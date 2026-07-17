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

-- Shared test-runner machinery for test command handlers (TestSoundCmd, TestCombatEventCmd)
-- Handles category resolution, branch iteration and session lifecycle
-- This module is only loaded in development builds

local mod = rgpvpw
local me = {}
mod.testCmdRunner = me

me.tag = "TestCmdRunner"

-- forward declaration
local RunTestForCategory

--[[
  Generic handler for test commands - handles both "all" and single category cases

  @param {string} commandType - Session command type (e.g., "Sound", "CombatEvent")
  @param {string} testCommand - The test command to execute
  @param {string|nil} branchArg - Optional branch arg (classic/sod/tbc); nil = all branches
  @param {table} availableCategories - Table of available categories
  @param {string} testTypeName - Display name for test type (e.g., "sound", "combat event")
  @param {function} helpFunction - Function to show help on error
  @return {boolean|nil} - Success status or nil if error occurred
]]--
function me.HandleTestCommand(commandType, testCommand, branchArg, availableCategories, testTypeName, helpFunction)
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

      table.sort(categoryList, function(left, right)
        return left.categoryName < right.categoryName
      end)

      local index = 1

      --[[
        Categories must run one at a time — the run owns a single test queue and a
        single active branch on its run context; concurrent categories would drain
        each other's queue and attribute results to the wrong branch.
      ]]--
      local function runNextCategory()
        if index > #categoryList then
          completionCallback()
          return
        end

        local categoryInfo = categoryList[index]
        index = index + 1
        RunTestForCategory(
          categoryInfo.categoryName, categoryInfo.moduleName, testTypeName, runNextCategory, branchFilter)
      end

      runNextCategory()
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
