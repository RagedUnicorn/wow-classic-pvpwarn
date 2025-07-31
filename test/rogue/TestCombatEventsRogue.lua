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
mod.testCombatEventsRogue = me

me.tag = "TestCombatEventsRogue"

local testGroupName = "CombatEventsRogue"
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
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlindApplied_2094)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlindRefresh_2094)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKickSuccess_1769)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKickSuccess_1766)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKickSuccess_1767)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKickSuccess_1768)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSprintApplied_11305)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSprintRemoved_11305)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSprintApplied_2983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSprintRemoved_2983)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSprintApplied_8696)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSprintRemoved_8696)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEvasionApplied_5277)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEvasionRemoved_5277)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKidneyShotSuccess_8643)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventKidneyShotSuccess_408)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCheapShotSuccess_1833)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAdrenalineRushApplied_13750)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventAdrenalineRushRemoved_13750)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBladeFlurryApplied_13877)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBladeFlurryRemoved_13877)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventColdBloodApplied_14177)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventColdBloodRemoved_14177)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPreparationSuccess_14185)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVanishSuccess_1856)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventVanishSuccess_1857)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStealthSuccess_1784)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStealthSuccess_1785)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStealthSuccess_1786)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventStealthSuccess_1787)

  -- start runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventQuickDrawSuccess_398196)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBetweenTheEyesSuccess_400009)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBladeDanceApplied_400012)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBladeDanceRemoved_400012)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMutilateSuccess_399960)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowstrikeSuccess_399985)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventSaberSlashSuccess_424785)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShadowstepSuccess_400029)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventPoisonedKnifeSuccess_425012)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventShurikenTossSuccess_399986)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventEnvenomSuccess_399963)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMainGaucheSuccess_424919)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMasterOfSubtletyApplied_425096)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventMasterOfSubtletyRemoved_425096)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCutthroatApplied_462708)
  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCutthroatRemoved_462708)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventBlunderbussSuccess_436610)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventCrimsonTempestSuccess_412096)

  mod.testReporter.AddToTestQueueWithDelay(me.TestCombatEventFanOfKnivesSuccess_409240)
end

function me.TestCombatEventBlindApplied_2094()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBlindApplied_2094",
    testCategory,
    "Blind",
    2094
  )
end

function me.TestCombatEventBlindRefresh_2094()
  mod.testHelper.TestCombatEventRefresh(
    "TestCombatEventBlindRefresh_2094",
    testCategory,
    "Blind",
    2094
  )
end

function me.TestCombatEventKickSuccess_1769()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_1769",
    testCategory,
    "Kick",
    1769
  )
end

function me.TestCombatEventKickSuccess_1766()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_1766",
    testCategory,
    "Kick",
    1766
  )
end

function me.TestCombatEventKickSuccess_1767()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_1767",
    testCategory,
    "Kick",
    1767
  )
end

function me.TestCombatEventKickSuccess_1768()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKickSuccess_1768",
    testCategory,
    "Kick",
    1768
  )
end

function me.TestCombatEventSprintApplied_11305()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSprintApplied_11305",
    testCategory,
    "Sprint",
    11305
  )
end

function me.TestCombatEventSprintRemoved_11305()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSprintRemoved_11305",
    testCategory,
    "Sprint",
    11305
  )
end

function me.TestCombatEventSprintApplied_2983()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSprintApplied_2983",
    testCategory,
    "Sprint",
    2983
  )
end

function me.TestCombatEventSprintRemoved_2983()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSprintRemoved_2983",
    testCategory,
    "Sprint",
    2983
  )
end

function me.TestCombatEventSprintApplied_8696()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventSprintApplied_8696",
    testCategory,
    "Sprint",
    8696
  )
end

function me.TestCombatEventSprintRemoved_8696()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventSprintRemoved_8696",
    testCategory,
    "Sprint",
    8696
  )
end

function me.TestCombatEventEvasionApplied_5277()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventEvasionApplied_5277",
    testCategory,
    "Evasion",
    5277
  )
end

function me.TestCombatEventEvasionRemoved_5277()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventEvasionRemoved_5277",
    testCategory,
    "Evasion",
    5277
  )
end

function me.TestCombatEventKidneyShotSuccess_8643()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKidneyShotSuccess_8643",
    testCategory,
    "Kidney Shot",
    8643
  )
end

function me.TestCombatEventKidneyShotSuccess_408()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventKidneyShotSuccess_408",
    testCategory,
    "Kidney Shot",
    408
  )
end

function me.TestCombatEventCheapShotSuccess_1833()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCheapShotSuccess_1833",
    testCategory,
    "Cheap Shot",
    1833
  )
end

function me.TestCombatEventAdrenalineRushApplied_13750()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventAdrenalineRushApplied_13750",
    testCategory,
    "Adrenaline Rush",
    13750
  )
end

function me.TestCombatEventAdrenalineRushRemoved_13750()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventAdrenalineRushRemoved_13750",
    testCategory,
    "Adrenaline Rush",
    13750
  )
end

