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
  Covers the warn textures derived from RGPVPW_COLORS.WARNINGS in code/Constants.lua - the keyed
  lookup table and the ordered array the visual warning dropdown iterates
  (gui/GuiHelper.lua CreateVisualWarningDropdown).
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it
-- luacheck: ignore 143

describe("warn textures", function()
  it("derives one keyed entry per warning color", function()
    local expectedCount = 0

    for _ in pairs(RGPVPW_COLORS.WARNINGS) do
      expectedCount = expectedCount + 1
    end

    local actualCount = 0

    for colorName, texture in pairs(RGPVPW_CONSTANTS.TEXTURES) do
      actualCount = actualCount + 1

      assert.are.equal("texture_" .. colorName, texture.textureName)
      assert.are.equal(RGPVPW_COLORS.WARNINGS[colorName].value, texture.colorValue)
    end

    assert.are.equal(expectedCount, actualCount)
  end)

  it("holds every keyed entry in the ordered array as well", function()
    local keyedCount = 0

    for _ in pairs(RGPVPW_CONSTANTS.TEXTURES) do
      keyedCount = keyedCount + 1
    end

    assert.are.equal(keyedCount, #RGPVPW_CONSTANTS.TEXTURES_ORDERED)

    for _, texture in ipairs(RGPVPW_CONSTANTS.TEXTURES_ORDERED) do
      local keyedTexture = RGPVPW_CONSTANTS.TEXTURES[texture.colorName]

      assert.is_table(keyedTexture)
      assert.are.equal(keyedTexture.textureName, texture.textureName)
      assert.are.equal(keyedTexture.colorValue, texture.colorValue)
    end
  end)

  it("sorts the ordered array ascending by colorValue", function()
    for i = 2, #RGPVPW_CONSTANTS.TEXTURES_ORDERED do
      assert.is_true(
        RGPVPW_CONSTANTS.TEXTURES_ORDERED[i - 1].colorValue < RGPVPW_CONSTANTS.TEXTURES_ORDERED[i].colorValue
      )
    end
  end)

  it("puts none first because it is the default color", function()
    assert.are.equal("none", RGPVPW_CONSTANTS.TEXTURES_ORDERED[1].colorName)
    assert.are.equal(RGPVPW_CONSTANTS.DEFAULT_COLOR, RGPVPW_CONSTANTS.TEXTURES_ORDERED[1].colorValue)
  end)
end)
