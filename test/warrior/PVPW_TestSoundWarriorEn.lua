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
mod.testSoundWarriorEn = me

me.tag = "TestSoundWarriorEn"

local testGroupName = "SoundWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRecklessness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRecklessness)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathWish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDeathWish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBattleStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDefensiveStance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntercept)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDisarm)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussionBlow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBloodrage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPummel)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCharge)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidatingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShieldBlock)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldWall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShieldWall)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLastStand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLastStand)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetaliation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRetaliation)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlagellation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFlagellation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRagingBlow)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConsumedByRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownConsumedByRage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundQuickStrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnragedRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEnragedRegeneration)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRallyingCry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRallyingCry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntervene)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCommandingShout)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRampage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRampage)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMeathook)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShockwave)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSuddenDeath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSuddenDeath)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundValorOfAzeroth)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownValorOfAzeroth)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVictoryRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGladiatorStance)
end

function me.TestSoundBerserkerRage()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserkerRage",
    testCategory,
    "Berserker Rage"
  )
end

function me.TestSoundDownBerserkerRage()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserkerRage",
    testCategory,
    "Berserker Rage"
  )
end

function me.TestSoundRecklessness()
  mod.testHelper.TestSoundApplied(
    "TestSoundRecklessness",
    testCategory,
    "Recklessness"
  )
end

function me.TestSoundDownRecklessness()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRecklessness",
    testCategory,
    "Recklessness"
  )
end

function me.TestSoundDeathWish()
  mod.testHelper.TestSoundApplied(
    "TestSoundDeathWish",
    testCategory,
    "Death Wish"
  )
end

function me.TestSoundDownDeathWish()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDeathWish",
    testCategory,
    "Death Wish"
  )
end

function me.TestSoundBattleStance()
  mod.testHelper.TestSoundApplied(
    "TestSoundBattleStance",
    testCategory,
    "Battle Stance"
  )
end

function me.TestSoundBerserkerStance()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserkerStance",
    testCategory,
    "Berserker Stance"
  )
end

function me.TestSoundDefensiveStance()
  mod.testHelper.TestSoundApplied(
    "TestSoundDefensiveStance",
    testCategory,
    "Defensive Stance"
  )
end

function me.TestSoundIntercept()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntercept",
    testCategory,
    "Intercept"
  )
end

function me.TestSoundDisarm()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDisarm",
    testCategory,
    "Disarm"
  )
end

function me.TestSoundConcussionBlow()
  mod.testHelper.TestSoundSuccess(
    "TestSoundConcussionBlow",
    testCategory,
    "Concussion Blow"
  )
end

function me.TestSoundBloodrage()
  mod.testHelper.TestSoundApplied(
    "TestSoundBloodrage",
    testCategory,
    "Bloodrage"
  )
end

function me.TestSoundDownBloodrage()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBloodrage",
    testCategory,
    "Bloodrage"
  )
end

function me.TestSoundPummel()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPummel",
    testCategory,
    "Pummel"
  )
end

function me.TestSoundCharge()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCharge",
    testCategory,
    "Charge"
  )
end

function me.TestSoundIntimidatingShout()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntimidatingShout",
    testCategory,
    "Intimidating Shout"
  )
end

function me.TestSoundShieldBlock()
  mod.testHelper.TestSoundApplied(
    "TestSoundShieldBlock",
    testCategory,
    "Shield Block"
  )
end

function me.TestSoundDownShieldBlock()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShieldBlock",
    testCategory,
    "Shield Block"
  )
end

function me.TestSoundShieldSlam()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldSlam",
    testCategory,
    "Shield Slam"
  )
end

function me.TestSoundShieldWall()
  mod.testHelper.TestSoundApplied(
    "TestSoundShieldWall",
    testCategory,
    "Shield Wall"
  )
end

function me.TestSoundDownShieldWall()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShieldWall",
    testCategory,
    "Shield Wall"
  )
