--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
]]--

--[[
  Headless spec for code/Warn.lua (rgpvpw.warn). Warn.lua keeps file-local state (warnQueue,
  isQueueBusy), so the module is re-dofile'd in before_each for a fresh queue. GetTime is a
  controllable clock and C_Timer captures its callbacks (both from the WowStubs registry) so the
  0.8s busy gate is fired deterministically. mod.sound, mod.flash, mod.detectionBarManager and
  mod.configuration are recording stubs; the logger methods are stubbed because the real print
  path reaches mod.filter and C_AddOns which do not exist headlessly.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it before_each after_each
-- luacheck: ignore 143

local wowStubs = require("WowStubs")

describe("warn queue", function()
  local warn
  local spellTypes
  local clock
  local timer
  local restoreGlobals
  local playedSounds
  local flashes
  local pushes
  local flashEnabled
  local loggedErrors
  local originalLogError
  local originalLogWarn
  local originalLogDebug

  local function BuildSpell()
    return {
      name = "Psychic Scream",
      soundFileName = "psychic_scream",
      visualWarningColor = 3
    }
  end

  --[[
    Queue a warning with sensible defaults; overrides = { spellType =, playSound =, playVisual = }.
  ]]--
  local function QueueWarning(overrides)
    overrides = overrides or {}

    warn.AddToQueue(
      "test-warning",
      "priest",
      overrides.spellType or spellTypes.NORMAL,
      BuildSpell(),
      overrides.playSound ~= false,
      overrides.playVisual ~= false
    )
  end

  local function FireBusyGateReset()
    timer.scheduled[#timer.scheduled].callback()
  end

  before_each(function()
    clock = { now = 100 }
    timer = wowStubs.stubs.C_Timer()
    restoreGlobals = wowStubs.install({
      GetTime = wowStubs.stubs.GetTime(clock),
      C_Timer = timer
    })

    dofile("code/Warn.lua")
    warn = rgpvpw.warn
    spellTypes = RGPVPW_CONSTANTS.SPELL_TYPES

    loggedErrors = {}
    originalLogError = rgpvpw.logger.LogError
    originalLogWarn = rgpvpw.logger.LogWarn
    originalLogDebug = rgpvpw.logger.LogDebug
    rgpvpw.logger.LogError = function(tag, message)
      table.insert(loggedErrors, { tag = tag, message = message })
    end
    rgpvpw.logger.LogWarn = function() end
    rgpvpw.logger.LogDebug = function() end

    playedSounds = {}
    rgpvpw.sound = {
      PlaySound = function(category, spellType, soundFileName)
        table.insert(playedSounds, { category = category, spellType = spellType, soundFileName = soundFileName })
      end
    }

    flashes = {}
    rgpvpw.flash = {
      Show = function(color)
        table.insert(flashes, color)
      end
    }

    pushes = {}
    rgpvpw.detectionBarManager = {
      Push = function(payload)
        table.insert(pushes, payload)
      end
    }

    flashEnabled = true
    rgpvpw.configuration = {
      IsFlashEnabled = function()
        return flashEnabled
      end
    }
  end)

  after_each(function()
    restoreGlobals()
    rgpvpw.logger.LogError = originalLogError
    rgpvpw.logger.LogWarn = originalLogWarn
    rgpvpw.logger.LogDebug = originalLogDebug
    rgpvpw.sound = nil
    rgpvpw.flash = nil
    rgpvpw.detectionBarManager = nil
    rgpvpw.configuration = nil
  end)

  describe("ProcessQueue drain", function()
    it("plays exactly one queued warning per call", function()
      QueueWarning()
      QueueWarning()

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)

      FireBusyGateReset()
      warn.ProcessQueue()

      assert.are.equal(2, #playedSounds)

      FireBusyGateReset()
      warn.ProcessQueue()

      assert.are.equal(2, #playedSounds)
    end)

    it("no-ops on an empty queue without engaging the busy gate", function()
      warn.ProcessQueue()

      assert.are.equal(0, #playedSounds)
      assert.are.equal(0, #timer.scheduled)
    end)
  end)

  describe("busy gate", function()
    it("schedules the busy reset with the configured gate duration after playing", function()
      QueueWarning()

      warn.ProcessQueue()

      assert.are.equal(1, #timer.scheduled)
      assert.are.equal(RGPVPW_CONSTANTS.WARN_QUEUE_BUSY_GATE, timer.scheduled[1].seconds)
    end)

    it("no-ops while busy and resumes once the reset callback fires", function()
      QueueWarning()
      QueueWarning()

      warn.ProcessQueue()
      warn.ProcessQueue()
      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)

      FireBusyGateReset()
      warn.ProcessQueue()

      assert.are.equal(2, #playedSounds)
    end)

    it("does not engage the busy gate when neither sound nor visual played", function()
      QueueWarning({ playSound = false, playVisual = false })
      QueueWarning()

      warn.ProcessQueue()

      assert.are.equal(0, #playedSounds)
      assert.are.equal(0, #timer.scheduled)

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)
    end)
  end)

  describe("expiry", function()
    it("plays a warning aged exactly MAX_WARN_AGE", function()
      QueueWarning()
      clock.now = clock.now + RGPVPW_CONSTANTS.MAX_WARN_AGE

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)
    end)

    it("drops a warning older than MAX_WARN_AGE without playing", function()
      QueueWarning()
      clock.now = clock.now + RGPVPW_CONSTANTS.MAX_WARN_AGE + 0.1

      warn.ProcessQueue()

      assert.are.equal(0, #playedSounds)
      assert.are.equal(0, #timer.scheduled)
    end)

    it("removes all adjacent expired warnings in a single tick", function()
      QueueWarning()
      QueueWarning()
      QueueWarning()
      clock.now = clock.now + RGPVPW_CONSTANTS.MAX_WARN_AGE + 0.1
      QueueWarning()

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)
    end)
  end)

  describe("spellType routing", function()
    it("routes NORMAL to sound and visual", function()
      QueueWarning({ spellType = spellTypes.NORMAL })

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)
      assert.are.equal(spellTypes.NORMAL, playedSounds[1].spellType)
      assert.are.equal("psychic_scream", playedSounds[1].soundFileName)
      assert.are.same({ 3 }, flashes)
    end)

    it("routes APPLIED to sound (as NORMAL) and visual", function()
      QueueWarning({ spellType = spellTypes.APPLIED })

      warn.ProcessQueue()

      assert.are.equal(spellTypes.NORMAL, playedSounds[1].spellType)
      assert.are.equal(1, #flashes)
    end)

    it("routes REFRESH to sound (as NORMAL) and visual", function()
      QueueWarning({ spellType = spellTypes.REFRESH })

      warn.ProcessQueue()

      assert.are.equal(spellTypes.NORMAL, playedSounds[1].spellType)
      assert.are.equal(1, #flashes)
    end)

    it("routes REMOVED to sound only", function()
      QueueWarning({ spellType = spellTypes.REMOVED })

      warn.ProcessQueue()

      assert.are.equal(spellTypes.REMOVED, playedSounds[1].spellType)
      assert.are.equal(0, #flashes)
    end)

    it("routes START to sound only", function()
      QueueWarning({ spellType = spellTypes.START })

      warn.ProcessQueue()

      assert.are.equal(spellTypes.START, playedSounds[1].spellType)
      assert.are.equal(0, #flashes)
    end)

    it("routes MISSED_SELF to sound and visual", function()
      QueueWarning({ spellType = spellTypes.MISSED_SELF })

      warn.ProcessQueue()

      assert.are.equal(spellTypes.MISSED_SELF, playedSounds[1].spellType)
      assert.are.equal(1, #flashes)
    end)

    it("routes MISSED_ENEMY to sound and visual", function()
      QueueWarning({ spellType = spellTypes.MISSED_ENEMY })

      warn.ProcessQueue()

      assert.are.equal(spellTypes.MISSED_ENEMY, playedSounds[1].spellType)
      assert.are.equal(1, #flashes)
    end)

    it("logs an error for an invalid spellType and drops the warning without playing", function()
      QueueWarning({ spellType = 999 })
      QueueWarning()

      warn.ProcessQueue()

      assert.are.equal(1, #loggedErrors)
      assert.matches("Found invalid spelltype: 999", loggedErrors[1].message)
      assert.are.equal(0, #playedSounds)
      assert.are.equal(0, #timer.scheduled)

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)
    end)
  end)

  describe("visual gating", function()
    it("skips the visual when playVisual is false but still plays the sound", function()
      QueueWarning({ playVisual = false })

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)
      assert.are.equal(0, #flashes)
    end)

    it("skips the visual when the flash channel is disabled", function()
      flashEnabled = false
      QueueWarning()

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)
      assert.are.equal(0, #flashes)
    end)
  end)

  describe("PlayWarning", function()
    it("returns without queueing when category, spellType or spell is nil", function()
      warn.PlayWarning(nil, spellTypes.NORMAL, BuildSpell(), nil, true, true)
      warn.PlayWarning("priest", nil, BuildSpell(), nil, true, true)
      warn.PlayWarning("priest", spellTypes.NORMAL, nil, nil, true, true)

      warn.ProcessQueue()

      assert.are.equal(0, #playedSounds)
    end)

    it("queues a warning that ProcessQueue then plays", function()
      warn.PlayWarning("priest", spellTypes.NORMAL, BuildSpell(), nil, true, true)

      warn.ProcessQueue()

      assert.are.equal(1, #playedSounds)
      assert.are.equal("priest", playedSounds[1].category)
    end)

    it("pushes the detection bar payload directly, bypassing the busy gate", function()
      QueueWarning()
      warn.ProcessQueue()

      assert.are.equal(1, #timer.scheduled)

      local payload = { spellId = 8122 }

      warn.PlayWarning("priest", spellTypes.NORMAL, BuildSpell(), nil, true, true, payload)

      assert.are.equal(1, #pushes)
      assert.are.equal(payload, pushes[1])
    end)

    it("does not push to the detection bar without a payload", function()
      warn.PlayWarning("priest", spellTypes.NORMAL, BuildSpell(), nil, true, true)

      assert.are.equal(0, #pushes)
    end)

    it("invokes the optional callback with category, spellType and spell", function()
      local spell = BuildSpell()
      local callbackArgs

      warn.PlayWarning("priest", spellTypes.NORMAL, spell, function(...)
        callbackArgs = { ... }
      end, true, true)

      assert.are.equal("priest", callbackArgs[1])
      assert.are.equal(spellTypes.NORMAL, callbackArgs[2])
      assert.are.equal(spell, callbackArgs[3])
    end)

    it("throws when the callback is not a function", function()
      assert.has_error(function()
        warn.PlayWarning("priest", spellTypes.NORMAL, BuildSpell(), "not-a-function", true, true)
      end)
    end)
  end)
end)
