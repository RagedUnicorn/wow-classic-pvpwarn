--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

-- luacheck: globals date

-- Test session management for PVPWarn addon
-- Manages complete test lifecycle with single entry point through commands
-- Ensures only one session can be active at a time

local mod = rgpvpw
local me = {}
mod.testSessionManager = me

me.tag = "TestSessionManager"

-- forward declaration
local CreateRunContext

--[[
  The active run context, or nil when no session is running. Created by StartSession
  and dropped on completion or force reset. All mutable test framework state for a
  run - session identity, reporter bookkeeping, the test queues and the active
  branch - lives on this table, so a finished or abandoned run can never leak state
  into the next one. Async callbacks (delayed-queue timers, completion callbacks)
  capture their run's context and go dead with it instead of corrupting a new run.
]]--
local runContext = nil

--[[
  Check if a test session is currently active

  @return {boolean} - True if a session is active
]]--
function me.IsSessionActive()
  return runContext ~= nil
end

--[[
  Get the active run context. TestReporter and TestHelper resolve their per-run
  state through this accessor; framework-internal async chains capture the returned
  table directly so they stay bound to their own run.

  @return {table|nil} - The active run context or nil if no session is running
]]--
function me.GetRunContext()
  return runContext
end

--[[
  Get current session information

  @return {table|nil} - Current session info or nil if no active session
]]--
function me.GetCurrentSession()
  if runContext == nil then
    return nil
  end

  return {
    sessionName = runContext.sessionName,
    sessionId = runContext.sessionId,
    commandType = runContext.commandType,
    commandCategory = runContext.commandCategory,
    startTime = runContext.startTime
  }
end

--[[
  Start a new test session automatically

  @param {string} commandType - Type of command
  @param {string} category - Category being tested
  @param {function} testFunction - Function to execute within the session

  @return {boolean} - True if session started successfully
]]--
function me.StartSession(commandType, category, testFunction)
  if runContext ~= nil then
    mod.logger.LogError(me.tag,
      "Cannot start new session - session '" .. runContext.sessionName .. "' is already active")

    return false
  end

  local context = CreateRunContext(commandType, category)
  runContext = context

  mod.logger.LogInfo(me.tag, "Starting test session: " .. context.sessionName)

  mod.testReporter.StartTestGroup(context.sessionName)

  if mod.testLogWindow and mod.testLogWindow.OnSessionStart then
    mod.testLogWindow.OnSessionStart()
  end

  if type(testFunction) == "function" then
    local completionCallback = me.CreateCompletionCallback()
    local status, err = pcall(testFunction, completionCallback)

    if not status then
      mod.logger.LogError(me.tag,
        "Test session '" .. context.sessionName .. "' failed with error: " .. tostring(err))
      completionCallback()
    end
  end

  return true
end

--[[
  Force reset the session state without running the normal completion flow.
  Recovery path for a stranded session where the completion callback can no
  longer be reached (e.g. a test errored inside an async timer callback).
  Cancelling the context makes any still-scheduled async callback of the
  stranded run a no-op.
]]--
function me.ForceResetSession()
  if runContext == nil then
    mod.logger.LogInfo(me.tag, "No active test session to reset")
    return
  end

  mod.logger.LogWarn(me.tag, "Forcibly resetting test session: " .. runContext.sessionName)

  -- Restore test mode only if the test group made it far enough to install the
  -- hooks - RestoreMaxWarnAge must not run without a prior HookMaxWarnAge
  if runContext.testGroupName ~= nil then
    mod.testHelper.RestoreMaxWarnAge()
    mod.testHelper.DisableTestMode()
  end

  runContext.cancelled = true
  runContext = nil
end

--[[
  Create a completion callback for test functions to call when they finish.
  The callback is bound to the run context active at creation time - if that run
  was force reset (or already completed) in the meantime it does nothing instead
  of tearing down a newer session.

  @return {function} - Completion callback that handles session cleanup
]]--
function me.CreateCompletionCallback()
  local context = runContext

  return function()
    if context == nil or context ~= runContext then
      return
    end

    local completedSessionName = context.sessionName

    mod.logger.LogInfo(me.tag, "Test session completed: " .. completedSessionName)

    -- Create the session cleanup callback
    local sessionCleanupCallback = function()
      context.cancelled = true
      runContext = nil

      if mod.testLogWindow and mod.testLogWindow.OnSessionEnd then
        mod.testLogWindow.OnSessionEnd(completedSessionName)
      end
    end

    -- Call StopTestGroup with the cleanup callback
    mod.testReporter.StopTestGroup(sessionCleanupCallback)
  end
end

--[[
  Create a fresh run context for a starting session

  @param {string} commandType - Type of command (e.g., "Sound", "CombatEvent", "Validation", "All")
  @param {string} category - Category name (e.g., "mage", "all")

  @return {table} - The new run context
]]--
CreateRunContext = function(commandType, category)
  local timestamp = date("%Y%m%d_%H%M%S")

  return {
    sessionName = string.format("%s_%s_%s", commandType, category, timestamp),
    sessionId = timestamp,
    commandType = commandType,
    commandCategory = category,
    startTime = date("%Y-%m-%d %H:%M:%S"),
    -- set when the run ends (normally or forcibly); stale async callbacks check it
    cancelled = false,
    -- test branch consumed by spell map assembly and test-case discovery (TestHelper)
    activeBranch = "classic",
    -- reporter state (owned by TestReporter)
    testGroupName = nil,
    currentTest = nil,
    failedTests = {},
    messageSequence = 0,
    testQueueWithDelay = {},
    testQueueImmediate = {}
  }
end
