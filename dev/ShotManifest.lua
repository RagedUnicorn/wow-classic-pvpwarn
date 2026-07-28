--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

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

-- THIS FILE IS AUTO-GENERATED. ALL CHANGES ARE OVERWRITTEN
-- Source: wow-media-capture/reference/media/pvpwarn.json
-- Regenerate: scripts/gen-shot-table.ps1 -Addon pvpwarn

-- shows/name are human-facing copy carried over from the manifest verbatim - reflowing
-- them is not the generator's call, so the 120-column limit does not apply here
-- luacheck: max line length 400

RGPVPW_SHOTS = {
  {
    name = "pvpwarn_configure_zones",
    shot = "configure_zones",
    frame = "SettingsPanel",
    setup = { "openCategory:zone" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 0,
    shows = "The Zones panel with the per-battleground enable checkboxes"
  },
  {
    name = "pvpwarn_configure_profiles",
    shot = "configure_profiles",
    frame = "SettingsPanel",
    setup = { "openCategory:profile" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 0,
    shows = "The Profiles panel with the named-profile list and the export/import controls"
  },
  {
    name = "pvpwarn_configure_spell_still",
    shot = "configure_spell_still",
    frame = "SettingsPanel",
    setup = { "openCategory:warrior" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 0,
    shows = "A class category's Spells tab - the per-spell rows with the enable, sound and visual-warning controls and their inline descriptions"
  },
  {
    name = "pvpwarn_configure_avoid_still",
    shot = "configure_avoid_still",
    frame = "SettingsPanel",
    setup = { "openCategory:enemyAvoid" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 0,
    shows = "The Enemy Avoid panel - the player's own class spells that can be resisted, with their warning controls"
  },
  {
    name = "pvpwarn_detection_bar_still",
    shot = "detection_bar_still",
    frame = "PVPW_DetectionBarAnchor",
    setup = { "closeSettings", "previewDetectionBar" },
    includeFrames = { "PVPW_DetectionBarSlot_1", "PVPW_DetectionBarSlot_2", "PVPW_DetectionBarSlot_3", "PVPW_DetectionBarSlot_4" },
    hideChrome = true,
    padding = 80,
    shows = "A stack of detection bars - spell icon with a class-coloured border, the detected event and the enemy player's name, with the stack-position alpha falloff"
  },
  {
    name = "pvpwarn_flash",
    shot = "flash",
    frame = "PVPW_FlashFrame",
    setup = { "closeSettings", "previewDetectionBar", "flashTest:red" },
    hideChrome = true,
    padding = 0,
    shows = "The soft red vignette flash at peak opacity with a detection bar stack visible - the whole visual-warning story in one frame"
  },
  {
    name = "pvpwarn_target_state_still",
    shot = "target_state_still",
    frame = "PVPW_CombatStateFrame",
    setup = { "closeSettings", "showCombatState", "previewStanceState:15473" },
    includeFrames = { "PVPW_StanceStateFrame", "TargetFrame" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 140,
    shows = "The combat-state and stance-state icons sitting next to the target frame"
  },
  {
    name = "pvpwarn_configure_spell",
    shot = "configure_spell",
    frame = "UIParent",
    kind = "gif",
    setup = { "openCategory:warrior" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 0,
    shows = "Configuring the warning for an enemy spell in a class category"
  },
  {
    name = "pvpwarn_configure_self_avoid",
    shot = "configure_self_avoid",
    frame = "UIParent",
    kind = "gif",
    setup = { "openCategory:priest", "selectTab:2" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 0,
    shows = "The Avoid tab of a class category, configuring a warning for a spell the player resisted"
  },
  {
    name = "pvpwarn_configure_enemy_avoid",
    shot = "configure_enemy_avoid",
    frame = "UIParent",
    kind = "gif",
    setup = { "openCategory:enemyAvoid" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 0,
    shows = "The Enemy Avoid panel, configuring a warning for a spell of the player's own class that an enemy resisted"
  },
  {
    name = "pvpwarn_detection_bar",
    shot = "detection_bar",
    frame = "PVPW_DetectionBarAnchor",
    kind = "gif",
    setup = { "closeSettings", "testDetectionBar" },
    includeFrames = { "PVPW_DetectionBarSlot_1", "PVPW_DetectionBarSlot_2", "PVPW_DetectionBarSlot_3", "PVPW_DetectionBarSlot_4" },
    hideChrome = true,
    padding = 80,
    shows = "Detected enemy spells sliding into the detection bar stack one after another"
  },
  {
    name = "pvpwarn_combat",
    shot = "combat",
    frame = "PVPW_CombatStateFrame",
    kind = "gif",
    setup = { "closeSettings", "showCombatState" },
    includeFrames = { "TargetFrame" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 140,
    shows = "The combat-state icon appearing next to the target frame as the target enters combat"
  },
  {
    name = "pvpwarn_switching_stance",
    shot = "switching_stance",
    frame = "PVPW_StanceStateFrame",
    kind = "gif",
    setup = { "closeSettings", "showStanceState" },
    includeFrames = { "TargetFrame" },
    hideFrames = { "PVPW_DetectionBarAnchor" },
    hideChrome = true,
    padding = 140,
    shows = "The stance-state icon next to the target frame updating as the target switches stance"
  }
}
