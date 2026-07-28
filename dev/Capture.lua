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
  Development-only media capture. Loaded by the development .toc only - it must never
  ship in a release. Walks the generated RGPVPW_SHOTS manifest, sets the UI up for each
  shot, takes a screenshot and records the target frame's pixel rect so the post-process
  script can crop exactly instead of by eye.

  Static entries are driven by `shot <name>` / `shot all` / `shot next`. Entries marked
  kind = "gif" are screen recordings instead: `shot demo <name>` sets the UI up, prints
  the recording region and leaves the chrome visible until `shot hide`.

  Registers a `shot` sub-command on the production command registry (code/Cmd.lua). The
  registry is not what /rgpvpw help prints - that is a hardcoded list in code/Cmd.lua - so
  the dev-only command stays invisible without any extra effort.

  See the wow-media-capture skill for the full pipeline.
]]--

-- luacheck: globals C_Timer Screenshot SetCVar GetPhysicalScreenSize InCombatLockdown
-- luacheck: globals Settings SettingsPanel CreateFrame UIParent time
-- luacheck: globals PVPWarnShotLog RGPVPW_SHOTS

local mod = rgpvpw
local me = {}
mod.capture = me

me.tag = "Capture"

--[[
  Delay between setting the UI up and taking the screenshot. The frames need a moment to
  lay out - measuring too early yields a rect for the previous layout.
]]--
local SETTLE_DELAY = 0.5
--[[
  Delay before the UI chrome is restored. Must outlast SETTLE_DELAY so the chrome is still
  hidden when the screenshot is actually taken.
]]--
local RESTORE_DELAY = 1.0
--[[
  Spacing between shots in a `shot all` run.
]]--
local BATCH_INTERVAL = 2.5
--[[
  How long before the screenshot the vignette flash is fired. The flash animation runs
  fadeIn 0.25 -> hold 0.4 -> (pulse) -> fadeOut 0.5, so firing it this far ahead puts the
  screenshot on the fade-in peak instead of somewhere on the decay curve.
]]--
local FLASH_LEAD = 0.25
--[[
  How long after a category is opened the tab selection is applied. CategoryMenu.MenuOnShow
  unconditionally re-activates the spell tab whenever Blizzard shows the panel, so a
  synchronous ActivateTab would simply be overwritten. Must stay below SETTLE_DELAY.
]]--
local TAB_SELECT_DELAY = 0.15

--[[
  Default UI elements hidden for a clean capture. Guarded by existence - the set differs
  between Classic Era and TBC Anniversary.
]]--
local CHROME = {
  -- the primary action buttons do not follow MainMenuBar:Hide() on this client
  "ActionButton1",
  "ActionButton2",
  "ActionButton3",
  "ActionButton4",
  "ActionButton5",
  "ActionButton6",
  "ActionButton7",
  "ActionButton8",
  "ActionButton9",
  "ActionButton10",
  "ActionButton11",
  "ActionButton12",
  "MainActionBar",
  "MainActionBar.ActionBarPageNumber",
  "ChatFrame1",
  "ChatFrame1Tab",
  "ChatFrame1ButtonFrame",
  "ChatFrame1EditBox",
  "GeneralDockManager",
  "MinimapCluster",
  "MainMenuBar",
  "MultiBarBottomLeft",
  "MultiBarBottomRight",
  "MultiBarLeft",
  "MultiBarRight",
  "MultiBar5",
  "MultiBar6",
  "MultiBar7",
  "StanceBar",
  "StanceBarFrame",
  "PetActionBar",
  "PetActionBarFrame",
  "PossessActionBar",
  -- the 1.15 client splits the micro menu, bag buttons and xp bar into own frames
  "MicroMenuContainer",
  "MicroButtonAndBagsBar",
  "BagsBar",
  "StatusTrackingBarManager",
  "PlayerFrame",
  "TargetFrame",
  "PetFrame",
  "PartyMemberFrame1",
  "PartyMemberFrame2",
  "PartyMemberFrame3",
  "PartyMemberFrame4",
  "BuffFrame",
  "DebuffFrame",
  "TicketStatusFrame"
}

-- frames hidden by the current shot, restored afterwards
local hidden = {}
-- cursor for the keybind-safe `shot next` driver
local cursor = 1
-- the entry of the last `demo`, so `hide` can apply its chrome/hide configuration
local lastDemoEntry

