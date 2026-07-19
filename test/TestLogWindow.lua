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

-- luacheck: globals C_Timer CreateFrame date StaticPopup_Show StaticPopupDialogs ScrollUtil

local mod = rgpvpw
local me = {}
mod.testLogWindow = me

me.tag = "TestLogWindow"

-- UI elements
me.logMessages = {}
-- Recycled message frames ready for reuse
me.messageFramePool = {}
me.maxMessages = 1000
me.messageHeight = 14
me.messagePadding = 2
me.selectedSession = nil

local sessionDropdown
local scrollBar

-- forward declaration
local ReleaseMessageFrame

-- Color codes for different message types
me.messageColors = {
  -- Test status colors
  SUCCESS = {0, 1, 0},              -- Green
  FAILURE = {1, 0, 0},              -- Red
  INFO = {0.95, 0.95, 0.95},        -- White
  -- Special formatting
  GROUP_HEADER = {0, 1, 1},         -- Cyan for test group headers
  SEPARATOR = {0.5, 0.5, 0.5},      -- Gray for separators
  TIMESTAMP = {0.6, 0.6, 0.6}       -- Gray for timestamps
}


--[[
  Create session dropdown following VoicePackMenu pattern

  @param {table} frame
    The test log window frame to attach to
]]--
function me.CreateSessionDropdown(frame)
  sessionDropdown = mod.guiHelper.CreateSettingsDropdown(
    "PVPW_TestLogWindowSessionDropdown",
    frame,
    {"TOPLEFT", frame, "TOPLEFT", 20, -40},
    200,
    me.InitializeSessionDropdown
  )
  sessionDropdown:SetDefaultText("Select Session")
  -- generate once so the button shows the current selection before the menu was ever opened
  sessionDropdown:GenerateMenu()
end

--[[
  Menu generator for the session dropdown - fills the root description with a radio
  entry per available session plus a clear option while a session is selected

  @param {table} _
    The dropdown the menu is generated for (unused)
  @param {table} rootDescription
]]--
function me.InitializeSessionDropdown(_, rootDescription)
  -- Add current session if active
  if mod.testSessionManager and mod.testSessionManager.IsSessionActive() then
    local currentSession = mod.testSessionManager.GetCurrentSession()
    rootDescription:CreateRadio(
      "Current: " .. currentSession.sessionName,
      me.IsSessionSelected,
      me.OnSessionSelect,
      "current"
    )
  end

  -- Add all test group entries from PVPWarnTestLog. Groups are identified by the counter
  -- fields StartTestGroup seeds rather than by name shape, so free-form group names
  -- (e.g. "TestAll", direct validator runs) are listed alongside session-named groups.
  if PVPWarnTestLog then
    for groupName, groupData in pairs(PVPWarnTestLog) do
      if type(groupData) == "table" and type(groupData.testCount) == "number" then
        rootDescription:CreateRadio(
          groupName,
          me.IsSessionSelected,
          me.OnSessionSelect,
          "session_" .. groupName
        )
      end
    end
  end

  -- Add clear selection option
  if me.selectedSession then
    rootDescription:CreateButton("Clear Selection", me.OnSessionClear)
  end
end

--[[
  Whether the passed session is the currently selected one

  @param {string} sessionValue
    "current" or "session_" .. groupName

  @return {boolean}
]]--
function me.IsSessionSelected(sessionValue)
  return me.selectedSession == sessionValue
end

--[[
  Callback for when a session is selected

  @param {string} sessionValue
    "current" or "session_" .. groupName
]]--
function me.OnSessionSelect(sessionValue)
  me.selectedSession = sessionValue

  if sessionValue == "current" then
    me.ShowCurrentSession()
  else
    me.ShowStoredSession((sessionValue:gsub("^session_", "")))
  end
end

--[[
  Callback for the clear selection entry
]]--
function me.OnSessionClear()
  me.selectedSession = nil
  me.UpdateSessionDropdown()
  me.ShowEmptyState()
