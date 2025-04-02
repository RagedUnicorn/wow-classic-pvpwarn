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
mod.testSoundWarrior = me

me.tag = "TestSoundWarrior"

local testGroupName = "SoundWarrior"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerRage_18499)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBerserkerRage_18499)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRecklessness_1719)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRecklessness_1719)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDeathWish_12292)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownDeathWish_12292)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBattleStance_2457)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBerserkerStance_2458)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDefensiveStance_71)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntercept_20252)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntercept_20616)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntercept_20617)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDisarm_676)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConcussionBlow_12809)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBloodrage_2687)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBloodrage_2687)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPummel_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPummel_6554)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCharge_100)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCharge_6178)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCharge_11578)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntimidatingShout_5246)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBlock_2565)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShieldBlock_2565)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam_23922)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam_23923)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam_23924)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldSlam_23925)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldWall_871)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownShieldWall_871)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundLastStand_12975)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownLastStand_12975)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBash_72)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBash_1671)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShieldBash_1672)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRetaliation_20230)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRetaliation_20230)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFlagellation_402877)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownFlagellation_402877)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRagingBlow_402911)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundConsumedByRage_425418)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownConsumedByRage_425418)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundQuickStrike_429765)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnragedRegeneration_402913)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEnragedRegeneration_402913)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRallyingCry_426490)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRallyingCry_426490)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundIntervene_403338)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCommandingShout_403215)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundRampage_426940)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownRampage_426940)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMeathook_403228)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShockwave_440488)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSuddenDeath_440113)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSuddenDeath_440113)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundValorOfAzeroth_461475)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownValorOfAzeroth_461475)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVictoryRush_402927)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundGladiatorStance_412513)
end

function me.TestSoundBerserkerRage_18499()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserkerRage_18499",
    testCategory,
    18499 -- Berserker Rage
  )
end

function me.TestSoundDownBerserkerRage_18499()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBerserkerRage_18499",
    testCategory,
    18499 -- Berserker Rage
  )
end

function me.TestSoundRecklessness_1719()
  mod.testHelper.TestSoundApplied(
    "TestSoundRecklessness_1719",
    testCategory,
    1719
  )
end

function me.TestSoundDownRecklessness_1719()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRecklessness_1719",
    testCategory,
    1719
  )
end

function me.TestSoundDeathWish_12292()
  mod.testHelper.TestSoundApplied(
    "TestSoundDeathWish_12292",
    testCategory,
    12292
  )
end

function me.TestSoundDownDeathWish_12292()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownDeathWish_12292",
    testCategory,
    12292
  )
end

function me.TestSoundBattleStance_2457()
  mod.testHelper.TestSoundApplied(
    "TestSoundBattleStance_2457",
    testCategory,
    2457
  )
end

function me.TestSoundBerserkerStance_2458()
  mod.testHelper.TestSoundApplied(
    "TestSoundBerserkerStance_2458",
    testCategory,
    2458
  )
end

function me.TestSoundDefensiveStance_71()
  mod.testHelper.TestSoundApplied(
    "TestSoundDefensiveStance_71",
    testCategory,
    71
  )
end

function me.TestSoundIntercept_20252()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntercept_20252",
    testCategory,
    20252
  )
end

function me.TestSoundIntercept_20616()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntercept_20616",
    testCategory,
    20616
  )
end

function me.TestSoundIntercept_20617()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntercept_20617",
    testCategory,
    20617
  )
end

function me.TestSoundDisarm_676()
  mod.testHelper.TestSoundSuccess(
    "TestSoundDisarm_676",
    testCategory,
    676
  )
end

function me.TestSoundConcussionBlow_12809()
  mod.testHelper.TestSoundSuccess(
    "TestSoundConcussionBlow_12809",
    testCategory,
    12809
  )
end

function me.TestSoundBloodrage_2687()
  mod.testHelper.TestSoundApplied(
    "TestSoundBloodrage_2687",
    testCategory,
    2687
  )
end

function me.TestSoundDownBloodrage_2687()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBloodrage_2687",
    testCategory,
    2687
  )
end

function me.TestSoundPummel_6552()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPummel_6552",
    testCategory,
    6552
  )
end

function me.TestSoundPummel_6554()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPummel_6554",
    testCategory,
    6554
  )
end

function me.TestSoundCharge_100()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCharge_100",
    testCategory,
    100
  )
end

function me.TestSoundCharge_6178()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCharge_6178",
    testCategory,
    6178
  )
end

function me.TestSoundCharge_11578()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCharge_11578",
    testCategory,
    11578
  )
end

function me.TestSoundIntimidatingShout_5246()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntimidatingShout_5246",
    testCategory,
    5246
  )
end

function me.TestSoundShieldBlock_2565()
  mod.testHelper.TestSoundApplied(
    "TestSoundShieldBlock_2565",
    testCategory,
    2565
  )
end

function me.TestSoundDownShieldBlock_2565()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShieldBlock_2565",
    testCategory,
    2565
  )