-- forward declarations
local FindShot
local IsShootable
local RunSetup
local HideChrome
local HideFrames
local RestoreChrome
local ResolveFrame
local MeasureFrame
local MeasureShotRect
local RecordShot
local TakeShot
local HandleShotCommand

--[[
  Setup verbs referenced by the manifest's capture.setup array. Keep this vocabulary small -
  add a verb only when a shot genuinely needs it.
]]--
local setupVerbs = {
  --[[
    Open a Settings subcategory. Settings.OpenToCategory requires the numeric category id -
    passing a name errors ("outside of expected range"). The addon exposes its ids via
    mod.addonConfiguration.GetCategoryId(key).
  ]]--
  ["openCategory"] = function(key)
    local id = mod.addonConfiguration.GetCategoryId(key)

    if id == nil then
      mod.logger.PrintUserError("Unknown category key: " .. tostring(key))
      return
    end

    Settings.OpenToCategory(id)
  end,

  ["closeSettings"] = function()
    if SettingsPanel ~= nil then
      SettingsPanel:Hide()
    end
  end,

  ["showFrame"] = function(name)
    local frame = _G[name]

    if frame ~= nil then
      frame:Show()
    end
  end,

  --[[
    Switch a class category to one of its tabs (1 = spells, 2 = avoid). Deferred because
    CategoryMenu.MenuOnShow re-activates the spell tab every time the panel is shown.
  ]]--
  ["selectTab"] = function(position)
    local tab = tonumber(position)

    if tab == nil then
      mod.logger.PrintUserError("selectTab expects a tab number, got: " .. tostring(position))
      return
    end

    C_Timer.After(TAB_SELECT_DELAY, function()
      mod.categoryMenu.ActivateTab(tab)
    end)
  end,

  --[[
    Show a static, non-fading detection bar stack - one sample bar per configured slot with
    the stack alpha applied. Deliberately not EnterPositioning, which also draws the drag
    label that does not belong in media.
  ]]--
  ["previewDetectionBar"] = function()
    mod.detectionBarManager.ShowPreview()
  end,

  --[[
    Push the four staggered fake detections `/rgpvpw bar test` uses - the choreography a
    detection bar recording wants.
  ]]--
  ["testDetectionBar"] = function()
    mod.detectionBarCmd.PushTestBars()
  end,

  --[[
    Fire the vignette flash so it peaks when the screenshot is taken. mod.flash.Test bypasses
    the enabled gate, so no configuration change is needed.
  ]]--
  ["flashTest"] = function(color)
    if color == nil or color == "" then
      color = "red"
    end

    C_Timer.After(SETTLE_DELAY - FLASH_LEAD, function()
      if not mod.flash.Test(color) then
        mod.logger.PrintUserError("Unknown flash color: " .. tostring(color))
      end
    end)
  end,

  ["showCombatState"] = function()
    mod.combatState.EnableConfigurationMode()
  end,

  ["showStanceState"] = function()
    mod.stanceState.EnableConfigurationMode()
  end
}

--[[
  @param {string} name

  @return {table}, {number}
    The manifest entry and its index, or nil
]]--
FindShot = function(name)
  for i = 1, #RGPVPW_SHOTS do
    if RGPVPW_SHOTS[i].name == name or RGPVPW_SHOTS[i].shot == name then
      return RGPVPW_SHOTS[i], i
    end
  end

  return nil, nil
end

--[[
  Whether an entry is driven by the screenshot drivers. Gif entries are screen recordings -
  the `demo` driver supplies their region instead.

  @param {table} entry

  @return {boolean}
]]--
IsShootable = function(entry)
  return entry.kind ~= "gif"
end

--[[
  @param {table} entry
]]--
RunSetup = function(entry)
  for _, step in ipairs(entry.setup) do
    local verb, argument = string.match(step, "^(%w+):?(.*)$")
    local handler = setupVerbs[verb]

    if handler == nil then
      mod.logger.PrintUserError("Unknown setup verb: " .. tostring(verb))
    else
      handler(argument)
    end
  end
end

