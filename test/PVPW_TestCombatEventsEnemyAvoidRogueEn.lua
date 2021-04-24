--[[
  MIT License

  Copyright (c) 2021 Michael Wiesendanger

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
mod.testCombatEventsEnemyAvoidRogueEn = me

me.tag = "TestCombatEventsEnemyAvoidRogueEn"

local testGroupName = "CombatEventsEnemyAvoidRogueEn"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- asyncron finish of testgroup
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKickBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidCheapShotResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGougeBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidKidneyShotResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidBlindMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGhostlyStrikeMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidSapMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidDistractResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidExposeArmorMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidGarroteImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemyAvoidRuptureMissed)
end

function me.TestCombatEventEnemyAvoidKickDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickDodged",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKickParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickParried",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKickImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickImmune",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKickMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickMissed",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKickBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKickBlocked",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidCheapShotImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotImmune",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidCheapShotMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotMissed",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidCheapShotResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidCheapShotResisted",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidGougeDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeDodged",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGougeParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeParried",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGougeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeImmune",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGougeMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeMissed",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGougeBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGougeBlocked",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotDodged",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotParried",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotImmune",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotMissed",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidKidneyShotResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidKidneyShotResisted",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidBlindImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindImmune",
    testCategory,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidBlindMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidBlindMissed",
    testCategory,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeDodged",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeParried",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeImmune",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidGhostlyStrikeMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGhostlyStrikeMissed",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidSapImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapImmune",
    testCategory,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidSapMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidSapMissed",
    testCategory,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidDistractImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractImmune",
    testCategory,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidDistractResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidDistractResisted",
    testCategory,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorDodged",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorParried",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorImmune",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidExposeArmorMissed",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemyAvoidGarroteImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidGarroteImmune",
    testCategory,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureDodged",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemyAvoidRuptureParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureParried",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemyAvoidRuptureImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureImmune",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemyAvoidRuptureMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemyAvoidRuptureMissed",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end
