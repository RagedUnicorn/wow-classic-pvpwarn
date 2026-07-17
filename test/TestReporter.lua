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

-- Test reporting for PVPWarn addon. Holds no module-global run state - all
-- bookkeeping (current test group, current test, failed tests, test queues,
-- message sequence) lives on the run context owned by TestSessionManager, so
-- every run starts from a clean slate and a stranded run cannot leak state
-- into the next one.

local mod = rgpvpw
local me = {}
mod.testReporter = me

me.tag = "TestReporter"

-- forward declaration
local GetRunContext
local getMessageData
local initializeTestLogStructure
local logTestGroupStart
local logTestGroupSummary
local logFailedTests
local logFinalSummary
local playImmediateTests
local playDelayedTests
local executeTestFunction

if PVPWarnTestLog == nil then
  PVPWarnTestLog = {}
end

--[[
  Reset SavedVariable for storing logs
]]--
function me.ClearSavedTestReports()
  PVPWarnTestLog = {}
  mod.logger.LogInfo(me.tag, "Cleared PVPWarnTestLog")
end

--[[
  Starting a new group of tests. Requires an active test session - the test
  group's state is stored on the session's run context.

  @param {string} groupName
]]--
function me.StartTestGroup(groupName)
  assert(type(groupName) == "string",
    string.format("bad argument #1 to `StartTestGroup` (expected string got %s)", type(groupName)))

  local context = GetRunContext()

  if context == nil then
    mod.logger.LogError(me.tag, "Cannot start test group - no active test session")
    return
  end

  if context.testGroupName ~= nil then
    mod.logger.LogError(me.tag, "A test group was already started. Stop the test group first before starting a new one")
    return
  end

  mod.testHelper.EnableTestMode()
  mod.testHelper.HookMaxWarnAge()

  context.testGroupName = groupName
  initializeTestLogStructure(groupName)
  logTestGroupStart(context, groupName)
end

--[[
  Stopping a test group

  @param {function} completionCallback - Optional callback to call after test group cleanup
]]--
function me.StopTestGroup(completionCallback)
  local context = GetRunContext()

  if context == nil or context.testGroupName == nil then
    mod.logger.LogError(me.tag, "No running test group found to stop")
    return
  end

  local groupName = context.testGroupName

  logFailedTests(context, groupName)
  logTestGroupSummary(context, groupName)
  logFinalSummary(context, groupName)

  mod.testHelper.RestoreMaxWarnAge()
  mod.testHelper.DisableTestMode()

  context.testGroupName = nil
  context.failedTests = {}

  if type(completionCallback) == "function" then
    completionCallback(groupName)
  end
end

--[[
  Start a new test

  @param {string} testName
]]--
function me.StartTestRun(testName)
  assert(type(testName) == "string",
    string.format("bad argument #1 to `StartTestRun` (expected string got %s)", type(testName)))

  local context = GetRunContext()

  if context == nil or context.testGroupName == nil then
    mod.logger.LogError(me.tag, "No current test group found. Every test has to be part of a test group.")
    return
  end

  context.currentTest = testName
  PVPWarnTestLog[context.testGroupName].testCount = PVPWarnTestLog[context.testGroupName].testCount + 1

  local logMessage = string.format("Starting test with name %s", testName)

  me.NotifyTestLogWindow(logMessage, "INFO")
  PVPWarnTestLog[context.testGroupName][testName] = {}
  PVPWarnTestLog[context.testGroupName][testName].status = nil
  local sequence, timestamp = getMessageData(context)
  table.insert(
    PVPWarnTestLog[context.testGroupName][testName],
    {
      message = logMessage,
      timestamp = timestamp,
      sequence = sequence,
      messageType = "INFO"
    }
  )
end

--[[
  Report a test as success
]]--
function me.ReportSuccessTestRun()
  local context = GetRunContext()

  if context == nil or context.currentTest == nil then
    mod.logger.LogError(me.tag, "Cannot report test status because there was no test started")
    return
  end

  local logMessage = string.format("Test with name %s finished with status SUCCESS", context.currentTest)

  me.NotifyTestLogWindow(logMessage, "SUCCESS")
  PVPWarnTestLog[context.testGroupName].testSuccess =
    PVPWarnTestLog[context.testGroupName].testSuccess + 1
  PVPWarnTestLog[context.testGroupName][context.currentTest].status = "SUCCESS"
  local sequence, timestamp = getMessageData(context)
  table.insert(
    PVPWarnTestLog[context.testGroupName][context.currentTest],
    {
      message = logMessage,
      timestamp = timestamp,
      sequence = sequence,
      messageType = "SUCCESS"
    }
  )

  context.currentTest = nil
end