--[[
  Hide the default chrome for a clean capture. Frames named in keepFrames (the shot's
  capture.includeFrames) are spared so a shot can deliberately keep, e.g., the TargetFrame
  next to the combat state icon.

  @param {table | nil} keepFrames
    Array of frame names to leave visible
]]--
HideChrome = function(keepFrames)
  local keep = {}

  if keepFrames ~= nil then
    for _, name in ipairs(keepFrames) do
      keep[name] = true
    end
  end

  for _, name in ipairs(CHROME) do
    if not keep[name] then
      local frame = ResolveFrame(name)

      if frame ~= nil and frame.IsShown ~= nil and frame:IsShown() then
        -- alpha 0 on top of Hide: the modern action bar controller re-Shows bars on state
        -- changes (stance, paging) mid-recording - the alpha keeps them invisible
        frame:SetAlpha(0)
        frame:Hide()
        table.insert(hidden, frame)
      end
    end
  end
end

RestoreChrome = function()
  for _, frame in ipairs(hidden) do
    frame:SetAlpha(1)
    frame:Show()
  end

  hidden = {}
end

--[[
  Hide specific frames named by the shot's capture.hideFrames, right before the screenshot
  and restored afterwards (queued onto the same `hidden` list as the chrome). Used to
  suppress a frame a setup step forces visible - for PVPWarn that is above all the detection
  bar stack, which the Detection Bar panel's OnShow and the previewDetectionBar verb both
  leave on screen where it ghosts through the semi-transparent settings window.

  @param {table | nil} names
    Array of frame names to hide
]]--
HideFrames = function(names)
  if names == nil then return end

  for _, name in ipairs(names) do
    local frame = ResolveFrame(name)

    if frame ~= nil and frame.IsShown ~= nil and frame:IsShown() then
      frame:SetAlpha(0)
      frame:Hide()
      table.insert(hidden, frame)
    end
  end
end

--[[
  Resolve a manifest frame name to a live frame.

  @param {string} name

  @return {table | nil}
    The frame or nil
]]--
ResolveFrame = function(name)
  local frame = _G[name]

  if frame ~= nil then
    return frame
  end

  --[[
    Dotted paths reach non-global children the retail-style UI stopped exposing as globals -
    e.g. MainActionBar.ActionBarPageNumber (found via /fstack).
  ]]--
  if string.find(name, ".", 1, true) ~= nil then
    local current = _G

    for part in string.gmatch(name, "[^.]+") do
      current = current[part]

      if current == nil then
        return nil
      end
    end

    return current
  end

  --[[
    The detection bar's per-stack-position slot frames are created anonymously
    (DetectionBarManager.Init) so they have no global name, and the anchor they hang from is
    only one bar tall - cropping to the anchor alone clips most of the stack.
    PVPW_DetectionBarSlot_<n> is therefore resolved through the manager's public slots table
    so a manifest entry can union the whole stack into its crop rect.
  ]]--
  local position = string.match(name, "^PVPW_DetectionBarSlot_(%d+)$")

  if position ~= nil then
    return mod.detectionBarManager.slots[tonumber(position)]
  end

  return nil
end

--[[
  Convert a frame's UI coordinates to screenshot pixel coordinates. Two conversions are
  needed:

    1. WoW UI coordinates live in a virtual space that is a fixed 768 units tall at scale 1.0
       (UIParent:GetHeight() * UIParent:GetEffectiveScale() == 768), independent of the render
       resolution. A frame's GetLeft/GetTop/GetWidth/GetHeight are in that space, so UI units
       must be mapped up to real pixels via screenHeight / 768. Omitting this factor is the
       classic bug - crops come out ~2.6x too small and mispositioned.
    2. The UI origin is bottom-left while the screenshot's is top-left, so the y edge is
       flipped against screenHeight.

  @param {table} frame

  @return {number}, {number}, {number}, {number}, {number}, {number}
    x, y, width, height, screenWidth, screenHeight
]]--
MeasureFrame = function(frame)
  local screenWidth, screenHeight = GetPhysicalScreenSize()

  -- referenceHeight is 768; derived live rather than hardcoded so it survives any future
  -- change to WoW's virtual UI height
  local referenceHeight = UIParent:GetHeight() * UIParent:GetEffectiveScale()
  local uiToPixel = frame:GetEffectiveScale() * (screenHeight / referenceHeight)

  local x = frame:GetLeft() * uiToPixel
  local y = screenHeight - (frame:GetTop() * uiToPixel)
  local width = frame:GetWidth() * uiToPixel
  local height = frame:GetHeight() * uiToPixel

  return x, y, width, height, screenWidth, screenHeight
