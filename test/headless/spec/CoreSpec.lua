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
  Headless spec for the login bootstrap in code/Core.lua. The bootstrap does not load
  Core.lua (its Initialize builds the whole gui layer); this spec dofiles it against a
  capturing event bus, grabs the PLAYER_ENTERING_WORLD handler RegisterEvents registers,
  and drives it with a first Initialize step that raises. Every rgpvpw field Core.lua or
  the spec replaces is restored in after_each - busted's file insulation only snapshots
  the top-level `rgpvpw` reference.
]]--

local wowStubs = require("WowStubs")

describe("Core", function()
  local REPLACED_FIELDS = {
    "tag", "OnLoad", "RegisterEvents", "OnEvent", "Initialize", "ShowWelcomeMessage",
    "ShowDetectionBarHint", "event", "cmd", "comm", "zone"
  }
  local savedFields
  local originalLogError
  local originalLogLevel
  local restore
  local handlers
  local ready
  local zoneUpdated
  local handledErrors
  local loggedErrors

  before_each(function()
    savedFields = {}

    for _, field in ipairs(REPLACED_FIELDS) do
      savedFields[field] = rgpvpw[field]
    end

    originalLogError = rgpvpw.logger.LogError
    originalLogLevel = rgpvpw.logger.logLevel
    handlers = {}
    ready = false
    zoneUpdated = false
    handledErrors = {}
    loggedErrors = {}

    restore = wowStubs.install({
      geterrorhandler = function()
        return function(err)
          handledErrors[#handledErrors + 1] = err
        end
      end
    })

    -- Initialize logs a debug line first; keep it (and its filter lookup) silent
    rgpvpw.logger.logLevel = rgpvpw.logger.error - 1
    rgpvpw.logger.LogError = function(_, message)
      loggedErrors[#loggedErrors + 1] = message
    end

    rgpvpw.event = {
      Setup = function() end,
      Register = function(eventName, handler)
        handlers[eventName] = handler
      end,
      SetReady = function()
        ready = true
      end
    }

    -- RegisterEvents registers the addon message handler; OnEnteringWorld broadcasts
    rgpvpw.comm = {
      OnChatMsgAddon = function() end,
      BroadcastVersion = function() end
    }
    rgpvpw.zone = {
      UpdateZone = function()
        zoneUpdated = true
      end
    }

    -- the first step of Initialize raises
    rgpvpw.cmd = {
      SetupSlashCmdList = function()
        error("slash command setup failed")
      end
    }

    dofile("code/Core.lua")
    rgpvpw.OnLoad({})
  end)

  after_each(function()
    restore()
    rgpvpw.logger.LogError = originalLogError
    rgpvpw.logger.logLevel = originalLogLevel

    for _, field in ipairs(REPLACED_FIELDS) do
      rgpvpw[field] = savedFields[field]
    end
  end)

  it("opens the readiness gate even when a step of Initialize raises", function()
    assert.has_no.errors(function()
      handlers.PLAYER_ENTERING_WORLD(true, false)
    end)

    assert.is_true(ready)
    assert.is_true(zoneUpdated)
  end)

  it("hands the initialization error to the client error handler and logs it", function()
    handlers.PLAYER_ENTERING_WORLD(false, true)

    assert.are.equal(1, #handledErrors)
    assert.truthy(string.find(handledErrors[1], "slash command setup failed", 1, true))
    assert.are.equal(1, #loggedErrors)
    assert.truthy(string.find(loggedErrors[1], "slash command setup failed", 1, true))
  end)

  it("does not initialize again on a plain loading screen", function()
    handlers.PLAYER_ENTERING_WORLD(false, false)

    assert.is_false(ready)
    assert.are.same({}, handledErrors)
  end)
end)
