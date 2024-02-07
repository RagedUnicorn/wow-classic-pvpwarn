--[[
  MIT License

  Copyright (c) 2024 Michael Wiesendanger

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
mod.testCombatEventsSelfAvoidRogueEn = me

me.tag = "TestCombatEventsSelfAvoidRogueEn"

local testGroupName = "CombatEventsSelfAvoidRogueEn"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKickBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidCheapShotResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGougeBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidKidneyShotResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidBlindMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGhostlyStrikeMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidSapMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidDistractResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidExposeArmorMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidGarroteImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSelfAvoidRuptureMissed)
end

function me.TestCombatEventSelfAvoidKickDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickDodged",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKickParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickParried",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKickImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickImmune",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKickMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickMissed",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKickBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKickBlocked",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidCheapShotImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotImmune",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidCheapShotMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotMissed",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidCheapShotResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidCheapShotResisted",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidGougeDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeDodged",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGougeParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeParried",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGougeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeImmune",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGougeMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeMissed",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGougeBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGougeBlocked",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventSelfAvoidKidneyShotDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotDodged",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidKidneyShotParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotParried",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidKidneyShotImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotImmune",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidKidneyShotMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotMissed",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidKidneyShotResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidKidneyShotResisted",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidBlindImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindImmune",
    testCategory,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidBlindMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidBlindMissed",
    testCategory,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeDodged",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeParried",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeImmune",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidGhostlyStrikeMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGhostlyStrikeMissed",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidSapImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapImmune",
    testCategory,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidSapMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidSapMissed",
    testCategory,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidDistractImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractImmune",
    testCategory,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidDistractResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidDistractResisted",
    testCategory,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventSelfAvoidExposeArmorDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorDodged",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorParried",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidExposeArmorImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorImmune",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidExposeArmorMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidExposeArmorMissed",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventSelfAvoidGarroteImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidGarroteImmune",
    testCategory,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureDodged",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventSelfAvoidRuptureParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureParried",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventSelfAvoidRuptureImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureImmune",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventSelfAvoidRuptureMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventSelfAvoidRuptureMissed",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end
