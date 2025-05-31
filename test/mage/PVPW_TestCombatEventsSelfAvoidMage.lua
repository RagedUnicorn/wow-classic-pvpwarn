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
mod.testCombatEventsSelfAvoidMage = me

me.tag = "TestCombatEventsSelfAvoidMage"

local testGroupName = "CombatEventsSelfAvoidMage"
local testCategory = "mage"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellDodge_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellBlock_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellParry_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellMiss_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellResist_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellImmune_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellReflect_2139)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCounterspellAbsorbIgnored_2139)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphDodge_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphBlock_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphParry_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphMiss_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphResist_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphImmune_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphReflect_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12826)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphDodge_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphBlock_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphParry_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphMiss_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphResist_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphImmune_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphReflect_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_118)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphDodge_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphBlock_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphParry_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphMiss_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphResist_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphImmune_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphReflect_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12824)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphDodge_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphBlock_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphParry_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphMiss_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphResist_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphImmune_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphReflect_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12825)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphDodge_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphBlock_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphParry_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphMiss_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphResist_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphImmune_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphReflect_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_28271)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphDodge_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphBlock_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphParry_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphMiss_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphResist_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphImmune_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphReflect_28272)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_28272)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaDodge_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaBlock_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaParry_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaMiss_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaResist_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaImmune_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaReflect_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_10230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaDodge_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaBlock_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaParry_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaMiss_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaResist_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaImmune_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaReflect_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_122)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaDodge_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaBlock_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaParry_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaMiss_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaResist_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaImmune_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaReflect_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_865)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaDodge_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaBlock_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaParry_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaMiss_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaResist_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaImmune_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaReflect_6131)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_6131)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdDodge_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdBlock_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdParry_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdMiss_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdResist_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdImmune_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdReflect_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10161)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdDodge_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdBlock_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdParry_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdMiss_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdResist_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdImmune_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdReflect_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_120)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdDodge_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdBlock_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdParry_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdMiss_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdResist_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdImmune_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdReflect_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_8492)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdDodge_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdBlock_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdParry_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdMiss_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdResist_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdImmune_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdReflect_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10159)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdDodge_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdBlock_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdParry_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdMiss_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdResist_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdImmune_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdReflect_10160)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10160)
end

