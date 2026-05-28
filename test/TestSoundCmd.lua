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

-- Test sound command handler for PVPWarn addon
-- Handles all sound test commands (testsound, testselfsound, testenemysound)
-- This module is only loaded in development builds

local mod = rgpvpw
local me = {}
mod.testSoundCmd = me

me.tag = "TestSoundCmd"

-- Forward declarations for local functions
local GetAvailableCategories
local GetAvailableSelfAvoidCategories
local GetAvailableEnemyAvoidCategories
local RunTestForCategory

--[[
  Get available test sound categories mapping

  @return {table} - Map of category names to module names
]]--
GetAvailableCategories = function()
  return {
    druid = "testSoundDruid",
    hunter = "testSoundHunter",
    mage = "testSoundMage",
    paladin = "testSoundPaladin",
    priest = "testSoundPriest",
    rogue = "testSoundRogue",
    shaman = "testSoundShaman",
    warlock = "testSoundWarlock",
    warrior = "testSoundWarrior",
    items = "testSoundItems",
    misc = "testSoundMisc",
    racials = "testSoundRacials"
  }
end

--[[
  Get available test sound self avoid categories mapping

  @return {table} - Map of category names to module names
]]--
GetAvailableSelfAvoidCategories = function()
  return {
    druid = "testSoundSelfAvoidDruid",
    hunter = "testSoundSelfAvoidHunter",
    mage = "testSoundSelfAvoidMage",
    paladin = "testSoundSelfAvoidPaladin",
    priest = "testSoundSelfAvoidPriest",
    rogue = "testSoundSelfAvoidRogue",
    shaman = "testSoundSelfAvoidShaman",
    warlock = "testSoundSelfAvoidWarlock",
    warrior = "testSoundSelfAvoidWarrior"
  }
end

--[[
  Get available test sound enemy avoid categories mapping

  @return {table} - Map of category names to module names
]]--
GetAvailableEnemyAvoidCategories = function()
  return {
    druid = "testSoundEnemyAvoidDruid",
    hunter = "testSoundEnemyAvoidHunter",
    mage = "testSoundEnemyAvoidMage",
    paladin = "testSoundEnemyAvoidPaladin",
    priest = "testSoundEnemyAvoidPriest",
    rogue = "testSoundEnemyAvoidRogue",
    shaman = "testSoundEnemyAvoidShaman",
    warlock = "testSoundEnemyAvoidWarlock",
    warrior = "testSoundEnemyAvoidWarrior"
  }
end

--[[
  Run tests for a single category (unified logic for all test types)

  @param {string} categoryName - Name of the category
  @param {string} moduleName - Name of the test module
  @param {string} testType - Type of test (for logging purposes)
  @param {function} completionCallback - Invoked once all selected branches finish
  @param {table|nil} branchFilter - Optional 1-element PascalCase branch list from
    `testHelper.ResolveBranchFilter`; when nil, the default 3-branch list is used.

  @return {boolean} - True if tests were run successfully
]]--
RunTestForCategory = function(categoryName, moduleName, testType, completionCallback, branchFilter)
  local branches = branchFilter or { "Classic", "Sod", "Tbc" }
  local index = 1
  local anyRan = false

  local function runNext()
    while index <= #branches do
      local branch = branches[index]
      index = index + 1
      local testModule = mod[moduleName .. branch]

      if testModule and type(testModule.Test) == "function" then
        anyRan = true
        mod.testHelper.SetActiveBranch(string.lower(branch))
        mod.logger.LogInfo(me.tag,
          "Running " .. categoryName .. " " .. testType .. " tests (" .. branch .. ")...")
        testModule.Test(runNext)

        return
      end
    end

    if not anyRan then
      local scope = branchFilter
        and ("on branch " .. string.lower(branchFilter[1]))
        or "in any branch"
      mod.logger.LogError(me.tag,
        testType .. " test module for category '" .. categoryName .. "' not found " .. scope)
    end

    completionCallback()
  end

  runNext()
  return true
end

