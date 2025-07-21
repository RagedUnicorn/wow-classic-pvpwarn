--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

local mod = rgpvpw
local me = {}

mod.voicePack = me

me.tag = "VoicePack"

local registeredVoicePacks = {}

--[[
  Register a voice pack addon

  @param {string} name
    The name of the voice pack
  @param {string} displayName
    The display name for the UI
  @param {string} assetPath
    The path to the voice pack's sound assets

  @return {boolean}
    True if registration was successful, false if parameters were invalid
]]--
function me.RegisterVoicePack(name, displayName, assetPath)
  if not name or not displayName or not assetPath then
    mod.logger.LogError(me.tag, "Invalid voice pack registration - missing required parameters")
    return false
  end

  registeredVoicePacks[name] = {
    name = name,
    displayName = displayName,
    assetPath = assetPath
  }

  mod.logger.LogInfo(me.tag, "Registered voice pack: " .. name .. " with path: " .. assetPath)

  -- check if this is the configured voice pack
  local configuredVoicePack = mod.configuration.GetActiveVoicePack()
  if configuredVoicePack == name then
    mod.logger.LogInfo(me.tag, "Registered voice pack matches configured pack, activating: " .. name)
  end

  return true
end

--[[
  Get all registered voice packs

  @return {table}
    Table of registered voice packs
]]--
function me.GetRegisteredVoicePacks()
  return registeredVoicePacks
end

--[[
  Set the active voice pack

  @param {string} name
    The name of the voice pack to activate, or nil for default
]]--
function me.SetActiveVoicePack(name)
  mod.configuration.SetActiveVoicePack(name or RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME)

  mod.logger.LogInfo(me.tag, "Set active voice pack: " .. (name or RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME))
end


--[[
  Get the asset path for the active voice pack

  @return {string}
    The asset path for the active voice pack, or nil if using default
]]--
function me.GetActiveVoicePackPath()
  local activeVoicePack = mod.configuration.GetActiveVoicePack()

  if not activeVoicePack or activeVoicePack == RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME then
    return nil
  end

  local voicePack = registeredVoicePacks[activeVoicePack]
  -- if voice pack not found, fallback to default
  if not voicePack then
    mod.logger.LogDebug(me.tag, "Voice pack not found: " .. activeVoicePack .. ", using default")
    return nil
  end

  return voicePack.assetPath
end

--[[
  Register the default voice pack

  This is called during addon initialization
]]--
function me.RegisterDefaultVoicePack()
  me.RegisterVoicePack(
    RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME,
    rgpvpw.L["voice_pack_default"],
    "Interface\\AddOns\\PVPWarn\\assets\\sounds\\en\\"
   )
  mod.logger.LogInfo(me.tag, "Registered default voice pack")
end
