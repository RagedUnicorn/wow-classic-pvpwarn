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
mod.testCombatEventsSelfAvoidRogue = me

me.tag = "TestCombatEventsSelfAvoidRogue"

local testGroupName = "CombatEventsSelfAvoidRogue"
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickDodge_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickBlock_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickParry_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickMiss_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickResist_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickImmune_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickReflect_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickAbsorbIgnored_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickDodge_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickBlock_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickParry_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickMiss_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickResist_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickImmune_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickReflect_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickAbsorbIgnored_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickDodge_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickBlock_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickParry_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickMiss_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickResist_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickImmune_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickReflect_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickAbsorbIgnored_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickDodge_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickBlock_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickParry_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickMiss_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickResist_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickImmune_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickReflect_1768)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickAbsorbIgnored_1768)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotDodge_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotBlock_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotParry_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotMiss_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotResist_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotImmune_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotReflect_1833)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotAbsorbIgnored_1833)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeDodge_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeBlock_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeParry_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeMiss_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeResist_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeImmune_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeReflect_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeAbsorbIgnored_11286)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeDodge_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeBlock_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeParry_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeMiss_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeResist_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeImmune_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeReflect_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeAbsorbIgnored_1776)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeDodge_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeBlock_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeParry_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeMiss_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeResist_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeImmune_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeReflect_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeAbsorbIgnored_1777)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeDodge_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeBlock_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeParry_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeMiss_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeResist_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeImmune_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeReflect_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeAbsorbIgnored_8629)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeDodge_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeBlock_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeParry_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeMiss_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeResist_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeImmune_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeReflect_11285)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeAbsorbIgnored_11285)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotDodge_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotBlock_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotParry_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotMiss_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotResist_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotImmune_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotReflect_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotAbsorbIgnored_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotDodge_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotBlock_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotParry_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotMiss_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotResist_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotImmune_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotReflect_408)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotAbsorbIgnored_408)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindDodge_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindBlock_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindParry_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindMiss_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindResist_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindImmune_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindReflect_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindAbsorbIgnored_2094)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeDodge_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeBlock_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeParry_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeMiss_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeResist_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeImmune_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeReflect_14278)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeAbsorbIgnored_14278)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapDodge_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapBlock_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapParry_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapMiss_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapResist_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapImmune_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapReflect_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapAbsorbIgnored_11297)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapDodge_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapBlock_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapParry_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapMiss_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapResist_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapImmune_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapReflect_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapAbsorbIgnored_6770)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapDodge_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapBlock_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapParry_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapMiss_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapResist_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapImmune_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapReflect_2070)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapAbsorbIgnored_2070)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractDodge_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractBlock_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractParry_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractMiss_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractResist_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractImmune_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractReflect_1725)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractAbsorbIgnored_1725)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorDodge_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorBlock_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorParry_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorMiss_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorResist_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorImmune_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorReflect_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_11198)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorDodge_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorBlock_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorParry_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorMiss_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorResist_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorImmune_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorReflect_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8647)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorDodge_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorBlock_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorParry_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorMiss_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorResist_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorImmune_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorReflect_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8649)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorDodge_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorBlock_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorParry_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorMiss_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorResist_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorImmune_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorReflect_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8650)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorDodge_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorBlock_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorParry_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorMiss_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorResist_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorImmune_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorReflect_11197)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_11197)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteDodge_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteBlock_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteParry_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteMiss_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteResist_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteImmune_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteReflect_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_11290)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteDodge_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteBlock_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteParry_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteMiss_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteResist_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteImmune_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteReflect_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_703)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteDodge_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteBlock_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteParry_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteMiss_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteResist_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteImmune_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteReflect_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_8631)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteDodge_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteBlock_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteParry_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteMiss_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteResist_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteImmune_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteReflect_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_8632)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteDodge_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteBlock_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteParry_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteMiss_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteResist_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteImmune_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteReflect_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_8633)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteDodge_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteBlock_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteParry_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteMiss_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteResist_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteImmune_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteReflect_11289)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_11289)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureDodge_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureBlock_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureParry_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureMiss_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureResist_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureImmune_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureReflect_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_11275)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureDodge_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureBlock_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureParry_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureMiss_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureResist_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureImmune_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureReflect_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_1943)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureDodge_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureBlock_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureParry_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureMiss_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureResist_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureImmune_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureReflect_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_8639)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureDodge_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureBlock_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureParry_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureMiss_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureResist_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureImmune_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureReflect_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_8640)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureDodge_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureBlock_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureParry_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureMiss_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureResist_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureImmune_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureReflect_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_11273)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureDodge_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureBlock_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureParry_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureMiss_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureResist_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureImmune_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureReflect_11274)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_11274)
end

