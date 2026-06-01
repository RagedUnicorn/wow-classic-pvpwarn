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

-- luacheck: globals CreateFrame RAID_CLASS_COLORS GetSpellInfo

--[[
  Visual primitive for a single detection bar. A detection bar surfaces one detected enemy
  spell over gameplay:

    [ class-bordered spell icon ]  [ EVENT TEXT ]  [ Player Name ]

  The bar has its own fade-in -> hold -> fade-out lifecycle animation. The stack manager
  (mod.detectionBarManager) composes multiple bars and owns the stack-position alpha and the
  slide-up animation.
]]--

local mod = rgpvpw
local me = {}
mod.detectionBar = me

me.tag = "DetectionBar"

--[[
  Apply the bundled detection-bar font, falling back to the default WoW font if the custom font fails to load.

  @param {table} fontString
  @param {number} size
  @param {string} flags
]]--
local function applyFont(fontString, size, flags)
  if not fontString:SetFont(RGPVPW_CONSTANTS.DETECTION_BAR_FONT, size, flags) then
    fontString:SetFont(RGPVPW_CONSTANTS.DETECTION_BAR_FONT_FALLBACK, size, flags)
  end
end

--[[
  Build a new detection bar. The returned table is a plain bar object; its lifecycle methods
  live on this module (me.Set / me.Play / me.OnDeath) and take the bar as their first argument.

  @param {table} parent
    The frame the bar should be parented to (usually a manager slot wrapper frame)

  @return {table}
    A bar object with a .frame field
]]--
function me.New(parent)
  local width = RGPVPW_CONSTANTS.DETECTION_BAR_WIDTH
  local height = RGPVPW_CONSTANTS.DETECTION_BAR_HEIGHT
  local iconSize = height - 16
  local padX = width * 0.14

  local frame = CreateFrame("Frame", nil, parent)
  frame:SetSize(width, height)
  frame:EnableMouse(false)
  frame:EnableMouseWheel(false)
  frame:Hide()

  --[[ Background: class-colored gradient layer ]]--
  local bg = frame:CreateTexture(nil, "BACKGROUND", nil, 0)
  bg:SetTexture(RGPVPW_CONSTANTS.DETECTION_BAR_GRADIENT_CLASS_TEXTURE)
  bg:SetAllPoints(frame)

  --[[ Background: black darken layer stacked on top of the class layer ]]--
  local dark = frame:CreateTexture(nil, "BACKGROUND", nil, 1)
  dark:SetTexture(RGPVPW_CONSTANTS.DETECTION_BAR_GRADIENT_DARK_TEXTURE)
  dark:SetVertexColor(0, 0, 0, 0.85)
  dark:SetAllPoints(frame)

  --[[ Soft class-colored halo under the icon ]]--
  local iconGlow = frame:CreateTexture(nil, "BACKGROUND", nil, 2)
  iconGlow:SetTexture(RGPVPW_CONSTANTS.DETECTION_BAR_ICON_GLOW_TEXTURE)
  iconGlow:SetBlendMode("BLEND")
  iconGlow:SetSize(iconSize + 24, iconSize + 24)

  --[[ Icon with a class-colored border and a 1px inset bevel ]]--
  local iconHolder = CreateFrame("Frame", nil, frame, "BackdropTemplate")
  iconHolder:SetSize(iconSize, iconSize)
  iconHolder:SetPoint("LEFT", frame, "LEFT", padX, 0)
  iconHolder:SetBackdrop({
    edgeFile = "Interface\\Buttons\\WHITE8x8",
    edgeSize = 2
  })

  iconGlow:SetPoint("CENTER", iconHolder, "CENTER")

  local icon = iconHolder:CreateTexture(nil, "ARTWORK")
  icon:SetPoint("TOPLEFT", 2, -2)
  icon:SetPoint("BOTTOMRIGHT", -2, 2)
  icon:SetTexCoord(0.08, 0.92, 0.08, 0.92) -- crop Blizzard's default dark icon edge

  --[[ Event text - heavy Fira Sans (~design weight 800), ~0.46 of bar height ]]--
  local eventText = frame:CreateFontString(nil, "OVERLAY")
  applyFont(eventText, 24, "OUTLINE")
  eventText:SetPoint("LEFT", iconHolder, "RIGHT", 14, 0)
  eventText:SetShadowColor(0, 0, 0, 1)
  eventText:SetShadowOffset(0, -1)

  --[[ Player name - heavy Fira Sans, ~0.42 of bar height ]]--
  local nameText = frame:CreateFontString(nil, "OVERLAY")
  applyFont(nameText, 20, "OUTLINE")
  nameText:SetPoint("LEFT", eventText, "RIGHT", 14, 0)
  nameText:SetShadowColor(0, 0, 0, 1)
  nameText:SetShadowOffset(0, -1)

  --[[ Lifecycle animation: fade in -> hold -> fade out ]]--
  local life = frame:CreateAnimationGroup()

  local fadeIn = life:CreateAnimation("Alpha")
  fadeIn:SetFromAlpha(0)
  fadeIn:SetToAlpha(1)
  fadeIn:SetDuration(0.18)
  fadeIn:SetOrder(1)
  fadeIn:SetSmoothing("OUT")

  local hold = life:CreateAnimation("Alpha")
  hold:SetFromAlpha(1)
  hold:SetToAlpha(1)
  hold:SetDuration(4.0)
  hold:SetOrder(2)

  local fadeOut = life:CreateAnimation("Alpha")
  fadeOut:SetFromAlpha(1)
  fadeOut:SetToAlpha(0)
  fadeOut:SetDuration(0.7)
  fadeOut:SetOrder(3)
  fadeOut:SetSmoothing("IN")

  local bar = {
    tag = me.tag,
    frame = frame,
    bg = bg,
    dark = dark,
    iconHolder = iconHolder,
    icon = icon,
    iconGlow = iconGlow,
    eventText = eventText,
    nameText = nameText,
    life = life
  }

  life:SetScript("OnFinished", function()
    me.OnDeath(bar)
  end)

  return bar