end

--[[
  Extract all messages with timestamps from the test log

  @param {table} testLog - The test log data structure
  @return {table} - Array of message objects with timestamps
]]--
local function extractSessionMessage(sessionName, key, value)
  if type(key) == "number" and value.message and value.timestamp then
    return {
      session = sessionName,
      message = value.message,
      timestamp = value.timestamp,
      sequence = value.sequence,
      messageType = value.messageType
    }
  end
  return nil
end

local function extractTestMessages(sessionName, testName, testData)
  local messages = {}

  for _, testMessage in ipairs(testData) do
    if type(testMessage) == "table" and testMessage.message and testMessage.timestamp then
      table.insert(messages, {
        session = sessionName,
        test = testName,
        message = testMessage.message,
        timestamp = testMessage.timestamp,
        sequence = testMessage.sequence,
        messageType = testMessage.messageType
      })
    end
  end
  return messages
end

local function extractAllMessages(testLog)
  local messages = {}

  for sessionName, sessionData in pairs(testLog) do
    if type(sessionData) == "table" then
      for key, value in pairs(sessionData) do
        if type(value) == "table" then
          -- Session-level message
          local sessionMessage = extractSessionMessage(sessionName, key, value)

          if sessionMessage then
            table.insert(messages, sessionMessage)
          -- Test case messages
          elseif type(key) == "string" and key:match("^Test") then
            local testMessages = extractTestMessages(sessionName, key, value)

            for _, msg in ipairs(testMessages) do
              table.insert(messages, msg)
            end
          end
        end
      end
    end
  end

  return messages
end

--[[
  Sort messages by sequence number for guaranteed chronological order

  @param {table} messages - Array of message objects
  @return {table} - Sorted array of message objects
]]--
local function sortMessagesBySequence(messages)
  table.sort(messages, function(a, b)
    return a.sequence < b.sequence
  end)
  return messages
end

--[[
  Load test logs from PVPWarnTestLog SavedVariable with sequence-based sorting
]]--
function me.LoadTestLogs()
  if not PVPWarnTestLog then return end

  me.ClearLog()

  -- Extract and sort all messages by sequence number across all sessions
  local allMessages = extractAllMessages(PVPWarnTestLog)
  local sortedMessages = sortMessagesBySequence(allMessages)

  -- For multiple sessions, display all messages in global chronological order
  for _, msgData in ipairs(sortedMessages) do
    local messageType = msgData.messageType or me.DetermineMessageType(msgData.message)
    me.AppendMessage(msgData.message, messageType, msgData.timestamp)
  end
end

--[[
  Add a single new message to the window without clearing existing content

  @param {string} message - The message to add
  @param {string} messageType - Type of message (SUCCESS, FAILURE, INFO, etc.)
  @param {number} storedTimestamp - Optional stored timestamp from session data
]]--
function me.AppendMessage(message, messageType, storedTimestamp)
  if not message or message == "" then
    return
  end

  local messageTypeToUse = messageType or me.DetermineMessageType(message)
  me.AddLogMessage(message, messageTypeToUse, storedTimestamp)
end

--[[
  Show the test log window
]]--
function me.Show()
  local testLogWindow = _G["PVPW_TestLogWindow"]

  if not testLogWindow then
    mod.logger.LogError(me.tag, "Test log window not found")
    return
  end

  if not sessionDropdown then
    me.CreateSessionDropdown(testLogWindow)
  end

  if not scrollBar then
    me.CreateScrollBar(testLogWindow)
  end

  testLogWindow:Show()
  testLogWindow:ClearAllPoints()

  mod.guiHelper.LoadFramePosition(testLogWindow, "PVPW_TestLogWindow")

  -- Show empty state by default unless a session is already selected
  if not me.selectedSession then
    me.ShowEmptyState()
  else
    me.LoadTestLogs()
  end
end

