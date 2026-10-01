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
  Headless spec for code/Event.lua (rgpvpw.event), the central event bus: registration (single and
  array form), frame subscription, dispatch and the readiness gate.

  Event.lua is re-dofile'd in before_each so every test starts with an empty handler table and a
  closed gate. Dispatch logs every event through LogEvent and the gated path through LogDebug; both
  are no-op'd because the real print path reaches modules the bootstrap does not load. The logger
  and rgpvpw.event are restored in after_each.
]]--

describe("Event bus", function()
  local event
  local registered
  local stubFrame
  local originalEvent = rgpvpw.event
  local originalLogDebug = rgpvpw.logger.LogDebug
  local originalLogEvent = rgpvpw.logger.LogEvent

  before_each(function()
    rgpvpw.logger.LogDebug = function() end
    rgpvpw.logger.LogEvent = function() end

    dofile("code/Event.lua")
    event = rgpvpw.event

    registered = {}
    stubFrame = {
      RegisterEvent = function(_, eventName)
        registered[eventName] = true
      end
    }
  end)

  after_each(function()
    rgpvpw.event = originalEvent
    rgpvpw.logger.LogDebug = originalLogDebug
    rgpvpw.logger.LogEvent = originalLogEvent
  end)

  it("Setup registers every declared event on the frame", function()
    event.Register("PLAYER_ENTERING_WORLD", function() end)
    event.Register("PLAYER_TARGET_CHANGED", function() end)

    event.Setup(stubFrame)

    assert.is_true(registered["PLAYER_ENTERING_WORLD"])
    assert.is_true(registered["PLAYER_TARGET_CHANGED"])
  end)

  it("Dispatch invokes the matching handler with the event varargs", function()
    local received

    event.Register("CUSTOM_EVENT", function(a, b)
      received = { a, b }
    end)

    event.Dispatch("CUSTOM_EVENT", "unit", 42)

    assert.are.same({ "unit", 42 }, received)
  end)

  it("Register accepts an array of events sharing one handler", function()
    local calls = 0

    event.Register({ "EVENT_A", "EVENT_B", "EVENT_C" }, function()
      calls = calls + 1
    end)

    event.Setup(stubFrame)

    assert.is_true(registered["EVENT_A"])
    assert.is_true(registered["EVENT_B"])
    assert.is_true(registered["EVENT_C"])

    event.Dispatch("EVENT_A")
    event.Dispatch("EVENT_C")

    assert.are.equal(2, calls)
  end)

  it("Dispatch ignores an unregistered event", function()
    assert.has_no.errors(function()
      event.Dispatch("UNREGISTERED_EVENT")
    end)
  end)

  it("ungated handlers fire before SetReady", function()
    local calls = 0

    event.Register("UNGATED", function() calls = calls + 1 end)

    event.Dispatch("UNGATED")

    assert.are.equal(1, calls)
  end)

  it("gated handlers are suppressed until SetReady, then fire", function()
    local calls = 0

    event.Register("GATED", function() calls = calls + 1 end, { gated = true })

    event.Dispatch("GATED")
    assert.are.equal(0, calls)

    event.SetReady()

    event.Dispatch("GATED")
    assert.are.equal(1, calls)
  end)
end)
