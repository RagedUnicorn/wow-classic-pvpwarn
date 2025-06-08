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
mod.testCombatEventsWarrior = me

me.tag = "TestCombatEventsWarrior"

local testGroupName = "CombatEventsWarrior"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerRageApplied_18499)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerRageRemoved_18499)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRecklessnessApplied_1719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRecklessnessRemoved_1719)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathWishApplied_12292)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDeathWishRemoved_12292)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBattleStanceApplied_2457)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBerserkerStanceApplied_2458)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDefensiveStanceApplied_71)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInterceptSuccess_20252)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInterceptSuccess_20616)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInterceptSuccess_20617)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventDisarmSuccess_676)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConcussionBlowSuccess_12809)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodrageApplied_2687)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBloodrageRemoved_2687)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPummelSuccess_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPummelSuccess_6554)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChargeSuccess_100)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChargeSuccess_6178)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventChargeSuccess_11578)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventIntimidatingShoutSuccess_5246)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBlockApplied_2565)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBlockRemoved_2565)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldSlamSuccess_23922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldSlamSuccess_23923)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldSlamSuccess_23924)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldSlamSuccess_23925)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldWallApplied_871)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldWallRemoved_871)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLastStandApplied_12975)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventLastStandRemoved_12975)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBashSuccess_72)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBashSuccess_1671)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShieldBashSuccess_1672)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRetaliationApplied_20230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRetaliationRemoved_20230)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlagellationApplied_402877)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFlagellationRemoved_402877)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRagingBlowSuccess_402911)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConsumedByRageApplied_425418)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventConsumedByRageRemoved_425418)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventQuickStrikeSuccess_429765)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnragedRegenerationApplied_402913)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnragedRegenerationRemoved_402913)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRallyingCryApplied_426490)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRallyingCryRemoved_426490)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventInterveneSuccess_403338)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCommandingShoutSuccess_403215)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRampageApplied_426940)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventRampageRemoved_426940)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMeathookSuccess_403228)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShockwaveSuccess_440488)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSuddenDeathApplied_440113)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSuddenDeathRemoved_440113)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventValorOfAzerothApplied_461475)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventValorOfAzerothRemoved_461475)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVictoryRushSuccess_402927)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventGladiatorStanceApplied_412513)
end

function me.TestCombatEventBerserkerRageApplied_18499()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkerRageApplied_18499",
    testCategory,
    "Berserker Rage",
    18499
  )
end

function me.TestCombatEventBerserkerRageRemoved_18499()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBerserkerRageRemoved_18499",
    testCategory,
    "Berserker Rage",
    18499
  )
end

function me.TestCombatEventRecklessnessApplied_1719()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRecklessnessApplied_1719",
    testCategory,
    "Recklessness",
    1719
  )
end

function me.TestCombatEventRecklessnessRemoved_1719()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRecklessnessRemoved_1719",
    testCategory,
    "Recklessness",
    1719
  )
end

function me.TestCombatEventDeathWishApplied_12292()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDeathWishApplied_12292",
    testCategory,
    "Death Wish",
    12292
  )
end

function me.TestCombatEventDeathWishRemoved_12292()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventDeathWishRemoved_12292",
    testCategory,
    "Death Wish",
    12292
  )
end

function me.TestCombatEventBattleStanceApplied_2457()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBattleStanceApplied_2457",
    testCategory,
    "Battle Stance",
    2457
  )
end

function me.TestCombatEventBerserkerStanceApplied_2458()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBerserkerStanceApplied_2458",
    testCategory,
    "Berserker Stance",
    2458
  )
end

function me.TestCombatEventDefensiveStanceApplied_71()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventDefensiveStanceApplied_71",
    testCategory,
    "Defensive Stance",
    71
  )
end

function me.TestCombatEventInterceptSuccess_20252()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterceptSuccess_20252",
    testCategory,
    "Intercept",
    20252
  )
end

