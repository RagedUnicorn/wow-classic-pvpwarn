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

-- luacheck: globals GetAddOnMetadata DEFAULT_CHAT_FRAME C_Timer GetTime time

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

-- Global sequence counter for message ordering
local messageSequence = 0

--[[
  Get next sequence number and current timestamp for message ordering

  @return {number, number} - sequence number, timestamp
]]--
local function getMessageData()
  messageSequence = messageSequence + 1
  local baseTime = time()
  local gameTime = GetTime()
  local fractionalSeconds = gameTime - math.floor(gameTime)
  return messageSequence, baseTime + fractionalSeconds
end

--[[
  Log a message to the DEFAULT_CHAT_FRAME that is not affected by logger settings

  @param {string} message
]]--
function me.LogTestMessage(message)
  if RGPVPW_ENVIRONMENT.TEST_LOG_TO_CHAT then
    print("|cff1cdb4f" .. GetAddOnMetadata(RGPVPW_CONSTANTS.ADDON_NAME, "Title") .. ":" .. message)
  end
end

--[[
  Add line seperator based on the width of the DEFAULT_CHAT_FRAME
]]--
function me.AddLine()
  if not RGPVPW_ENVIRONMENT.TEST_LOG_TO_CHAT then
    return
  end

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
    mod.logger.LogError(me.tag, "A test group was already started. Stop the test group first before starting a new one")
    return
  end

  mod.testHelper.EnableTestMode()

  testManager.currentTestGroup = groupName

  local logMessage = string.format("Starting test group with name %s", groupName)
  me.LogTestMessage(logMessage)
  me.AddLine()

  mod.testHelper.HookMaxWarnAge()

  PVPWarnTestLog[groupName] = {}
  PVPWarnTestLog[groupName].testCount = 0
  PVPWarnTestLog[groupName].testSuccess = 0
  PVPWarnTestLog[groupName].testFailure = 0

  local sequence, timestamp = getMessageData()
  table.insert(PVPWarnTestLog[groupName], {message = logMessage, timestamp = timestamp, sequence = sequence})

  me.NotifyTestLogWindow("=== Test Group: " .. groupName .. " ===", "GROUP_HEADER")
  me.NotifyTestLogWindow(logMessage)
end

--[[
  Force clear test manager state (for cleanup between sessions)
]]--
function me.ForceResetTestManager()
  testManager.currentTestGroup = nil
  testManager.currentTest = nil
  testManager.currentFailedTests = {}
  mod.logger.LogInfo(me.tag, "TestReporter state forcibly reset")
end

--[[
  Stopping a test group
]]--
function me.StopTestGroup()
  if testManager.currentTestGroup == nil then
    mod.logger.LogError(me.tag, "No running test group found to stop")
    return
  end

  local logMessage = string.format("Finished test group with name: %s\n"
    .. "Tests succeeded: %i\n"
    .. "Tests failed: %i\n"
    .. "Tests total: %i",
    testManager.currentTestGroup,
    PVPWarnTestLog[testManager.currentTestGroup].testSuccess,
    PVPWarnTestLog[testManager.currentTestGroup].testFailure,
    PVPWarnTestLog[testManager.currentTestGroup].testCount)

  me.LogTestMessage(logMessage)
  me.AddLine()

  -- display failed test names if there where any
  if #testManager.currentFailedTests > 0 then
    me.LogTestMessage("Failed tests:")
    for i = 1, #testManager.currentFailedTests do
      me.LogTestMessage(testManager.currentFailedTests[i])
    end

    me.AddLine()
  end

  local sequence, timestamp = getMessageData()
  table.insert(PVPWarnTestLog[testManager.currentTestGroup], {message = logMessage, timestamp = timestamp, sequence = sequence})
  mod.testHelper.RestoreMaxWarnAge()
  mod.testHelper.DisableTestMode()
  me.NotifyTestLogWindow(logMessage)

  -- Add test group summary
  local summaryMessage = string.format("Total: %d, Success: %d, Failure: %d",
    PVPWarnTestLog[testManager.currentTestGroup].testCount,
    PVPWarnTestLog[testManager.currentTestGroup].testSuccess,
    PVPWarnTestLog[testManager.currentTestGroup].testFailure)

  me.NotifyTestLogWindow(summaryMessage, "INFO")
  me.NotifyTestLogWindow("", "SEPARATOR")

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
    mod.logger.LogError(me.tag, "No current test group found. Every test has to be part of a test group.")
    return
  end

  testManager.currentTest = testName
  PVPWarnTestLog[testManager.currentTestGroup].testCount = PVPWarnTestLog[testManager.currentTestGroup].testCount + 1

  local logMessage = string.format("Starting test with name %s", testName)
  me.LogTestMessage(logMessage)

  PVPWarnTestLog[testManager.currentTestGroup][testName] = {}
  PVPWarnTestLog[testManager.currentTestGroup][testName].status = nil
  local sequence, timestamp = getMessageData()
  table.insert(PVPWarnTestLog[testManager.currentTestGroup][testName], {message = logMessage, timestamp = timestamp, sequence = sequence})

  me.NotifyTestLogWindow(logMessage)
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
  local sequence, timestamp = getMessageData()
  table.insert(PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest], {message = logMessage, timestamp = timestamp, sequence = sequence})

  me.NotifyTestLogWindow(logMessage, "SUCCESS")

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
  local sequence, timestamp = getMessageData()
  table.insert(PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest], {message = logMessage, timestamp = timestamp, sequence = sequence})

  table.insert(testManager.currentFailedTests, category .. " - " .. testName)

  me.NotifyTestLogWindow(logMessage, "FAILURE")

  testManager.currentTest = nil
end

--[[
  add a function to the test queue
  @param {function} testFunction
    testfunction to execute
]]--
function me.AddToTestQueueWithDelay(testFunction)
  table.insert(testQueueWithDelay, testFunction)
end

--[[
  @param {function} callback
    Callback function that is invoked once the test queue is empty/done
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

--[[
  Notify the test log window to append the latest message if it's currently shown

  @param {string} message - The message to append
  @param {string} messageType - Optional message type
]]--
function me.NotifyTestLogWindow(message, messageType)
  if not RGPVPW_ENVIRONMENT.TEST_LOG_TO_WINDOW or not mod.testLogWindow or not message then
    return
  end

  local testLogWindow = _G["PVPW_TestLogWindow"]

  if not testLogWindow or not testLogWindow:IsShown() then
    return
  end

  mod.testLogWindow.AppendMessage(message, messageType)
end
