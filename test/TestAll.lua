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
    /run rgpvpw.testAll.TestAll()           -- all branches
    /run rgpvpw.testAll.TestAll("tbc")      -- single branch (classic, sod, or tbc)

  Iterates the three branches in order (Classic, SoD, TBC), or only the requested one when an
  optional branch arg is provided. For each branch the active branch is set before validators and
  CollectTestCases run so the assembled spell map and the discovery lookups all target that
  branch's content.

  Runs through the standard test session (TestSessionManager.StartSession), so results are
  recorded under a generated session name and show up in the test log window's session dropdown
  like any slash-command run.
]]--

local mod = rgpvpw
local me = {}
mod.testAll = me

me.tag = "TestAll"

-- forward declaration
local queueIfPresent

-- Branch names as they appear when appended to a module name (e.g. testSoundHunterClassic).
local branches = { "Classic", "Sod", "Tbc" }

local soundCategories = {
  "Warrior", "Priest", "Rogue", "Mage", "Hunter", "Warlock", "Paladin", "Druid", "Shaman",
  "Racials", "Items", "Misc"
}
local soundAvoidCategories = {
  "Warrior", "Priest", "Rogue", "Mage", "Hunter", "Warlock", "Paladin", "Druid", "Shaman"
}

function me.TestAll(branchArg)
  local branchFilter, branchErr = mod.testHelper.ResolveBranchFilter(branchArg)
  if branchErr then
    mod.logger.LogError(me.tag, branchErr)
    return
  end

  local category = branchFilter and string.lower(branchFilter[1]) or "all"

  mod.testSessionManager.StartSession("All", category, function(completionCallback)
    me.RunAllTests(branchFilter, completionCallback)
  end)
end

--[[
  Run validators and all spell tests for the selected branches within the active session.

  @param {table|nil} branchFilter
    Optional 1-element PascalCase branch list from `testHelper.ResolveBranchFilter`;
    when nil, all three branches run in order.
  @param {function} completionCallback
    Invoked once every selected branch's queue has been played to completion.
]]--
function me.RunAllTests(branchFilter, completionCallback)
  local branchList = branchFilter or branches
  local index = 1

  --[[
    Process one branch at a time, playing that branch's queue to completion before advancing.
    The active branch determines which assembled spell map lookups target, so each branch's tests
    must execute (not just enqueue) while that branch is active.
  ]]--
  local function processNextBranch()
    if index > #branchList then
      completionCallback() -- async finish of the session's test group
      return
    end

    local branchCap = branchList[index]
    index = index + 1

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

    -- Play this branch's queue to completion (under this active branch), then advance.
    mod.testReporter.PlayTestQueueWithDelay(processNextBranch)
  end

  processNextBranch()
end

--[[
  Enqueue a test module's test cases if the module exists for the given branch

  @param {string} modulePrefix - Module name prefix, e.g. "testSound"
  @param {string} classCap - Capitalized category name, e.g. "Warrior"
  @param {string} branchCap - Capitalized branch name, e.g. "Classic"
]]--
queueIfPresent = function(modulePrefix, classCap, branchCap)
  local moduleTable = mod[modulePrefix .. classCap .. branchCap]

  if moduleTable and type(moduleTable.CollectTestCases) == "function" then
    moduleTable.CollectTestCases()
  end
end