function me.TestCombatEventInterceptSuccess_20616()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterceptSuccess_20616",
    testCategory,
    "Intercept",
    20616
  )
end

function me.TestCombatEventInterceptSuccess_20617()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterceptSuccess_20617",
    testCategory,
    "Intercept",
    20617
  )
end

function me.TestCombatEventDisarmSuccess_676()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventDisarmSuccess_676",
    testCategory,
    "Disarm",
    676
  )
end

function me.TestCombatEventConcussionBlowSuccess_12809()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventConcussionBlowSuccess_12809",
    testCategory,
    "Concussion Blow",
    12809
  )
end

function me.TestCombatEventBloodrageApplied_2687()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBloodrageApplied_2687",
    testCategory,
    "Bloodrage",
    2687
  )
end

function me.TestCombatEventBloodrageRemoved_2687()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBloodrageRemoved_2687",
    testCategory,
    "Bloodrage",
    2687
  )
end

function me.TestCombatEventPummelSuccess_6552()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPummelSuccess_6552",
    testCategory,
    "Pummel",
    6552
  )
end

function me.TestCombatEventPummelSuccess_6554()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPummelSuccess_6554",
    testCategory,
    "Pummel",
    6554
  )
end

function me.TestCombatEventChargeSuccess_100()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventChargeSuccess_100",
    testCategory,
    "Charge",
    100
  )
end

function me.TestCombatEventChargeSuccess_6178()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventChargeSuccess_6178",
    testCategory,
    "Charge",
    6178
  )
end

function me.TestCombatEventChargeSuccess_11578()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventChargeSuccess_11578",
    testCategory,
    "Charge",
    11578
  )
end

function me.TestCombatEventIntimidatingShoutSuccess_5246()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventIntimidatingShoutSuccess_5246",
    testCategory,
    "Intimidating Shout",
    5246
  )
end

function me.TestCombatEventShieldBlockApplied_2565()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShieldBlockApplied_2565",
    testCategory,
    "Shield Block",
    2565
  )
end

function me.TestCombatEventShieldBlockRemoved_2565()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShieldBlockRemoved_2565",
    testCategory,
    "Shield Block",
    2565
  )
end

function me.TestCombatEventShieldSlamSuccess_23922()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldSlamSuccess_23922",
    testCategory,
    "Shield Slam",
    23922
  )
end

function me.TestCombatEventShieldSlamSuccess_23923()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldSlamSuccess_23923",
    testCategory,
    "Shield Slam",
    23923
  )
end

function me.TestCombatEventShieldSlamSuccess_23924()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldSlamSuccess_23924",
    testCategory,
    "Shield Slam",
    23924
  )
end

function me.TestCombatEventShieldSlamSuccess_23925()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldSlamSuccess_23925",
    testCategory,
    "Shield Slam",
    23925
  )
end

function me.TestCombatEventShieldWallApplied_871()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventShieldWallApplied_871",
    testCategory,
    "Shield Wall",
    871
  )
end

function me.TestCombatEventShieldWallRemoved_871()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventShieldWallRemoved_871",
    testCategory,
    "Shield Wall",
    871
  )
end

function me.TestCombatEventLastStandApplied_12975()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventLastStandApplied_12975",
    testCategory,
    "Last Stand",
    12975
  )
end

function me.TestCombatEventLastStandRemoved_12975()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventLastStandRemoved_12975",
    testCategory,
    "Last Stand",
    12975
  )
end

function me.TestCombatEventShieldBashSuccess_72()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldBashSuccess_72",
    testCategory,
    "Shield Bash",
    72
  )
end

function me.TestCombatEventShieldBashSuccess_1671()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldBashSuccess_1671",
    testCategory,
    "Shield Bash",
    1671
  )
end

function me.TestCombatEventShieldBashSuccess_1672()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShieldBashSuccess_1672",
    testCategory,
    "Shield Bash",
    1672
  )
end

