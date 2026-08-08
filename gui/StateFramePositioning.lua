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

-- luacheck: globals CreateFrame

--[[
  Shared positioning mode for the two state icons (combat state and stance state).

  The icons are meant to sit next to each other, which is impossible to arrange while only one of
  them can be shown at a time. Entering positioning mode from either state options panel therefore
  puts *both* features into their configuration mode, so both icons appear and can be dragged into
  place in a single pass.

  The mode is derived, never stored - IsPositioning() reads the two feature flags instead of
  keeping a copy, so the per feature slash commands (/rgpvpw combatstate|stancestate enable|disable)
  can never desync it from what the options panels display.

  Positioning is never persisted. It always reverts on /reload, when combat starts and when the
  Settings window closes, so a mouse enabled icon can never be left swallowing clicks on the
  target frame it sits on.
]]--

local mod = rgpvpw
local me = {}
mod.stateFramePositioning = me

me.tag = "StateFramePositioning"

--[[
  Callbacks invoked whenever positioning mode is entered or exited. Both state options panels
  register their button label updater here.
]]--
local listeners = {}

--[[
  Claim both configuration mode callback slots, register the combat safeguard and hook the
  Settings window. Invoked once from mod.core after both state frames have been built.
]]--
function me.Init()
  mod.combatState.onConfigurationModeChanged = me.NotifyListeners
  mod.stanceState.onConfigurationModeChanged = me.NotifyListeners

  me.RegisterCombatSafeguard()
  --[[ leaving the Settings window always finishes positioning - even when it was entered by
       slash command and no options panel was ever built ]]--
  mod.guiHelper.HookSettingsClose(me.tag, me.ExitPositioning)
end

--[[
  Register an event frame that forces positioning mode off when combat starts so an icon can
  never be left mouse enabled - it sits on top of the target frame and would swallow its clicks.
]]--
function me.RegisterCombatSafeguard()
  local eventFrame = CreateFrame("Frame")
  eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
  eventFrame:SetScript("OnEvent", function()
    if me.IsPositioning() then
      me.ExitPositioning()
    end
  end)

  me.combatSafeguardFrame = eventFrame
end

--[[
  Register a callback to be invoked whenever positioning mode changes

  @param {function} callback
]]--
function me.RegisterListener(callback)
  table.insert(listeners, callback)
end

--[[
  Invoke all registered listeners
]]--
function me.NotifyListeners()
  for _, callback in pairs(listeners) do
    callback()
  end
end

--[[
  Enter positioning mode - show both state icons and make them draggable
]]--
function me.EnterPositioning()
  --[[ retry the hook - the Settings window may not have existed yet during Init ]]--
  mod.guiHelper.HookSettingsClose(me.tag, me.ExitPositioning)

  --[[ both icons are children of the blizzard target frame - without a target that frame is
       hidden and nothing can become visible. Printed once here instead of once per feature ]]--
  if mod.target.GetCurrentTargetGuid() == nil then
    mod.logger.PrintUserError(rgpvpw.L["configuration_mode_no_target"])
  end

  if not mod.combatState.IsConfigurationModeEnabled() then
    mod.combatState.EnableConfigurationMode(true)
  end

  if not mod.stanceState.IsConfigurationModeEnabled() then
    mod.stanceState.EnableConfigurationMode(true)
  end
end

--[[
  Exit positioning mode - hide both state icons and make them click through again. Idempotent
  per feature: disabling a configuration mode that is not active would hide a stance icon that
  is legitimately shown, and unlike the combat icon nothing repaints it until the next target
  change.
]]--
function me.ExitPositioning()
  if mod.combatState.IsConfigurationModeEnabled() then
    mod.combatState.DisableConfigurationMode()
  end

  if mod.stanceState.IsConfigurationModeEnabled() then
    mod.stanceState.DisableConfigurationMode()
  end
end

--[[
  Toggle positioning mode
]]--
function me.TogglePositioning()
  if me.IsPositioning() then
    me.ExitPositioning()
  else
    me.EnterPositioning()
  end
end

--[[
  @return {boolean}
    true - if either state frame is currently in configuration mode
    false - if neither is
]]--
function me.IsPositioning()
  return mod.combatState.IsConfigurationModeEnabled()
    or mod.stanceState.IsConfigurationModeEnabled()
end
