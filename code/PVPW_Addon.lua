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

mod.addon = me

me.tag = "Addon"

local registeredVoicePacks = {}
local activeVoicePack = nil

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
  if name and not registeredVoicePacks[name] then
    mod.logger.LogError(me.tag, "Cannot set active voice pack - not registered: " .. name)
    return false
  end

  activeVoicePack = name
  mod.logger.LogInfo(me.tag, "Set active voice pack: " .. (name or "default"))
  return true
end

--[[
  Get the active voice pack

  @return {string|nil}
    The name of the active voice pack, or nil if using default
]]--
function me.GetActiveVoicePack()
  return activeVoicePack
end

--[[
  Get the asset path for the active voice pack

  @return {string}
    The asset path for the active voice pack, or nil if using default
]]--
function me.GetActiveVoicePackPath()
  if not activeVoicePack then
    return nil
  end

  local voicePack = registeredVoicePacks[activeVoicePack]
  return voicePack and voicePack.assetPath or nil
end

