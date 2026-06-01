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

-- luacheck: globals CreateFrame GetTime GetSpellInfo

--[[
  Owns the vertical stack of detection bars: newest at the top, older ones below with a
  decreasing stack-position alpha, max maxBars visible, oldest dropped on overflow, a 200ms
  slide-up when a bar dies, dedup of repeated detections, and suppression during loading screens.

  WoW AnimationGroups set absolute alpha - they cannot multiply - so the stack-position alpha
  is applied through per-slot wrapper frames. Each bar lives inside a slot wrapper whose alpha
  cascades down to the child bar, leaving the bar's own fade animation untouched. See
  reference/handoffs/detection-bar/README.md "Things that don't translate cleanly" #2.
]]--

local mod = rgpvpw
local me = {}
mod.detectionBarManager = me

me.tag = "DetectionBarManager"

--[[ stack-position alpha multipliers, newest (top) first ]]--
local STACK_ALPHA = { 1.0, 0.7, 0.45, 0.30 }
local MAX_SLOTS = 4
local SLIDE_UP_DURATION = 0.2

--[[
  Sample detections used to populate edit-mode preview, one per slot (newest first). Real,
  classic-valid spell ids so GetSpellInfo resolves an icon.
]]--
local PREVIEW_SAMPLES = {
  { spellID = 1784, classToken = "ROGUE", playerName = "Stalker" },     -- Stealth
  { spellID = 118, classToken = "MAGE", playerName = "Frostbite" },     -- Polymorph
  { spellID = 17, classToken = "PRIEST", playerName = "Lightbringer" }, -- Power Word: Shield
  { spellID = 100, classToken = "WARRIOR", playerName = "Bonecrush" }   -- Charge
}

--[[ The user-movable anchor the stack hangs from ]]--
me.anchor = nil
--[[ Per stack-position wrapper frames (slot[1] = top). Their alpha multiplies the child bar. ]]--
me.slots = {}
--[[ Active bars, newest at [1] ]]--
me.active = {}
--[[ Recycled bars ready for reuse ]]--
me.pool = {}
--[[ Whether new bars are currently suppressed (loading screen) ]]--
me.suppressed = false
--[[ Debug counters - used by /rgpvpw bar test to confirm pooling reuses bars ]]--
me.barsCreated = 0
me.poolReuses = 0
--[[ Dedicated static sample bars shown during edit-mode positioning (index = slot) ]]--
me.previewBars = {}

--[[
  Initialize the manager and build the slot wrapper frames.

  @param {table} anchorFrame
    The anchor frame the stack should grow downward from
]]--
function me.Init(anchorFrame)
  me.anchor = anchorFrame

  local width = RGPVPW_CONSTANTS.DETECTION_BAR_WIDTH
  local height = RGPVPW_CONSTANTS.DETECTION_BAR_HEIGHT
  local gap = RGPVPW_CONSTANTS.DETECTION_BAR_GAP

  for i = 1, MAX_SLOTS do
    local slot = CreateFrame("Frame", nil, anchorFrame)
    slot:SetSize(width, height)
    slot:SetPoint("TOP", anchorFrame, "TOP", 0, -(i - 1) * (height + gap))
    slot:SetAlpha(STACK_ALPHA[i])
    me.slots[i] = slot
  end

  me.RegisterSuppressionEvents()
  me.ApplyScale()

  mod.logger.LogDebug(me.tag, "Initialized detection bar manager with " .. MAX_SLOTS .. " slots")
end

--[[
  Apply the configured bar scale to every slot. Scaling the slot scales its child bar and the
  slot's offset from the anchor, so the whole stack - bar size, every element within and the
  inter-bar spacing - scales uniformly while the anchor keeps its saved position.
]]--
function me.ApplyScale()
  local scale = mod.configuration.GetDetectionBarScale()

  for _, slot in ipairs(me.slots) do
    slot:SetScale(scale)
  end
end

