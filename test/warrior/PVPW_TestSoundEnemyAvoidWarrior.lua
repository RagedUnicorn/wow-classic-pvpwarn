local mod = rgpvpw
local me = {}
mod.testSoundEnemyAvoidWarrior = me

me.tag = "TestSoundEnemyAvoidWarrior"

local testGroupName = "SoundEnemyAvoidWarrior"
local testCategory = "warrior"

function me.Test()
  mod.testReporter.StartTestGroup(testGroupName)

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end

function me.CollectTestCases()
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidChargeStun_7922)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidInterceptStun_20253)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidInterceptStun_20614)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidInterceptStun_20615)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHamstring_7372)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHamstring_7373)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidHamstring_25212)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMortalStrike_12294)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMortalStrike_21551)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMortalStrike_21552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidMortalStrike_21553)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidIntimidatingShout_5246)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPummel_6552)
  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidPummel_6554)

  mod.testReporter.AddToTestQueueWithDelay(me.TestSoundEnemyAvoidDisarm_676)
end

function me.TestSoundEnemyAvoidChargeStun_7922()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidChargeStun_7922",
    testCategory,
    7922
  )
end

function me.TestSoundEnemyAvoidInterceptStun_20253()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidInterceptStun_20253",
    testCategory,
    20253
  )
end

function me.TestSoundEnemyAvoidInterceptStun_20614()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidInterceptStun_20614",
    testCategory,
    20614
  )
end

function me.TestSoundEnemyAvoidInterceptStun_20615()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidInterceptStun_20615",
    testCategory,
    20615
  )
end

function me.TestSoundEnemyAvoidHamstring_7372()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHamstring_7372",
    testCategory,
    7372
  )
end

function me.TestSoundEnemyAvoidHamstring_7373()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHamstring_7373",
    testCategory,
    7373
  )
end

function me.TestSoundEnemyAvoidHamstring_25212()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidHamstring_25212",
    testCategory,
    25212
  )
end

function me.TestSoundEnemyAvoidMortalStrike_12294()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMortalStrike_12294",
    testCategory,
    12294
  )
end

function me.TestSoundEnemyAvoidMortalStrike_21551()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMortalStrike_21551",
    testCategory,
    21551
  )
end

function me.TestSoundEnemyAvoidMortalStrike_21552()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMortalStrike_21552",
    testCategory,
    21552
  )
end

function me.TestSoundEnemyAvoidMortalStrike_21553()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidMortalStrike_21553",
    testCategory,
    21553
  )
end

function me.TestSoundEnemyAvoidIntimidatingShout_5246()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidIntimidatingShout_5246",
    testCategory,
    5246
  )
end

function me.TestSoundEnemyAvoidPummel_6552()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidPummel_6552",
    testCategory,
    6552
  )
end

function me.TestSoundEnemyAvoidPummel_6554()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidPummel_6554",
    testCategory,
    6554
  )
end

function me.TestSoundEnemyAvoidDisarm_676()
  mod.testHelper.TestSoundSpellMissedEnemy(
    "TestSoundEnemyAvoidDisarm_676",
    testCategory,
    676
  )
end
