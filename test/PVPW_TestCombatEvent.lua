--[[
  MIT License

  Copyright (c) 2020 Michael Wiesendanger

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
    /run rgpvpw.testCombatEvent.Test(language [, categoryName])
  Run combat event tests:
    /run rgpvpw.testCombatEvent.ShouldHaveCombatEventTestForAllTrackedEvents(language [, categoryName])
]]--

local mod = rgpvpw
local me = {}
mod.testCombatEvent = me

me.tag = "TestCombatEvent"

local testGroupName = "ShouldHaveCombatEventTestForAllTrackedEvents"

--[[
  @param {string} language
    A supported language such as En, De etc.
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.Test(language, categoryName)
  mod.testReporter.StartTestGroup(testGroupName)

  if language == nil then
    mod.logger.LogError(me.tag, "Missing language - aborting...")
    mod.testReporter.StopTestGroup()

    return
  end

  me.ShouldHaveCombatEventTestForAllTrackedEvents(language, categoryName)

  mod.testReporter.StopTestGroup()
end

--[[
  Tests whether there is an appropriate testcase for every spell found in the spellmap

  @param {string} language
    A supported language such as En, De etc.
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveCombatEventTestForAllTrackedEvents(language, categoryName)
  if language == nil then
    mod.logger.LogError(me.tag, "Missing language - aborting...")
    return
  end

  if categoryName ~= nil then
    me.ShouldHaveCombatEventTestByCategory(categoryName, language)
  else
    me.ShouldHaveCombatEventTest(language)
  end
end

--[[
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {string} language
    A supported language such as En, De etc.
]]--
function me.ShouldHaveCombatEventTestByCategory(categoryName, language)
  local spellMap = mod.testHelper.GetAllForCategory(categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
    return
  end

  me.CombatEventTest(categoryName, spellMap, language)
end

--[[
  @param {string} language
    A supported language such as En, De etc.
]]--
function me.ShouldHaveCombatEventTest(language)
  local spellMap = mod.spellMap.GetSpellConfiguration()

  for category, categoryData in pairs(spellMap) do
    me.CombatEventTest(category, categoryData, language)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
  @param {string} language
]]--
function me.CombatEventTest(categoryName, categoryData, language)
  for name, spellData in pairs (categoryData) do
    local spellName = mod.testHelper.NormalizeSpellName(name)
    local trackedEvents = spellData.trackedEvents
    local module = mod["testCombatEvents" .. mod.testHelper.FirstToUpper(categoryName) .. language]

    for _, trackedEvent in pairs(trackedEvents) do
      local testName = "CombatEventTestPresent" .. mod.testHelper.FirstToUpper(categoryName) ..
        spellName .. "_" .. trackedEvent

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

      local func = module["TestCombatEvent" .. spellName .. eventName]

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