--[[
  Attach a MinimalScrollBar in the style of the stock configuration menus to the
  scroll frame defined in TestLogWindow.xml

  @param {table} frame
    The test log window frame to attach to
]]--
function me.CreateScrollBar(frame)
  local scrollFrame = _G["PVPW_TestLogWindowScrollFrame"]

  if not scrollFrame then
    mod.logger.LogError(me.tag, "Test log window scroll frame not found")
    return
  end

  scrollBar = CreateFrame("EventFrame", nil, frame, "MinimalScrollBar")
  scrollBar:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 8, 0)
  scrollBar:SetPoint("BOTTOMLEFT", scrollFrame, "BOTTOMRIGHT", 8, 0)
  ScrollUtil.InitScrollFrameWithScrollBar(scrollFrame, scrollBar)
end

--[[
  Hide the test log window
]]--
function me.Hide()
  local testLogWindow = _G["PVPW_TestLogWindow"]

  if testLogWindow then
    testLogWindow:Hide()
  end
end

--[[
  Add a log message to the window

  @param {string} message - The message to display
  @param {string} messageType - Type of message (SUCCESS, FAILURE, INFO, GROUP_HEADER, SEPARATOR)
  @param {number} storedTimestamp - Optional stored timestamp from session data
]]--
function me.AddLogMessage(message, messageType, storedTimestamp)
  local testLogWindow = _G["PVPW_TestLogWindow"]

  if not testLogWindow then return end

  local scrollFrame = nil
  local scrollChild = nil

  for i = 1, testLogWindow:GetNumChildren() do
    local child = select(i, testLogWindow:GetChildren())

    if child and child:GetObjectType() == "ScrollFrame" then
      scrollFrame = child
      scrollChild = child:GetScrollChild()
      break
    end
  end

  if not scrollFrame or not scrollChild then return end

  local messageFrame = me.CreateMessageFrame(scrollChild, message, messageType, storedTimestamp)

  if #me.logMessages == 0 then
    messageFrame:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, 0)
  else
    local previousTail = me.logMessages[#me.logMessages]
    messageFrame:SetPoint("TOPLEFT", previousTail, "BOTTOMLEFT", 0, -me.messagePadding)
  end

  table.insert(me.logMessages, messageFrame)

  if #me.logMessages > me.maxMessages then
    local oldMessage = table.remove(me.logMessages, 1)
    ReleaseMessageFrame(oldMessage)

    if #me.logMessages > 0 then
      local newHead = me.logMessages[1]
      newHead:ClearAllPoints()
      newHead:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, 0)
    end
  end

  local totalHeight = #me.logMessages * (me.messageHeight + me.messagePadding)
  scrollChild:SetHeight(math.max(totalHeight, 1))

  local autoScrollCheckBox = _G["PVPW_TestLogWindowAutoScrollCheckBox"]

  if autoScrollCheckBox and autoScrollCheckBox:GetChecked() then
    C_Timer.After(0.01, function()
      local scrollRange = scrollFrame:GetVerticalScrollRange()

      if scrollRange > 0 then
        scrollFrame:SetVerticalScroll(scrollRange)
      end
    end)
  end
end

