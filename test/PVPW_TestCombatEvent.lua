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
  mod.testReporter.StartTestGroup(testGroupName)

  me.ShouldHaveCombatEventTestForAllTrackedEvents(categoryName)
  --[[
  me.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
    language, RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID, categoryName)
  me.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
    language, RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID, categoryName)
  ]]--
  mod.testReporter.StopTestGroup()
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
    if spell.refId then
      spell = categoryData[spell.refId]
    end

    local spellName = mod.testHelper.NormalizeSpellName(spell.name)
    local trackedEvents = spell.trackedEvents
    local module = mod["testCombatEvents" .. mod.testHelper.FirstToUpper(categoryName)]

    for _, trackedEvent in pairs(trackedEvents) do
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

  @param {string} language
    A supported language such as en, de etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(language, spellAvoidType, categoryName)
  if language == nil then
    mod.logger.LogError(me.tag, "Missing language - aborting...")
    return
  end

  if categoryName ~= nil then
    me.ShouldHaveCombatEventAvoidTestByCategory(categoryName, language, spellAvoidType)
  else
    me.ShouldHaveCombatEventAvoidTest(language, spellAvoidType)
  end
end

--[[
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {string} language
    A supported language such as en, de etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveCombatEventAvoidTestByCategory(categoryName, language, spellAvoidType)
  local spellAvoidMap = mod.testHelper.GetAllForCategory(RGPVPW_CONSTANTS.SPELL_AVOID_MAP, categoryName)

  if spellAvoidMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellAvoidMap for categoryName: " .. categoryName)
    return
  end

  me.CombatEventAvoidTest(categoryName, spellAvoidMap, language, spellAvoidType)
end

--[[
  @param {string} language
    A supported language such as en, de etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveCombatEventAvoidTest(language, spellAvoidType)
  local spellAvoidMap = mod.spellAvoidMap.GetSpellConfiguration()

  for category, categoryData in pairs(spellAvoidMap) do
    me.CombatEventAvoidTest(category, categoryData, language, spellAvoidType)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
  @param {string} language
    A supported language such as en, de etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.CombatEventAvoidTest(categoryName, categoryData, language, spellAvoidType)
  for name, spellData in pairs (categoryData) do
    local spellName = mod.testHelper.NormalizeSpellName(name)
    local moduleNameBase
    local testNameBase
    local testFunctionBase

    if spellAvoidType == RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID then
      moduleNameBase = "testCombatEventsSelfAvoid"
      testNameBase = "CombatSelfAvoidEventTestPresent"
      testFunctionBase = "TestCombatEventSelfAvoid"
    elseif spellAvoidType == RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID then
      moduleNameBase = "testCombatEventsEnemyAvoid"
      testNameBase = "CombatEnemyAvoidEventTestPresent"
      testFunctionBase = "TestCombatEventEnemyAvoid"
    else
      mod.logger.LogError(me.tag, "Invalid spellAvoidType: " .. spellAvoidType)
    end

    local module = mod[moduleNameBase .. mod.testHelper.FirstToUpper(categoryName)
      .. mod.testHelper.FirstToUpper(language)]
    local avoidCases = {"dodge", "parry", "immune", "miss", "block", "resist"}
    local avoidTestName = {"Dodged", "Parried", "Immune", "Missed", "Blocked", "Resisted"}

    for index, avoidCase in ipairs(avoidCases) do
      if spellData[avoidCase] then
        local testName = testNameBase .. mod.testHelper.FirstToUpper(categoryName) ..
          spellName .. "_" .. avoidTestName[index]

        mod.testReporter.StartTestRun(testName)

        local func = module[testFunctionBase .. spellName .. avoidTestName[index]]

        if type(func) ~= "function" then
          mod.testReporter.ReportFailureTestRun(
            categoryName,
            testName,
            string.format(mod.testHelper.missingCombatEventAvoidTest, spellName, avoidTestName[index])
          )
        else
          mod.testReporter.ReportSuccessTestRun()
        end
      end
    end
  end
end