function me.TestCombatEventBladeFlurryApplied_13877()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBladeFlurryApplied_13877",
    testCategory,
    "Blade Flurry",
    13877
  )
end

function me.TestCombatEventBladeFlurryRemoved_13877()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBladeFlurryRemoved_13877",
    testCategory,
    "Blade Flurry",
    13877
  )
end

function me.TestCombatEventColdBloodApplied_14177()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventColdBloodApplied_14177",
    testCategory,
    "Cold Blood",
    14177
  )
end

function me.TestCombatEventColdBloodRemoved_14177()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventColdBloodRemoved_14177",
    testCategory,
    "Cold Blood",
    14177
  )
end

function me.TestCombatEventPreparationSuccess_14185()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPreparationSuccess_14185",
    testCategory,
    "Preparation",
    14185
  )
end

function me.TestCombatEventVanishSuccess_1856()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVanishSuccess_1856",
    testCategory,
    "Vanish",
    1856
  )
end

function me.TestCombatEventVanishSuccess_1857()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventVanishSuccess_1857",
    testCategory,
    "Vanish",
    1857
  )
end

function me.TestCombatEventStealthSuccess_1784()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess_1784",
    testCategory,
    "Stealth",
    1784
  )
end

function me.TestCombatEventStealthSuccess_1785()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess_1785",
    testCategory,
    "Stealth",
    1785
  )
end

function me.TestCombatEventStealthSuccess_1786()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess_1786",
    testCategory,
    "Stealth",
    1786
  )
end

function me.TestCombatEventStealthSuccess_1787()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventStealthSuccess_1787",
    testCategory,
    "Stealth",
    1787
  )
end

function me.TestCombatEventQuickDrawSuccess_398196()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventQuickDrawSuccess_398196",
    testCategory,
    "Quick Draw",
    398196
  )
end

function me.TestCombatEventBetweenTheEyesSuccess_400009()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBetweenTheEyesSuccess_400009",
    testCategory,
    "Between the Eyes",
    400009
  )
end

function me.TestCombatEventBladeDanceApplied_400012()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventBladeDanceApplied_400012",
    testCategory,
    "Blade Dance",
    400012
  )
end

function me.TestCombatEventBladeDanceRemoved_400012()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventBladeDanceRemoved_400012",
    testCategory,
    "Blade Dance",
    400012
  )
end

function me.TestCombatEventMutilateSuccess_399960()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMutilateSuccess_399960",
    testCategory,
    "Mutilate",
    399960
  )
end

function me.TestCombatEventShadowstrikeSuccess_399985()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowstrikeSuccess_399985",
    testCategory,
    "Shadowstrike",
    399985
  )
end

function me.TestCombatEventSaberSlashSuccess_424785()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventSaberSlashSuccess_424785",
    testCategory,
    "Saber Slash",
    424785
  )
end

function me.TestCombatEventShadowstepSuccess_400029()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShadowstepSuccess_400029",
    testCategory,
    "Shadowstep",
    400029
  )
end

function me.TestCombatEventPoisonedKnifeSuccess_425012()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventPoisonedKnifeSuccess_425012",
    testCategory,
    "Poisoned Knife",
    425012
  )
end

function me.TestCombatEventShurikenTossSuccess_399986()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventShurikenTossSuccess_399986",
    testCategory,
    "Shuriken Toss",
    399986
  )
end

function me.TestCombatEventEnvenomSuccess_399963()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventEnvenomSuccess_399963",
    testCategory,
    "Envenom",
    399963
  )
end

function me.TestCombatEventMainGaucheSuccess_424919()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventMainGaucheSuccess_424919",
    testCategory,
    "Main Gauche",
    424919
  )
end

function me.TestCombatEventMasterOfSubtletyApplied_425096()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventMasterOfSubtletyApplied_425096",
    testCategory,
    "Master of Subtlety",
    425096
  )
end

function me.TestCombatEventMasterOfSubtletyRemoved_425096()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventMasterOfSubtletyRemoved_425096",
    testCategory,
    "Master of Subtlety",
    425096
  )
end

function me.TestCombatEventCutthroatApplied_462708()
  mod.testHelper.TestCombatEventApplied(
    "TestCombatEventCutthroatApplied_462708",
    testCategory,
    "Cutthroat",
    462708
  )
end

function me.TestCombatEventCutthroatRemoved_462708()
  mod.testHelper.TestCombatEventRemoved(
    "TestCombatEventCutthroatRemoved_462708",
    testCategory,
    "Cutthroat",
    462708
  )
end

function me.TestCombatEventBlunderbussSuccess_436610()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventBlunderbussSuccess_436610",
    testCategory,
    "Blunderbuss",
    436610
  )
end

function me.TestCombatEventCrimsonTempestSuccess_412096()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventCrimsonTempestSuccess_412096",
    testCategory,
    "Crimson Tempest",
    412096
  )
end

function me.TestCombatEventFanOfKnivesSuccess_409240()
  mod.testHelper.TestCombatEventSuccess(
    "TestCombatEventFanofKnivesSuccess_409240",
    testCategory,
    "Fan of Knives",
    409240
  )
end