--[[
  Create a message frame, reusing a recycled one from the pool when available

  @param {Frame} parent - Parent frame
  @param {string} message - The message to display
  @param {string} messageType - Type of message
  @param {number} storedTimestamp - Optional stored timestamp from session data

  @return {Frame} - Created message frame
]]--
function me.CreateMessageFrame(parent, message, messageType, storedTimestamp)
  local frame = table.remove(me.messageFramePool)

  if frame then
    frame:SetParent(parent)
    frame:SetWidth(parent:GetWidth())
    frame:Show()
  else
    frame = CreateFrame("Frame", nil, parent)
    frame:SetHeight(me.messageHeight)
    frame:SetWidth(parent:GetWidth())

    frame.timestamp = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.timestamp:SetPoint("LEFT", frame, "LEFT", 0, 0)
    frame.timestamp:SetTextColor(unpack(me.messageColors.TIMESTAMP))
    frame.timestamp:SetWidth(60)
    frame.timestamp:SetJustifyH("LEFT")

    frame.messageText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.messageText:SetPoint("LEFT", frame.timestamp, "RIGHT", 5, 0)
    frame.messageText:SetPoint("RIGHT", frame, "RIGHT", -5, 0)
    frame.messageText:SetJustifyH("LEFT")
  end

  local timestampText
  if storedTimestamp and storedTimestamp > 0 then
    local seconds = math.floor(storedTimestamp)
    timestampText = date("%H:%M:%S", seconds)
  else
    timestampText = date("%H:%M:%S")
  end
  frame.timestamp:SetText(timestampText)

  frame.messageText:SetText(message)

  local color = me.messageColors[messageType] or me.messageColors.INFO
  frame.messageText:SetTextColor(unpack(color))

  return frame
end

--[[
  Clear all log messages from display
]]--
function me.ClearLog()
  for _, messageFrame in ipairs(me.logMessages) do
    ReleaseMessageFrame(messageFrame)
  end

  me.logMessages = {}

  local scrollFrame = _G["PVPW_TestLogWindowScrollFrame"]
  local scrollChild = scrollFrame and scrollFrame:GetScrollChild()

  if scrollChild then
    scrollChild:SetHeight(1)
  end

  mod.logger.LogInfo(me.tag, "Test log display cleared")
end

--[[
  Show confirmation dialog for clearing all saved logs
]]--
function me.ConfirmClearAllLogs()
  StaticPopup_Show("PVPW_CONFIRM_CLEAR_ALL_LOGS")
end

--[[
  Clear all saved test logs and display
]]--
function me.ClearAllSavedLogs()
  mod.testReporter.ClearSavedTestReports()
  me.ClearLog()
  me.selectedSession = nil
  me.UpdateSessionDropdown()
  me.ShowEmptyState()
  mod.logger.LogInfo(me.tag, "All saved test logs cleared")
end

--[[
  Determine message type from the message content

  @param {string} message - The message to analyze

  @return {string} - The determined message type
]]--
function me.DetermineMessageType(message)
  if message:find("^Starting test group") or message:find("^Finished test group") then
    return "GROUP_HEADER"
  end

  if message:find("^=+$") then
    return "SEPARATOR"
  end

  if message:find("finished with status SUCCESS") then
    return "SUCCESS"
  elseif message:find("finished with status FAILURE") or message:find("Failed tests:") then
    return "FAILURE"
  end

  if message:find("Tests succeeded:") then
    return "SUCCESS"
  elseif message:find("Tests failed:") and not message:find("Tests failed: 0") then
    return "FAILURE"
  elseif message:find("Tests failed: 0") or message:find("Tests total:") then
    return "INFO"
  end

  return "INFO"
end

--[[
  Show empty state when no session is selected
]]--
function me.ShowEmptyState()
  me.ClearLog()
  me.AppendMessage("No session selected. Choose a session from the dropdown above or run a test command.", "INFO")
end

--[[
  Show current active session
]]--
function me.ShowCurrentSession()
  if not mod.testSessionManager.IsSessionActive() then
    me.ShowEmptyState()
    return
  end

  me.ClearLog()
  local currentSession = mod.testSessionManager.GetCurrentSession()
  me.AppendMessage("=== Current Active Session ===", "GROUP_HEADER")
  me.AppendMessage("Session: " .. currentSession.sessionName, "INFO")
  me.AppendMessage("Type: " .. currentSession.commandType .. " - " .. currentSession.commandCategory, "INFO")
  me.AppendMessage("Started: " .. currentSession.startTime, "INFO")
  me.AppendMessage("Status: RUNNING", "INFO")
  me.AppendMessage("", "SEPARATOR")
  me.AppendMessage("Live test output will appear below as tests execute...", "INFO")
end