end

--[[
  Populate a bar from a detection payload.

  @param {table} bar
    A bar object as returned by me.New
  @param {table} opts
    {
      spellID = {number},
      classToken = {string},   -- e.g. "ROGUE", "MAGE"; nil falls back to neutral white
      playerName = {string},   -- may include a "-Realm" suffix which is stripped
      eventText = {string},    -- the localized spell name to display
      eventColor = { r, g, b } -- optional, defaults to #FF4FA8
    }
]]--
function me.Set(bar, opts)
  local cc = (opts.classToken and RAID_CLASS_COLORS[opts.classToken]) or { r = 1, g = 1, b = 1 }
  local cleanName = opts.playerName and (opts.playerName:match("^([^%-]+)") or opts.playerName) or ""

  bar.spellID = opts.spellID
  bar.playerName = cleanName

  bar.bg:SetVertexColor(cc.r, cc.g, cc.b, 1)
  bar.iconHolder:SetBackdropBorderColor(cc.r, cc.g, cc.b, 1)
  bar.iconGlow:SetVertexColor(cc.r, cc.g, cc.b, 0.55)

  if opts.spellID then
    bar.icon:SetTexture(select(3, GetSpellInfo(opts.spellID)))
  end

  --[[
    Font face / sizes are the fixed design tokens set in me.New (Fira Sans Heavy, 24pt event /
    20pt name). Overall bar size is controlled by the slot scale (see
    mod.detectionBarManager.ApplyScale), which scales every element - icon, gradients and both
    fonts - uniformly.
  ]]--
  bar.eventText:SetText(opts.eventText or "")
  local ec = opts.eventColor or RGPVPW_CONSTANTS.DETECTION_BAR_DEFAULT_EVENT_COLOR
  bar.eventText:SetTextColor(ec.r, ec.g, ec.b, 1)

  bar.nameText:SetText(cleanName)
  bar.nameText:SetTextColor(cc.r, cc.g, cc.b, 1)
end

--[[
  Run the bar's lifecycle from the start.

  @param {table} bar
]]--
function me.Play(bar)
  bar.frame:SetAlpha(0)
  bar.frame:Show()
  bar.life:Stop()
  bar.life:Play()
end

--[[
  Stop the bar's lifecycle and hide it immediately (no fade). Used when the manager drops an
  overflow bar or clears the stack during a loading screen.

  @param {table} bar
]]--
function me.Stop(bar)
  bar.life:Stop()
  bar.frame:Hide()
end

--[[
  Restart the bar's hold timer without rebuilding it. Used by the dedup path so a repeated
  detection refreshes the existing bar's lifetime instead of stacking a duplicate.

  @param {table} bar
]]--
function me.Refresh(bar)
  bar.frame:SetAlpha(1)
  bar.frame:Show()
  bar.life:Stop()
  bar.life:Play()
end

--[[
  Lifecycle finished - hide the bar and hand it back to the manager for recycling.

  @param {table} bar
]]--
function me.OnDeath(bar)
  bar.frame:Hide()

  if bar.onDeath then
    bar.onDeath(bar)
  end
end