end

--[[
  Compute the crop rect for a shot: the primary frame's pixel rect, expanded to the union of
  any capture.includeFrames rects. This lets a shot capture a group - e.g. the detection bar
  anchor together with all four stack slots - instead of a single frame. Include frames that
  are missing, hidden or unpositioned are skipped so the crop degrades to the primary frame.

  @param {table} entry
  @param {table} frame
    The primary (already validated) frame

  @return {number}, {number}, {number}, {number}, {number}, {number}
    x, y, width, height, screenWidth, screenHeight
]]--
MeasureShotRect = function(entry, frame)
  local x, y, width, height, screenWidth, screenHeight = MeasureFrame(frame)
  local left, top, right, bottom = x, y, x + width, y + height

  if entry.includeFrames ~= nil then
    for _, name in ipairs(entry.includeFrames) do
      local extra = ResolveFrame(name)

      if extra ~= nil and extra.GetLeft ~= nil and extra:GetLeft() ~= nil and extra:IsShown() then
        local ex, ey, ew, eh = MeasureFrame(extra)

        left = math.min(left, ex)
        top = math.min(top, ey)
        right = math.max(right, ex + ew)
        bottom = math.max(bottom, ey + eh)
      end
    end
  end

  return left, top, right - left, bottom - top, screenWidth, screenHeight
end

--[[
  Append a shot record to the SavedVariable. Written as a JSON string so the post-process
  script needs no Lua table parser.

  @param {table} entry
  @param {table} frame
]]--
RecordShot = function(entry, frame)
  if PVPWarnShotLog == nil then
    PVPWarnShotLog = {}
  end

  local x, y, width, height, screenWidth, screenHeight = MeasureShotRect(entry, frame)

  table.insert(PVPWarnShotLog, string.format(
    '{"name":"%s","x":%d,"y":%d,"w":%d,"h":%d,"padding":%d,'
      .. '"uiScale":%.4f,"screenW":%d,"screenH":%d,"ts":%d}',
    entry.name,
    math.floor(x),
    math.floor(y),
    math.floor(width),
    math.floor(height),
    entry.padding,
    frame:GetEffectiveScale(),
    screenWidth,
    screenHeight,
    time()
  ))
end

--[[
  @param {table} entry
]]--
TakeShot = function(entry)
  if InCombatLockdown() then
    mod.logger.PrintUserError("Refusing to capture in combat - hiding protected frames would taint the UI")
    return
  end

  RunSetup(entry)

  C_Timer.After(SETTLE_DELAY, function()
    local frame = ResolveFrame(entry.frame)

    if frame == nil then
      mod.logger.PrintUserError("Frame not found: " .. entry.frame .. " (is it shown?)")
      return
    end

    if frame:GetLeft() == nil then
      mod.logger.PrintUserError("Frame has no position: " .. entry.frame .. " (it is probably hidden)")
      return
    end

    if entry.hideChrome then
      HideChrome(entry.includeFrames)
    end

    HideFrames(entry.hideFrames)

    RecordShot(entry, frame)
    Screenshot()

    print(rgpvpw.L["info_title"] .. " captured " .. entry.name)
  end)

  C_Timer.After(RESTORE_DELAY, RestoreChrome)
end

--[[
  Capture a single static shot by name. Gif entries are rejected - their region comes from
  the `demo` driver and a screen recorder does the recording.

  @param {string} name
]]--
function me.Shot(name)
  local entry = FindShot(name)

  if entry == nil then
    mod.logger.PrintUserError("Unknown shot: " .. tostring(name) .. " - try /rgpvpw shot list")
    return
  end

  if not IsShootable(entry) then
    mod.logger.PrintUserError(entry.name .. " is a gif - use /rgpvpw shot demo " .. entry.name)
    return
  end

  TakeShot(entry)
end

