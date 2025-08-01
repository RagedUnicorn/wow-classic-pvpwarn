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

  @return {boolean} - True if tests were run successfully
]]--
RunTestForCategory = function(categoryName, moduleName, testType, completionCallback)
  local testModule = mod[moduleName]

  if not testModule or not testModule.Test then
    mod.logger.LogError(
      me.tag,
      testType .. " test module for category '" .. categoryName .. "' not found or missing Test() function"
    )

    return false
  end

  mod.logger.LogInfo(me.tag, "Running " .. categoryName .. " " .. testType .. " tests...")
  testModule.Test(completionCallback)

  return true
end

--[[
  Show test sound command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowSoundHelp()
  print("|cFF00FFFFTest Sound Commands:|r")
  print("|cFF00FFFF/rgpvpw testsound|r - Show this help")
  print("|cFF00FFFF/rgpvpw testsound <category>|r - Run sound tests for category")
  print("|cFF00FFFF/rgpvpw testsound all|r - Run sound tests for ALL categories")
  print("")
  print("Runs actual sound tests with delayed execution for the specified category.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("  items, misc, racials")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testsound mage|r - Run all mage sound tests")
  print("  |cFF00FFFF/rgpvpw testsound all|r - Run sound tests for all categories")
end

--[[
  Generic handler for test commands - handles both "all" and single category cases

  @param {string} commandType - Session command type (e.g., "Sound", "SelfSound")
  @param {string} testCommand - The test command to execute
  @param {table} availableCategories - Table of available categories
  @param {string} testTypeName - Display name for test type (e.g., "sound", "self avoid sound")
  @param {function} helpFunction - Function to show help on error
  @return {boolean|nil} - Success status or nil if error occurred
]]--
local function HandleTestCommand(commandType, testCommand, availableCategories, testTypeName, helpFunction)
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
        RunTestForCategory(categoryInfo.categoryName, categoryInfo.moduleName, testTypeName, onCategoryComplete)
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
    RunTestForCategory(category, moduleName, testTypeName, completionCallback)
  end)
end

--[[
  Handle test sound commands

  @param {string} testCommand - The test command to execute
]]--
function me.HandleSound(testCommand)
  HandleTestCommand("Sound", testCommand, GetAvailableCategories(), "sound", me.ShowSoundHelp)
end

--[[
  Show test self sound command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowSelfSoundHelp()
  print("|cFF00FFFFTest Self Sound Commands:|r")
  print("|cFF00FFFF/rgpvpw testselfsound|r - Show this help")
  print("|cFF00FFFF/rgpvpw testselfsound <category>|r - Run self avoid sound tests for category")
  print("|cFF00FFFF/rgpvpw testselfsound all|r - Run self avoid sound tests for ALL categories")
  print("")
  print("Runs actual self avoid sound tests with delayed execution for the specified category.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testselfsound mage|r - Run all mage self avoid sound tests")
  print("  |cFF00FFFF/rgpvpw testselfsound all|r - Run self avoid sound tests for all categories")
end

--[[
  Handle test self sound commands

  @param {string} testCommand - The test command to execute
]]--
function me.HandleSelfSound(testCommand)
  HandleTestCommand("SelfSound", testCommand, GetAvailableSelfAvoidCategories(), "self avoid sound", me.ShowSelfSoundHelp)
end

--[[
  Show test enemy sound command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowEnemySoundHelp()
  print("|cFF00FFFFTest Enemy Sound Commands:|r")
  print("|cFF00FFFF/rgpvpw testenemysound|r - Show this help")
  print("|cFF00FFFF/rgpvpw testenemysound <category>|r - Run enemy avoid sound tests for category")
  print("|cFF00FFFF/rgpvpw testenemysound all|r - Run enemy avoid sound tests for ALL categories")
  print("")
  print("Runs actual enemy avoid sound tests with delayed execution for the specified category.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testenemysound mage|r - Run all mage enemy avoid sound tests")
  print("  |cFF00FFFF/rgpvpw testenemysound all|r - Run enemy avoid sound tests for all categories")
end

--[[
  Handle test enemy sound commands

  @param {string} testCommand - The test command to execute
]]--
function me.HandleEnemySound(testCommand)
  HandleTestCommand("EnemySound", testCommand, GetAvailableEnemyAvoidCategories(), "enemy avoid sound", me.ShowEnemySoundHelp)
end
