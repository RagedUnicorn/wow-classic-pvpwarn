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

--[[
  Run all tests:
    /run rgpvpw.testAll.TestAll()

  Iterates the three branches in order (Classic, SoD, TBC). For each branch the active branch is
  set before validators and CollectTestCases run so the assembled spell map and the discovery
  lookups all target that branch's content.
]]--

local mod = rgpvpw
local me = {}
mod.testAll = me

me.tag = "TestAll"

local testGroupName = "TestAll"

-- Branch names as they appear when appended to a module name (e.g. testSoundHunterClassic).
local branches = { "Classic", "Sod", "Tbc" }

local soundCategories = {
  "Warrior", "Priest", "Rogue", "Mage", "Hunter", "Warlock", "Paladin", "Druid", "Shaman",
  "Racials", "Items", "Misc"
}
local soundAvoidCategories = {
  "Warrior", "Priest", "Rogue", "Mage", "Hunter", "Warlock", "Paladin", "Druid", "Shaman"
}

local function queueIfPresent(modulePrefix, classCap, branchCap)
  local moduleTable = mod[modulePrefix .. classCap .. branchCap]

  if moduleTable and type(moduleTable.CollectTestCases) == "function" then
    moduleTable.CollectTestCases()
  end
end

function me.TestAll()
  mod.testReporter.StartTestGroup(testGroupName)

  for _, branchCap in ipairs(branches) do
    mod.testHelper.SetActiveBranch(string.lower(branchCap))

    -- Validators (coverage checks) for this branch's assembled map.
    mod.testSound.ShouldHaveSoundTestForAllSpells()
    mod.testSound.ShouldHaveSoundDownTestForAllSpells()
    mod.testSound.ShouldHaveSoundRefreshTestForAllSpells()
    mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
    mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)
    mod.testCombatEvent.ShouldHaveCombatEventTestForAllTrackedEvents()
    mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
      RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID
    )
    mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
      RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID
    )
    mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
      RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
    )
    mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
      RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
    )

    -- Enqueue this branch's spell tests. Missing modules (e.g. no SoD avoid coverage) are
    -- silently skipped via queueIfPresent.
    for _, classCap in ipairs(soundCategories) do
      queueIfPresent("testSound", classCap, branchCap)
    end

    for _, classCap in ipairs(soundAvoidCategories) do
      queueIfPresent("testSoundSelfAvoid", classCap, branchCap)
      queueIfPresent("testSoundEnemyAvoid", classCap, branchCap)
    end

    for _, classCap in ipairs(soundCategories) do
      queueIfPresent("testCombatEvents", classCap, branchCap)
    end

    for _, classCap in ipairs(soundAvoidCategories) do
      queueIfPresent("testCombatEventsSelfAvoid", classCap, branchCap)
      queueIfPresent("testCombatEventsEnemyAvoid", classCap, branchCap)
    end
  end

  mod.testReporter.PlayTestQueueWithDelay(function()
    mod.testReporter.StopTestGroup() -- async finish of test group
  end)
end
