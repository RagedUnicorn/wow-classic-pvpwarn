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

-- luacheck: globals C_Timer GetTime time

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
  Reset SavedVariable for storing logs
]]--
function me.ClearSavedTestReports()
  PVPWarnTestLog = {}
  mod.logger.LogInfo(me.tag, "Cleared PVPWarnTestLog")
end

--[[
  Initialize PVPWarnTestLog structure for a test group

  @param {string} groupName
]]--
local function initializeTestLogStructure(groupName)
  PVPWarnTestLog[groupName] = {}
  PVPWarnTestLog[groupName].testCount = 0
  PVPWarnTestLog[groupName].testSuccess = 0
  PVPWarnTestLog[groupName].testFailure = 0
end

--[[
  Log and display test group start message

  @param {string} groupName
]]--
local function logTestGroupStart(groupName)
  local logMessage = string.format("Starting test group with name %s", groupName)
  local sequence, timestamp = getMessageData()
  table.insert(
    PVPWarnTestLog[groupName],
    {message = logMessage, timestamp = timestamp, sequence = sequence, messageType = "INFO"}
  )

  me.NotifyTestLogWindow("=== Test Group: " .. groupName .. " ===", "GROUP_HEADER")
  me.NotifyTestLogWindow(logMessage)
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
  mod.testHelper.HookMaxWarnAge()

  testManager.currentTestGroup = groupName
  initializeTestLogStructure(groupName)
  logTestGroupStart(groupName)
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
  Log and display individual test group summary lines

  @param {string} groupName
]]--
local function logTestGroupSummary(groupName)
  local finishedMessage = string.format("Finished test group with name: %s", groupName)
  me.NotifyTestLogWindow(finishedMessage)
  local sequence1, timestamp1 = getMessageData()
  table.insert(
    PVPWarnTestLog[groupName],
    {message = finishedMessage, timestamp = timestamp1, sequence = sequence1, messageType = "INFO"}
  )

  local succeededMessage = string.format("Tests succeeded: %i", PVPWarnTestLog[groupName].testSuccess)
  me.NotifyTestLogWindow(succeededMessage, "SUCCESS")
  local sequence2, timestamp2 = getMessageData()
  table.insert(
    PVPWarnTestLog[groupName],
    {message = succeededMessage, timestamp = timestamp2, sequence = sequence2, messageType = "SUCCESS"}
  )

  local failedMessage = string.format("Tests failed: %i", PVPWarnTestLog[groupName].testFailure)
  local failedMessageType = PVPWarnTestLog[groupName].testFailure > 0 and "FAILURE" or "INFO"
  me.NotifyTestLogWindow(failedMessage, failedMessageType)
  local sequence3, timestamp3 = getMessageData()
  table.insert(
    PVPWarnTestLog[groupName],
    {message = failedMessage, timestamp = timestamp3, sequence = sequence3, messageType = failedMessageType}
  )

  local totalMessage = string.format("Tests total: %i", PVPWarnTestLog[groupName].testCount)
  me.NotifyTestLogWindow(totalMessage, "INFO")
  local sequence4, timestamp4 = getMessageData()
  table.insert(
    PVPWarnTestLog[groupName],
    {message = totalMessage, timestamp = timestamp4, sequence = sequence4, messageType = "INFO"}
  )
end

--[[
  Log and display failed test details

  @param {string} groupName
]]--
local function logFailedTests(groupName)
  if #testManager.currentFailedTests == 0 then
    return
  end

  local failedTestsMessage = "Failed tests:"
  me.NotifyTestLogWindow(failedTestsMessage, "FAILURE")
  local failedSequence, failedTimestamp = getMessageData()
  table.insert(
    PVPWarnTestLog[groupName],
    {
      message = failedTestsMessage,
      timestamp = failedTimestamp,
      sequence = failedSequence,
      messageType = "FAILURE"
    }
  )

  for i = 1, #testManager.currentFailedTests do
    me.NotifyTestLogWindow(testManager.currentFailedTests[i], "FAILURE")
    local testSequence, testTimestamp = getMessageData()
    table.insert(
      PVPWarnTestLog[groupName],
      {
        message = testManager.currentFailedTests[i],
        timestamp = testTimestamp,
        sequence = testSequence,
        messageType = "FAILURE"
      }
    )
  end
end

--[[
  Log and display final summary statistics

  @param {string} groupName
]]--
local function logFinalSummary(groupName)
  local summaryStats = string.format("Total: %d, Success: %d, Failure: %d",
    PVPWarnTestLog[groupName].testCount,
    PVPWarnTestLog[groupName].testSuccess,
    PVPWarnTestLog[groupName].testFailure)

  me.NotifyTestLogWindow(summaryStats, "INFO")
  local summarySequence, summaryTimestamp = getMessageData()
  table.insert(
    PVPWarnTestLog[groupName],
    {
      message = summaryStats,
      timestamp = summaryTimestamp,
      sequence = summarySequence,
      messageType = "INFO"
    }
  )

  me.NotifyTestLogWindow("", "SEPARATOR")
end

--[[
  Stopping a test group
]]--
function me.StopTestGroup()
  if testManager.currentTestGroup == nil then
    mod.logger.LogError(me.tag, "No running test group found to stop")
    return
  end

  local groupName = testManager.currentTestGroup

  logFailedTests(groupName)
  logTestGroupSummary(groupName)
  logFinalSummary(groupName)

  mod.testHelper.RestoreMaxWarnAge()
  mod.testHelper.DisableTestMode()

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

  PVPWarnTestLog[testManager.currentTestGroup][testName] = {}
  PVPWarnTestLog[testManager.currentTestGroup][testName].status = nil
  local sequence, timestamp = getMessageData()
  table.insert(
    PVPWarnTestLog[testManager.currentTestGroup][testName],
    {
      message = logMessage,
      timestamp = timestamp,
      sequence = sequence,
      messageType = "INFO"
    }
  )

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

  PVPWarnTestLog[testManager.currentTestGroup].testSuccess =
    PVPWarnTestLog[testManager.currentTestGroup].testSuccess + 1
  PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest].status = "SUCCESS"
  local sequence, timestamp = getMessageData()
  table.insert(
    PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest],
    {
      message = logMessage,
      timestamp = timestamp,
      sequence = sequence,
      messageType = "SUCCESS"
    }
  )

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

  if reason then
    local failureDetail = category .. " : " .. testName .. " - " .. reason
    me.NotifyTestLogWindow(failureDetail, "FAILURE")
    local sequence, timestamp = getMessageData()
    table.insert(
      PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest],
      {
        message = failureDetail,
        timestamp = timestamp,
        sequence = sequence,
        messageType = "FAILURE"
      }
    )
  end

  PVPWarnTestLog[testManager.currentTestGroup].testFailure =
    PVPWarnTestLog[testManager.currentTestGroup].testFailure + 1
  PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest].status = "FAILURE"
  local sequence, timestamp = getMessageData()
  table.insert(
    PVPWarnTestLog[testManager.currentTestGroup][testManager.currentTest],
    {
      message = logMessage,
      timestamp = timestamp,
      sequence = sequence,
      messageType = "FAILURE"
    }
  )
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
  if not mod.testLogWindow or not message then
    return
  end

  local testLogWindow = _G["PVPW_TestLogWindow"]

  if not testLogWindow or not testLogWindow:IsShown() then
    return
  end

  mod.testLogWindow.AppendMessage(message, messageType)
end