function me.TestCombatEventSelfAvoidKickDodge_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickDodge_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKickBlock_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickBlock_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidKickParry_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickParry_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKickMiss_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickMiss_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKickResist_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickResist_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidKickImmune_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickImmune_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKickReflect_1769()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickReflect_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidKickAbsorbIgnored_1769()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidKickAbsorbIgnored_1769",
    testCategory,
    1769,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidKickDodge_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickDodge_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKickBlock_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickBlock_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidKickParry_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickParry_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKickMiss_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickMiss_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKickResist_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickResist_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidKickImmune_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickImmune_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKickReflect_1766()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickReflect_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidKickAbsorbIgnored_1766()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidKickAbsorbIgnored_1766",
    testCategory,
    1766,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidKickDodge_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickDodge_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKickBlock_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickBlock_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidKickParry_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickParry_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKickMiss_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickMiss_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKickResist_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickResist_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidKickImmune_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickImmune_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKickReflect_1767()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickReflect_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidKickAbsorbIgnored_1767()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidKickAbsorbIgnored_1767",
    testCategory,
    1767,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidKickDodge_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickDodge_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKickBlock_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickBlock_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidKickParry_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickParry_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKickMiss_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickMiss_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKickResist_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickResist_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidKickImmune_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickImmune_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKickReflect_1768()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickReflect_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidKickAbsorbIgnored_1768()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidKickAbsorbIgnored_1768",
    testCategory,
    1768,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidCheapShotDodge_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotDodge_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidCheapShotBlock_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotBlock_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidCheapShotParry_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotParry_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidCheapShotMiss_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotMiss_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidCheapShotResist_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotResist_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidCheapShotImmune_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotImmune_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidCheapShotReflect_1833()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotReflect_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidCheapShotAbsorbIgnored_1833()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidCheapShotAbsorbIgnored_1833",
    testCategory,
    1833,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGougeDodge_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeDodge_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGougeBlock_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeBlock_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGougeParry_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeParry_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGougeMiss_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeMiss_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGougeResist_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeResist_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGougeImmune_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeImmune_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGougeReflect_11286()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeReflect_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGougeAbsorbIgnored_11286()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGougeAbsorbIgnored_11286",
    testCategory,
    11286,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGougeDodge_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeDodge_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGougeBlock_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeBlock_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGougeParry_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeParry_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGougeMiss_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeMiss_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGougeResist_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeResist_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGougeImmune_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeImmune_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGougeReflect_1776()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeReflect_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGougeAbsorbIgnored_1776()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGougeAbsorbIgnored_1776",
    testCategory,
    1776,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGougeDodge_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeDodge_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGougeBlock_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeBlock_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGougeParry_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeParry_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGougeMiss_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeMiss_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGougeResist_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeResist_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGougeImmune_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeImmune_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGougeReflect_1777()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeReflect_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGougeAbsorbIgnored_1777()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGougeAbsorbIgnored_1777",
    testCategory,
    1777,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGougeDodge_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeDodge_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGougeBlock_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeBlock_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGougeParry_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeParry_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGougeMiss_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeMiss_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGougeResist_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeResist_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGougeImmune_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeImmune_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGougeReflect_8629()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeReflect_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGougeAbsorbIgnored_8629()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGougeAbsorbIgnored_8629",
    testCategory,
    8629,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGougeDodge_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeDodge_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGougeBlock_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeBlock_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGougeParry_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeParry_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGougeMiss_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeMiss_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGougeResist_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeResist_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGougeImmune_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeImmune_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGougeReflect_11285()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeReflect_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGougeAbsorbIgnored_11285()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGougeAbsorbIgnored_11285",
    testCategory,
    11285,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidKidneyShotDodge_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotDodge_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKidneyShotBlock_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotBlock_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidKidneyShotParry_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotParry_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKidneyShotMiss_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotMiss_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKidneyShotResist_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotResist_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidKidneyShotImmune_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotImmune_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKidneyShotReflect_8643()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotReflect_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidKidneyShotAbsorbIgnored_8643()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidKidneyShotAbsorbIgnored_8643",
    testCategory,
    8643,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidKidneyShotDodge_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotDodge_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKidneyShotBlock_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotBlock_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidKidneyShotParry_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotParry_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKidneyShotMiss_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotMiss_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKidneyShotResist_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotResist_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidKidneyShotImmune_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotImmune_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKidneyShotReflect_408()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotReflect_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidKidneyShotAbsorbIgnored_408()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidKidneyShotAbsorbIgnored_408",
    testCategory,
    408,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidBlindDodge_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindDodge_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidBlindBlock_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindBlock_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidBlindParry_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindParry_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidBlindMiss_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindMiss_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidBlindResist_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindResist_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBlindImmune_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindImmune_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBlindReflect_2094()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindReflect_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidBlindAbsorbIgnored_2094()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidBlindAbsorbIgnored_2094",
    testCategory,
    2094,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeDodge_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeDodge_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeBlock_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeBlock_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeParry_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeParry_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeMiss_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeMiss_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeResist_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeResist_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeImmune_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeImmune_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeReflect_14278()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeReflect_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeAbsorbIgnored_14278()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGhostlyStrikeAbsorbIgnored_14278",
    testCategory,
    14278,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSapDodge_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapDodge_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSapBlock_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapBlock_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSapParry_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapParry_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSapMiss_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapMiss_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSapResist_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapResist_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSapImmune_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapImmune_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSapReflect_11297()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapReflect_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSapAbsorbIgnored_11297()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSapAbsorbIgnored_11297",
    testCategory,
    11297,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSapDodge_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapDodge_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSapBlock_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapBlock_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSapParry_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapParry_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSapMiss_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapMiss_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSapResist_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapResist_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSapImmune_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapImmune_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSapReflect_6770()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapReflect_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSapAbsorbIgnored_6770()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSapAbsorbIgnored_6770",
    testCategory,
    6770,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidSapDodge_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapDodge_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidSapBlock_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapBlock_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidSapParry_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapParry_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidSapMiss_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapMiss_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSapResist_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapResist_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidSapImmune_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapImmune_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSapReflect_2070()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapReflect_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidSapAbsorbIgnored_2070()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidSapAbsorbIgnored_2070",
    testCategory,
    2070,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidDistractDodge_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractDodge_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidDistractBlock_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractBlock_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidDistractParry_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractParry_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidDistractMiss_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractMiss_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDistractResist_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractResist_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidDistractImmune_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractImmune_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDistractReflect_1725()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractReflect_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidDistractAbsorbIgnored_1725()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidDistractAbsorbIgnored_1725",
    testCategory,
    1725,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidExposeArmorDodge_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorDodge_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorBlock_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorBlock_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidExposeArmorParry_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorParry_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidExposeArmorMiss_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorMiss_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidExposeArmorResist_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorResist_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidExposeArmorImmune_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorImmune_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorReflect_11198()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorReflect_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_11198()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_11198",
    testCategory,
    11198,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidExposeArmorDodge_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorDodge_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorBlock_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorBlock_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidExposeArmorParry_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorParry_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidExposeArmorMiss_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorMiss_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidExposeArmorResist_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorResist_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidExposeArmorImmune_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorImmune_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorReflect_8647()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorReflect_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8647()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8647",
    testCategory,
    8647,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidExposeArmorDodge_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorDodge_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorBlock_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorBlock_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidExposeArmorParry_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorParry_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidExposeArmorMiss_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorMiss_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidExposeArmorResist_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorResist_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidExposeArmorImmune_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorImmune_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorReflect_8649()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorReflect_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8649()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8649",
    testCategory,
    8649,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidExposeArmorDodge_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorDodge_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorBlock_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorBlock_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidExposeArmorParry_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorParry_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidExposeArmorMiss_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorMiss_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidExposeArmorResist_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorResist_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidExposeArmorImmune_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorImmune_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorReflect_8650()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorReflect_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8650()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_8650",
    testCategory,
    8650,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidExposeArmorDodge_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorDodge_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorBlock_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorBlock_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidExposeArmorParry_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorParry_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidExposeArmorMiss_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorMiss_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidExposeArmorResist_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorResist_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidExposeArmorImmune_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorImmune_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorReflect_11197()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorReflect_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_11197()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_11197",
    testCategory,
    11197,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteDodge_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGarroteBlock_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteBlock_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGarroteParry_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteParry_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGarroteMiss_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteMiss_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteResist_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteResist_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGarroteReflect_11290()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteReflect_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_11290()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_11290",
    testCategory,
    11290,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteDodge_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGarroteBlock_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteBlock_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGarroteParry_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteParry_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGarroteMiss_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteMiss_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteResist_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteResist_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGarroteReflect_703()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteReflect_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_703()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_703",
    testCategory,
    703,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteDodge_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGarroteBlock_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteBlock_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGarroteParry_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteParry_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGarroteMiss_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteMiss_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteResist_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteResist_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGarroteReflect_8631()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteReflect_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_8631()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_8631",
    testCategory,
    8631,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteDodge_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGarroteBlock_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteBlock_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGarroteParry_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteParry_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGarroteMiss_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteMiss_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteResist_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteResist_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGarroteReflect_8632()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteReflect_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_8632()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_8632",
    testCategory,
    8632,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteDodge_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGarroteBlock_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteBlock_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGarroteParry_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteParry_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGarroteMiss_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteMiss_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteResist_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteResist_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGarroteReflect_8633()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteReflect_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_8633()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_8633",
    testCategory,
    8633,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteDodge_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGarroteBlock_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteBlock_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidGarroteParry_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteParry_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGarroteMiss_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteMiss_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteResist_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteResist_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGarroteReflect_11289()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteReflect_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_11289()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_11289",
    testCategory,
    11289,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidRuptureDodge_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureDodge_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidRuptureBlock_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureBlock_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidRuptureParry_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureParry_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidRuptureMiss_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureMiss_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidRuptureResist_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureResist_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidRuptureImmune_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureImmune_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureReflect_11275()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureReflect_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_11275()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidRuptureAbsorbIgnored_11275",
    testCategory,
    11275,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidRuptureDodge_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureDodge_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidRuptureBlock_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureBlock_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidRuptureParry_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureParry_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidRuptureMiss_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureMiss_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidRuptureResist_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureResist_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidRuptureImmune_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureImmune_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureReflect_1943()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureReflect_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_1943()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidRuptureAbsorbIgnored_1943",
    testCategory,
    1943,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidRuptureDodge_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureDodge_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidRuptureBlock_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureBlock_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidRuptureParry_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureParry_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidRuptureMiss_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureMiss_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidRuptureResist_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureResist_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidRuptureImmune_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureImmune_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureReflect_8639()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureReflect_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_8639()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidRuptureAbsorbIgnored_8639",
    testCategory,
    8639,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidRuptureDodge_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureDodge_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidRuptureBlock_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureBlock_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidRuptureParry_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureParry_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidRuptureMiss_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureMiss_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidRuptureResist_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureResist_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidRuptureImmune_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureImmune_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureReflect_8640()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureReflect_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_8640()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidRuptureAbsorbIgnored_8640",
    testCategory,
    8640,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidRuptureDodge_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureDodge_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidRuptureBlock_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureBlock_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidRuptureParry_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureParry_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidRuptureMiss_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureMiss_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidRuptureResist_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureResist_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidRuptureImmune_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureImmune_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureReflect_11273()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureReflect_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_11273()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidRuptureAbsorbIgnored_11273",
    testCategory,
    11273,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidRuptureDodge_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureDodge_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidRuptureBlock_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureBlock_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidRuptureParry_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureParry_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidRuptureMiss_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureMiss_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidRuptureResist_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureResist_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidRuptureImmune_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureImmune_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureReflect_11274()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureReflect_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_11274()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidRuptureAbsorbIgnored_11274",
    testCategory,
    11274,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