--[[
  Register the event frame that suppresses new bars during loading screens so detections that
  fire mid-load do not pile up behind the loading screen.
]]--
function me.RegisterSuppressionEvents()
  local eventFrame = CreateFrame("Frame")

  eventFrame:RegisterEvent("LOADING_SCREEN_ENABLED")
  eventFrame:RegisterEvent("LOADING_SCREEN_DISABLED")

  eventFrame:SetScript("OnEvent", function(_, event)
    if event == "LOADING_SCREEN_ENABLED" then
      me.suppressed = true
      me.ClearAll()
    else
      me.suppressed = false
    end
  end)

  me.eventFrame = eventFrame
end

--[[
  Acquire a bar from the pool or build a new one.

  @param {table} parent
    The slot frame the bar should initially be parented to

  @return {table}
    A bar object
]]--
function me.Acquire(parent)
  local bar = table.remove(me.pool)

  if bar then
    me.poolReuses = me.poolReuses + 1
    bar.frame:SetParent(parent)
  else
    bar = mod.detectionBar.New(parent)
    me.barsCreated = me.barsCreated + 1
  end

  bar.onDeath = me.OnBarDeath

  return bar
end

--[[
  Push a new detection onto the stack.

  @param {table} opts
    {
      spellID = {number},
      classToken = {string},
      playerName = {string},
      eventText = {string},
      eventColor = { r, g, b }
    }
]]--
function me.Push(opts)
  if me.suppressed then
    mod.logger.LogDebug(me.tag, "Suppressed - ignoring detection bar push")
    return
  end

  if me.anchor == nil then
    mod.logger.LogWarn(me.tag, "Detection bar manager not initialized - ignoring push")
    return
  end

  --[[ dedup: refresh a matching live bar instead of stacking a duplicate ]]--
  if me.TryDedup(opts) then return end

  local maxBars = mod.configuration.GetDetectionBarMaxBars()

  --[[ drop overflow oldest immediately (no fade - it would be pushed off the stack anyway) ]]--
  while #me.active >= maxBars do
    local oldest = table.remove(me.active)
    mod.detectionBar.Stop(oldest)
    table.insert(me.pool, oldest)
  end

  local bar = me.Acquire(me.slots[1])
  table.insert(me.active, 1, bar)

  --[[ snap every bar to its new slot, newest in slot 1 ]]--
  me.AssignSlots()

  mod.detectionBar.Set(bar, opts)
  bar.lastPushedAt = GetTime()
  mod.detectionBar.Play(bar)
end

--[[
  If an active bar matches the incoming (playerName, spellID) within the dedup window, refresh
  its hold timer and return true. Otherwise return false.

  @param {table} opts

  @return {boolean}
]]--
function me.TryDedup(opts)
  local window = mod.configuration.GetDetectionBarDedupWindow() or 1.0
  local incomingName = opts.playerName and (opts.playerName:match("^([^%-]+)") or opts.playerName) or ""
  local now = GetTime()

  for _, bar in ipairs(me.active) do
    if bar.spellID == opts.spellID and bar.playerName == incomingName
        and bar.lastPushedAt ~= nil and (now - bar.lastPushedAt) <= window then
      mod.detectionBar.Refresh(bar)
      bar.lastPushedAt = now
      mod.logger.LogDebug(me.tag, "Deduped detection bar push for " .. incomingName)

      return true
    end
  end

  return false
end

--[[
  Parent each active bar to its stack slot and snap it into place (no animation).
]]--
function me.AssignSlots()
  for i, bar in ipairs(me.active) do
    bar.slotIndex = i
    bar.frame:SetParent(me.slots[i])
    bar.frame:ClearAllPoints()
    bar.frame:SetPoint("TOPLEFT", me.slots[i], "TOPLEFT", 0, 0)
  end
end

--[[
  Called when a bar's lifecycle finishes. Returns the bar to the pool and slides the remaining
  bars up into their new slots.

  @param {table} bar
]]--
function me.OnBarDeath(bar)
  for i, activeBar in ipairs(me.active) do
    if activeBar == bar then
      table.remove(me.active, i)
      break
    end
  end

  table.insert(me.pool, bar)
  me.AnimateRelayout(SLIDE_UP_DURATION)
end

