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
  Sanity check that the busted harness is wired correctly: the bootstrap globals are present and the
  pure modules (Constants, Logger, Common) loaded headlessly with no WoW client running.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it
-- luacheck: ignore 143

describe("test harness", function()
  it("creates the rgpvpw namespace", function()
    assert.is_table(rgpvpw)
  end)

  it("shims the addon environment with TEST disabled", function()
    assert.is_table(RGPVPW_ENVIRONMENT)
    assert.are.equal(4, RGPVPW_ENVIRONMENT.LOG_LEVEL)
    assert.is_false(RGPVPW_ENVIRONMENT.TEST)
  end)

  it("loads code/Constants.lua (defines RGPVPW_CONSTANTS)", function()
    assert.is_table(RGPVPW_CONSTANTS)
    assert.are.equal("PVPWarn", RGPVPW_CONSTANTS.ADDON_NAME)
  end)

  it("loads code/Logger.lua (defines rgpvpw.logger)", function()
    assert.is_table(rgpvpw.logger)
    assert.is_function(rgpvpw.logger.LogDebug)
    assert.are.equal(RGPVPW_ENVIRONMENT.LOG_LEVEL, rgpvpw.logger.logLevel)
  end)

  it("loads code/Common.lua (defines rgpvpw.common)", function()
    assert.is_table(rgpvpw.common)
    assert.is_function(rgpvpw.common.NormalizeSpellName)
  end)

  it("resolves the WowStubs registry via package.path", function()
    local wowStubs = require("WowStubs")

    assert.is_function(wowStubs.install)
    assert.is_table(wowStubs.stubs)
  end)
end)
