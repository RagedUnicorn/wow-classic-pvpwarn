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
  Headless spec for code/VoicePack.lua (rgpvpw.voicePack): voice-pack registration by the voice-pack
  AddOns, the active voice pack switch and the asset path Sound.lua plays clips from.

  VoicePack.lua is re-dofile'd in before_each to clear its registry. rgpvpw.configuration is
  replaced by a stub holding the active voice pack name, rgpvpw.L by the one key the default
  registration reads, and the logger by capturing / no-op levels (the real print path reaches
  modules the bootstrap does not load). Every replaced rgpvpw field is restored in after_each.
]]--

describe("VoicePack", function()
  local voicePack
  local activeVoicePack
  local loggedErrors
  local originalVoicePack = rgpvpw.voicePack
  local originalConfiguration = rgpvpw.configuration
  local originalLogger = rgpvpw.logger
  local originalL = rgpvpw.L

  local GFC_PATH = "Interface\\AddOns\\PVPWarn_VoicePack_GFC\\assets\\sounds\\"

  before_each(function()
    activeVoicePack = RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME
    loggedErrors = {}

    rgpvpw.configuration = {
      GetActiveVoicePack = function() return activeVoicePack end,
      SetActiveVoicePack = function(name) activeVoicePack = name end
    }
    rgpvpw.logger = {
      LogDebug = function() end,
      LogInfo = function() end,
      LogError = function(_, message) loggedErrors[#loggedErrors + 1] = message end
    }
    rgpvpw.L = { ["voice_pack_default"] = "Default" }

    dofile("code/VoicePack.lua")
    voicePack = rgpvpw.voicePack
  end)

  after_each(function()
    rgpvpw.voicePack = originalVoicePack
    rgpvpw.configuration = originalConfiguration
    rgpvpw.logger = originalLogger
    rgpvpw.L = originalL
  end)

  it("registers a voice pack under its name", function()
    assert.is_true(voicePack.RegisterVoicePack("gfc", "German female", GFC_PATH))

    assert.are.same(
      { name = "gfc", displayName = "German female", assetPath = GFC_PATH },
      voicePack.GetRegisteredVoicePacks()["gfc"]
    )
  end)

  it("refuses a registration with a missing parameter and logs it", function()
    assert.is_false(voicePack.RegisterVoicePack("gfc", nil, GFC_PATH))
    assert.is_false(voicePack.RegisterVoicePack("gfc", "German female", nil))

    assert.is_nil(voicePack.GetRegisteredVoicePacks()["gfc"])
    assert.are.equal(2, #loggedErrors)
  end)

  it("registers the built-in default voice pack", function()
    voicePack.RegisterDefaultVoicePack()

    local default = voicePack.GetRegisteredVoicePacks()[RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME]

    assert.are.equal("Default", default.displayName)
    assert.are.equal("Interface\\AddOns\\PVPWarn\\assets\\sounds\\en\\", default.assetPath)
  end)

  it("has no voice pack path while the default voice pack is active", function()
    voicePack.RegisterDefaultVoicePack()

    assert.is_nil(voicePack.GetActiveVoicePackPath())
  end)

  it("returns the asset path of the active registered voice pack", function()
    voicePack.RegisterVoicePack("gfc", "German female", GFC_PATH)
    voicePack.SetActiveVoicePack("gfc")

    assert.are.equal(GFC_PATH, voicePack.GetActiveVoicePackPath())
  end)

  it("falls back to the default when the active voice pack is not installed", function()
    activeVoicePack = "uninstalled"

    assert.is_nil(voicePack.GetActiveVoicePackPath())
  end)

  it("activates the default voice pack when no name is given", function()
    activeVoicePack = "gfc"

    voicePack.SetActiveVoicePack(nil)

    assert.are.equal(RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME, activeVoicePack)
  end)
end)
