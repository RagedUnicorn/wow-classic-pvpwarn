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
    /run rgpvpw.testSound.Test([, categoryName])
  Run sound tests:
    /run rgpvpw.testSound.ShouldHaveSoundTestForAllSpells([, categoryName])
  Run sound down tests:
    /run rgpvpw.testSound.ShouldHaveSoundDownTestForAllSpells([, categoryName])
  Run sound self avoid test:
    /run rgpvpw.testSound.ShouldHaveSoundAvoidTestForAllSpells(
      RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID [, categoryName]
    )
  Run sound enemy avoid test:
    /run rgpvpw.testSound.ShouldHaveSoundAvoidTestForAllSpells(
      RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID [, categoryName]
    )
]]--

-- luacheck: globals tContains

local mod = rgpvpw
local me = {}
mod.testSound = me

me.tag = "TestSound"

local testGroupName = "ShouldHaveSoundTestForAllSpells"

--[[
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.Test(categoryName)
  mod.testReporter.StartTestGroup(testGroupName)

  me.ShouldHaveSoundTestForAllSpells(categoryName)
  me.ShouldHaveSoundDownTestForAllSpells(categoryName)
  me.ShouldHaveSoundRefreshTestForAllSpells(categoryName)
  me.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID, categoryName)
  me.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID, categoryName)

  mod.testReporter.StopTestGroup()
end

