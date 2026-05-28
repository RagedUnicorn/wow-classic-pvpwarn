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
  print("|cFF00FFFF/rgpvpw testvalidation <suite> [branch]|r - Run a validation suite")
  print("")
  print("Suites:")
  print("  all                                  - Run all validation suites")
  print("  sound                                - Validate sound test coverage")
  print("  sounddown                            - Validate sound down test coverage")
  print("  soundrefresh                         - Validate sound refresh test coverage")
  print("  soundselfavoid                       - Validate self avoid sound test coverage")
  print("  soundenemyavoid                      - Validate enemy avoid sound test coverage")
  print("  combatevent                          - Validate combat event test coverage")
  print("  combateventselfavoid                 - Validate self avoid combat event test coverage")
  print("  combateventenemyavoid                - Validate enemy avoid combat event test coverage")
  print("  combateventselfavoidirrelevant       - Validate self avoid irrelevant combat event test coverage")
  print("  combateventenemyavoidirrelevant      - Validate enemy avoid irrelevant combat event test coverage")
  print("")
  print("Optional [branch] scopes the validation to a single client branch (classic, sod, tbc).")
  print("Omit it to validate all three branches in sequence.")
  print("")
  print("These commands validate that test cases exist for every spell in the spell maps.")
  print("They do not run the actual tests, but check test coverage completeness.")
  print("")
  print("Examples:")
  print("  |cFF00FFFF/rgpvpw testvalidation all|r - Run all validation tests")
  print("  |cFF00FFFF/rgpvpw testvalidation sound|r - Check if sound tests exist for all spells")
  print("  |cFF00FFFF/rgpvpw testvalidation sound tbc|r - Check sound test coverage for TBC only")
end

--[[
  The fixed pass order. Every "all" / per-suite validation iterates these branches in turn,
  setting mod.testHelper.SetActiveBranch before invoking the underlying validator so the
  test framework consumes the branch-specific assembled map.
]]--
local branches = { "classic", "sod", "tbc" }

--[[
  Run a validator callback once per branch with the active branch set first.

  @param {function} validator
    The validator function to invoke each pass; receives no arguments.
  @param {table|nil} branchFilter
    Optional 1-element PascalCase branch list from `testHelper.ResolveBranchFilter`;
    when nil, the module-level default 3-branch list is used.
]]--
local function forEachBranch(validator, branchFilter)
  local list = branchFilter or branches
  for _, branch in ipairs(list) do
    mod.testHelper.SetActiveBranch(string.lower(branch))
    validator()
  end
end

--[[
  Handle test validation commands

  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc)
]]--
function me.HandleValidation(testCommand, branchArg)
  local branchFilter, branchErr = mod.testHelper.ResolveBranchFilter(branchArg)
  if branchErr then
    mod.logger.LogError(me.tag, branchErr)
    me.ShowValidationHelp()
    return
  end

  local command = string.lower(testCommand)
  local function each(validator) forEachBranch(validator, branchFilter) end

  if command == "all" then
    mod.logger.LogInfo(me.tag, "Starting all validation tests...")
    mod.testSessionManager.StartSession("Validation", "all", function(completionCallback)
      each(function()
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
      end)
      completionCallback()
    end)
  elseif command == "sound" then
    mod.logger.LogInfo(me.tag, "Starting sound test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "sound", function(completionCallback)
      each(function()
        mod.testSound.ShouldHaveSoundTestForAllSpells()
      end)
      completionCallback()
    end)
  elseif command == "sounddown" then
    mod.logger.LogInfo(me.tag, "Starting sound down test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "sounddown", function(completionCallback)
      each(function()
        mod.testSound.ShouldHaveSoundDownTestForAllSpells()
      end)
      completionCallback()
    end)
  elseif command == "soundrefresh" then
    mod.logger.LogInfo(me.tag, "Starting sound refresh test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "soundrefresh", function(completionCallback)
      each(function()
        mod.testSound.ShouldHaveSoundRefreshTestForAllSpells()
      end)
      completionCallback()
    end)
  elseif command == "soundselfavoid" then
    mod.logger.LogInfo(me.tag, "Starting self avoid sound test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "soundselfavoid", function(completionCallback)
      each(function()
        mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
      end)
      completionCallback()
    end)
  elseif command == "soundenemyavoid" then
    mod.logger.LogInfo(me.tag, "Starting enemy avoid sound test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "soundenemyavoid", function(completionCallback)
      each(function()
        mod.testSound.ShouldHaveSoundAvoidTestForAllSpells(RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)
      end)
      completionCallback()
    end)
  elseif command == "combatevent" then
    mod.logger.LogInfo(me.tag, "Starting combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combatevent", function(completionCallback)
      each(function()
        mod.testCombatEvent.ShouldHaveCombatEventTestForAllTrackedEvents()
      end)
      completionCallback()
    end)
  elseif command == "combateventselfavoid" then
    mod.logger.LogInfo(me.tag, "Starting self avoid combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combateventselfavoid", function(completionCallback)
      each(function()
        mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
          RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID
        )
      end)
      completionCallback()
    end)
  elseif command == "combateventenemyavoid" then
    mod.logger.LogInfo(me.tag, "Starting enemy avoid combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combateventenemyavoid", function(completionCallback)
      each(function()
        mod.testCombatEvent.ShouldHaveCombatEventAvoidTestForAllTrackedEvents(
          RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID
        )
      end)
      completionCallback()
    end)
  elseif command == "combateventselfavoidirrelevant" then
    mod.logger.LogInfo(me.tag, "Starting self avoid irrelevant combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combateventselfavoidirrelevant", function(completionCallback)
      each(function()
        mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
          RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.SELF_AVOID)
      end)
      completionCallback()
    end)
  elseif command == "combateventenemyavoidirrelevant" then
    mod.logger.LogInfo(me.tag, "Starting enemy avoid irrelevant combat event test coverage validation...")
    mod.testSessionManager.StartSession("Validation", "combateventenemyavoidirrelevant", function(completionCallback)
      each(function()
        mod.testCombatEvent.ShouldHaveCombatEventAvoidIrrelevantTestForAllTrackedEvents(
          RGPVPW_CONSTANTS.SPELL_AVOID_TYPE.ENEMY_AVOID)
      end)
      completionCallback()
    end)
  else
    mod.logger.LogError(me.tag, "Unknown validation command: " .. testCommand)
    me.ShowValidationHelp()
  end
end
