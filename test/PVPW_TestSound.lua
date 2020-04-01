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
    /run rgpvpw.testSound.Test(language [, categoryName])
  Run sound tests:
    /run rgpvpw.testSound.ShouldHaveSoundTestForAllSpells(language [, categoryName])
  Run sound down tests:
    /run rgpvpw.testSound.ShouldHaveSoundDownTestForAllSpells(language [, categoryName])
]]--

local mod = rgpvpw
local me = {}
mod.testSound = me

me.tag = "TestSound"

local testGroupName = "ShouldHaveSoundTestForAllSpells"

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

  me.ShouldHaveSoundTestForAllSpells(language, categoryName)
  me.ShouldHaveSoundDownTestForAllSpells(language, categoryName)

  mod.testReporter.StopTestGroup()
end

--[[
  Tests whether there is an appropriate sound testcase for every spell found in the spellmap

  @param {string} language
    A supported language such as En, De etc.
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundTestForAllSpells(language, categoryName)
  if language == nil then
    mod.logger.LogError(me.tag, "Missing language - aborting...")
    return
  end

  if categoryName ~= nil then
    me.ShouldHaveSoundTestByCategory(categoryName, language)
  else
    me.ShouldHaveSoundTest(language)
  end
end

--[[
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {string} language
]]--
function me.ShouldHaveSoundTestByCategory(categoryName, language)
  local spellMap = mod.testHelper.GetAllForCategory(categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
  end

  me.SoundTest(categoryName, spellMap, language)
end

--[[
  @param {string} language
]]--
function me.ShouldHaveSoundTest(language)
  local spellMap = mod.spellMap.GetSpellConfiguration()

  for category, categoryData in pairs(spellMap) do
    me.SoundTest(category, categoryData, language)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
  @param {string} language
]]--
function me.SoundTest(categoryName, categoryData, language)
  for name, _ in pairs (categoryData) do
    local spellName = mod.testHelper.NormalizeSpellName(name)
    local testName = "SoundTestPresent" .. mod.testHelper.FirstToUpper(categoryName) .. spellName

    mod.testReporter.StartTestRun(testName)

    local func = mod["testSound" .. mod.testHelper.FirstToUpper(categoryName) .. language]
      ["TestSound" .. spellName]

    if type(func) ~= "function" then
      mod.testReporter.ReportFailureTestRun(
        categoryName,
        testName,
        string.format(mod.testHelper.missingSoundTest, categoryName, spellName)
      )
    else
      mod.testReporter.ReportSuccessTestRun()
    end
  end
end

--[[
  Tests whether there is an appropriate sound down testcase for every spell found in the spellmap

  @param {string} language
    A supported language such as En, De etc.
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundDownTestForAllSpells(language, categoryName)
  if language == nil then
    mod.logger.LogError(me.tag, "Missing language - aborting...")
    return
  end

  if categoryName ~= nil then
    me.ShouldHaveSoundDownTestByCategory(categoryName, language)
  else
    me.ShouldHaveSoundDownTest(language)
  end
end

--[[
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {string} language
]]--
function me.ShouldHaveSoundDownTestByCategory(categoryName, language)
  local spellMap = mod.testHelper.GetAllForCategory(categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
  end

  me.SoundDownTest(categoryName, spellMap, language)
end

--[[
  @param {string} language
]]--
function me.ShouldHaveSoundDownTest(language)
  local spellMap = mod.spellMap.GetSpellConfiguration()

  for category, categoryData in pairs(spellMap) do
    me.SoundDownTest(category, categoryData, language)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
  @param {string} language
]]--
function me.SoundDownTest(categoryName, categoryData, language)
  for name, spellData in pairs (categoryData) do
    -- for spells without hasFade there is not test expected
    if spellData.hasFade then
      local spellName = mod.testHelper.NormalizeSpellName(name)
      local testName = "SoundTestPresent" .. mod.testHelper.FirstToUpper(categoryName) .. spellName

      mod.testReporter.StartTestRun(testName)

      local func = mod["testSound" .. mod.testHelper.FirstToUpper(categoryName) .. language]
        ["TestSoundDown" .. spellName]

      if type(func) ~= "function" then
        mod.testReporter.ReportFailureTestRun(
          categoryName,
          testName,
          string.format(mod.testHelper.missingSoundDownTest, categoryName, spellName)
        )
      else
        mod.testReporter.ReportSuccessTestRun()
      end
    end
  end
end
