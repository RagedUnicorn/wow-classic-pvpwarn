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
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKickDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKickParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKickImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKickMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKickBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidCheapShotImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidCheapShotMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidCheapShotResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGougeDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGougeParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGougeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGougeMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGougeBlocked)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKidneyShotDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKidneyShotParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKidneyShotImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKidneyShotMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidKidneyShotResisted)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidBlindImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGhostlyStrikeDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGhostlyStrikeParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGhostlyStrikeImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGhostlyStrikeMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidSapImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidSapMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidDistractImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidDistractMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidExposeArmorDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidExposeArmorParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidExposeArmorImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidExposeArmorMissed)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidGarroteImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidRuptureDodged)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidRuptureParried)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidRuptureImmune)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnemeyAvoidRuptureMissed)
end

function me.TestCombatEventEnemeyAvoidKickDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKickDodged",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemeyAvoidKickParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKickParried",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemeyAvoidKickImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKickImmune",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidKickMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKickMissed",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemeyAvoidKickBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKickBlocked",
    testCategory,
    "Kick",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemeyAvoidCheapShotImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidCheapShotImmune",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidCheapShotMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidCheapShotMissed",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemeyAvoidCheapShotResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidCheapShotResisted",
    testCategory,
    "Cheap Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemeyAvoidGougeDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGougeDodged",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemeyAvoidGougeParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGougeParried",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemeyAvoidGougeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGougeImmune",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidGougeMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGougeMissed",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemeyAvoidGougeBlocked()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGougeBlocked",
    testCategory,
    "Gouge",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.BLOCK
  )
end

function me.TestCombatEventEnemeyAvoidKidneyShotDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKidneyShotDodged",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemeyAvoidKidneyShotParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKidneyShotParried",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemeyAvoidKidneyShotImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKidneyShotImmune",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidKidneyShotMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKidneyShotMissed",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemeyAvoidKidneyShotResisted()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidKidneyShotResisted",
    testCategory,
    "Kidney Shot",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.RESIST
  )
end

function me.TestCombatEventEnemeyAvoidBlindImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidBlindImmune",
    testCategory,
    "Blind",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidGhostlyStrikeDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGhostlyStrikeDodged",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemeyAvoidGhostlyStrikeParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGhostlyStrikeParried",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemeyAvoidGhostlyStrikeImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGhostlyStrikeImmune",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidGhostlyStrikeMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGhostlyStrikeMissed",
    testCategory,
    "Ghostly Strike",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemeyAvoidSapImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidSapImmune",
    testCategory,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidSapMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidSapMissed",
    testCategory,
    "Sap",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemeyAvoidDistractImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidDistractImmune",
    testCategory,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidDistractMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidDistractMissed",
    testCategory,
    "Distract",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemeyAvoidExposeArmorDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidExposeArmorDodged",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemeyAvoidExposeArmorParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidExposeArmorParried",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemeyAvoidExposeArmorImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidExposeArmorImmune",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidExposeArmorMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidExposeArmorMissed",
    testCategory,
    "Expose Armor",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end

function me.TestCombatEventEnemeyAvoidGarroteImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidGarroteImmune",
    testCategory,
    "Garrote",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidRuptureDodged()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidRuptureDodged",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.DODGE
  )
end

function me.TestCombatEventEnemeyAvoidRuptureParried()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidRuptureParried",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.PARRY
  )
end

function me.TestCombatEventEnemeyAvoidRuptureImmune()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidRuptureImmune",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.IMMUNE
  )
end

function me.TestCombatEventEnemeyAvoidRuptureMissed()
  mod.testHelper.TestCombatEventSpellMissed(
    "TestCombatEventEnemeyAvoidRuptureMissed",
    testCategory,
    "Rupture",
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY,
    RGPVPW_CONSTANTS.MISS_TYPES.MISS
  )
end
