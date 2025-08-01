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

-- Test validation command handler for PVPWarn addon
-- Handles test validation commands that verify test coverage completeness
-- This module is only loaded in development builds

local mod = rgpvpw
local me = {}
mod.testValidationCmd = me

me.tag = "TestValidationCmd"

--[[
  Show test validation command help

  Note: Will not be translated as this is a development-only feature
]]--
function me.ShowValidationHelp()
  print("|cFF00FFFFTest Validation Commands:|r")
  print("|cFF00FFFF/rgpvpw testvalidation|r - Show this help")
  print("|cFF00FFFF/rgpvpw testvalidation all|r - Run all validation tests")
  print("|cFF00FFFF/rgpvpw testvalidation sound|r - Validate sound test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation sounddown|r - Validate sound down test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation soundrefresh|r - Validate sound refresh test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation soundselfavoid|r - Validate self avoid sound test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation soundenemyavoid|r - Validate enemy avoid sound test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation combatevent|r - Validate combat event test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation combateventselfavoid|r - Validate self avoid combat event test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation combateventenemyavoid|r - Validate enemy avoid combat event test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation combateventselfavoidirrelevant|r - " ..
        "Validate self avoid irrelevant combat event test coverage")
  print("|cFF00FFFF/rgpvpw testvalidation combateventenemyavoidirrelevant|r - " ..
        "Validate enemy avoid irrelevant combat event test coverage")
  print("")
  print("These commands validate that test cases exist for every spell in the spell maps.")
  print("They do not run the actual tests, but check test coverage completeness.")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testvalidation all|r - Run all validation tests")
  print("  |cFF00FFFF/rgpvpw testvalidation sound|r - Check if sound tests exist for all spells")
  print("  |cFF00FFFF/rgpvpw testvalidation combatevent|r - Check if combat event tests exist for all spells")
end

--[[
  Handle test validation commands

  @param {string} testCommand - The test command to execute
]]--
function me.HandleValidation(testCommand)
  local command = string.lower(testCommand)

  if command == "all" then
    mod.logger.LogInfo(me.tag, "Starting all validation tests...")
    mod.testSessionManager.StartSession("Validation", "all", function(completionCallback)
      mod.testSound.ShouldHaveSoundTestForAllSpells()
      mod.testSound.ShouldHaveSoundDownTestForAllSpells()
      mod.testSound.ShouldHaveSoundRefreshTestForAllSpells()
      mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
      mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)
      mod.testCombatEvent.ShouldHaveCombatEventTestForAllTrackedEvents()
      mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
        RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID
      )
      mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
        RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
      )
      mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
        RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
      mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
        RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)
      completionCallback()
    end)
  elseif command == "sound" then
    mod.logger.LogInfo(me.tag, "Starting sound test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "sound", function(completionCallback)
      mod.testSound.ShouldHaveSoundTestForAllSpells()
      completionCallback()
    end)
  elseif command == "sounddown" then
    mod.logger.LogInfo(me.tag, "Starting sound down test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "sounddown", function(completionCallback)
      mod.testSound.ShouldHaveSoundDownTestForAllSpells()
      completionCallback()
    end)
  elseif command == "soundrefresh" then
    mod.logger.LogInfo(me.tag, "Starting sound refresh test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "soundrefresh", function(completionCallback)
      mod.testSound.ShouldHaveSoundRefreshTestForAllSpells()
      completionCallback()
    end)
  elseif command == "soundselfavoid" then
    mod.logger.LogInfo(me.tag, "Starting self avoid sound test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "soundselfavoid", function(completionCallback)
      mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
      completionCallback()
    end)
  elseif command == "soundenemyavoid" then
    mod.logger.LogInfo(me.tag, "Starting enemy avoid sound test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "soundenemyavoid", function(completionCallback)
      mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)
      completionCallback()
    end)
  elseif command == "combatevent" then
    mod.logger.LogInfo(me.tag, "Starting combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combatevent", function(completionCallback)
      mod.testCombatEvent.ShouldHaveCombatEventTestForAllTrackedEvents()
      completionCallback()
    end)
  elseif command == "combateventselfavoid" then
    mod.logger.LogInfo(me.tag, "Starting self avoid combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combateventselfavoid", function(completionCallback)
      mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
        RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID
      )
      completionCallback()
    end)
  elseif command == "combateventenemyavoid" then
    mod.logger.LogInfo(me.tag, "Starting enemy avoid combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combateventenemyavoid", function(completionCallback)
      mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
        RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
      )
      completionCallback()
    end)
  elseif command == "combateventselfavoidirrelevant" then
    mod.logger.LogInfo(me.tag, "Starting self avoid irrelevant combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combateventselfavoidirrelevant", function(completionCallback)
      mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
        RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
      completionCallback()
    end)
  elseif command == "combateventenemyavoidirrelevant" then
    mod.logger.LogInfo(me.tag, "Starting enemy avoid irrelevant combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combateventenemyavoidirrelevant", function(completionCallback)
      mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
        RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)
      completionCallback()
    end)
  else
    mod.logger.LogError(me.tag, "Unknown validation command: " .. testCommand)
    me.ShowValidationHelp()
  end
end