--[[
  Capture every static shot in the manifest, spaced far enough apart that each one settles.
  Gif entries are skipped. Requires Screenshot() to work from a timer callback - if it does
  not, use me.Next() bound to a key instead.
]]--
function me.ShotAll()
  me.Clear()

  local shootable = {}

  for i = 1, #RGPVPW_SHOTS do
    if IsShootable(RGPVPW_SHOTS[i]) then
      table.insert(shootable, RGPVPW_SHOTS[i])
    end
  end

  for i = 1, #shootable do
    C_Timer.After(BATCH_INTERVAL * (i - 1), function()
      TakeShot(shootable[i])
    end)
  end

  print(rgpvpw.L["info_title"] .. " capturing " .. #shootable .. " shot(s), /reload when done")
end

--[[
  Keybind-safe driver: capture the static shot at the cursor and advance. Use this when
  Screenshot() turns out to require a hardware event - and for shots that need the mouse to
  stay where it is.
]]--
function me.Next()
  while cursor <= #RGPVPW_SHOTS and not IsShootable(RGPVPW_SHOTS[cursor]) do
    cursor = cursor + 1
  end

  if cursor > #RGPVPW_SHOTS then
    print(rgpvpw.L["info_title"] .. " all shots captured - /reload to flush the log")
    return
  end

  local entry = RGPVPW_SHOTS[cursor]
  cursor = cursor + 1

  print(rgpvpw.L["info_title"] .. " shot " .. (cursor - 1) .. "/" .. #RGPVPW_SHOTS .. " - " .. entry.name)
  TakeShot(entry)
end

--[[
  Capture a static shot after a delay - for scenes the mouse has to hold open when the
  screenshot fires: type the command, set the scene up, the shot announces itself.

  @param {number} delay
    Seconds before the shot is set up and taken
  @param {string} name
]]--
function me.ShotIn(delay, name)
  if type(delay) ~= "number" or delay <= 0 then
    mod.logger.PrintUserError("Usage: /rgpvpw shot in <seconds> <name>")
    return
  end

  local entry = FindShot(name)

  if entry == nil then
    mod.logger.PrintUserError("Unknown shot: " .. tostring(name) .. " - try /rgpvpw shot list")
    return
  end

  if not IsShootable(entry) then
    mod.logger.PrintUserError(entry.name .. " is a gif - use /rgpvpw shot demo " .. entry.name)
    return
  end

  print(rgpvpw.L["info_title"] .. " capturing " .. entry.name .. " in " .. delay .. "s - set up the scene now")

  C_Timer.After(delay, function()
    TakeShot(entry)
  end)
end

--[[
  Set the UI up for a gif recording and print the recording region. The chrome stays VISIBLE
  so the printed region is readable in chat - hide it with `/rgpvpw shot hide` right before
  recording (chrome does not affect the measured geometry). Unlike static shots nothing is
  written to the shot log, so a demo cannot break the post-process pairing.

  The optional delay postpones the measurement so state-dependent frames can be brought up
  first. For the detection bar the four slot frames are always present, so the printed region
  already covers bars that have not been pushed yet - measure first, then record, then run
  /rgpvpw bar test.

  @param {string} name
  @param {string | nil} delay
    Optional seconds before the region is measured
]]--
function me.Demo(name, delay)
  local entry = FindShot(name)

  if entry == nil then
    mod.logger.PrintUserError("Unknown shot: " .. tostring(name) .. " - try /rgpvpw shot list")
    return
  end

  delay = tonumber(delay) or SETTLE_DELAY

  RunSetup(entry)

  if delay > SETTLE_DELAY then
    print(rgpvpw.L["info_title"] .. " measuring " .. entry.name .. " in " .. delay
      .. "s - set the scene up now")
  end

  C_Timer.After(delay, function()
    local frame = ResolveFrame(entry.frame)

    if frame == nil or frame:GetLeft() == nil then
      mod.logger.PrintUserError("Frame not found or hidden: " .. entry.frame)
      return
    end

    lastDemoEntry = entry

    -- unlike static shots the padding is applied here: the printed rect is what the user
    -- types into the recorder, so it must be final and clamped to the screen
    local x, y, width, height, screenWidth, screenHeight = MeasureShotRect(entry, frame)
    local padding = entry.padding or 0
    local left = math.max(0, math.floor(x) - padding)
    local top = math.max(0, math.floor(y) - padding)
    local right = math.min(screenWidth, math.floor(x + width) + padding)
    local bottom = math.min(screenHeight, math.floor(y + height) + padding)

    print(string.format(
      "%s demo region for %s: X=%d Y=%d W=%d H=%d (screen %dx%d)",
      rgpvpw.L["info_title"], entry.name, left, top, right - left, bottom - top,
      screenWidth, screenHeight
    ))
    print(rgpvpw.L["info_title"] .. " set the recording region, then /rgpvpw shot hide - record"
      .. " - /rgpvpw shot restore")
  end)
end

--[[
  Hide the chrome for the recording of the last `demo` (falls back to the plain chrome set
  when no demo ran). Kept separate from me.Demo so the printed region stays readable in chat
  until the user is ready to record.
]]--
function me.Hide()
  if InCombatLockdown() then
    mod.logger.PrintUserError("Refusing to hide frames in combat - it would taint the UI")
    return
  end

  if lastDemoEntry ~= nil then
    if lastDemoEntry.hideChrome then
      HideChrome(lastDemoEntry.includeFrames)
    end

    HideFrames(lastDemoEntry.hideFrames)
  else
    HideChrome(nil)
  end

  print(rgpvpw.L["info_title"] .. " chrome hidden - record now, then /rgpvpw shot restore")
end

--[[
  Restore the chrome a `hide` left hidden.
]]--
function me.Restore()
  RestoreChrome()
  print(rgpvpw.L["info_title"] .. " chrome restored")
end

--[[
  Reset the shot log and the cursor. The post-process script pairs log records with the
  newest screenshot files, so a stale log breaks the pairing.
]]--
function me.Clear()
  PVPWarnShotLog = {}
  cursor = 1
end

--[[
  Print the manifest.
]]--
function me.List()
  print(rgpvpw.L["info_title"] .. " " .. #RGPVPW_SHOTS .. " shot(s)")

  for i = 1, #RGPVPW_SHOTS do
    local entry = RGPVPW_SHOTS[i]
    local marker = IsShootable(entry) and "" or " |cFFFF6060(gif)|r"

    print("  |cFFFFC300" .. entry.name .. "|r" .. marker .. " - " .. entry.shows .. " (" .. entry.frame .. ")")
  end
end

--[[
  Handle the `shot` sub-command of /rgpvpw. Receives the remaining arguments from the command
  registry, the sub-command name already removed.

  @param {table} args
]]--
HandleShotCommand = function(args)
  if args[1] == nil or args[1] == "help" then
    print(rgpvpw.L["info_title"] .. " media capture (development only)")
    print("  |cFFFFC300list|r - show the shot manifest")
    print("  |cFFFFC300all|r - capture every static shot")
    print("  |cFFFFC300next|r - capture the next static shot (bind this if `all` does not work)")
    print("  |cFFFFC300in <seconds> <name>|r - capture a static shot after a delay")
    print("  |cFFFFC300demo <name> [seconds]|r - set up a gif recording and print its region")
    print("  |cFFFFC300hide|r - hide the chrome right before recording")
    print("  |cFFFFC300restore|r - restore the chrome after a recording")
    print("  |cFFFFC300clear|r - reset the shot log")
    print("  |cFFFFC300<name>|r - capture a single static shot")
  elseif args[1] == "list" then
    me.List()
  elseif args[1] == "all" then
    me.ShotAll()
  elseif args[1] == "next" then
    me.Next()
  elseif args[1] == "in" then
    me.ShotIn(tonumber(args[2]), args[3])
  elseif args[1] == "demo" then
    me.Demo(args[2], args[3])
  elseif args[1] == "hide" then
    me.Hide()
  elseif args[1] == "restore" then
    me.Restore()
  elseif args[1] == "clear" then
    me.Clear()
    print(rgpvpw.L["info_title"] .. " shot log cleared")
  else
    me.Shot(args[1])
  end
end

--[[
  Register the `shot` subcommand on load, the same way code/DetectionBarCmd.lua and
  code/FlashCmd.lua do - the toc loads code/Cmd.lua long before this file.
]]--
mod.cmd.RegisterCommand("shot", HandleShotCommand)

--[[
  Screenshots default to JPEG, which is lossy on UI panels. PNG is the right format for media
  that ends up in a README. The CVar is set after login so it sticks.
]]--
local eventFrame = CreateFrame("Frame")

eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", function()
  SetCVar("screenshotFormat", "png")
end)