end

function me.TestSoundLastStand()
  mod.testHelper.TestSoundApplied(
    "TestSoundLastStand",
    testCategory,
    "Last Stand"
  )
end

function me.TestSoundDownLastStand()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownLastStand",
    testCategory,
    "Last Stand"
  )
end

function me.TestSoundShieldBash()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldBash",
    testCategory,
    "Shield Bash"
  )
end

function me.TestSoundRetaliation()
  mod.testHelper.TestSoundApplied(
    "TestSoundRetaliation",
    testCategory,
    "Retaliation"
  )
end

function me.TestSoundDownRetaliation()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRetaliation",
    testCategory,
    "Retaliation"
  )
end

function me.TestSoundFlagellation()
  mod.testHelper.TestSoundApplied(
    "TestSoundFlagellation",
    testCategory,
    "Flagellation"
  )
end

function me.TestSoundDownFlagellation()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFlagellation",
    testCategory,
    "Flagellation"
  )
end

function me.TestSoundRagingBlow()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRagingBlow",
    testCategory,
    "Raging Blow"
  )
end

function me.TestSoundConsumedByRage()
  mod.testHelper.TestSoundApplied(
    "TestSoundConsumedByRage",
    testCategory,
    "Consumed by Rage"
  )
end

function me.TestSoundDownConsumedByRage()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownConsumedByRage",
    testCategory,
    "Consumed by Rage"
  )
end

function me.TestSoundQuickStrike()
  mod.testHelper.TestSoundSuccess(
    "TestSoundQuickStrike",
    testCategory,
    "Quick Strike"
  )
end

function me.TestSoundEnragedRegeneration()
  mod.testHelper.TestSoundApplied(
    "TestSoundEnragedRegeneration",
    testCategory,
    "Enraged Regeneration"
  )
end

function me.TestSoundDownEnragedRegeneration()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEnragedRegeneration",
    testCategory,
    "Enraged Regeneration"
  )
end

function me.TestSoundRallyingCry()
  mod.testHelper.TestSoundApplied(
    "TestSoundRallyingCry",
    testCategory,
    "Rallying Cry"
  )
end

function me.TestSoundDownRallyingCry()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRallyingCry",
    testCategory,
    "Rallying Cry"
  )
end

function me.TestSoundIntervene()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntervene",
    testCategory,
    "Intervene"
  )
end

function me.TestSoundCommandingShout()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCommandingShout",
    testCategory,
    "Commanding Shout"
  )
end

function me.TestSoundRampage()
  mod.testHelper.TestSoundApplied(
    "TestSoundRampage",
    testCategory,
    "Rampage"
  )
end

function me.TestSoundDownRampage()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRampage",
    testCategory,
    "Rampage"
  )
end

function me.TestSoundMeathook()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMeathook",
    testCategory,
    "Meathook"
  )
end

function me.TestSoundShockwave()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShockwave",
    testCategory,
    "Shockwave"
  )
end

function me.TestSoundSuddenDeath()
  mod.testHelper.TestSoundApplied(
    "TestSoundSuddenDeath",
    testCategory,
    "Sudden Death"
  )
end

function me.TestSoundDownSuddenDeath()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSuddenDeath",
    testCategory,
    "Sudden Death"
  )
end

function me.TestSoundValorOfAzeroth()
  mod.testHelper.TestSoundApplied(
    "TestSoundValorOfAzeroth",
    testCategory,
    "Valor of Azeroth"
  )
end

function me.TestSoundDownValorOfAzeroth()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownValorOfAzeroth",
    testCategory,
    "Valor of Azeroth"
  )
end

function me.TestSoundVictoryRush()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVictoryRush",
    testCategory,
    "Victory Rush"
  )
end

function me.TestSoundGladiatorStance()
  mod.testHelper.TestSoundApplied(
    "TestSoundGladiatorStance",
    testCategory,
    "Gladiator Stance"
  )
end
