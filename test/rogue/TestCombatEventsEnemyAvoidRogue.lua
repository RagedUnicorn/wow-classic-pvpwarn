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

local mod = rgpvpw
local me = {}
mod.testCombatEventsEnemyAvoidRogue = me

me.tag = "TestCombatEventsEnemyAvoidRogue"

local testGroupName = "CombatEventsEnemyAvoidRogue"
local testCategory = "rogue"

function me.Test()
  local isUsingSessionManager = false

  -- Check if session manager is handling test group management
  if mod.testSessionManager and mod.testSessionManager.IsSessionActive() then
    -- Session manager is active, just collect tests without managing test group
    isUsingSessionManager = true
    me.CollectTestCases()
  else
    -- No session manager, handle test group ourselves
    mod.testReporter.StartTestGroup(testGroupName)
    me.CollectTestCases()
  end

  mod.testReporter.PlayTestQueueWithDelay(function()
    if not isUsingSessionManager then
      mod.testReporter.StopTestGroup() -- async finish of test group
    end
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickDodge_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickBlock_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickParry_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickMiss_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickResist_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickImmune_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickReflect_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickAbsorbIgnored_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickDodge_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickBlock_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickParry_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickMiss_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickResist_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickImmune_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickReflect_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickAbsorbIgnored_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickDodge_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickBlock_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickParry_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickMiss_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickResist_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickImmune_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickReflect_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickAbsorbIgnored_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickDodge_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickBlock_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickParry_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickMiss_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickResist_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickImmune_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickReflect_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickAbsorbIgnored_1768)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotDodge_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotBlock_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotParry_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotMiss_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotResist_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotImmune_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotReflect_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotAbsorbIgnored_1833)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeDodge_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeBlock_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeParry_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeMiss_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeResist_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeImmune_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeReflect_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeDodge_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeBlock_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeParry_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeMiss_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeResist_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeImmune_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeReflect_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeDodge_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeBlock_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeParry_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeMiss_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeResist_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeImmune_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeReflect_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeDodge_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeBlock_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeParry_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeMiss_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeResist_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeImmune_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeReflect_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeDodge_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeBlock_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeParry_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeMiss_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeResist_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeImmune_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeReflect_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_11285)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotDodge_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotBlock_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotParry_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotMiss_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotResist_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotImmune_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotReflect_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotAbsorbIgnored_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotDodge_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotBlock_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotParry_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotMiss_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotResist_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotImmune_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotReflect_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotAbsorbIgnored_408)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindDodge_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindBlock_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindParry_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindMiss_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindResist_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindImmune_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindReflect_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindAbsorbIgnored_2094)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeDodge_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeBlock_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeParry_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeMiss_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeResist_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeImmune_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeReflect_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeAbsorbIgnored_14278)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapDodge_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapBlock_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapParry_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapMiss_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapResist_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapImmune_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapReflect_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapAbsorbIgnored_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapDodge_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapBlock_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapParry_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapMiss_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapResist_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapImmune_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapReflect_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapAbsorbIgnored_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapDodge_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapBlock_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapParry_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapMiss_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapResist_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapImmune_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapReflect_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapAbsorbIgnored_2070)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractDodge_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractBlock_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractParry_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractMiss_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractResist_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractImmune_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractReflect_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractAbsorbIgnored_1725)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorDodge_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorBlock_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorParry_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorMiss_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorResist_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorImmune_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorReflect_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorDodge_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorBlock_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorParry_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorMiss_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorResist_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorImmune_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorReflect_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorDodge_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorBlock_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorParry_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorMiss_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorResist_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorImmune_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorReflect_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorDodge_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorBlock_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorParry_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorMiss_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorResist_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorImmune_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorReflect_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorDodge_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorBlock_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorParry_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorMiss_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorResist_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorImmune_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorReflect_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_11197)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteDodge_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteBlock_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteParry_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteMiss_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteResist_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteImmune_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteReflect_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteDodge_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteBlock_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteParry_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteMiss_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteResist_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteImmune_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteReflect_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteDodge_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteBlock_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteParry_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteMiss_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteResist_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteImmune_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteReflect_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteDodge_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteBlock_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteParry_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteMiss_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteResist_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteImmune_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteReflect_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteDodge_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteBlock_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteParry_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteMiss_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteResist_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteImmune_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteReflect_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteDodge_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteBlock_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteParry_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteMiss_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteResist_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteImmune_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteReflect_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_11289)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureDodge_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureBlock_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureParry_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureMiss_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureResist_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureImmune_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureReflect_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureDodge_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureBlock_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureParry_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureMiss_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureResist_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureImmune_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureReflect_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureDodge_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureBlock_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureParry_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureMiss_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureResist_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureImmune_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureReflect_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureDodge_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureBlock_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureParry_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureMiss_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureResist_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureImmune_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureReflect_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureDodge_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureBlock_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureParry_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureMiss_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureResist_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureImmune_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureReflect_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureDodge_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureBlock_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureParry_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureMiss_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureResist_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureImmune_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureReflect_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11274)
end

