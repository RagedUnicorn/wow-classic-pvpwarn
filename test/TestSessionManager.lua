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

-- Automatic test session management for PVPWarn addon
-- Manages complete test lifecycle with single entry point through commands
-- Ensures only one session can be active at a time

local mod = rgpvpw
local me = {}
mod.testSessionManager = me

me.tag = "TestSessionManager"

-- Session state tracking
local currentSession = {
  isActive = false,
  sessionName = nil,
  sessionId = nil,
  commandType = nil,
  commandCategory = nil,
  startTime = nil
}

--[[
  Initialize session manager
]]--
function me.Initialize()
  mod.logger.LogInfo(me.tag, "Test session manager initialized")
end

--[[
  Check if a test session is currently active

  @return {boolean} - True if a session is active
]]--
function me.IsSessionActive()
  return currentSession.isActive
end

--[[
  Get current session information

  @return {table|nil} - Current session info or nil if no active session
]]--
function me.GetCurrentSession()
  if currentSession.isActive then
    return {
      sessionName = currentSession.sessionName,
      sessionId = currentSession.sessionId,
      commandType = currentSession.commandType,
      commandCategory = currentSession.commandCategory,
      startTime = currentSession.startTime
    }
  end

  return nil
end

--[[
  Generate a session name based on command type and category

  @param {string} commandType - Type of command (e.g., "Sound", "CombatEvent", "SelfSound", "EnemySound")
  @param {string} category - Category name (e.g., "mage", "all")

  @return {string} - Generated session name
]]--
local function GenerateSessionName(commandType, category)
  local timestamp = date("%Y%m%d_%H%M%S")
  return string.format("AutoSession_%s_%s_%s", commandType, category, timestamp)
end

--[[
  Start a new test session automatically

  @param {string} commandType - Type of command
  @param {string} category - Category being tested
  @param {function} testFunction - Function to execute within the session

  @return {boolean} - True if session started successfully
]]--
function me.StartAutoSession(commandType, category, testFunction)

  if currentSession.isActive then
    mod.logger.LogError(me.tag,
      "Cannot start new session - session '" .. currentSession.sessionName .. "' is already active")
    return false
  end

  local sessionName = GenerateSessionName(commandType, category)
  local sessionId = date("%Y%m%d_%H%M%S")

  currentSession.isActive = true
  currentSession.sessionName = sessionName
  currentSession.sessionId = sessionId
  currentSession.commandType = commandType
  currentSession.commandCategory = category
  currentSession.startTime = date("%Y-%m-%d %H:%M:%S")

  mod.logger.LogInfo(me.tag, "Starting automatic test session: " .. sessionName)

  mod.testReporter.StartTestGroup(sessionName)

  if type(testFunction) == "function" then
    testFunction()
  end

  me.SetupSessionCleanup()

  if mod.testLogWindow and mod.testLogWindow.OnSessionStart then
    mod.testLogWindow.OnSessionStart()
  end

  return true
end

--[[
  Set up automatic session cleanup when the test queue finishes
]]--
function me.SetupSessionCleanup()
  if not me.originalStopTestGroup then
    me.originalStopTestGroup = mod.testReporter.StopTestGroup
    mod.testReporter.StopTestGroup = me.WrappedStopTestGroup
  end
end

--[[
  Wrapped version of StopTestGroup that handles session cleanup

  This replaces the original StopTestGroup function to automatically
  manage session state when tests complete
]]--
function me.WrappedStopTestGroup()
  -- Call original StopTestGroup first
  if me.originalStopTestGroup then
    me.originalStopTestGroup()
  end

  -- Handle session cleanup
  if currentSession.isActive then
    mod.logger.LogInfo(me.tag, "Automatic test session completed: " .. currentSession.sessionName)

    local completedSessionName = currentSession.sessionName

    currentSession.isActive = false
    currentSession.sessionName = nil
    currentSession.sessionId = nil
    currentSession.commandType = nil
    currentSession.commandCategory = nil
    currentSession.startTime = nil

    if mod.testLogWindow and mod.testLogWindow.OnSessionEnd then
      mod.testLogWindow.OnSessionEnd(completedSessionName)
    end
  end
end

