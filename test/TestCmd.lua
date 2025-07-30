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

-- Test command handler for PVPWarn addon
-- This module is only loaded in development builds

local mod = rgpvpw
local me = {}
mod.testCmd = me

me.tag = "TestCmd"

-- Forward declarations for local functions
local HandleTestLogCommand
local ShowTestLogHelp
local HandleTestSoundCommand
local ShowTestSoundHelp
local HandleTestSelfSoundCommand
local ShowTestSelfSoundHelp
local HandleTestEnemySoundCommand
local ShowTestEnemySoundHelp
local GetAvailableCategories
local GetAvailableSelfAvoidCategories
local GetAvailableEnemyAvoidCategories
local RunTestForCategory
local RunSelfAvoidTestForCategory
local RunEnemyAvoidTestForCategory

--[[
  Initialize test command module
]]--
function me.Initialize()
  if mod.cmd and mod.cmd.RegisterCommand then
    mod.cmd.RegisterCommand("testlog", function(args)
      if #args > 0 then
        HandleTestLogCommand(args[1])
      else
        ShowTestLogHelp()
      end
    end)

    mod.cmd.RegisterCommand("testsound", function(args)
      if #args > 0 then
        HandleTestSoundCommand(args[1])
      else
        ShowTestSoundHelp()
      end
    end)

    mod.cmd.RegisterCommand("testselfsound", function(args)
      if #args > 0 then
        HandleTestSelfSoundCommand(args[1])
      else
        ShowTestSelfSoundHelp()
      end
    end)

    mod.cmd.RegisterCommand("testenemysound", function(args)
      if #args > 0 then
        HandleTestEnemySoundCommand(args[1])
      else
        ShowTestEnemySoundHelp()
      end
    end)

    mod.logger.LogDebug(me.tag, "Test commands registered")
  else
    mod.logger.LogError(me.tag, "Failed to register test commands - command module not available")
  end
end

--[[
  Show test log command help

  Note: Will not be translated as this is a development-only feature
]]--
ShowTestLogHelp = function()
  print("|cFF00FFFFTest Log Commands:|r")
  print("|cFF00FFFF/rgpvpw testlog|r - Show this help")
  print("|cFF00FFFF/rgpvpw testlog show|r - Show test log window (loads saved test logs)")
  print("|cFF00FFFF/rgpvpw testlog hide|r - Hide test log window")
  print("|cFF00FFFF/rgpvpw testlog clear|r - Clear test log window display")
  print("")
  print("Note: Test logs are saved to PVPWarnTestLog and displayed when window is shown.")
end

--[[
  Handle test log commands

  @param {string} testCommand - The test command to execute
  @param {table} args - All command arguments
]]--
HandleTestLogCommand = function(testCommand)
  if testCommand == "show" then
    mod.testLogWindow.Show()
  elseif testCommand == "hide" then
    mod.testLogWindow.Hide()
  elseif testCommand == "clear" then
    mod.testLogWindow.ClearLog()
  else
    ShowTestLogHelp()
  end
end

--[[
  Show test sound command help

  Note: Will not be translated as this is a development-only feature
]]--
ShowTestSoundHelp = function()
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
  Run tests for a single category

  @param {string} categoryName - Name of the category
  @param {string} moduleName - Name of the test module
  @return {boolean} - True if tests were run successfully
]]--
RunTestForCategory = function(categoryName, moduleName)
  local testModule = mod[moduleName]

  if not testModule or not testModule.Test then
    mod.logger.LogError(me.tag, "Test module for category '" .. categoryName .. "' not found or missing Test() function")

    return false
  end

  mod.logger.LogInfo(me.tag, "Running " .. categoryName .. " sound tests...")
  testModule.Test()

  return true
end