end

function me.TestSoundShieldSlam_23922()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldSlam_23922",
    testCategory,
    23922
  )
end

function me.TestSoundShieldSlam_23923()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldSlam_23923",
    testCategory,
    23923
  )
end

function me.TestSoundShieldSlam_23924()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldSlam_23924",
    testCategory,
    23924
  )
end

function me.TestSoundShieldSlam_23925()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldSlam_23925",
    testCategory,
    23925
  )
end

function me.TestSoundShieldWall_871()
  mod.testHelper.TestSoundApplied(
    "TestSoundShieldWall_871",
    testCategory,
    871
  )
end

function me.TestSoundDownShieldWall_871()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownShieldWall_871",
    testCategory,
    871
  )
end

function me.TestSoundLastStand_12975()
  mod.testHelper.TestSoundApplied(
    "TestSoundLastStand_12975",
    testCategory,
    12975
  )
end

function me.TestSoundDownLastStand_12975()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownLastStand_12975",
    testCategory,
    12975
  )
end

function me.TestSoundShieldBash_72()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldBash_72",
    testCategory,
    72
  )
end

function me.TestSoundShieldBash_1671()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldBash_1671",
    testCategory,
    1671
  )
end

function me.TestSoundShieldBash_1672()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShieldBash_1672",
    testCategory,
    1672
  )
end

function me.TestSoundRetaliation_20230()
  mod.testHelper.TestSoundApplied(
    "TestSoundRetaliation_20230",
    testCategory,
    20230
  )
end

function me.TestSoundDownRetaliation_20230()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRetaliation_20230",
    testCategory,
    20230
  )
end

function me.TestSoundFlagellation_402877()
  mod.testHelper.TestSoundApplied(
    "TestSoundFlagellation_402877",
    testCategory,
    402877
  )
end

function me.TestSoundDownFlagellation_402877()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownFlagellation_402877",
    testCategory,
    402877
  )
end

function me.TestSoundRagingBlow_402911()
  mod.testHelper.TestSoundSuccess(
    "TestSoundRagingBlow_402911",
    testCategory,
    402911
  )
end

function me.TestSoundConsumedByRage_425418()
  mod.testHelper.TestSoundApplied(
    "TestSoundConsumedByRage_425418",
    testCategory,
    425418
  )
end

function me.TestSoundDownConsumedByRage_425418()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownConsumedByRage_425418",
    testCategory,
    425418
  )
end

function me.TestSoundQuickStrike_429765()
  mod.testHelper.TestSoundSuccess(
    "TestSoundQuickStrike_429765",
    testCategory,
    429765
  )
end

function me.TestSoundEnragedRegeneration_402913()
  mod.testHelper.TestSoundApplied(
    "TestSoundEnragedRegeneration_402913",
    testCategory,
    402913
  )
end

function me.TestSoundDownEnragedRegeneration_402913()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEnragedRegeneration_402913",
    testCategory,
    402913
  )
end

function me.TestSoundRallyingCry_426490()
  mod.testHelper.TestSoundApplied(
    "TestSoundRallyingCry_426490",
    testCategory,
    426490
  )
end

function me.TestSoundDownRallyingCry_426490()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRallyingCry_426490",
    testCategory,
    426490
  )
end

function me.TestSoundIntervene_403338()
  mod.testHelper.TestSoundSuccess(
    "TestSoundIntervene_403338",
    testCategory,
    403338
  )
end

function me.TestSoundCommandingShout_403215()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCommandingShout_403215",
    testCategory,
    403215
  )
end

function me.TestSoundRampage_426940()
  mod.testHelper.TestSoundApplied(
    "TestSoundRampage_426940",
    testCategory,
    426940
  )
end

function me.TestSoundDownRampage_426940()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownRampage_426940",
    testCategory,
    426940
  )
end

function me.TestSoundMeathook_403228()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMeathook_403228",
    testCategory,
    403228
  )
end

function me.TestSoundShockwave_440488()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShockwave_440488",
    testCategory,
    440488
  )
end

function me.TestSoundSuddenDeath_440113()
  mod.testHelper.TestSoundApplied(
    "TestSoundSuddenDeath_440113",
    testCategory,
    440113
  )
end

function me.TestSoundDownSuddenDeath_440113()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSuddenDeath_440113",
    testCategory,
    440113
  )
end

function me.TestSoundValorOfAzeroth_461475()
  mod.testHelper.TestSoundApplied(
    "TestSoundValorOfAzeroth_461475",
    testCategory,
    461475
  )
end

function me.TestSoundDownValorOfAzeroth_461475()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownValorOfAzeroth_461475",
    testCategory,
    461475
  )
end

function me.TestSoundVictoryRush_402927()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVictoryRush_402927",
    testCategory,
    402927
  )
end

function me.TestSoundGladiatorStance_412513()
  mod.testHelper.TestSoundApplied(
    "TestSoundGladiatorStance_412513",
    testCategory,
    412513
  )
end