--[[
  Tests whether there is an appropriate sound testcase for every spell found in the spell map

  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundTestForAllSpells(categoryName)
  if categoryName ~= nil then
    me.ShouldHaveSoundTestByCategory(categoryName)
  else
    me.ShouldHaveSoundTest()
  end
end

--[[
  Go through all spells for a specific category and check if there is a sound test present

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundTestByCategory(categoryName)
  local spellMap = mod.spellMapHelper.GetSpellConfigurationByCategory(categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
    return
  end

  me.SoundTest(categoryName, spellMap)
end

--[[
  Go through all spells and check if there is a sound test present
]]--
function me.ShouldHaveSoundTest()
  local spellMap = mod.spellMapHelper.GetSpellConfiguration()

  for categoryName, categoryData in pairs(spellMap) do
    me.SoundTest(categoryName, categoryData)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
]]--
function me.SoundTest(categoryName, categoryData)
  for spellId, spell in pairs (categoryData) do
    if spell.refId then
      spell = categoryData[spell.refId]
    end

    local spellName = mod.testHelper.NormalizeSpellName(spell.name)
    local testName = "SoundTestPresent" .. mod.testHelper.FirstToUpper(categoryName) .. spellName
      .. "_" .. spellId

    mod.testReporter.StartTestRun(testName)

    local func = mod["testSound" .. mod.testHelper.FirstToUpper(categoryName)]
      ["TestSound" .. spellName .. "_" .. spellId]

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

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundDownTestForAllSpells(categoryName)
  if categoryName ~= nil then
    me.ShouldHaveSoundDownTestByCategory(categoryName)
  else
    me.ShouldHaveSoundDownTest()
  end
end

--[[
  Get through all spells for a specific category and check if there is a sound down test present

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundDownTestByCategory(categoryName)
  local spellMap = mod.spellMapHelper.GetSpellConfigurationByCategory(categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
    return
  end

  me.SoundDownTest(categoryName, spellMap)
end

--[[
  Go through all spells and check if there is a sound down test present
]]--
function me.ShouldHaveSoundDownTest()
  local spellMap = mod.spellMapHelper.GetSpellConfiguration()

  for category, categoryData in pairs(spellMap) do
    me.SoundDownTest(category, categoryData)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
]]--
function me.SoundDownTest(categoryName, categoryData)
  for spellId, spell in pairs (categoryData) do
    -- for spells without hasFade there is not test expected
    if spell.hasFade then
      if spell.refId then
        spell = categoryData[spell.refId]
      end

      local spellName = mod.testHelper.NormalizeSpellName(spell.name)
      local testName = "SoundDownTestPresent" .. mod.testHelper.FirstToUpper(categoryName) .. spellName
        .. "_" .. spellId

      mod.testReporter.StartTestRun(testName)

      local func = mod["testSound" .. mod.testHelper.FirstToUpper(categoryName)]
      ["TestSoundDown" .. spellName .. "_" .. spellId]

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
  Tests whether there is an appropriate sound refresh testcase for every spell found in the spell map

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundRefreshTestForAllSpells(categoryName)
  if categoryName ~= nil then
    me.ShouldHaveSoundRefreshTestByCategory(categoryName)
  else
    me.ShouldHaveSoundRefreshTest()
  end
end

--[[
  Get through all spells for a specific category and check if there is a sound refresh test present

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundRefreshTestByCategory(categoryName)
  local spellMap = mod.spellMapHelper.GetSpellConfigurationByCategory(categoryName)

  if spellMap == nil then
    mod.logger.LogError(me.tag, "Unable to get spellMap for categoryName: " .. categoryName)
    return
  end

  me.SoundRefreshTest(categoryName, spellMap)
end

--[[
  Go through all spells and check if there is a sound refresh test present
]]--
function me.ShouldHaveSoundRefreshTest()
  local spellMap = mod.spellMapHelper.GetSpellConfiguration()

  for category, categoryData in pairs(spellMap) do
    me.SoundRefreshTest(category, categoryData)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
]]--
function me.SoundRefreshTest(categoryName, categoryData)
  for spellId, spell in pairs(categoryData) do
    -- Use reference spell if present
    if spell.refId then
      spell = categoryData[spell.refId]
    end

    -- Only expect a test if SPELL_AURA_REFRESH is in trackedEvents
    local shouldHaveTest = spell.trackedEvents ~= nil and
        tContains(spell.trackedEvents, RGPVPW_CONSTANTS.EVENT_SPELL_AURA_REFRESH)
    if shouldHaveTest then
      local spellName = mod.testHelper.NormalizeSpellName(spell.name)
      local testName = "SoundRefreshTestPresent" .. mod.testHelper.FirstToUpper(categoryName) .. spellName
        .. "_" .. spellId

      mod.testReporter.StartTestRun(testName)

      local func = mod["testSound" .. mod.testHelper.FirstToUpper(categoryName)]
      ["TestSoundRefresh" .. spellName .. "_" .. spellId]

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

  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
  @param {string} categoryName
    Optional valid categoryName such as "priest", "warrior" etc.
]]--
function me.ShouldHaveSoundAvoidTestForAllSpells(spellAvoidType, categoryName)
  if categoryName ~= nil then
    me.ShouldHaveSoundAvoidTestByCategory(categoryName, spellAvoidType)
  else
    me.ShouldHaveSoundAvoidTest(spellAvoidType)
  end
end

--[[
  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveSoundAvoidTestByCategory(categoryName, spellAvoidType)
  local categoryData = mod.spellAvoidMapHelper.GetSpellConfigurationByCategory(categoryName)

  if categoryData == nil then
    mod.logger.LogError(me.tag, "Unable to get categoryData for categoryName: " .. categoryName)
    return
  end

  me.SoundAvoidTest(categoryName, categoryData, spellAvoidType)
end

--[[
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.ShouldHaveSoundAvoidTest(spellAvoidType)
  local spellAvoidMap = mod.spellAvoidMapHelper.GetSpellConfiguration()

  for categoryName, categoryData in pairs(spellAvoidMap) do
    me.SoundAvoidTest(categoryName, categoryData, spellAvoidType)
  end
end

--[[
  Do the actual test whether the expected function is present or not

  @param {string} categoryName
    A valid categoryName such as "priest", "warrior" etc.
  @param {table} categoryData
  @param {number} spellAvoidType
    RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID or RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
]]--
function me.SoundAvoidTest(categoryName, categoryData, spellAvoidType)
  for spellId, spell in pairs (categoryData) do
    if spell.refId then
      spell = categoryData[spell.refId]
    end

    local spellName = mod.testHelper.NormalizeSpellName(spell.name)
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
      .. "_" .. spellId

    mod.testReporter.StartTestRun(testName)

    local func = mod[moduleNameBase .. mod.testHelper.FirstToUpper(categoryName)]
      [testFunctionBase .. spellName .. "_" .. spellId]

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
