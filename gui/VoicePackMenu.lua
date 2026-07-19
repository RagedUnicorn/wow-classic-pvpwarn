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

-- luacheck: globals CreateFrame STANDARD_TEXT_FONT

local mod = rgpvpw
local me = {}
mod.voicePackMenu = me

me.tag = "VoicePackMenu"

-- track whether the menu was already built
local builtMenu = false

-- reference to the dropdown frame
local voicePackDropdown
-- cached font string for measuring text width (ui regions cannot be destroyed)
local measureFontString

-- sample sounds to play for testing voice packs
local sampleSounds = {
  {category = "warrior", sound = "shield_wall"},
  {category = "mage", sound = "polymorph"},
  {category = "priest", sound = "psychic_scream"},
  {category = "rogue", sound = "vanish"},
  {category = "paladin", sound = "divine_shield"},
  {category = "warlock", sound = "fear"},
  {category = "hunter", sound = "freezing_trap"},
  {category = "druid", sound = "bear_form"},
  {category = "shaman", sound = "grounding_totem"},
  {category = "racials", sound = "will_of_the_forsaken"},
  {category = "items", sound = "insignia"},
  {category = "misc", sound = "first_aid"}
}

--[[
  Build the ui for the voice pack menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildUi(frame)
  if builtMenu then return end

  mod.guiHelper.CreatePanelTitle(frame, RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_TITLE, rgpvpw.L["voice_pack_title"])
  me.BuildVoicePackDropdown(frame)
  me.BuildPlaySoundButton(frame)

  builtMenu = true
end

--[[
  Build the voice pack dropdown menu

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildVoicePackDropdown(frame)
  local dropdownLabel = frame:CreateFontString(nil, "OVERLAY")
  dropdownLabel:SetFont(STANDARD_TEXT_FONT, 15)
  dropdownLabel:SetPoint("TOPLEFT", 20, -52)
  mod.guiHelper.SetColor(dropdownLabel, RGPVPW_CONSTANTS.COLOR.BODY)
  dropdownLabel:SetText(rgpvpw.L["voice_pack_dropdown_label"])

  voicePackDropdown = mod.guiHelper.CreateSettingsDropdown(
    RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_DROPDOWN,
    frame,
    {"LEFT", dropdownLabel, "RIGHT", 10, -2},
    RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_DROPDOWN_MIN_WIDTH,
    me.InitializeDropdown
  )
  voicePackDropdown:SetDefaultText(rgpvpw.L["voice_pack_default"])
  -- generate once so the button shows the current selection before the menu was ever opened
  voicePackDropdown:GenerateMenu()
  me.UpdateDropdownWidth()
end

--[[
  Menu generator for the voice pack dropdown - fills the root description with a radio
  entry per registered voice pack, the default voice pack first

  @param {table} _
    The dropdown the menu is generated for (unused)
  @param {table} rootDescription
]]--
function me.InitializeDropdown(_, rootDescription)
  local voicePacks = mod.voicePack.GetRegisteredVoicePacks()

  local function addVoicePackToDropdown(name, voicePack)
    rootDescription:CreateRadio(voicePack.displayName, me.IsVoicePackSelected, me.OnVoicePackSelect, name)
  end

  local defaultVoicePack = voicePacks[RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME]

  if defaultVoicePack then
    addVoicePackToDropdown(RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME, defaultVoicePack)
  end

  for name, voicePack in pairs(voicePacks) do
    if name ~= RGPVPW_CONSTANTS.DEFAULT_VOICE_PACK_NAME then
      addVoicePackToDropdown(name, voicePack)
    end
  end
end

--[[
  Whether the passed voice pack is the currently active one

  @param {string} voicePackName

  @return {boolean}
]]--
function me.IsVoicePackSelected(voicePackName)
  return mod.configuration.GetActiveVoicePack() == voicePackName
end

--[[
  Callback for when a voice pack is selected

  @param {string} voicePackName
    The name of the selected voice pack
]]--
function me.OnVoicePackSelect(voicePackName)
  mod.configuration.SetActiveVoicePack(voicePackName)
  mod.voicePack.SetActiveVoicePack(voicePackName)
  me.UpdateDropdownWidth()

  mod.logger.LogInfo(me.tag, "Selected voice pack: " .. voicePackName)
end

--[[
  Calculate and update the dropdown width based on the longest text
]]--
function me.UpdateDropdownWidth()
  if not voicePackDropdown then return end

  if not measureFontString then
    measureFontString = voicePackDropdown:CreateFontString(nil, "ARTWORK")
    measureFontString:SetFont(STANDARD_TEXT_FONT, 12) -- standard dropdown font size
    measureFontString:Hide()
  end

  local maxWidth = 0
  local voicePacks = mod.voicePack.GetRegisteredVoicePacks()

  -- measure all voice pack display names
  for _, voicePack in pairs(voicePacks) do
    measureFontString:SetText(voicePack.displayName)
    local textWidth = measureFontString:GetStringWidth()
    if textWidth > maxWidth then
      maxWidth = textWidth
    end
  end

  -- add padding for dropdown arrow and margins (typically 40-50 pixels)
  local dropdownWidth = maxWidth + 50

  -- set minimum width to ensure it doesn't look too small
  if dropdownWidth < RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_DROPDOWN_MIN_WIDTH then
    dropdownWidth = RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_DROPDOWN_MIN_WIDTH
  end

  voicePackDropdown:SetWidth(dropdownWidth)
end

--[[
  Build the play sound button for testing voice packs

  @param {table} frame
    The addon configuration frame to attach to
]]--
function me.BuildPlaySoundButton(frame)
  mod.guiHelper.CreateTextButton(
    RGPVPW_CONSTANTS.ELEMENT_VOICE_PACK_PLAY_SOUND_BUTTON,
    frame,
    {"TOPLEFT", voicePackDropdown, "TOPRIGHT", 10, -2},
    me.PlayRandomSoundOnClick,
    rgpvpw.L["voice_pack_play_sound_button"]
  )
end

--[[
  Play a random spell sound from the active voice pack
]]--
function me.PlayRandomSoundOnClick()
  local randomIndex = math.random(1, #sampleSounds)
  local sample = sampleSounds[randomIndex]


  local status = mod.sound.PlaySound(sample.category, RGPVPW_CONSTANTS.SPELL_TYPES.NORMAL, sample.sound)

  if status then
    mod.logger.LogInfo(me.tag, "Playing sample sound: " .. sample.category .. "/" .. sample.sound)
  else
    mod.logger.LogWarn(me.tag, "Failed to play sample sound: " .. sample.category .. "/" .. sample.sound)
  end
end
