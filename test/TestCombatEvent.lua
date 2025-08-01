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
    /run rgpvpw.testCombatEvent.Test([, categoryName])
  Run combat event tests:
    /run rgpvpw.testCombatEvent.ShouldHaveCombatEventTestForAllTrackedEvents([, categoryName])
  Run combat event self avoid tests:
    /run rgpvpw.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
      RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID [, categoryName]
    )
  Run combat event enemy avoid tests:
    /run rgpvpw.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
      RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID [, categoryName]
    )
]]--

local mod = rgpvpw
local me = {}
mod.testCombatEvent = me

me.tag = "TestCombatEvent"

local testGroupName = "ShouldHaveCombatEventTestForAllTrackedEvents"

--[[
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.Test(categoryName)
  local isUsingSessionManager = false

  -- Check if session manager is handling test group management
  if mod.testSessionManager and mod.testSessionManager.IsSessionActive() then
    -- Session manager is active, just collect tests without managing test group
    isUsingSessionManager = true
  else
    -- No session manager, handle test group ourselves
    mod.testReporter.StartTestGroup(testGroupName)
  end

  me.ShouldHaveCombatEventTestForAllTrackedEvents(categoryName)

  me.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID, categoryName
  )
  me.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID, categoryName
  )
  me.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID, categoryName
  )
  me.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID, categoryName
  )

  if not isUsingSessionManager then
    mod.testReporter.StopTestGroup()
  end
end

