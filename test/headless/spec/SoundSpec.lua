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
  Headless spec for code/Sound.lua (rgpvpw.sound): the clip lookup that turns a sound category, a
  spell type and a sound file name into the path handed to PlaySoundFile - one path shape per spell
  type, below the built-in sound folder or the active voice pack's asset path.

  PlaySoundFile is stubbed to capture the path and return a configurable status; rgpvpw.voicePack
  is replaced by a stub that reports the active voice pack path. The logger is swapped for no-op
  levels because the real print path reaches modules the bootstrap does not load. Every replaced
  rgpvpw field is restored in after_each.
]]--

local wowStubs = require("WowStubs")

local DEFAULT_BASE_PATH = "Interface\\AddOns\\PVPWarn\\assets\\sounds\\en\\"

describe("Sound", function()
  local sound
  local restoreGlobals
  local playedPaths
  local playStatus
  local voicePackPath
  local warnings
  local originalSound = rgpvpw.sound
  local originalVoicePack = rgpvpw.voicePack
  local originalLogger = rgpvpw.logger

  before_each(function()
    playedPaths = {}
    playStatus = true
    voicePackPath = nil
    warnings = {}

    restoreGlobals = wowStubs.install({
      PlaySoundFile = function(path, channel)
        playedPaths[#playedPaths + 1] = { path = path, channel = channel }

        return playStatus
      end
    })

    rgpvpw.voicePack = {
      GetActiveVoicePackPath = function() return voicePackPath end
    }
    rgpvpw.logger = {
      LogDebug = function() end,
      LogWarn = function(_, message) warnings[#warnings + 1] = message end
    }

    dofile("code/Sound.lua")
    sound = rgpvpw.sound
  end)

  after_each(function()
    restoreGlobals()
    rgpvpw.sound = originalSound
    rgpvpw.voicePack = originalVoicePack
    rgpvpw.logger = originalLogger
  end)

  --[[
    @param {number} spellType
    @return {string}
      the path PlaySound handed to PlaySoundFile for the rogue "blind" clip
  ]]--
  local function pathFor(spellType)
    sound.PlaySound("rogue", spellType, "blind")

    return playedPaths[#playedPaths].path
  end

  it("plays the plain clip for a cast, an applied and a refreshed aura", function()
    local spellTypes = RGPVPW_CONSTANTS.SPELL_TYPES

    for _, spellType in ipairs({ spellTypes.NORMAL, spellTypes.APPLIED, spellTypes.REFRESH }) do
      assert.are.equal(DEFAULT_BASE_PATH .. "rogue\\blind.mp3", pathFor(spellType))
    end
  end)

  it("plays the _down clip for a removed aura", function()
    assert.are.equal(DEFAULT_BASE_PATH .. "rogue\\blind_down.mp3", pathFor(RGPVPW_CONSTANTS.SPELL_TYPES.REMOVED))
  end)

  it("plays the _cast clip for a cast start", function()
    assert.are.equal(DEFAULT_BASE_PATH .. "rogue\\blind_cast.mp3", pathFor(RGPVPW_CONSTANTS.SPELL_TYPES.START))
  end)

  it("plays the self avoid clip for a spell the player avoided", function()
    assert.are.equal(
      DEFAULT_BASE_PATH .. "rogue\\self_avoid\\you_avoided_blind.mp3",
      pathFor(RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF)
    )
  end)

  it("plays the enemy avoid clip for a spell the enemy avoided", function()
    assert.are.equal(
      DEFAULT_BASE_PATH .. "rogue\\enemy_avoid\\enemy_avoided_blind.mp3",
      pathFor(RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY)
    )
  end)

  it("plays on the Master channel and returns the PlaySoundFile status", function()
    assert.is_true(sound.PlaySound("rogue", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, "blind"))
    assert.are.equal("Master", playedPaths[1].channel)
  end)

  it("plays below the active voice pack's asset path", function()
    voicePackPath = "Interface\\AddOns\\PVPWarn_VoicePack_GFC\\assets\\sounds\\"

    assert.are.equal(voicePackPath .. "rogue\\blind.mp3", pathFor(RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL))
  end)

  it("returns false and warns when the client could not play the clip", function()
    playStatus = false

    assert.is_false(sound.PlaySound("rogue", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, "blind"))
    assert.are.equal(1, #warnings)
  end)

  it("plays nothing and returns false for an unknown spell type", function()
    assert.is_false(sound.PlaySound("rogue", 99, "blind"))
    assert.are.same({}, playedPaths)
    assert.are.equal(1, #warnings)
  end)

  it("raises on arguments of the wrong type", function()
    assert.has_error(function() sound.PlaySound(nil, RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, "blind") end)
    assert.has_error(function() sound.PlaySound("rogue", "1", "blind") end)
    assert.has_error(function() sound.PlaySound("rogue", RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, 2094) end)
  end)
end)