function me.TestCombatEventEnemyAvoidKickDodge_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickDodge_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKickBlock_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickBlock_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidKickParry_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickParry_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKickMiss_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickMiss_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKickResist_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickResist_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidKickImmune_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickImmune_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKickReflect_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickReflect_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidKickAbsorbIgnored_1769()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidKickAbsorbIgnored_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidKickDodge_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickDodge_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKickBlock_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickBlock_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidKickParry_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickParry_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKickMiss_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickMiss_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKickResist_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickResist_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidKickImmune_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickImmune_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKickReflect_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickReflect_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidKickAbsorbIgnored_1766()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidKickAbsorbIgnored_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidKickDodge_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickDodge_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKickBlock_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickBlock_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidKickParry_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickParry_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKickMiss_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickMiss_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKickResist_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickResist_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidKickImmune_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickImmune_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKickReflect_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickReflect_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidKickAbsorbIgnored_1767()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidKickAbsorbIgnored_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidKickDodge_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickDodge_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKickBlock_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickBlock_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidKickParry_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickParry_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKickMiss_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickMiss_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKickResist_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickResist_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidKickImmune_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickImmune_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKickReflect_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickReflect_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidKickAbsorbIgnored_1768()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidKickAbsorbIgnored_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidCheapShotDodge_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotDodge_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidCheapShotBlock_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotBlock_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidCheapShotParry_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotParry_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidCheapShotMiss_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotMiss_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidCheapShotResist_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotResist_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidCheapShotImmune_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotImmune_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidCheapShotReflect_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotReflect_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidCheapShotAbsorbIgnored_1833()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidCheapShotAbsorbIgnored_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGougeDodge_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeDodge_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGougeBlock_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeBlock_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGougeParry_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeParry_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGougeMiss_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeMiss_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGougeResist_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeResist_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGougeImmune_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeImmune_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGougeReflect_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeReflect_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_11286()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGougeAbsorbIgnored_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGougeDodge_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeDodge_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGougeBlock_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeBlock_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGougeParry_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeParry_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGougeMiss_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeMiss_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGougeResist_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeResist_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGougeImmune_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeImmune_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGougeReflect_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeReflect_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_1776()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGougeAbsorbIgnored_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGougeDodge_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeDodge_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGougeBlock_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeBlock_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGougeParry_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeParry_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGougeMiss_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeMiss_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGougeResist_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeResist_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGougeImmune_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeImmune_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGougeReflect_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeReflect_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_1777()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGougeAbsorbIgnored_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGougeDodge_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeDodge_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGougeBlock_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeBlock_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGougeParry_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeParry_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGougeMiss_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeMiss_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGougeResist_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeResist_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGougeImmune_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeImmune_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGougeReflect_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeReflect_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_8629()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGougeAbsorbIgnored_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGougeDodge_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeDodge_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGougeBlock_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeBlock_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGougeParry_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeParry_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGougeMiss_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeMiss_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGougeResist_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeResist_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGougeImmune_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeImmune_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGougeReflect_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeReflect_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_11285()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGougeAbsorbIgnored_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotDodge_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotDodge_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotBlock_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotBlock_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotParry_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotParry_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotMiss_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotMiss_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotResist_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotResist_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotImmune_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotImmune_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotReflect_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotReflect_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotAbsorbIgnored_8643()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidKidneyShotAbsorbIgnored_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotDodge_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotDodge_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotBlock_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotBlock_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotParry_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotParry_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotMiss_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotMiss_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotResist_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotResist_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotImmune_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotImmune_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotReflect_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotReflect_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotAbsorbIgnored_408()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidKidneyShotAbsorbIgnored_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidBlindDodge_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindDodge_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidBlindBlock_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindBlock_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidBlindParry_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindParry_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidBlindMiss_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindMiss_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidBlindResist_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindResist_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBlindImmune_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindImmune_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBlindReflect_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindReflect_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidBlindAbsorbIgnored_2094()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidBlindAbsorbIgnored_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeDodge_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeDodge_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeBlock_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeBlock_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeParry_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeParry_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeMiss_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeMiss_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeResist_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeResist_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeImmune_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeImmune_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeReflect_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeReflect_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeAbsorbIgnored_14278()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGhostlyStrikeAbsorbIgnored_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSapDodge_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapDodge_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSapBlock_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapBlock_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSapParry_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapParry_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSapMiss_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapMiss_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSapResist_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapResist_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSapImmune_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapImmune_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSapReflect_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapReflect_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSapAbsorbIgnored_11297()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSapAbsorbIgnored_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSapDodge_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapDodge_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSapBlock_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapBlock_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSapParry_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapParry_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSapMiss_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapMiss_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSapResist_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapResist_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSapImmune_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapImmune_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSapReflect_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapReflect_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSapAbsorbIgnored_6770()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSapAbsorbIgnored_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidSapDodge_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapDodge_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidSapBlock_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapBlock_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidSapParry_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapParry_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidSapMiss_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapMiss_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSapResist_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapResist_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidSapImmune_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapImmune_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSapReflect_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapReflect_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidSapAbsorbIgnored_2070()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidSapAbsorbIgnored_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidDistractDodge_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractDodge_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidDistractBlock_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractBlock_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidDistractParry_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractParry_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidDistractMiss_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractMiss_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDistractResist_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractResist_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidDistractImmune_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractImmune_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDistractReflect_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractReflect_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidDistractAbsorbIgnored_1725()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidDistractAbsorbIgnored_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorDodge_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorDodge_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorBlock_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorBlock_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorParry_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorParry_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorMiss_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorMiss_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorResist_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorResist_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorImmune_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorImmune_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorReflect_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorReflect_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_11198()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorDodge_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorDodge_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorBlock_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorBlock_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorParry_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorParry_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorMiss_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorMiss_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorResist_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorResist_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorImmune_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorImmune_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorReflect_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorReflect_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8647()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorDodge_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorDodge_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorBlock_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorBlock_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorParry_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorParry_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorMiss_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorMiss_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorResist_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorResist_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorImmune_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorImmune_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorReflect_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorReflect_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8649()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorDodge_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorDodge_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorBlock_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorBlock_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorParry_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorParry_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorMiss_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorMiss_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorResist_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorResist_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorImmune_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorImmune_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorReflect_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorReflect_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8650()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorDodge_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorDodge_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorBlock_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorBlock_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorParry_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorParry_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorMiss_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorMiss_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorResist_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorResist_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorImmune_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorImmune_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorReflect_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorReflect_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_11197()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteDodge_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGarroteBlock_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteBlock_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGarroteParry_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteParry_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGarroteMiss_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteMiss_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteResist_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteResist_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGarroteReflect_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteReflect_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_11290()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteDodge_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGarroteBlock_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteBlock_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGarroteParry_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteParry_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGarroteMiss_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteMiss_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteResist_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteResist_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGarroteReflect_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteReflect_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_703()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteDodge_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGarroteBlock_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteBlock_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGarroteParry_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteParry_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGarroteMiss_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteMiss_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteResist_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteResist_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGarroteReflect_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteReflect_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8631()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteDodge_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGarroteBlock_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteBlock_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGarroteParry_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteParry_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGarroteMiss_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteMiss_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteResist_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteResist_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGarroteReflect_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteReflect_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8632()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteDodge_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGarroteBlock_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteBlock_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGarroteParry_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteParry_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGarroteMiss_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteMiss_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteResist_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteResist_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGarroteReflect_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteReflect_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8633()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteDodge_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGarroteBlock_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteBlock_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidGarroteParry_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteParry_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGarroteMiss_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteMiss_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteResist_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteResist_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGarroteReflect_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteReflect_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_11289()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodge_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureDodge_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidRuptureBlock_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureBlock_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidRuptureParry_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureParry_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidRuptureMiss_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureMiss_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidRuptureResist_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureResist_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidRuptureImmune_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureImmune_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureReflect_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureReflect_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11275()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodge_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureDodge_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidRuptureBlock_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureBlock_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidRuptureParry_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureParry_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidRuptureMiss_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureMiss_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidRuptureResist_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureResist_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidRuptureImmune_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureImmune_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureReflect_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureReflect_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_1943()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidRuptureAbsorbIgnored_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodge_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureDodge_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidRuptureBlock_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureBlock_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidRuptureParry_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureParry_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidRuptureMiss_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureMiss_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidRuptureResist_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureResist_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidRuptureImmune_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureImmune_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureReflect_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureReflect_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_8639()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidRuptureAbsorbIgnored_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodge_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureDodge_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidRuptureBlock_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureBlock_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidRuptureParry_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureParry_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidRuptureMiss_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureMiss_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidRuptureResist_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureResist_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidRuptureImmune_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureImmune_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureReflect_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureReflect_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_8640()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidRuptureAbsorbIgnored_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodge_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureDodge_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidRuptureBlock_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureBlock_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidRuptureParry_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureParry_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidRuptureMiss_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureMiss_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidRuptureResist_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureResist_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidRuptureImmune_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureImmune_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureReflect_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureReflect_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11273()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodge_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureDodge_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidRuptureBlock_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureBlock_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidRuptureParry_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureParry_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidRuptureMiss_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureMiss_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidRuptureResist_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureResist_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidRuptureImmune_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureImmune_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureReflect_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureReflect_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11274()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidRuptureAbsorbIgnored_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
