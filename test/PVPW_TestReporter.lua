--[[
  MIT License

  Copyright (c) 2022 Michael Wiesendanger

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

-- luacheck: globals GetAddOnMetadata DEFAULT_CHAT_FRAME C_Timer

local mod = rgpvpw
local me = {}
mod.testReporter = me

me.tag = "TestReporter"

local testManager = {
  ["currentTestGroup"] = nil,
  ["currentTest"] = nil,
  ["currentFailedTests"] = {}
}

local testQueueWithDelay = {}

if PVPWarnTestLog == nil then
  PVPWarnTestLog = {}
end

--[[
  Log a message to the DEFAULT_CHAT_FRAME that is not affected by logger settings

  @param {string} message
]]--
function me.LogTestMessage(message)
  print("|cff1cdb4f" .. GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Title") .. ":" .. message)
end

--[[
  Add line seperator based on the width of the DEFAULT_CHAT_FRAME
]]--
function me.AddLine()
  local chatFrameWidth = DEFAULT_CHAT_FRAME:GetWidth()
  local line = "="

  for _ = 1, math.floor(chatFrameWidth / 10)  do
    line = line .. "="
  end

  me.LogTestMessage(line)
end

--[[
  Reset SavedVariable for storing logs
]]--
function me.ClearSavedTestReports()
  PVPWarnTestLog = {}
  mod.logger.LogInfo(me.tag, "Cleared PVPWarnTestLog")
end

--[[
  Starting a new group of tests

  @param {string} groupName
]]--
function me.StartTestGroup(groupName)
  assert(type(groupName) == "string",
    string.format("bad argument #1 to `StartTestGroup` (expected string got %s)", type(groupName)))

  if testManager.currentTestGroup ~= nil then
    mod.logger.LogError(me.tag, "A testgroup was already started. Stop the testgroup first before starting a new one")
    return
  end

  mod.testHelper.EnableTestMode()

  testManager.currentTestGroup = groupName

  local logMessage = string.format("Starting testgroup with name %s", groupName)
  me.LogTestMessage(logMessage)
  me.AddLine()

  mod.testHelper.HookMaxWarnAge()

  PVPWarnTestLog[groupName] = {}
  PVPWarnTestLog[groupName].testCount = 0
  PVPWarnTestLog[groupName].testSuccess = 0
  PVPWarnTestLog[groupName].testFailure = 0
  table.insert(PVPWarnTestLog[groupName], logMessage)
end

--[[
  Stopping a testgroup
]]--
function me.StopTestGroup()
  if testManager.currentTestGroup == nil then
    mod.logger.LogError(me.tag, "No running test group found to stop")
    return
  end

  local logMessage = string.format("Finished testgroup with name: %s\n"
    .. "Tests succeeded: %i\n"
    .. "Tests failed: %i\n"
    .. "Tests total: %i",
    testManager.currentTestGroup,
    PVPWarnTestLog[testManager.currentTestGroup].testSuccess,
    PVPWarnTestLog[testManager.currentTestGroup].testFailure,
    PVPWarnTestLog[testManager.currentTestGroup].testCount)

  me.LogTestMessage(logMessage)

  me.AddLine()

  -- display failed testnames if there where any
  if #testManager.currentFailedTests > 0 then
    me.LogTestMessage("Failed tests:")
    for i = 1, #testManager.currentFailedTests do
      me.LogTestMessage(testManager.currentFailedTests[i])
    end

    me.AddLine()
  end

  table.insert(PVPWarnTestLog[testManager.currentTestGroup], logMessage)
  mod.testHelper.RestoreMaxWarnAge()

  mod.testHelper.DisableTestMode()
  -- reset
  testManager.currentTestGroup = nil
  testManager.currentFailedTests = {}
end

--[[
  Start a new test

  @param {string} testName
]]--
function me.StartTestRun(testName)
  assert(type(testName) == "string",
    string.format("bad argument #1 to `StartTestRun` (expected string got %s)", type(testName)))

  if testManager.currentTestGroup == nil then
    mod.logger.LogError(me.tag, "No current testgroup found. Every test has to be part of a testgroup.")
    return
  end

  testManager.currentTest = testName
  PVPWarnTestLog[testManager.currentTestGroup].testCount = PVPWarnTestLog[testManager.currentTestGroup].testCount + 1

  local logMessage = string.format("Starting test with name %s", testName)
  me.LogTestMessage(logMessage)

  PVPWarnTestLog[testManager.currentTestGroup][testName] = {}
  PVPWarnTestLog[testManager.currentTestGroup][testName].status = nil
  table.insert(PVPWarnTestLog[testManager.currentTestGroup][testName], logMessage)
end

--[[
  Report a test as success
]]--
function me.ReportSuccessTestRun()
  if testManager.currentTest == nil then
    mod.logger.LogError(me.tag, "Cannot report test status because there was no test started")
    return
  end

  local logMessage = string.format("Test with name %s finished with status SUCCESS", testManager.currentTest)
  me.LogTestMessage(logMessage)

  PVPWarnTestLog[testManager.currentTestGroup].testSuccess =
    PVPWarnTestLog[testManager.currentTestGroup].testSuccess + 1
  PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest].status = "SUCCESS"
  table.insert(PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest], logMessage)

  -- reset
  testManager.currentTest = nil
end

--[[
  Report a test as failed

  @param {string} category
  @param {string} testName
  @param {string} reason
    Option reason why a failure is getting reported
]]--
function me.ReportFailureTestRun(category, testName, reason)
  if testManager.currentTest == nil then
    mod.logger.LogError(me.tag, "Cannot report test status because there was no test started")
    return
  end

  local logMessage = string.format("Test with name %s finished with status FAILURE", testManager.currentTest)
  me.LogTestMessage(logMessage)

  if reason then
    me.LogTestMessage(category .. " : " .. testName .. " - " .. reason)
  end

  PVPWarnTestLog[testManager.currentTestGroup].testFailure =
    PVPWarnTestLog[testManager.currentTestGroup].testFailure + 1
  PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest].status = "FAILURE"
  table.insert(PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest], logMessage)

  table.insert(testManager.currentFailedTests, category .. " - " .. testName)

  -- reset
  testManager.currentTest = nil
end

--[[
  add a function to the testqueue
  @param {function} testFunction
    testfunction to execute
]]--
function me.AddToTestQueueWithDelay(testFunction)
  table.insert(testQueueWithDelay, testFunction)
end

--[[
  @param {function} callback
    Callback function that is invoked once the testqueue is empty/done
]]--
function me.PlayTestQueueWithDelay(callback)
  if testQueueWithDelay[1] ~= nil then
    testQueueWithDelay[1]()
    table.remove(testQueueWithDelay, 1)
  else
    callback()
    return -- queue is empty abort...
  end

  C_Timer.After(0.8, function()
    me.PlayTestQueueWithDelay(callback)
  end)
end