--[[
  Report a test as failed

  @param {string} category
  @param {string} testName
  @param {string} reason
    Option reason why a failure is getting reported
]]--
function me.ReportFailureTestRun(category, testName, reason)
  local context = GetRunContext()

  if context == nil or context.currentTest == nil then
    mod.logger.LogError(me.tag, "Cannot report test status because there was no test started")
    return
  end

  local logMessage = string.format("Test with name %s finished with status FAILURE", context.currentTest)

  me.NotifyTestLogWindow(logMessage, "FAILURE")
  if reason then
    local failureDetail = category .. " : " .. testName .. " - " .. reason
    me.NotifyTestLogWindow(failureDetail, "FAILURE")
    local sequence, timestamp = getMessageData(context)
    table.insert(
      PVPWarnTestLog[context.testGroupName][context.currentTest],
      {
        message = failureDetail,
        timestamp = timestamp,
        sequence = sequence,
        messageType = "FAILURE"
      }
    )
  end

  PVPWarnTestLog[context.testGroupName].testFailure =
    PVPWarnTestLog[context.testGroupName].testFailure + 1
  PVPWarnTestLog[context.testGroupName][context.currentTest].status = "FAILURE"
  local sequence, timestamp = getMessageData(context)
  table.insert(
    PVPWarnTestLog[context.testGroupName][context.currentTest],
    {
      message = logMessage,
      timestamp = timestamp,
      sequence = sequence,
      messageType = "FAILURE"
    }
  )
  table.insert(context.failedTests, category .. " - " .. testName)

  context.currentTest = nil
end

--[[
  add a function to the test queue with delay
  @param {function} testFunction
    testfunction to execute
]]--
function me.AddToTestQueueWithDelay(testFunction)
  local context = GetRunContext()

  if context == nil then
    mod.logger.LogError(me.tag, "Cannot queue test - no active test session")
    return
  end

  table.insert(context.testQueueWithDelay, testFunction)
end

--[[
  add a function to the immediate test queue (no delay)
  @param {function} testFunction
    testfunction to execute
]]--
function me.AddToTestQueueImmediate(testFunction)
  local context = GetRunContext()

  if context == nil then
    mod.logger.LogError(me.tag, "Cannot queue test - no active test session")
    return
  end

  table.insert(context.testQueueImmediate, testFunction)
end

--[[
  Execute all immediate tests first, then delayed tests
  @param {function} callback
    Callback function that is invoked once all test queues are empty/done
]]--
function me.PlayTestQueueWithDelay(callback)
  local context = GetRunContext()

  if context == nil then
    mod.logger.LogError(me.tag, "Cannot play test queue - no active test session")
    return
  end

  playImmediateTests(context)
  playDelayedTests(context, callback)
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

--[[
  Resolve the run context of the active test session

  @return {table|nil} - The active run context or nil if no session is running
]]--
GetRunContext = function()
  return mod.testSessionManager.GetRunContext()
end

--[[
  Get next sequence number and current timestamp for message ordering

  @param {table} context - The run context owning the sequence counter

  @return {number, number} - sequence number, timestamp
]]--
getMessageData = function(context)
  context.messageSequence = context.messageSequence + 1
  local baseTime = time()
  local gameTime = GetTime()
  local fractionalSeconds = gameTime - math.floor(gameTime)
  return context.messageSequence, baseTime + fractionalSeconds
end

--[[
  Initialize PVPWarnTestLog structure for a test group

  @param {string} groupName
]]--
initializeTestLogStructure = function(groupName)
  PVPWarnTestLog[groupName] = {}
  PVPWarnTestLog[groupName].testCount = 0
  PVPWarnTestLog[groupName].testSuccess = 0
  PVPWarnTestLog[groupName].testFailure = 0
end

--[[
  Log and display test group start message

  @param {table} context - The active run context
  @param {string} groupName
]]--
logTestGroupStart = function(context, groupName)
  local logMessage = string.format("Starting test group with name %s", groupName)
  local sequence, timestamp = getMessageData(context)
  table.insert(
    PVPWarnTestLog[groupName],
    {message = logMessage, timestamp = timestamp, sequence = sequence, messageType = "INFO"}
  )

  me.NotifyTestLogWindow("=== Test Group: " .. groupName .. " ===", "GROUP_HEADER")
  me.NotifyTestLogWindow(logMessage)
end

