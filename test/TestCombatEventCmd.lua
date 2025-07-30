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

-- Test combat event command handler for PVPWarn addon
-- Handles all combat event test commands (testcombatevent, testselfcombatevent, testenemycombatevent)
-- This module is only loaded in development builds

local mod = rgpvpw
local me = {}
mod.testCombatEventCmd = me

me.tag = "TestCombatEventCmd"

-- Forward declarations for local functions
local GetAvailableCategories
local GetAvailableSelfAvoidCategories
local GetAvailableEnemyAvoidCategories
local RunTestForCategory

--[[
  Get available test combat event categories mapping

  @return {table} - Map of category names to module names
]]--
GetAvailableCategories = function()
  return {
    druid = "testCombatEventsDruid",
    hunter = "testCombatEventsHunter",
    mage = "testCombatEventsMage",
    paladin = "testCombatEventsPaladin",
    priest = "testCombatEventsPriest",
    rogue = "testCombatEventsRogue",
    shaman = "testCombatEventsShaman",
    warlock = "testCombatEventsWarlock",
    warrior = "testCombatEventsWarrior",
    items = "testCombatEventsItems",
    misc = "testCombatEventsMisc",
    racials = "testCombatEventsRacials"
  }
end

--[[
  Get available test combat event self avoid categories mapping

  @return {table} - Map of category names to module names
]]--
GetAvailableSelfAvoidCategories = function()
  return {
    druid = "testCombatEventsSelfAvoidDruid",
    hunter = "testCombatEventsSelfAvoidHunter",
    mage = "testCombatEventsSelfAvoidMage",
    paladin = "testCombatEventsSelfAvoidPaladin",
    priest = "testCombatEventsSelfAvoidPriest",
    rogue = "testCombatEventsSelfAvoidRogue",
    shaman = "testCombatEventsSelfAvoidShaman",
    warlock = "testCombatEventsSelfAvoidWarlock",
    warrior = "testCombatEventsSelfAvoidWarrior"
  }
end

--[[
  Get available test combat event enemy avoid categories mapping

  @return {table} - Map of category names to module names
]]--
GetAvailableEnemyAvoidCategories = function()
  return {
    druid = "testCombatEventsEnemyAvoidDruid",
    hunter = "testCombatEventsEnemyAvoidHunter",
    mage = "testCombatEventsEnemyAvoidMage",
    paladin = "testCombatEventsEnemyAvoidPaladin",
    priest = "testCombatEventsEnemyAvoidPriest",
    rogue = "testCombatEventsEnemyAvoidRogue",
    shaman = "testCombatEventsEnemyAvoidShaman",
    warlock = "testCombatEventsEnemyAvoidWarlock",
    warrior = "testCombatEventsEnemyAvoidWarrior"
  }
end

--[[
  Run tests for a single category (unified logic for all test types)

  @param {string} categoryName - Name of the category
  @param {string} moduleName - Name of the test module
  @param {string} testType - Type of test (for logging purposes)

  @return {boolean} - True if tests were run successfully
]]--
RunTestForCategory = function(categoryName, moduleName, testType)
  local testModule = mod[moduleName]

  if not testModule or not testModule.Test then
    mod.logger.LogError(
      me.tag,
      testType .. " test module for category '" .. categoryName .. "' not found or missing Test() function"
    )
    return false
  end

  mod.logger.LogInfo(me.tag, "Running " .. categoryName .. " " .. testType .. " tests...")
  testModule.Test()

  return true
end