--[[
  Run self avoid tests for a single category

  @param {string} categoryName - Name of the category
  @param {string} moduleName - Name of the test module
  @return {boolean} - True if tests were run successfully
]]--
RunSelfAvoidTestForCategory = function(categoryName, moduleName)
  local testModule = mod[moduleName]

  if not testModule or not testModule.Test then
    mod.logger.LogError(me.tag, "Self avoid test module for category '" .. categoryName .. "' not found or missing Test() function")

    return false
  end

  mod.logger.LogInfo(me.tag, "Running " .. categoryName .. " self avoid sound tests...")
  testModule.Test()

  return true
end

--[[
  Run enemy avoid tests for a single category

  @param {string} categoryName - Name of the category
  @param {string} moduleName - Name of the test module
  @return {boolean} - True if tests were run successfully
]]--
RunEnemyAvoidTestForCategory = function(categoryName, moduleName)
  local testModule = mod[moduleName]

  if not testModule or not testModule.Test then
    mod.logger.LogError(me.tag, "Enemy avoid test module for category '" .. categoryName .. "' not found or missing Test() function")

    return false
  end

  mod.logger.LogInfo(me.tag, "Running " .. categoryName .. " enemy avoid sound tests...")
  testModule.Test()

  return true
end

--[[
  Handle test sound commands

  @param {string} testCommand - The test command to execute
]]--
HandleTestSoundCommand = function(testCommand)
  local availableCategories = GetAvailableCategories()
  local category = string.lower(testCommand)

  if category == "all" then
    mod.logger.LogInfo(me.tag, "Starting sound tests for ALL categories...")

    for categoryName, moduleName in pairs(availableCategories) do
      RunTestForCategory(categoryName, moduleName)
    end

    return
  end

  local moduleName = availableCategories[category]

  if not moduleName then
    mod.logger.LogError(me.tag, "Unknown category: " .. testCommand)
    ShowTestSoundHelp()
    return
  end

  mod.logger.LogInfo(me.tag, "Starting " .. category .. " sound tests...")
  RunTestForCategory(category, moduleName)
end

--[[
  Show test self sound command help

  Note: Will not be translated as this is a development-only feature
]]--
ShowTestSelfSoundHelp = function()
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
HandleTestSelfSoundCommand = function(testCommand)
  local availableCategories = GetAvailableSelfAvoidCategories()
  local category = string.lower(testCommand)

  if category == "all" then
    mod.logger.LogInfo(me.tag, "Starting self avoid sound tests for ALL categories...")

    for categoryName, moduleName in pairs(availableCategories) do
      RunSelfAvoidTestForCategory(categoryName, moduleName)
    end

    return
  end

  local moduleName = availableCategories[category]

  if not moduleName then
    mod.logger.LogError(me.tag, "Unknown self avoid category: " .. testCommand)
    ShowTestSelfSoundHelp()

    return
  end

  mod.logger.LogInfo(me.tag, "Starting " .. category .. " self avoid sound tests...")
  RunSelfAvoidTestForCategory(category, moduleName)
end

--[[
  Show test enemy sound command help

  Note: Will not be translated as this is a development-only feature
]]--
ShowTestEnemySoundHelp = function()
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
HandleTestEnemySoundCommand = function(testCommand)
  local availableCategories = GetAvailableEnemyAvoidCategories()
  local category = string.lower(testCommand)

  if category == "all" then
    mod.logger.LogInfo(me.tag, "Starting enemy avoid sound tests for ALL categories...")

    for categoryName, moduleName in pairs(availableCategories) do
      RunEnemyAvoidTestForCategory(categoryName, moduleName)
    end

    return
  end

  local moduleName = availableCategories[category]

  if not moduleName then
    mod.logger.LogError(me.tag, "Unknown enemy avoid category: " .. testCommand)
    ShowTestEnemySoundHelp()
    return
  end

  mod.logger.LogInfo(me.tag, "Starting " .. category .. " enemy avoid sound tests...")
  RunEnemyAvoidTestForCategory(category, moduleName)
end
