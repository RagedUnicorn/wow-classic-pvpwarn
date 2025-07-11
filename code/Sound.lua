--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

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

-- luacheck: globals PlaySoundFile

local mod = rgpvpw
local me = {}
mod.sound = me

me.tag = "Sound"

--[[
  Private
]]--
local DEFAULT_BASE_PATH = "Interface\\AddOns\\PVPWarn\\assets\\sounds\\en\\"
local FILE_NAME_DOWN = "_down"
local PATH_SELF_AVOID = "self_avoid\\"
local PATH_ENEMY_AVOID = "enemy_avoid\\"
local FILE_NAME_SELF_AVOID = "you_avoided_"
local FILE_NAME_ENEMY_AVOID = "enemy_avoided_"
local FILE_NAME_START = "_cast"
local FILE_TYPE = ".mp3"

--[[
  Get the base path for sound files
  Uses voice pack path if available, otherwise defaults to built-in sounds

  @return {string}
    The base path for sound files
]]--
local function GetBasePath()
  local voicePackPath = mod.voicePack.GetActiveVoicePackPath()

  if voicePackPath then
    return voicePackPath
  end
  return DEFAULT_BASE_PATH
end

--[[
  Play a sound from the assets-folder
  @param {string} soundCategory
    e.g rogue, misc, racials etc
  @param {number} spellType
    see constants SPELL_TYPES
  @param {string} soundFileName
    part of the name of the soundfile
  @return {number}
    0 if there was a problem
    1 if sound was played
]]--
function me.PlaySound(soundCategory, spellType, soundFileName)
  assert(type(soundCategory) == "string",
    string.format("bad argument #1 to `PlaySound` (expected string, got %s)", type(soundCategory)))

  assert(type(spellType) == "number",
    string.format("bad argument #2 to `PlaySound` (expected number, got %s)", type(spellType)))

  assert(type(soundFileName) == "string",
    string.format("bad argument #3 to `PlaySound` (expected string, got %s)", type(soundFileName)))

  local status = 0
  local soundPath = GetBasePath() .. soundCategory .. "\\"
  local spellTypes = RGPVPW_CONSTANTS.SPELL_TYPES

  if spellType == spellTypes.NORMAL or spellType == spellTypes.APPLIED or spellType == spellTypes.REFRESH then
    soundPath =  soundPath .. soundFileName .. FILE_TYPE
  elseif spellType == spellTypes.REMOVED then
    soundPath = soundPath .. soundFileName .. FILE_NAME_DOWN .. FILE_TYPE
  elseif spellType == spellTypes.START then
    soundPath = soundPath .. soundFileName .. FILE_NAME_START .. FILE_TYPE
  elseif spellType == spellTypes.MISSED_SELF then
    soundPath = soundPath .. PATH_SELF_AVOID .. FILE_NAME_SELF_AVOID .. soundFileName.. FILE_TYPE
  elseif spellType == spellTypes.MISSED_ENEMY then
    soundPath = soundPath .. PATH_ENEMY_AVOID .. FILE_NAME_ENEMY_AVOID .. soundFileName.. FILE_TYPE
  else
    mod.logger.LogWarn(me.tag, "Invalid spellType: " .. spellType)
    return status
  end

  mod.logger.LogDebug(me.tag, string.format("Playing: %s", soundPath))
  status = PlaySoundFile(soundPath, "Master")

  if not status then
    -- this also happens when sound is deactivated
    mod.logger.LogWarn(me.tag, string.format("There seems to be an issue playing: %s", soundPath))
    return status
  end

  return status
end
