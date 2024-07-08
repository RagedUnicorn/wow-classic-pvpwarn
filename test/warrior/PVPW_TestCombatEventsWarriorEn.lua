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

-- luacheck: ignore _

local mod = rgpvpw
local me = {}
mod.testCombatEventsWarriorEn = me

me.tag = "TestCombatEventsWarriorEn"

local testGroupName = "CombatEventsWarriorEn"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerRageApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerRageRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRecklessnessApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRecklessnessRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathWishApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathWishRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBattleStanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerStanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDefensiveStanceApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInterceptSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDisarmSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConcussionBlowSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodrageApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodrageRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPummelSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChargeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIntimidatingShoutSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBlockApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBlockRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldSlamSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldWallApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldWallRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLastStandApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLastStandRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBashSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRetaliationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRetaliationRemoved)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlagellationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlagellationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRagingBlowSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConsumedByRageApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConsumedByRageRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventQuickStrikeSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnragedRegenerationApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnragedRegenerationRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRallyingCryApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRallyingCryRemoved)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInterveneSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCommandingShoutSuccess)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRampageApplied)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRampageRemoved)
end

function me.TestCombatEventBerserkerRageApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkerRageApplied",
    testCategory,
    "Berserker Rage"
  )
end

function me.TestCombatEventBerserkerRageRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBerserkerRageRemoved",
    testCategory,
    "Berserker Rage"
  )
end

function me.TestCombatEventRecklessnessApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRecklessnessApplied",
    testCategory,
    "Recklessness"
  )
end

function me.TestCombatEventRecklessnessRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRecklessnessRemoved",
    testCategory,
    "Recklessness"
  )
end

function me.TestCombatEventDeathWishApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDeathWishApplied",
    testCategory,
    "Death Wish"
  )
end

function me.TestCombatEventDeathWishRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDeathWishRemoved",
    testCategory,
    "Death Wish"
  )
end

function me.TestCombatEventBattleStanceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBattleStanceApplied",
    testCategory,
    "Battle Stance"
  )
end

function me.TestCombatEventBerserkerStanceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkerStanceApplied",
    testCategory,
    "Berserker Stance"
  )
end

function me.TestCombatEventDefensiveStanceApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDefensiveStanceApplied",
    testCategory,
    "Defensive Stance"
  )
end

function me.TestCombatEventInterceptSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterceptSuccess",
    testCategory,
    "Intercept"
  )
end

function me.TestCombatEventDisarmSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDisarmSuccess",
    testCategory,
    "Disarm"
  )
end

function me.TestCombatEventConcussionBlowSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventConcussionBlowSuccess",
    testCategory,
    "Concussion Blow"
  )
end

function me.TestCombatEventBloodrageApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBloodrageApplied",
    testCategory,
    "Bloodrage"
  )
end

function me.TestCombatEventBloodrageRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBloodrageRemoved",
    testCategory,
    "Bloodrage"
  )
end

function me.TestCombatEventPummelSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPummelSuccess",
    testCategory,
    "Pummel"
  )
end

function me.TestCombatEventChargeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventChargeSuccess",
    testCategory,
    "Charge"
  )
end

function me.TestCombatEventIntimidatingShoutSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventIntimidatingShoutSuccess",
    testCategory,
    "Intimidating Shout"
  )
end

function me.TestCombatEventShieldBlockApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShieldBlockApplied",
    testCategory,
    "Shield Block"
  )
end

function me.TestCombatEventShieldBlockRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShieldBlockRemoved",
    testCategory,
    "Shield Block"
  )
end

function me.TestCombatEventShieldSlamSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldSlamSuccess",
    testCategory,
    "Shield Slam"
  )
end

function me.TestCombatEventShieldWallApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShieldWallApplied",
    testCategory,
    "Shield Wall"
  )
end

function me.TestCombatEventShieldWallRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShieldWallRemoved",
    testCategory,
    "Shield Wall"
  )
end

function me.TestCombatEventLastStandApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventLastStandApplied",
    testCategory,
    "Last Stand"
  )
end

function me.TestCombatEventLastStandRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventLastStandRemoved",
    testCategory,
    "Last Stand"
  )
end

function me.TestCombatEventShieldBashSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldBashSuccess",
    testCategory,
    "Shield Bash"
  )
end

function me.TestCombatEventRetaliationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRetaliationApplied",
    testCategory,
    "Retaliation"
  )
end

function me.TestCombatEventRetaliationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRetaliationRemoved",
    testCategory,
    "Retaliation"
  )
end

function me.TestCombatEventFlagellationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFlagellationApplied",
    testCategory,
    "Flagellation"
  )
end

function me.TestCombatEventFlagellationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFlagellationRemoved",
    testCategory,
    "Flagellation"
  )
end

function me.TestCombatEventRagingBlowSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRagingBlowSuccess",
    testCategory,
    "Raging Blow"
  )
end

function me.TestCombatEventConsumedByRageApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventConsumedByRageApplied",
    testCategory,
    "Consumed by Rage"
  )
end

function me.TestCombatEventConsumedByRageRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventConsumedByRageRemoved",
    testCategory,
    "Consumed by Rage"
  )
end

function me.TestCombatEventQuickStrikeSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventQuickStrikeSuccess",
    testCategory,
    "Quick Strike"
  )
end

function me.TestCombatEventEnragedRegenerationApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEnragedRegenerationApplied",
    testCategory,
    "Enraged Regeneration"
  )
end

function me.TestCombatEventEnragedRegenerationRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEnragedRegenerationRemoved",
    testCategory,
    "Enraged Regeneration"
  )
end

function me.TestCombatEventRallyingCryApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRallyingCryApplied",
    testCategory,
    "Rallying Cry"
  )
end

function me.TestCombatEventRallyingCryRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRallyingCryRemoved",
    testCategory,
    "Rallying Cry"
  )
end

function me.TestCombatEventInterveneSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterveneSuccess",
    testCategory,
    "Intervene"
  )
end

function me.TestCombatEventCommandingShoutSuccess()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCommandingShoutSuccess",
    testCategory,
    "Commanding Shout"
  )
end

function me.TestCombatEventRampageApplied()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRampageApplied",
    testCategory,
    "Rampage"
  )
end

function me.TestCombatEventRampageRemoved()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRampageRemoved",
    testCategory,
    "Rampage"
  )
end