--[[
  Show stored session from PVPWarnTestLog

  @param {string} groupName - Session name to display
]]--
function me.ShowStoredSession(groupName)
  if not PVPWarnTestLog or not PVPWarnTestLog[groupName] then
    me.ShowEmptyState()
    return
  end

  me.ClearLog()
  me.LoadSpecificSession(groupName)
end

--[[
  Load specific session data with sequence-based sorting

  @param {string} sessionName - Session name to load
]]--
function me.LoadSpecificSession(sessionName)
  if not PVPWarnTestLog or not PVPWarnTestLog[sessionName] then
    return
  end

  local sessionData = {}
  sessionData[sessionName] = PVPWarnTestLog[sessionName]

  -- Extract and sort all messages by sequence number
  local allMessages = extractAllMessages(sessionData)
  local sortedMessages = sortMessagesBySequence(allMessages)

  -- Display messages in chronological order
  for _, msgData in ipairs(sortedMessages) do
    local messageType = msgData.messageType or me.DetermineMessageType(msgData.message)
    me.AppendMessage(msgData.message, messageType, msgData.timestamp)
  end

  me.AppendMessage("", "SEPARATOR")
end

--[[
  Update dropdown entries and button text when sessions or the selection change
]]--
function me.UpdateSessionDropdown()
  if sessionDropdown then
    sessionDropdown:GenerateMenu()
  end
end

--[[
  Called when a new test session starts
]]--
function me.OnSessionStart()
  -- Auto-open the test log window if it's not already visible
  local testLogWindow = _G["PVPW_TestLogWindow"]
  if testLogWindow and not testLogWindow:IsShown() then
    me.Show()
  end

  -- Clear current window content
  me.ClearLog()

  -- Select the current session before regenerating so the button text reflects it
  if mod.testSessionManager and mod.testSessionManager.IsSessionActive() then
    me.selectedSession = "current"
  end

  me.UpdateSessionDropdown()

  if me.selectedSession == "current" then
    if sessionDropdown then
      -- Disable dropdown while session is running
      sessionDropdown:SetEnabled(false)
    end
    me.ShowCurrentSession()
  end
end

--[[
  Called when a test session ends

  @param {string} completedSessionName - Name of the session that just completed
]]--
function me.OnSessionEnd(completedSessionName)
  -- Re-enable dropdown when session ends
  if sessionDropdown then
    sessionDropdown:SetEnabled(true)
  end

  -- Add a small delay to allow TestReporter to finish writing to PVPWarnTestLog
  C_Timer.After(0.1, function()
    -- Preselect the just-completed session if it exists in PVPWarnTestLog
    if completedSessionName and PVPWarnTestLog and PVPWarnTestLog[completedSessionName] then
      me.selectedSession = "session_" .. completedSessionName
      me.UpdateSessionDropdown()
      me.ShowStoredSession(completedSessionName)
    else
      me.selectedSession = nil
      me.UpdateSessionDropdown()
      me.ShowEmptyState()
    end
  end)
end

--[[
  Return a message frame to the pool so it can be reused instead of stranding the
  underlying UI regions (WoW never garbage-collects frames or font strings)

  @param {Frame} messageFrame - The message frame to recycle
]]--
ReleaseMessageFrame = function(messageFrame)
  messageFrame:Hide()
  messageFrame:ClearAllPoints()
  messageFrame:SetParent(nil)
  table.insert(me.messageFramePool, messageFrame)
end

-- StaticPopup for confirming clear all logs action
StaticPopupDialogs["PVPW_CONFIRM_CLEAR_ALL_LOGS"] = {
  text = "Are you sure you want to delete ALL saved test logs?\n\nThis action cannot be undone!",
  button1 = "Yes, Delete All",
  button2 = "Cancel",
  OnAccept = function()
    mod.testLogWindow.ClearAllSavedLogs()
  end,
  timeout = 0,
  whileDead = true,
  hideOnEscape = true,
  preferredIndex = 3, -- avoid taint issues
}
