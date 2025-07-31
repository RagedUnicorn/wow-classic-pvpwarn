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
mod.testCombatEventsEnemyAvoidMage = me

me.tag = "TestCombatEventsEnemyAvoidMage"

local testGroupName = "CombatEventsEnemyAvoidMage"
local testCategory = "mage"

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
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellDodge_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellBlock_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellParry_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellMiss_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellResist_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellImmune_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellReflect_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCounterspellAbsorbIgnored_2139)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphDodge_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphBlock_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphParry_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphMiss_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphResist_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphImmune_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphReflect_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphDodge_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphBlock_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphParry_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphMiss_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphResist_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphImmune_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphReflect_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphDodge_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphBlock_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphParry_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphMiss_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphResist_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphImmune_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphReflect_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphDodge_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphBlock_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphParry_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphMiss_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphResist_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphImmune_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphReflect_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphDodge_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphBlock_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphParry_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphMiss_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphResist_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphImmune_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphReflect_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphDodge_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphBlock_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphParry_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphMiss_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphResist_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphImmune_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphReflect_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_28272)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaDodge_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaBlock_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaParry_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaMiss_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaResist_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaImmune_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaReflect_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaDodge_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaBlock_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaParry_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaMiss_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaResist_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaImmune_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaReflect_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaDodge_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaBlock_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaParry_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaMiss_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaResist_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaImmune_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaReflect_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaDodge_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaBlock_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaParry_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaMiss_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaResist_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaImmune_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaReflect_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_6131)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdDodge_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdBlock_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdParry_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdMiss_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdResist_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdImmune_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdReflect_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdDodge_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdBlock_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdParry_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdMiss_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdResist_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdImmune_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdReflect_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdDodge_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdBlock_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdParry_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdMiss_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdResist_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdImmune_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdReflect_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdDodge_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdBlock_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdParry_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdMiss_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdResist_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdImmune_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdReflect_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdDodge_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdBlock_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdParry_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdMiss_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdResist_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdImmune_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdReflect_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10160)
end

function me.TestCombatEventEnemyAvoidCounterspellDodge_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellDodge_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidCounterspellBlock_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellBlock_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidCounterspellParry_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellParry_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidCounterspellMiss_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellMiss_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidCounterspellResist_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellResist_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidCounterspellImmune_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellImmune_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidCounterspellReflect_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCounterspellReflect_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidCounterspellAbsorbIgnored_2139()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidCounterspellAbsorbIgnored_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidPolymorphDodge_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphDodge_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphBlock_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphBlock_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPolymorphParry_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphParry_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPolymorphMiss_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphMiss_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPolymorphResist_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphResist_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPolymorphImmune_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphImmune_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphReflect_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphReflect_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12826()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidPolymorphDodge_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphDodge_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphBlock_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphBlock_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPolymorphParry_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphParry_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPolymorphMiss_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphMiss_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPolymorphResist_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphResist_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPolymorphImmune_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphImmune_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphReflect_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphReflect_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_118()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidPolymorphDodge_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphDodge_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphBlock_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphBlock_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPolymorphParry_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphParry_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPolymorphMiss_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphMiss_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPolymorphResist_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphResist_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPolymorphImmune_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphImmune_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphReflect_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphReflect_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12824()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidPolymorphDodge_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphDodge_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphBlock_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphBlock_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPolymorphParry_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphParry_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPolymorphMiss_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphMiss_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPolymorphResist_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphResist_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPolymorphImmune_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphImmune_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphReflect_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphReflect_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12825()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidPolymorphDodge_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphDodge_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphBlock_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphBlock_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPolymorphParry_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphParry_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPolymorphMiss_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphMiss_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPolymorphResist_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphResist_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPolymorphImmune_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphImmune_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphReflect_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphReflect_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_28271()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidPolymorphDodge_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphDodge_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphBlock_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphBlock_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidPolymorphParry_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphParry_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidPolymorphMiss_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphMiss_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidPolymorphResist_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphResist_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidPolymorphImmune_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphImmune_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidPolymorphReflect_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidPolymorphReflect_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_28272()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidPolymorphAbsorbIgnored_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaDodge_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaDodge_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaBlock_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaBlock_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaParry_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaParry_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaMiss_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaMiss_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaResist_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaResist_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaImmune_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaImmune_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaReflect_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaReflect_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_10230()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaDodge_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaDodge_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaBlock_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaBlock_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaParry_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaParry_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaMiss_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaMiss_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaResist_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaResist_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaImmune_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaImmune_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaReflect_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaReflect_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_122()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaDodge_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaDodge_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaBlock_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaBlock_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaParry_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaParry_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaMiss_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaMiss_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaResist_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaResist_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaImmune_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaImmune_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaReflect_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaReflect_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_865()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaDodge_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaDodge_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaBlock_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaBlock_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaParry_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaParry_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaMiss_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaMiss_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaResist_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaResist_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaImmune_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaImmune_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaReflect_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidFrostNovaReflect_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_6131()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidFrostNovaAbsorbIgnored_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdDodge_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdDodge_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdBlock_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdBlock_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdParry_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdParry_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdMiss_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdMiss_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdResist_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdResist_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdImmune_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdImmune_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdReflect_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdReflect_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10161()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdDodge_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdDodge_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdBlock_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdBlock_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdParry_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdParry_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdMiss_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdMiss_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdResist_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdResist_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdImmune_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdImmune_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdReflect_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdReflect_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_120()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdDodge_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdDodge_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdBlock_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdBlock_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdParry_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdParry_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdMiss_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdMiss_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdResist_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdResist_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdImmune_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdImmune_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdReflect_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdReflect_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_8492()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdDodge_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdDodge_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdBlock_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdBlock_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdParry_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdParry_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdMiss_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdMiss_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdResist_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdResist_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdImmune_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdImmune_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdReflect_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdReflect_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10159()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdDodge_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdDodge_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdBlock_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdBlock_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdParry_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdParry_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdMiss_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdMiss_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdResist_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdResist_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdImmune_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdImmune_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdReflect_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidConeOfColdReflect_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10160()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventEnemyAvoidConeOfColdAbsorbIgnored_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