--[[
  Tests whether there is an appropriate testcase for every spell found in the spellMap

  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveCombatEventTestForAllTrackedEvents(categoryName)
  if categoryName ~= nil then
    me.ShouldHaveCombatEventTestByCategory(categoryName)
  else
    me.ShouldHaveCombatEventTest()
  end
end

--[[
  Go through all spells for a specific category and check if there is a combat log test present

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveCombatEventTestByCategory(categoryName)
  local spellMap = mod.spellMapHelper.GetSpellConfigurationByCategory(categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
    return
  end

  me.CombatEventTest(categoryName, spellMap)
end

--[[
  Go through all spells and check if there is a combat log test present
]]--
function me.ShouldHaveCombatEventTest()
  local spellMap = mod.spellMapHelper.GetSpellConfiguration()

  for category, categoryData in pairs(spellMap) do
    me.CombatEventTest(category, categoryData)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
]]--
function me.CombatEventTest(categoryName, categoryData)
  for spellId, spell in pairs (categoryData) do
    spell = me.ResolveSpell(spell, categoryData)

    local spellName = mod.testHelper.NormalizeSpellName(spell.name)
    local trackedEvents = spell.trackedEvents
    local module = mod["testCombatEvents" .. mod.testHelper.FirstToUpper(categoryName)]

    for _, trackedEvent in ipairs(trackedEvents) do
      local testName = "CombatEventTestPresent" .. mod.testHelper.FirstToUpper(categoryName) ..
        spellName .. "_" .. trackedEvent .. "_" .. spellId

      mod.testReporter.StartTestRun(testName)

      local eventName = mod.testHelper.MappEventToName(trackedEvent)

      if eventName == nil then
        mod.testReporter.ReportFailureTestRun(
          categoryName,
          testName,
          string.format(mod.testHelper.invalidEvent, spellName, trackedEvent)
        )

        return
      end

      local func = module["TestCombatEvent" .. spellName .. eventName .. "_" .. spellId]

      if type(func) ~= "function" then
        mod.testReporter.ReportFailureTestRun(
          categoryName,
          testName,
          string.format(mod.testHelper.missingCombatEventTest, spellName, trackedEvent)
        )
      else
        mod.testReporter.ReportSuccessTestRun()
      end
    end
  end
end

--[[
  Tests whether there is an appropriate testcase for every spell found in the spellAvoidMap

  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(spellAvoidType, categoryName)
  if categoryName ~= nil then
    me.ShouldHaveCombatEventAvoidTestByCategory(categoryName, spellAvoidType)
  else
    me.ShouldHaveCombatEventAvoidTest(spellAvoidType)
  end
end

--[[
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveCombatEventAvoidTestByCategory(categoryName, spellAvoidType)
  local spellAvoidMap = mod.spellAvoidMapHelper.GetSpellConfigurationByCategory(categoryName)

  if spellAvoidMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellAvoidMap for categoryName: " .. categoryName)
    return
  end

  me.CombatEventAvoidTest(categoryName, spellAvoidMap, spellAvoidType)
end

--[[
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveCombatEventAvoidTest(spellAvoidType)
  local spellAvoidMap = mod.spellAvoidMapHelper.GetSpellConfiguration()

  for categoryName, categoryData in pairs(spellAvoidMap) do
    me.CombatEventAvoidTest(categoryName, categoryData, spellAvoidType)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
    A supported language such as en, de etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.CombatEventAvoidTest(categoryName, categoryData, spellAvoidType)
  for spellId, spell in pairs (categoryData) do
    spell = me.ResolveSpell(spell, categoryData)

    local spellName = mod.testHelper.NormalizeSpellName(spell.name)
    local moduleNameBase, testNameBase, testFunctionBase = me.GetAvoidTestIdentifiers(spellAvoidType, false)
    local module = mod[moduleNameBase .. mod.testHelper.FirstToUpper(categoryName)]
    local avoidTestNames = {"Dodge", "Parry", "Immune", "Miss", "Block", "Resist", "Reflect"}

    for _, avoidTestName in ipairs(avoidTestNames) do
      local testName = testNameBase .. mod.testHelper.FirstToUpper(categoryName) ..
        spellName .. "_" .. avoidTestName .. "_" .. spellId

      mod.testReporter.StartTestRun(testName)

      local func = module[testFunctionBase .. spellName .. avoidTestName .. "_" .. spellId]

      if type(func) ~= "function" then
        mod.testReporter.ReportFailureTestRun(
          categoryName,
          testName,
          string.format(mod.testHelper.missingCombatEventAvoidTest, spellName, avoidTestName)
        )
      else
        mod.testReporter.ReportSuccessTestRun()
      end
    end
  end
end

--[[
  Tests whether there is an appropriate irrelevant testcase for every spell found in the spellAvoidMap

  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(spellAvoidType, categoryName)
  if categoryName ~= nil then
    me.ShouldHaveCombatEventAvoidIrrelevantTestByCategory(categoryName, spellAvoidType)
  else
    me.ShouldHaveCombatEventAvoidIrrelevantTest(spellAvoidType)
  end
end

--[[
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveCombatEventAvoidIrrelevantTestByCategory(categoryName, spellAvoidType)
  local spellAvoidMap = mod.spellAvoidMapHelper.GetSpellConfigurationByCategory(categoryName)

  if spellAvoidMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellAvoidMap for categoryName: " .. categoryName)
    return
  end

  me.CombatEventAvoidIrrelevantTest(categoryName, spellAvoidMap, spellAvoidType)
end

--[[
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveCombatEventAvoidIrrelevantTest(spellAvoidType)
  local spellAvoidMap = mod.spellAvoidMapHelper.GetSpellConfiguration()

  for categoryName, categoryData in pairs(spellAvoidMap) do
    me.CombatEventAvoidIrrelevantTest(categoryName, categoryData, spellAvoidType)
  end
end

--[[
  Do the actual test whether the expected absorb ignored test function is present

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.CombatEventAvoidIrrelevantTest(categoryName, categoryData, spellAvoidType)
  for spellId, spell in pairs (categoryData) do
    spell = me.ResolveSpell(spell, categoryData)

    local spellName = mod.testHelper.NormalizeSpellName(spell.name)
    local moduleNameBase, testNameBase, testFunctionBase = me.GetAvoidTestIdentifiers(spellAvoidType, true)

    local module = mod[moduleNameBase .. mod.testHelper.FirstToUpper(categoryName)]
    local irrelevantMissTypeNames = {"Absorb"}

    for _, irrelevantMissTypeName in ipairs(irrelevantMissTypeNames) do
      local testName = testNameBase .. mod.testHelper.FirstToUpper(
        categoryName) .. spellName .. "_" .. irrelevantMissTypeName .. "_" .. spellId

      mod.testReporter.StartTestRun(testName)

      local func = module[testFunctionBase .. spellName .. irrelevantMissTypeName .. "Ignored" .. "_" .. spellId]

      if type(func) ~= "function" then
        mod.testReporter.ReportFailureTestRun(
          categoryName,
          testName,
          string.format(mod.testHelper.missingCombatEventAvoidTest, spellName, "IrrelevantMissType")
        )
      else
        mod.testReporter.ReportSuccessTestRun()
      end
    end
  end
end

--[[
  Resolve a spell by refId if present

  @param {table} spell
  @param {table} categoryData

  @return {table}
    The resolved spell
]]--
function me.ResolveSpell(spell, categoryData)
  return spell.refId and categoryData[spell.refId] or spell
end

--[[
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
  @param {boolean} isIrrelevant
    Whether to return identifiers for irrelevant tests
  @return {string, string, string}
    The module name, test name and test function name
]]--
function me.GetAvoidTestIdentifiers(spellAvoidType, isIrrelevant)
  local moduleNameBase
  local testNameBase
  local testFunctionBase

  if spellAvoidType == RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID then
    moduleNameBase = "testCombatEventsSelfAvoid"
    testNameBase = isIrrelevant and "CombatSelfAvoidEventIrrelevantTestPresent" or "CombatSelfAvoidEventTestPresent"
    testFunctionBase = "TestCombatEventSelfAvoid"
  elseif spellAvoidType == RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID then
    moduleNameBase = "testCombatEventsEnemyAvoid"
    testNameBase = isIrrelevant and "CombatEnemyAvoidEventIrrelevantTestPresent" or "CombatEnemyAvoidEventTestPresent"
    testFunctionBase = "TestCombatEventEnemyAvoid"
  else
    mod.logger.LogError(me.tag, "Invalid spellAvoidType: " .. tostring(spellAvoidType))
    return nil, nil, nil
  end

  return moduleNameBase, testNameBase, testFunctionBase
end
