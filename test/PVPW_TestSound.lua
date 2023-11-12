--[[
  MIT License

  Copyright (c) 2023 Michael Wiesendanger

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
  Run sound self avoid test:
    /run rgpvpw.testSound.ShouldHaveSoundAvoidTestForAllSpells(
      language, RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID [, categoryName]
    )
  Run sound enemy avoid test:
    /run rgpvpw.testSound.ShouldHaveSoundAvoidTestForAllSpells(
      language, RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID [, categoryName]
    )
]]--

local mod = rgpvpw
local me = {}
mod.testSound = me

me.tag = "TestSound"

local testGroupName = "ShouldHaveSoundTestForAllSpells"

--[[
  @param {string} language
    A supported language such as en, de etc.
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
  me.ShouldHaveSoundAvoidTestForAllSpells(language, RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID, categoryName)
  me.ShouldHaveSoundAvoidTestForAllSpells(language, RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID, categoryName)

  mod.testReporter.StopTestGroup()
end

--[[
  Tests whether there is an appropriate sound testcase for every spell found in the spell map

  @param {string} language
    A supported language such as en, de etc.
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
    A supported language such as en, de etc.
]]--
function me.ShouldHaveSoundTestByCategory(categoryName, language)
  local spellMap = mod.testHelper.GetAllForCategory(RGPVPW_CONSTANTS.SPELL_MAP, categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
    return
  end

  me.SoundTest(categoryName, spellMap, language)
end

--[[
  @param {string} language
    A supported language such as en, de etc.
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

    local func = mod["testSound" .. mod.testHelper.FirstToUpper(categoryName)
      .. mod.testHelper.FirstToUpper(language)]["TestSound" .. spellName]

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
  Tests whether there is an appropriate sound down testcase for every spell found in the spell map

  @param {string} language
    A supported language such as en, de etc.
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
  local spellMap = mod.testHelper.GetAllForCategory(RGPVPW_CONSTANTS.SPELL_MAP, categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
    return
  end

  me.SoundDownTest(categoryName, spellMap, language)
end

--[[
  @param {string} language
    A supported language such as en, de etc.
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
    A supported language such as en, de etc.
]]--
function me.SoundDownTest(categoryName, categoryData, language)
  for name, spellData in pairs (categoryData) do
    -- for spells without hasFade there is not test expected
    if spellData.hasFade then
      local spellName = mod.testHelper.NormalizeSpellName(name)
      local testName = "SoundTestPresent" .. mod.testHelper.FirstToUpper(categoryName) .. spellName

      mod.testReporter.StartTestRun(testName)

      local func = mod["testSound" .. mod.testHelper.FirstToUpper(categoryName)
        .. mod.testHelper.FirstToUpper(language)]["TestSoundDown" .. spellName]

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

--[[
  Tests whether there is an appropriate sound testcase for every spell found in the spellAvoidMap

  @param {string} language
    A supported language such as en, de etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundAvoidTestForAllSpells(language, spellAvoidType, categoryName)
  if language == nil then
    mod.logger.LogError(me.tag, "Missing language - aborting...")
    return
  end

  if categoryName ~= nil then
    me.ShouldHaveSoundAvoidTestByCategory(categoryName, language, spellAvoidType)
  else
    me.ShouldHaveSoundAvoidTest(language, spellAvoidType)
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
function me.ShouldHaveSoundAvoidTestByCategory(categoryName, language, spellAvoidType)
  local spellAvoidMap = mod.testHelper.GetAllForCategory(RGPVPW_CONSTANTS.SPELL_AVOID_MAP, categoryName)

  if spellAvoidMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellAvoidMap for categoryName: " .. categoryName)
    return
  end

  me.SoundAvoidTest(categoryName, spellAvoidMap, language, spellAvoidType)
end

--[[
  @param {string} language
    A supported language such as en, de etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveSoundAvoidTest(language, spellAvoidType)
  local spellAvoidMap = mod.spellAvoidMap.GetSpellConfiguration()

  for category, categoryData in pairs(spellAvoidMap) do
    me.SoundAvoidTest(category, categoryData, language, spellAvoidType)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
  @param {string} language
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.SoundAvoidTest(categoryName, categoryData, language, spellAvoidType)
  for name, _ in pairs (categoryData) do
    local spellName = mod.testHelper.NormalizeSpellName(name)
    local moduleNameBase
    local testNameBase
    local testFunctionBase

    if spellAvoidType == RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID then
      testNameBase = "SoundTestSelfAvoidPresent"
      moduleNameBase = "testSoundSelfAvoid"
      testFunctionBase = "TestSoundSelfAvoid"
    elseif spellAvoidType == RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID then
      testNameBase = "SoundTestEnemyAvoidPresent"
      moduleNameBase = "testSoundEnemyAvoid"
      testFunctionBase = "TestSoundEnemyAvoid"
    else
      mod.logger.LogError(me.tag, "Invalid spellAvoidType: " .. spellAvoidType)
    end

    local testName = testNameBase .. mod.testHelper.FirstToUpper(categoryName) .. spellName

    mod.testReporter.StartTestRun(testName)

    local func = mod[moduleNameBase .. mod.testHelper.FirstToUpper(categoryName)
      .. mod.testHelper.FirstToUpper(language)][testFunctionBase .. spellName]

    if type(func) ~= "function" then
      mod.testReporter.ReportFailureTestRun(
        categoryName,
        testName,
        string.format(mod.testHelper.missingSoundAvoidTest, categoryName, spellName)
      )
    else
      mod.testReporter.ReportSuccessTestRun()
    end
  end
end