function me.TestCombatEventRetaliationApplied_20230()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRetaliationApplied_20230",
    testCategory,
    "Retaliation",
    20230
  )
end

function me.TestCombatEventRetaliationRemoved_20230()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRetaliationRemoved_20230",
    testCategory,
    "Retaliation",
    20230
  )
end

function me.TestCombatEventFlagellationApplied_402877()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventFlagellationApplied_402877",
    testCategory,
    "Flagellation",
    402877
  )
end

function me.TestCombatEventFlagellationRemoved_402877()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventFlagellationRemoved_402877",
    testCategory,
    "Flagellation",
    402877
  )
end

function me.TestCombatEventRagingBlowSuccess_402911()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventRagingBlowSuccess_402911",
    testCategory,
    "Raging Blow",
    402911
  )
end

function me.TestCombatEventConsumedByRageApplied_425418()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventConsumedByRageApplied_425418",
    testCategory,
    "Consumed by Rage",
    425418
  )
end

function me.TestCombatEventConsumedByRageRemoved_425418()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventConsumedByRageRemoved_425418",
    testCategory,
    "Consumed by Rage",
    425418
  )
end

function me.TestCombatEventQuickStrikeSuccess_429765()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventQuickStrikeSuccess_429765",
    testCategory,
    "Quick Strike",
    429765
  )
end

function me.TestCombatEventEnragedRegenerationApplied_402913()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEnragedRegenerationApplied_402913",
    testCategory,
    "Enraged Regeneration",
    402913
  )
end

function me.TestCombatEventEnragedRegenerationRemoved_402913()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEnragedRegenerationRemoved_402913",
    testCategory,
    "Enraged Regeneration",
    402913
  )
end

function me.TestCombatEventRallyingCryApplied_426490()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRallyingCryApplied_426490",
    testCategory,
    "Rallying Cry",
    426490
  )
end

function me.TestCombatEventRallyingCryRemoved_426490()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRallyingCryRemoved_426490",
    testCategory,
    "Rallying Cry",
    426490
  )
end

function me.TestCombatEventInterveneSuccess_403338()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventInterveneSuccess_403338",
    testCategory,
    "Intervene",
    403338
  )
end

function me.TestCombatEventCommandingShoutSuccess_403215()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCommandingShoutSuccess_403215",
    testCategory,
    "Commanding Shout",
    403215
  )
end

function me.TestCombatEventRampageApplied_426940()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventRampageApplied_426940",
    testCategory,
    "Rampage",
    426940
  )
end

function me.TestCombatEventRampageRemoved_426940()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventRampageRemoved_426940",
    testCategory,
    "Rampage",
    426940
  )
end

function me.TestCombatEventMeathookSuccess_403228()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMeathookSuccess_403228",
    testCategory,
    "Meathook",
    403228
  )
end

function me.TestCombatEventShockwaveSuccess_440488()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShockwaveSuccess_440488",
    testCategory,
    "Shockwave",
    440488
  )
end

function me.TestCombatEventSuddenDeathApplied_440113()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSuddenDeathApplied_440113",
    testCategory,
    "Sudden Death",
    440113
  )
end

function me.TestCombatEventSuddenDeathRemoved_440113()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSuddenDeathRemoved_440113",
    testCategory,
    "Sudden Death",
    440113
  )
end

function me.TestCombatEventValorOfAzerothApplied_461475()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventValorOfAzerothApplied_461475",
    testCategory,
    "Valor of Azeroth",
    461475
  )
end

function me.TestCombatEventValorOfAzerothRemoved_461475()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventValorOfAzerothRemoved_461475",
    testCategory,
    "Valor of Azeroth",
    461475
  )
end

function me.TestCombatEventVictoryRushSuccess_402927()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVictoryRushSuccess_402927",
    testCategory,
    "Victory Rush",
    402927
  )
end

function me.TestCombatEventGladiatorStanceApplied_412513()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventGladiatorStanceApplied_412513",
    testCategory,
    "Gladiator Stance",
    412513
  )
end