--[[
  Log and display individual test group summary lines

  @param {table} context - The active run context
  @param {string} groupName
]]--
logTestGroupSummary = function(context, groupName)
  local finishedMessage = string.format("Finished test group with name: %s", groupName)
  me.NotifyTestLogWindow(finishedMessage)
  local sequence1, timestamp1 = getMessageData(context)
  table.insert(
    PVPWarnTestLog[groupName],
    {message = finishedMessage, timestamp = timestamp1, sequence = sequence1, messageType = "INFO"}
  )

  local succeededMessage = string.format("Tests succeeded: %i", PVPWarnTestLog[groupName].testSuccess)
  me.NotifyTestLogWindow(succeededMessage, "SUCCESS")
  local sequence2, timestamp2 = getMessageData(context)
  table.insert(
    PVPWarnTestLog[groupName],
    {message = succeededMessage, timestamp = timestamp2, sequence = sequence2, messageType = "SUCCESS"}
  )

  local failedMessage = string.format("Tests failed: %i", PVPWarnTestLog[groupName].testFailure)
  local failedMessageType = PVPWarnTestLog[groupName].testFailure > 0 and "FAILURE" or "INFO"
  me.NotifyTestLogWindow(failedMessage, failedMessageType)
  local sequence3, timestamp3 = getMessageData(context)
  table.insert(
    PVPWarnTestLog[groupName],
    {message = failedMessage, timestamp = timestamp3, sequence = sequence3, messageType = failedMessageType}
  )

  local totalMessage = string.format("Tests total: %i", PVPWarnTestLog[groupName].testCount)
  me.NotifyTestLogWindow(totalMessage, "INFO")
  local sequence4, timestamp4 = getMessageData(context)
  table.insert(
    PVPWarnTestLog[groupName],
    {message = totalMessage, timestamp = timestamp4, sequence = sequence4, messageType = "INFO"}
  )
end

--[[
  Log and display failed test details

  @param {table} context - The active run context
  @param {string} groupName
]]--
logFailedTests = function(context, groupName)
  if #context.failedTests == 0 then
    return
  end

  local failedTestsMessage = "Failed tests:"
  me.NotifyTestLogWindow(failedTestsMessage, "FAILURE")
  local failedSequence, failedTimestamp = getMessageData(context)
  table.insert(
    PVPWarnTestLog[groupName],
    {
      message = failedTestsMessage,
      timestamp = failedTimestamp,
      sequence = failedSequence,
      messageType = "FAILURE"
    }
  )

  for i = 1, #context.failedTests do
    me.NotifyTestLogWindow(context.failedTests[i], "FAILURE")
    local testSequence, testTimestamp = getMessageData(context)
    table.insert(
      PVPWarnTestLog[groupName],
      {
        message = context.failedTests[i],
        timestamp = testTimestamp,
        sequence = testSequence,
        messageType = "FAILURE"
      }
    )
  end
end

--[[
  Log and display final summary statistics

  @param {table} context - The active run context
  @param {string} groupName
]]--
logFinalSummary = function(context, groupName)
  local summaryStats = string.format("Total: %d, Success: %d, Failure: %d",
    PVPWarnTestLog[groupName].testCount,
    PVPWarnTestLog[groupName].testSuccess,
    PVPWarnTestLog[groupName].testFailure)

  me.NotifyTestLogWindow(summaryStats, "INFO")
  local summarySequence, summaryTimestamp = getMessageData(context)
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
  Execute immediate tests without delay

  @param {table} context - The run context whose immediate queue is drained
]]--
playImmediateTests = function(context)
  while context.testQueueImmediate[1] ~= nil do
    executeTestFunction(context, context.testQueueImmediate[1])
    table.remove(context.testQueueImmediate, 1)
  end
end

--[[
  Execute delayed tests with 0.8s delay between each. The timer chain captures its
  run context - if that run was cancelled (completed or force reset) a still-pending
  timer does nothing instead of draining a newer run's queue.

  @param {table} context - The run context whose delayed queue is drained
  @param {function} callback
    Callback function that is invoked once the delayed queue is empty/done
]]--
playDelayedTests = function(context, callback)
  if context.cancelled then
    return
  end

  if context.testQueueWithDelay[1] == nil then
    callback()
    return -- queue is empty abort...
  end

  executeTestFunction(context, context.testQueueWithDelay[1])
  table.remove(context.testQueueWithDelay, 1)

  C_Timer.After(0.8, function()
    playDelayedTests(context, callback)
  end)
end

--[[
  Execute a queued test function with error isolation. A thrown error must not
  abort the queue - it would strand the session with no way to recover short
  of a reload. An error in a started test is reported as its failure.

  @param {table} context - The run context the test executes under
  @param {function} testFunction
]]--
executeTestFunction = function(context, testFunction)
  local status, err = pcall(testFunction)

  if not status then
    mod.logger.LogError(me.tag, "Test function failed with error: " .. tostring(err))

    if context.currentTest ~= nil then
      me.ReportFailureTestRun("LuaError", context.currentTest, tostring(err))
    end
  end
end