--[[
  Show test combat event command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowCombatEventHelp()
  print("|cFF00FFFFTest Combat Event Commands:|r")
  print("|cFF00FFFF/rgpvpw testcombatevent|r - Show this help")
  print("|cFF00FFFF/rgpvpw testcombatevent <category>|r - Run combat event tests for category")
  print("|cFF00FFFF/rgpvpw testcombatevent all|r - Run combat event tests for ALL categories")
  print("")
  print("Runs actual combat event tests with delayed execution for the specified category.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("  items, misc, racials")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testcombatevent mage|r - Run all mage combat event tests")
  print("  |cFF00FFFF/rgpvpw testcombatevent all|r - Run combat event tests for all categories")
end

--[[
  Handle test combat event commands

  @param {string} testCommand - The test command to execute
]]--
function me.HandleCombatEvent(testCommand)
  local availableCategories = GetAvailableCategories()
  local category = string.lower(testCommand)

  if category == "all" then
    mod.logger.LogInfo(me.tag, "Starting combat event tests for ALL categories...")

    for categoryName, moduleName in pairs(availableCategories) do
      RunTestForCategory(categoryName, moduleName, "combat event")
    end

    return
  end

  local moduleName = availableCategories[category]

  if not moduleName then
    mod.logger.LogError(me.tag, "Unknown category: " .. testCommand)
    me.ShowCombatEventHelp()

    return
  end

  mod.logger.LogInfo(me.tag, "Starting " .. category .. " combat event tests...")
  RunTestForCategory(category, moduleName, "combat event")
end

--[[
  Show test self combat event command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowSelfCombatEventHelp()
  print("|cFF00FFFFTest Self Combat Event Commands:|r")
  print("|cFF00FFFF/rgpvpw testselfcombatevent|r - Show this help")
  print("|cFF00FFFF/rgpvpw testselfcombatevent <category>|r - Run self avoid combat event tests for category")
  print("|cFF00FFFF/rgpvpw testselfcombatevent all|r - Run self avoid combat event tests for ALL categories")
  print("")
  print("Runs actual self avoid combat event tests with delayed execution for the specified category.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testselfcombatevent mage|r - Run all mage self avoid combat event tests")
  print("  |cFF00FFFF/rgpvpw testselfcombatevent all|r - Run self avoid combat event tests for all categories")
end

--[[
  Handle test self combat event commands

  @param {string} testCommand - The test command to execute
]]--
function me.HandleSelfCombatEvent(testCommand)
  local availableCategories = GetAvailableSelfAvoidCategories()
  local category = string.lower(testCommand)

  if category == "all" then
    mod.logger.LogInfo(me.tag, "Starting self avoid combat event tests for ALL categories...")

    for categoryName, moduleName in pairs(availableCategories) do
      RunTestForCategory(categoryName, moduleName, "self avoid combat event")
    end

    return
  end

  local moduleName = availableCategories[category]

  if not moduleName then
    mod.logger.LogError(me.tag, "Unknown self avoid category: " .. testCommand)
    me.ShowSelfCombatEventHelp()

    return
  end

  mod.logger.LogInfo(me.tag, "Starting " .. category .. " self avoid combat event tests...")
  RunTestForCategory(category, moduleName, "self avoid combat event")
end

--[[
  Show test enemy combat event command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowEnemyCombatEventHelp()
  print("|cFF00FFFFTest Enemy Combat Event Commands:|r")
  print("|cFF00FFFF/rgpvpw testenemycombatevent|r - Show this help")
  print("|cFF00FFFF/rgpvpw testenemycombatevent <category>|r - Run enemy avoid combat event tests for category")
  print("|cFF00FFFF/rgpvpw testenemycombatevent all|r - Run enemy avoid combat event tests for ALL categories")
  print("")
  print("Runs actual enemy avoid combat event tests with delayed execution for the specified category.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testenemycombatevent mage|r - Run all mage enemy avoid combat event tests")
  print("  |cFF00FFFF/rgpvpw testenemycombatevent all|r - Run enemy avoid combat event tests for all categories")
end

--[[
  Handle test enemy combat event commands

  @param {string} testCommand - The test command to execute
]]--
function me.HandleEnemyCombatEvent(testCommand)
  local availableCategories = GetAvailableEnemyAvoidCategories()
  local category = string.lower(testCommand)

  if category == "all" then
    mod.logger.LogInfo(me.tag, "Starting enemy avoid combat event tests for ALL categories...")

    for categoryName, moduleName in pairs(availableCategories) do
      RunTestForCategory(categoryName, moduleName, "enemy avoid combat event")
    end

    return
  end

  local moduleName = availableCategories[category]

  if not moduleName then
    mod.logger.LogError(me.tag, "Unknown enemy avoid category: " .. testCommand)
    me.ShowEnemyCombatEventHelp()

    return
  end

  mod.logger.LogInfo(me.tag, "Starting " .. category .. " enemy avoid combat event tests...")
  RunTestForCategory(category, moduleName, "enemy avoid combat event")
end
