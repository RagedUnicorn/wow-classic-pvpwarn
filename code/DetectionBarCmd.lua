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

-- luacheck: globals C_Timer GetSpellInfo

--[[
  Registers the `bar` subcommand on the /rgpvpw and /pvpwarn registry:

    /rgpvpw bar lock    - lock the detection bar anchor
    /rgpvpw bar unlock  - unlock the detection bar anchor (shows the drag handle)
    /rgpvpw bar test    - push four staggered fake bars so the stack can be verified visually
]]--

local mod = rgpvpw
local me = {}
mod.detectionBarCmd = me

me.tag = "DetectionBarCmd"

--[[
  Fake detections used by `/rgpvpw bar test`. Mixed class tokens, spell ids and a realm
  suffix (to exercise realm stripping) so every slot fills and the alpha multipliers and the
  slide-up animation get exercised.
]]--
local TEST_BARS = {
  { spellID = 1784, classToken = "ROGUE", playerName = "Sneaky-Whitemane" },       -- Stealth
  { spellID = 118, classToken = "MAGE", playerName = "Frostbolt" },                -- Polymorph
  { spellID = 17, classToken = "PRIEST", playerName = "Lightwell", isRemoved = true }, -- Power Word: Shield down
  { spellID = 100, classToken = "WARRIOR", playerName = "Chargington" }            -- Charge
}

--[[
  Handle the `bar` subcommand.

  @param {table} args
    The remaining arguments after the `bar` subcommand
]]--
function me.HandleBar(args)
  local action = args[1]

  if action == "lock" then
    mod.detectionBarAnchor.ExitPositioning()
    print(rgpvpw.L["info_title"] .. " " .. rgpvpw.L["detection_bar_locked_message"])
  elseif action == "unlock" then
    mod.detectionBarAnchor.EnterPositioning()
    print(rgpvpw.L["info_title"] .. " " .. rgpvpw.L["detection_bar_unlocked_message"])
  elseif action == "test" then
    me.PushTestBars()
  else
    mod.logger.PrintUserError(rgpvpw.L["invalid_argument"])
  end
end

--[[
  Push the test bars in sequence (~0.5s apart) so the stack, alpha multipliers and slide-up
  can be observed.
]]--
function me.PushTestBars()
  local eventColor = RGPVPW_CONSTANTS.DETECTION_BAR_DEFAULT_EVENT_COLOR

  for i, testBar in ipairs(TEST_BARS) do
    C_Timer.After((i - 1) * 0.5, function()
      local spellName = GetSpellInfo(testBar.spellID)

      mod.detectionBarManager.Push({
        spellID = testBar.spellID,
        classToken = testBar.classToken,
        playerName = testBar.playerName,
        eventText = testBar.isRemoved
          and mod.combatLog.BuildRemovedEventText(spellName, eventColor) or spellName,
        eventColor = testBar.isRemoved
          and RGPVPW_CONSTANTS.DETECTION_BAR_REMOVED_EVENT_COLOR or eventColor,
        isRemoved = testBar.isRemoved
      })
    end)
  end
end

--[[
  Register the `bar` subcommand on load.
]]--
mod.cmd.RegisterCommand("bar", me.HandleBar)
