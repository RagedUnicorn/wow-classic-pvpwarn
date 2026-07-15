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
  Show test combat event command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowCombatEventHelp()
  print("|cFF00FFFFTest Combat Event Commands:|r")
  print("|cFF00FFFF/rgpvpw testcombatevent|r - Show this help")
  print("|cFF00FFFF/rgpvpw testcombatevent <category> [branch]|r - Run combat event tests for category")
  print("|cFF00FFFF/rgpvpw testcombatevent all [branch]|r - Run combat event tests for ALL categories")
  print("")
  print("Runs actual combat event tests with delayed execution for the specified category.")
  print("Optional [branch] scopes the run to a single client branch (classic, sod, tbc).")
  print("Omit it to run all three branches in sequence.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("  items, misc, racials")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testcombatevent mage|r - Run all mage combat event tests (all branches)")
  print("  |cFF00FFFF/rgpvpw testcombatevent mage tbc|r - Run mage combat event tests for TBC only")
  print("  |cFF00FFFF/rgpvpw testcombatevent all|r - Run combat event tests for all categories")
end

--[[
  Handle test combat event commands

  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc)
]]--
function me.HandleCombatEvent(testCommand, branchArg)
  mod.testCmdRunner.HandleTestCommand(
    "CombatEvent", testCommand, branchArg, GetAvailableCategories(), "combat event", me.ShowCombatEventHelp)
end

--[[
  Show test self combat event command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowSelfCombatEventHelp()
  print("|cFF00FFFFTest Self Combat Event Commands:|r")
  print("|cFF00FFFF/rgpvpw testselfcombatevent|r - Show this help")
  print("|cFF00FFFF/rgpvpw testselfcombatevent <category> [branch]|r - Run self avoid combat event tests for category")
  print("|cFF00FFFF/rgpvpw testselfcombatevent all [branch]|r - Run self avoid combat event tests for ALL categories")
  print("")
  print("Runs actual self avoid combat event tests with delayed execution for the specified category.")
  print("Optional [branch] scopes the run to a single client branch (classic, sod, tbc).")
  print("Omit it to run all three branches in sequence.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testselfcombatevent mage|r - Run all mage self avoid combat event tests")
  print("  |cFF00FFFF/rgpvpw testselfcombatevent mage tbc|r - Run mage self avoid combat event tests for TBC only")
  print("  |cFF00FFFF/rgpvpw testselfcombatevent all|r - Run self avoid combat event tests for all categories")
end

--[[
  Handle test self combat event commands

  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc)
]]--
function me.HandleSelfCombatEvent(testCommand, branchArg)
  mod.testCmdRunner.HandleTestCommand(
    "SelfCombatEvent",
    testCommand,
    branchArg,
    GetAvailableSelfAvoidCategories(),
    "self avoid combat event",
    me.ShowSelfCombatEventHelp
  )
end

--[[
  Show test enemy combat event command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowEnemyCombatEventHelp()
  print("|cFF00FFFFTest Enemy Combat Event Commands:|r")
  print("|cFF00FFFF/rgpvpw testenemycombatevent|r - Show this help")
  print("|cFF00FFFF/rgpvpw testenemycombatevent <category> [branch]|r" ..
    " - Run enemy avoid combat event tests for category")
  print("|cFF00FFFF/rgpvpw testenemycombatevent all [branch]|r - Run enemy avoid combat event tests for ALL categories")
  print("")
  print("Runs actual enemy avoid combat event tests with delayed execution for the specified category.")
  print("Optional [branch] scopes the run to a single client branch (classic, sod, tbc).")
  print("Omit it to run all three branches in sequence.")
  print("")
  print("Available categories:")
  print("  all, druid, hunter, mage, paladin, priest, rogue, shaman, warlock, warrior")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testenemycombatevent mage|r - Run all mage enemy avoid combat event tests")
  print("  |cFF00FFFF/rgpvpw testenemycombatevent mage tbc|r - Run mage enemy avoid combat event tests for TBC only")
  print("  |cFF00FFFF/rgpvpw testenemycombatevent all|r - Run enemy avoid combat event tests for all categories")
end

--[[
  Handle test enemy combat event commands

  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc)
]]--
function me.HandleEnemyCombatEvent(testCommand, branchArg)
  mod.testCmdRunner.HandleTestCommand(
    "EnemyCombatEvent",
    testCommand,
    branchArg,
    GetAvailableEnemyAvoidCategories(),
    "enemy avoid combat event",
    me.ShowEnemyCombatEventHelp
  )
end
