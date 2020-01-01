--[[
  MIT License

  Copyright (c) 2019 Michael Wiesendanger

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

local mod = rgpvpw
local me = {}
mod.testCombatEventsRogueEn = me

-- /run rgpvpw.testCombatEventsRogueEn.InitTestGroup()

me.tag = "TestCombatEventsRogueEn"

local testGroupName = "CombatEventsRogueEn"
local testCategory = "rogue"

function me.InitTestGroup()
  mod.testReporter.StartTestGroup(testGroupName)

  me.TestCombatEventBlindApplied()

  mod.testReporter.StopTestGroup()
end

--[[
  Example:

  {
    1566599449.589, -- [1]
    "SPELL_CAST_SUCCESS", -- [2]
    false, -- [3]
    "Player-531-0764E8DF", -- [4]
    "Shalitas", -- [5]
    66888, -- [6]
    0, -- [7]
    "Player-531-076B8096", -- [8]
    "Shalilol", -- [9]
    1297, -- [10]
    0, -- [11]
    1776, -- [12]
    "Gouge", -- [13]
    1, -- [14]
  }
]]--
function me.TestCombatEventBlindApplied()
  local testName = "TestCombatEventBlindApplied"
  mod.testReporter.StartTestRun(testName)

  local event = "SPELL_AURA_APPLIED"
  local sourceFlags = 1352
  local target = mod.testHelper.GetGenericEnemyId()
  local targetName = mod.testHelper.GetGenericEnemyName()
  local spellName = "Blind"
  local failureReason

  local fakeSpellCastCombatEvent = function()
    return  _, event, _, _, _, sourceFlags, _, target, targetName, _, _, _, spellName
  end

  mod.testHelper.HookCombatLogGetCurrentEventInfo(fakeSpellCastCombatEvent)
  mod.combatLog.ProcessUnfilteredCombatLogEvent(function(category, spellType, spell)
    if testCategory ~= category then
      failureReason = string.format("Expected category %s but got %s", testCategory, tostring(category))
    end

    if RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED ~= spellType then
      failureReason = string.format("Expected spellType %i but got %i", RGPVPW_CONSTANTS.SPELL_TYPES.APPLIED, spellType)
    end

    if not spell then
      failureReason = "Did not get any spell metadata"
    end
  end)
  mod.testHelper.RestoreCombatLogGetCurrentEventInfo()

  if failureReason ~= nil then
    mod.testReporter.ReportFailureTestRun(failureReason)
  else
    mod.testReporter.ReportSuccessTestRun()
  end
end