function me.TestCombatEventSelfAvoidCounterspellDodge_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellDodge_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidCounterspellBlock_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellBlock_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidCounterspellParry_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellParry_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidCounterspellMiss_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellMiss_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidCounterspellResist_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellResist_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidCounterspellImmune_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellImmune_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidCounterspellReflect_2139()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCounterspellReflect_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidCounterspellAbsorbIgnored_2139()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidCounterspellAbsorbIgnored_2139",
    testCategory,
    2139,
    "Counterspell",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidPolymorphDodge_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphDodge_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPolymorphBlock_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphBlock_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPolymorphParry_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphParry_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPolymorphMiss_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphMiss_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPolymorphResist_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphResist_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPolymorphImmune_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphImmune_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPolymorphReflect_12826()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphReflect_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12826()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12826",
    testCategory,
    12826,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidPolymorphDodge_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphDodge_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPolymorphBlock_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphBlock_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPolymorphParry_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphParry_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPolymorphMiss_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphMiss_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPolymorphResist_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphResist_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPolymorphImmune_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphImmune_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPolymorphReflect_118()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphReflect_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_118()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPolymorphAbsorbIgnored_118",
    testCategory,
    118,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidPolymorphDodge_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphDodge_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPolymorphBlock_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphBlock_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPolymorphParry_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphParry_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPolymorphMiss_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphMiss_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPolymorphResist_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphResist_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPolymorphImmune_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphImmune_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPolymorphReflect_12824()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphReflect_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12824()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12824",
    testCategory,
    12824,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidPolymorphDodge_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphDodge_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPolymorphBlock_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphBlock_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPolymorphParry_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphParry_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPolymorphMiss_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphMiss_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPolymorphResist_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphResist_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPolymorphImmune_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphImmune_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPolymorphReflect_12825()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphReflect_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12825()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPolymorphAbsorbIgnored_12825",
    testCategory,
    12825,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidPolymorphDodge_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphDodge_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPolymorphBlock_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphBlock_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPolymorphParry_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphParry_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPolymorphMiss_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphMiss_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPolymorphResist_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphResist_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPolymorphImmune_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphImmune_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPolymorphReflect_28271()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphReflect_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_28271()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPolymorphAbsorbIgnored_28271",
    testCategory,
    28271,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidPolymorphDodge_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphDodge_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidPolymorphBlock_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphBlock_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidPolymorphParry_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphParry_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidPolymorphMiss_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphMiss_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidPolymorphResist_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphResist_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidPolymorphImmune_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphImmune_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidPolymorphReflect_28272()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidPolymorphReflect_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidPolymorphAbsorbIgnored_28272()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidPolymorphAbsorbIgnored_28272",
    testCategory,
    28272,
    "Polymorph",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostNovaDodge_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaDodge_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaBlock_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaBlock_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostNovaParry_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaParry_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostNovaMiss_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaMiss_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostNovaResist_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaResist_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostNovaImmune_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaImmune_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaReflect_10230()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaReflect_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_10230()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_10230",
    testCategory,
    10230,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostNovaDodge_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaDodge_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaBlock_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaBlock_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostNovaParry_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaParry_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostNovaMiss_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaMiss_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostNovaResist_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaResist_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostNovaImmune_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaImmune_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaReflect_122()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaReflect_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_122()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_122",
    testCategory,
    122,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostNovaDodge_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaDodge_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaBlock_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaBlock_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostNovaParry_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaParry_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostNovaMiss_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaMiss_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostNovaResist_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaResist_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostNovaImmune_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaImmune_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaReflect_865()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaReflect_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_865()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_865",
    testCategory,
    865,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidFrostNovaDodge_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaDodge_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaBlock_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaBlock_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidFrostNovaParry_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaParry_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidFrostNovaMiss_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaMiss_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidFrostNovaResist_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaResist_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidFrostNovaImmune_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaImmune_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidFrostNovaReflect_6131()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidFrostNovaReflect_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_6131()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidFrostNovaAbsorbIgnored_6131",
    testCategory,
    6131,
    "Frost Nova",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidConeOfColdDodge_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdDodge_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdBlock_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdBlock_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidConeOfColdParry_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdParry_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidConeOfColdMiss_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdMiss_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidConeOfColdResist_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdResist_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConeOfColdImmune_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdImmune_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdReflect_10161()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdReflect_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10161()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10161",
    testCategory,
    10161,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidConeOfColdDodge_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdDodge_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdBlock_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdBlock_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidConeOfColdParry_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdParry_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidConeOfColdMiss_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdMiss_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidConeOfColdResist_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdResist_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConeOfColdImmune_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdImmune_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdReflect_120()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdReflect_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_120()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_120",
    testCategory,
    120,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidConeOfColdDodge_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdDodge_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdBlock_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdBlock_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidConeOfColdParry_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdParry_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidConeOfColdMiss_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdMiss_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidConeOfColdResist_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdResist_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConeOfColdImmune_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdImmune_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdReflect_8492()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdReflect_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_8492()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_8492",
    testCategory,
    8492,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidConeOfColdDodge_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdDodge_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdBlock_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdBlock_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidConeOfColdParry_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdParry_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidConeOfColdMiss_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdMiss_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidConeOfColdResist_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdResist_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConeOfColdImmune_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdImmune_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdReflect_10159()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdReflect_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10159()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10159",
    testCategory,
    10159,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidConeOfColdDodge_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdDodge_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdBlock_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdBlock_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidConeOfColdParry_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdParry_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidConeOfColdMiss_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdMiss_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidConeOfColdResist_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdResist_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidConeOfColdImmune_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdImmune_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidConeOfColdReflect_10160()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidConeOfColdReflect_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end

function me.TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10160()
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(
    "TestCombatEventSelfAvoidConeOfColdAbsorbIgnored_10160",
    testCategory,
    10160,
    "Cone of Cold",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
