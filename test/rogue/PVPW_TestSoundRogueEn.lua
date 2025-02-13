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
mod.testSoundRogueEn = me

me.tag = "TestSoundRogueEn"

local testGroupName = "SoundRogueEn"
local testCategory = "rogue"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKick)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlind)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSprint)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownSprint)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEvasion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownEvasion)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundKidneyShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCheapShot)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundAdrenalineRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownAdrenalineRush)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBladeFlurry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBladeFlurry)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundColdBlood)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownColdBlood)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPreparation)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundVanish)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundStealth)
  -- runes
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundQuickDraw)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBetweenTheEyes)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBladeDance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownBladeDance)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMutilate)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowstrike)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundSaberSlash)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShadowstep)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundPoisonedKnife)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundShurikenToss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnvenom)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMainGauche)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundMasterOfSubtlety)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownMasterOfSubtlety)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCutthroat)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundDownCutthroat)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundBlunderbuss)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundCrimsonTempest)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundFanOfKnives)
end

function me.TestSoundBlind()
  mod.testHelper.TestSoundApplied(
    "TestSoundBlind",
    testCategory,
    "Blind"
  )
end

function me.TestSoundKick()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKick",
    testCategory,
    "Kick"
  )
end

function me.TestSoundSprint()
  mod.testHelper.TestSoundApplied(
    "TestSoundSprint",
    testCategory,
    "Sprint"
  )
end

function me.TestSoundDownSprint()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownSprint",
    testCategory,
    "Sprint"
  )
end

function me.TestSoundEvasion()
  mod.testHelper.TestSoundApplied(
    "TestSoundEvasion",
    testCategory,
    "Evasion"
  )
end

function me.TestSoundDownEvasion()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownEvasion",
    testCategory,
    "Evasion"
  )
end

function me.TestSoundKidneyShot()
  mod.testHelper.TestSoundSuccess(
    "TestSoundKidneyShot",
    testCategory,
    "Kidney Shot"
  )
end

function me.TestSoundCheapShot()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCheapShot",
    testCategory,
    "Cheap Shot"
  )
end

function me.TestSoundAdrenalineRush()
  mod.testHelper.TestSoundApplied(
    "TestSoundAdrenalineRush",
    testCategory,
    "Adrenaline Rush"
  )
end

function me.TestSoundDownAdrenalineRush()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownAdrenalineRush",
    testCategory,
    "Adrenaline Rush"
  )
end

function me.TestSoundBladeFlurry()
  mod.testHelper.TestSoundApplied(
    "TestSoundBladeFlurry",
    testCategory,
    "Blade Flurry"
  )
end

function me.TestSoundDownBladeFlurry()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBladeFlurry",
    testCategory,
    "Blade Flurry"
  )
end

function me.TestSoundColdBlood()
  mod.testHelper.TestSoundApplied(
    "TestSoundColdBlood",
    testCategory,
    "Cold Blood"
  )
end

function me.TestSoundDownColdBlood()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownColdBlood",
    testCategory,
    "Cold Blood"
  )
end

function me.TestSoundPreparation()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPreparation",
    testCategory,
    "Preparation"
  )
end

function me.TestSoundVanish()
  mod.testHelper.TestSoundSuccess(
    "TestSoundVanish",
    testCategory,
    "Vanish"
  )
end

function me.TestSoundStealth()
  mod.testHelper.TestSoundSuccess(
    "TestSoundStealth",
    testCategory,
    "Stealth"
  )
end

function me.TestSoundQuickDraw()
  mod.testHelper.TestSoundSuccess(
    "TestSoundQuickDraw",
    testCategory,
    "Quick Draw"
  )
end

function me.TestSoundBetweenTheEyes()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBetweenTheEyes",
    testCategory,
    "Between the Eyes"
  )
end

function me.TestSoundBladeDance()
  mod.testHelper.TestSoundApplied(
    "TestSoundBladeDance",
    testCategory,
    "Blade Dance"
  )
end

function me.TestSoundDownBladeDance()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownBladeDance",
    testCategory,
    "Blade Dance"
  )
end

function me.TestSoundMutilate()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMutilate",
    testCategory,
    "Mutilate"
  )
end

function me.TestSoundShadowstrike()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowstrike",
    testCategory,
    "Shadowstrike"
  )
end

function me.TestSoundSaberSlash()
  mod.testHelper.TestSoundSuccess(
    "TestSoundSaberSlash",
    testCategory,
    "Saber Slash"
  )
end

function me.TestSoundShadowstep()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShadowstep",
    testCategory,
    "Shadowstep"
  )
end

function me.TestSoundPoisonedKnife()
  mod.testHelper.TestSoundSuccess(
    "TestSoundPoisonedKnife",
    testCategory,
    "Poisoned Knife"
  )
end

function me.TestSoundShurikenToss()
  mod.testHelper.TestSoundSuccess(
    "TestSoundShurikenToss",
    testCategory,
    "Shuriken Toss"
  )
end

function me.TestSoundEnvenom()
  mod.testHelper.TestSoundSuccess(
    "TestSoundEnvenom",
    testCategory,
    "Envenom"
  )
end

function me.TestSoundMainGauche()
  mod.testHelper.TestSoundSuccess(
    "TestSoundMainGauche",
    testCategory,
    "Main Gauche"
  )
end

function me.TestSoundMasterOfSubtlety()
  mod.testHelper.TestSoundApplied(
    "TestSoundMasterOfSubtlety",
    testCategory,
    "Master of Subtlety"
  )
end

function me.TestSoundDownMasterOfSubtlety()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownMasterOfSubtlety",
    testCategory,
    "Master of Subtlety"
  )
end

function me.TestSoundCutthroat()
  mod.testHelper.TestSoundApplied(
    "TestSoundCutthroat",
    testCategory,
    "Cutthroat"
  )
end

function me.TestSoundDownCutthroat()
  mod.testHelper.TestSoundRemoved(
    "TestSoundDownCutthroat",
    testCategory,
    "Cutthroat"
  )
end

function me.TestSoundBlunderbuss()
  mod.testHelper.TestSoundSuccess(
    "TestSoundBlunderbuss",
    testCategory,
    "Blunderbuss"
  )
end

function me.TestSoundCrimsonTempest()
  mod.testHelper.TestSoundSuccess(
    "TestSoundCrimsonTempest",
    testCategory,
    "Crimson Tempest"
  )
end

function me.TestSoundFanOfKnives()
  mod.testHelper.TestSoundSuccess(
    "TestSoundFanOfKnives",
    testCategory,
    "Fan of Knives"
  )
end