--[[
  Reassign the remaining bars to their new slots and tween any bar that moved up from its old
  position to its new slot over the given duration.

  @param {number} duration
]]--
function me.AnimateRelayout(duration)
  local height = RGPVPW_CONSTANTS.DETECTION_BAR_HEIGHT
  local gap = RGPVPW_CONSTANTS.DETECTION_BAR_GAP
  local step = height + gap
  local tweens = {}

  for i, bar in ipairs(me.active) do
    local oldIndex = bar.slotIndex or i
    local slotsMovedUp = oldIndex - i -- positive when the bar slid up

    bar.slotIndex = i
    bar.frame:SetParent(me.slots[i])
    bar.frame:ClearAllPoints()

    --[[ start the bar one-or-more slots lower (where it visually was) and tween up to 0 ]]--
    local startOffset = -slotsMovedUp * step
    bar.frame:SetPoint("TOPLEFT", me.slots[i], "TOPLEFT", 0, startOffset)

    if startOffset ~= 0 then
      table.insert(tweens, { frame = bar.frame, slot = me.slots[i], fromY = startOffset })
    end
  end

  if #tweens == 0 then return end

  local start = GetTime()

  me.anchor:SetScript("OnUpdate", function(self)
    local t = (GetTime() - start) / duration

    if t > 1 then t = 1 end

    for _, tween in ipairs(tweens) do
      local y = tween.fromY + (0 - tween.fromY) * t
      tween.frame:ClearAllPoints()
      tween.frame:SetPoint("TOPLEFT", tween.slot, "TOPLEFT", 0, y)
    end

    if t >= 1 then
      self:SetScript("OnUpdate", nil)
    end
  end)
end

--[[
  Stop and recycle every active bar immediately (no fade). Used when a loading screen begins.
]]--
function me.ClearAll()
  me.anchor:SetScript("OnUpdate", nil)

  for _, bar in ipairs(me.active) do
    mod.detectionBar.Stop(bar)
    table.insert(me.pool, bar)
  end

  me.active = {}
end

--[[
  Show a static, non-fading stack of sample bars - one per configured visible slot - so the
  user can see exactly how many bars stack, their size, look and position while positioning the
  anchor. Each bar sits in its slot so the stack-position alpha applies. Idempotent: re-applies
  the current configuration (maxBars, font sizes) each call, hiding any preview bars beyond the
  current maxBars, so live option changes are reflected.
]]--
function me.ShowPreview()
  if me.anchor == nil then return end

  local maxBars = mod.configuration.GetDetectionBarMaxBars()
  local eventColor = RGPVPW_CONSTANTS.DETECTION_BAR_DEFAULT_EVENT_COLOR

  for i = 1, MAX_SLOTS do
    if i <= maxBars then
      local bar = me.previewBars[i]

      if bar == nil then
        bar = mod.detectionBar.New(me.slots[i])
        me.previewBars[i] = bar
      end

      local sample = PREVIEW_SAMPLES[i]
      bar.frame:SetParent(me.slots[i])
      bar.frame:ClearAllPoints()
      bar.frame:SetPoint("TOPLEFT", me.slots[i], "TOPLEFT", 0, 0)

      mod.detectionBar.Set(bar, {
        spellID = sample.spellID,
        classToken = sample.classToken,
        playerName = sample.playerName,
        eventText = GetSpellInfo(sample.spellID) or rgpvpw.L["detection_bar_title"],
        eventColor = eventColor
      })

      --[[ full opacity without the fade lifecycle so it persists; slot alpha handles the stack ]]--
      bar.life:Stop()
      bar.frame:SetAlpha(1)
      bar.frame:Show()
    elseif me.previewBars[i] ~= nil then
      me.previewBars[i].life:Stop()
      me.previewBars[i].frame:Hide()
    end
  end
end

--[[
  Hide every sample preview bar.
]]--
function me.HidePreview()
  for _, bar in ipairs(me.previewBars) do
    bar.life:Stop()
    bar.frame:Hide()
  end
end

--[[
  Rebuild the preview for the current configuration if it is currently shown. Used by the options
  sliders so max-bars and font-size changes preview live.
]]--
function me.RefreshPreview()
  for _, bar in ipairs(me.previewBars) do
    if bar.frame:IsShown() then
      me.ShowPreview()
      return
    end
  end
end