--[[
  Show test sound command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowSoundHelp()
  print("|cFF00FFFFTest Sound Commands:|r")
  print("|cFF00FFFF/rgpvpw testsound|r - Show this help")
  print("|cFF00FFFF/rgpvpw testsound <category> [branch]|r - Run sound tests for category")
  print("|cFF00FFFF/rgpvpw testsound all [branch]|r - Run sound tests for ALL categories")
  print("")
  print("Runs actual sound tests with delayed execution for the specified category.")
  print("Optional [branch] scopes the run to a single client branch (classic, sod, tbc).")
  print("Omit it to run all three branches in sequence.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("  items, misc, racials")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testsound mage|r - Run all mage sound tests")
  print("  |cFF00FFFF/rgpvpw testsound mage tbc|r - Run mage sound tests for TBC only")
  print("  |cFF00FFFF/rgpvpw testsound all|r - Run sound tests for all categories")
end

--[[
  Generic handler for test commands - handles both "all" and single category cases

  @param {string} commandType - Session command type (e.g., "Sound", "SelfSound")
  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc); nil = all branches
  @param {table} availableCategories - Table of available categories
  @param {string} testTypeName - Display name for test type (e.g., "sound", "self avoid sound")
  @param {function} helpFunction - Function to show help on error
  @return {boolean|nil} - Success status or nil if error occurred
]]--
local function HandleTestCommand(commandType, testCommand, branchArg, availableCategories, testTypeName, helpFunction)
  local branchFilter, branchErr = mod.testHelper.ResolveBranchFilter(branchArg)
  if branchErr then
    mod.logger.LogError(me.tag, branchErr)
    helpFunction()
    return
  end

  local category = string.lower(testCommand)

  if category == "all" then
    mod.logger.LogInfo(me.tag, "Starting " .. testTypeName .. " tests for ALL categories...")
    return mod.testSessionManager.StartSession(commandType, "all", function(completionCallback)
      local categoryList = {}
      for categoryName, moduleName in pairs(availableCategories) do
        table.insert(categoryList, {categoryName = categoryName, moduleName = moduleName})
      end

      local completedCount = 0
      local totalCount = #categoryList

      local function onCategoryComplete()
        completedCount = completedCount + 1
        if completedCount >= totalCount then
          completionCallback()
        end
      end

      for _, categoryInfo in ipairs(categoryList) do
        RunTestForCategory(
          categoryInfo.categoryName, categoryInfo.moduleName, testTypeName, onCategoryComplete, branchFilter)
      end
    end)
  end

  local moduleName = availableCategories[category]
  if not moduleName then
    mod.logger.LogError(me.tag, "Unknown " .. testTypeName .. " category: " .. testCommand)
    helpFunction()
    return
  end

  mod.logger.LogInfo(me.tag, "Starting " .. category .. " " .. testTypeName .. " tests...")
  return mod.testSessionManager.StartSession(commandType, category, function(completionCallback)
    RunTestForCategory(category, moduleName, testTypeName, completionCallback, branchFilter)
  end)
end

--[[
  Handle test sound commands

  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc)
]]--
function me.HandleSound(testCommand, branchArg)
  HandleTestCommand("Sound", testCommand, branchArg, GetAvailableCategories(), "sound", me.ShowSoundHelp)
end

--[[
  Show test self sound command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowSelfSoundHelp()
  print("|cFF00FFFFTest Self Sound Commands:|r")
  print("|cFF00FFFF/rgpvpw testselfsound|r - Show this help")
  print("|cFF00FFFF/rgpvpw testselfsound <category> [branch]|r - Run self avoid sound tests for category")
  print("|cFF00FFFF/rgpvpw testselfsound all [branch]|r - Run self avoid sound tests for ALL categories")
  print("")
  print("Runs actual self avoid sound tests with delayed execution for the specified category.")
  print("Optional [branch] scopes the run to a single client branch (classic, sod, tbc).")
  print("Omit it to run all three branches in sequence.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testselfsound mage|r - Run all mage self avoid sound tests")
  print("  |cFF00FFFF/rgpvpw testselfsound mage tbc|r - Run mage self avoid sound tests for TBC only")
  print("  |cFF00FFFF/rgpvpw testselfsound all|r - Run self avoid sound tests for all categories")
end

--[[
  Handle test self sound commands

  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc)
]]--
function me.HandleSelfSound(testCommand, branchArg)
  HandleTestCommand(
    "SelfSound",
    testCommand,
    branchArg,
    GetAvailableSelfAvoidCategories(),
    "self avoid sound",
    me.ShowSelfSoundHelp
  )
end

--[[
  Show test enemy sound command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowEnemySoundHelp()
  print("|cFF00FFFFTest Enemy Sound Commands:|r")
  print("|cFF00FFFF/rgpvpw testenemysound|r - Show this help")
  print("|cFF00FFFF/rgpvpw testenemysound <category> [branch]|r - Run enemy avoid sound tests for category")
  print("|cFF00FFFF/rgpvpw testenemysound all [branch]|r - Run enemy avoid sound tests for ALL categories")
  print("")
  print("Runs actual enemy avoid sound tests with delayed execution for the specified category.")
  print("Optional [branch] scopes the run to a single client branch (classic, sod, tbc).")
  print("Omit it to run all three branches in sequence.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testenemysound mage|r - Run all mage enemy avoid sound tests")
  print("  |cFF00FFFF/rgpvpw testenemysound mage tbc|r - Run mage enemy avoid sound tests for TBC only")
  print("  |cFF00FFFF/rgpvpw testenemysound all|r - Run enemy avoid sound tests for all categories")
end

--[[
  Handle test enemy sound commands

  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc)
]]--
function me.HandleEnemySound(testCommand, branchArg)
  HandleTestCommand(
    "EnemySound",
    testCommand,
    branchArg,
    GetAvailableEnemyAvoidCategories(),
    "enemy avoid sound",
    me.ShowEnemySoundHelp
  )
end
