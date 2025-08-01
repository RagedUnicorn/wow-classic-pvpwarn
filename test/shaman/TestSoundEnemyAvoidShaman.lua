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
mod.testSoundEnemyAvoidShaman = me

me.tag = "TestSoundEnemyAvoidShaman"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: /rgpvpw testenemysound shaman")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    if type(completionCallback) == "function" then
      completionCallback()
    end
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEarthShock_8042)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEarthShock_8044)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEarthShock_8045)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEarthShock_8046)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEarthShock_10412)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEarthShock_10413)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidEarthShock_10414)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFlameShock_8050)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFlameShock_8052)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFlameShock_8053)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFlameShock_10447)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFlameShock_10448)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFlameShock_29228)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostShock_8056)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostShock_8058)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostShock_10472)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidFrostShock_10473)
end

function me.TestSoundEnemyAvoidEarthShock_8042()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEarthShock_8042",
    testCategory,
    8042
  )
end

function me.TestSoundEnemyAvoidEarthShock_8044()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEarthShock_8044",
    testCategory,
    8044
  )
end

function me.TestSoundEnemyAvoidEarthShock_8045()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEarthShock_8045",
    testCategory,
    8045
  )
end

function me.TestSoundEnemyAvoidEarthShock_8046()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEarthShock_8046",
    testCategory,
    8046
  )
end

function me.TestSoundEnemyAvoidEarthShock_10412()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEarthShock_10412",
    testCategory,
    10412
  )
end

function me.TestSoundEnemyAvoidEarthShock_10413()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEarthShock_10413",
    testCategory,
    10413
  )
end

function me.TestSoundEnemyAvoidEarthShock_10414()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidEarthShock_10414",
    testCategory,
    10414
  )
end

function me.TestSoundEnemyAvoidFlameShock_8050()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFlameShock_8050",
    testCategory,
    8050
  )
end

function me.TestSoundEnemyAvoidFlameShock_8052()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFlameShock_8052",
    testCategory,
    8052
  )
end

function me.TestSoundEnemyAvoidFlameShock_8053()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFlameShock_8053",
    testCategory,
    8053
  )
end

function me.TestSoundEnemyAvoidFlameShock_10447()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFlameShock_10447",
    testCategory,
    10447
  )
end

function me.TestSoundEnemyAvoidFlameShock_10448()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFlameShock_10448",
    testCategory,
    10448
  )
end

function me.TestSoundEnemyAvoidFlameShock_29228()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFlameShock_29228",
    testCategory,
    29228
  )
end

function me.TestSoundEnemyAvoidFrostShock_8056()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFrostShock_8056",
    testCategory,
    8056
  )
end

function me.TestSoundEnemyAvoidFrostShock_8058()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFrostShock_8058",
    testCategory,
    8058
  )
end

function me.TestSoundEnemyAvoidFrostShock_10472()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFrostShock_10472",
    testCategory,
    10472
  )
end

function me.TestSoundEnemyAvoidFrostShock_10473()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidFrostShock_10473",
    testCategory,
    10473
  )
end
