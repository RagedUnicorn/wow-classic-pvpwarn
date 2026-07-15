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
  Handle test sound commands

  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc)
]]--
function me.HandleSound(testCommand, branchArg)
  mod.testCmdRunner.HandleTestCommand(
    "Sound", testCommand, branchArg, GetAvailableCategories(), "sound", me.ShowSoundHelp)
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
  mod.testCmdRunner.HandleTestCommand(
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
  mod.testCmdRunner.HandleTestCommand(
    "EnemySound",
    testCommand,
    branchArg,
    GetAvailableEnemyAvoidCategories(),
    "enemy avoid sound",
    me.ShowEnemySoundHelp
  )
end
