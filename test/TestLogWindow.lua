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

-- luacheck: globals C_Timer CreateFrame date

local mod = rgpvpw
local me = {}
mod.testLogWindow = me

me.tag = "TestLogWindow"

-- UI elements
me.logMessages = {}
me.maxMessages = 1000
me.messageHeight = 14
me.messagePadding = 2
me.selectedSession = nil

local sessionDropdown

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
  Initialize test log window
]]--
function me.Initialize()
  me.initialized = true
  mod.logger.LogInfo(me.tag, "Test log window initialized")
end

--[[
  Create session dropdown following VoicePackMenu pattern
]]--
function me.CreateSessionDropdown(frame)
  sessionDropdown = mod.libUiDropDownMenu.CreateUiDropDownMenu("PVPW_TestLogWindowSessionDropdown", frame)
  sessionDropdown:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, -40)

  mod.libUiDropDownMenu.UiDropDownMenu_Initialize(sessionDropdown, me.SessionDropdown_Initialize)
  mod.libUiDropDownMenu.UiDropDownMenu_SetWidth(sessionDropdown, 200)
  mod.libUiDropDownMenu.UiDropDownMenu_SetText(sessionDropdown, "Select Session")
end

--[[
  Initialize session dropdown menu items
]]--
function me.SessionDropdown_Initialize()
  local info

  -- Add current session if active
  if mod.testSessionManager and mod.testSessionManager.IsSessionActive() then
    local currentSession = mod.testSessionManager.GetCurrentSession()
    info = mod.libUiDropDownMenu.UiDropDownMenu_CreateInfo()
    info.text = "Current: " .. currentSession.sessionName
    info.value = "current"
    info.func = me.SessionDropdown_OnClick
    info.checked = (me.selectedSession == "current")
    mod.libUiDropDownMenu.UiDropDownMenu_AddButton(info)
  end

  -- Add all AutoSession entries from PVPWarnTestLog
  if PVPWarnTestLog then
    for groupName, groupData in pairs(PVPWarnTestLog) do
      if type(groupData) == "table" and groupName:match("^AutoSession_") then
        info = mod.libUiDropDownMenu.UiDropDownMenu_CreateInfo()
        info.text = groupName
        info.value = "session_" .. groupName
        info.func = me.SessionDropdown_OnClick
        info.checked = (me.selectedSession == "session_" .. groupName)
        mod.libUiDropDownMenu.UiDropDownMenu_AddButton(info)
      end
    end
  end

  -- Add clear selection option
  if me.selectedSession then
    info = mod.libUiDropDownMenu.UiDropDownMenu_CreateInfo()
    info.text = "Clear Selection"
    info.value = "clear"
    info.func = me.SessionDropdown_OnClick
    mod.libUiDropDownMenu.UiDropDownMenu_AddButton(info)
  end
end

--[[
  Handle session dropdown selection
]]--
function me.SessionDropdown_OnClick(self)
  if self.value == "clear" then
    me.selectedSession = nil
    mod.libUiDropDownMenu.UiDropDownMenu_SetText(sessionDropdown, "Select Session")
    me.ShowEmptyState()
  else
    me.selectedSession = self.value

    if self.value == "current" then
      mod.libUiDropDownMenu.UiDropDownMenu_SetText(sessionDropdown, self:GetText())
      me.ShowCurrentSession()
    elseif self.value:match("^session_") then
      local groupName = self.value:gsub("^session_", "")
      mod.libUiDropDownMenu.UiDropDownMenu_SetText(sessionDropdown, self:GetText())
      me.ShowStoredSession(groupName)
    end
  end

  mod.libUiDropDownMenu.CloseDropDownMenus()
end

--[[
  Extract all messages with timestamps from the test log

  @param {table} testLog - The test log data structure
  @return {table} - Array of message objects with timestamps
]]--
local function extractAllMessages(testLog)
  local messages = {}

  -- Iterate through each test session
  for sessionName, sessionData in pairs(testLog) do
    if type(sessionData) == "table" then
      -- Check if it's a direct message entry (numbered)
      for key, value in pairs(sessionData) do
        if type(key) == "number" and type(value) == "table" and value.message and value.timestamp then
          table.insert(messages, {
            session = sessionName,
            message = value.message,
            timestamp = value.timestamp,
            sequence = value.sequence,
            messageType = value.messageType
          })
        elseif type(value) == "table" and type(key) == "string" and key:match("^Test") then
          -- This is a test case, extract its messages
          for _, testMessage in ipairs(value) do
            if type(testMessage) == "table" and testMessage.message and testMessage.timestamp then
              table.insert(messages, {
                session = sessionName,
                test = key,
                message = testMessage.message,
                timestamp = testMessage.timestamp,
                sequence = testMessage.sequence,
                messageType = testMessage.messageType
              })
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
  Process test messages from test data

  @param {table} testData - Array of test message objects
]]--
function me.ProcessTestMessages(testData)
  for _, testMessage in ipairs(testData) do
    if type(testMessage) == "table" and testMessage.message then
      local messageType = testMessage.messageType or me.DetermineMessageType(testMessage.message)
      me.AppendMessage(testMessage.message, messageType, testMessage.timestamp)
    end
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
  Hide the test log window
]]--
function me.Hide()
  local testLogWindow = _G["PVPW_TestLogWindow"]

  if testLogWindow then
    testLogWindow:Hide()
  end
end

--[[
  Toggle the test log window
]]--
function me.Toggle()
  local testLogWindow = _G["PVPW_TestLogWindow"]

  if testLogWindow and testLogWindow:IsShown() then
    me.Hide()
  else
    me.Show()
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
  local yOffset = -(#me.logMessages * (me.messageHeight + me.messagePadding))
  messageFrame:SetPoint("TOPLEFT", scrollChild, "TOPLEFT", 0, yOffset)

  table.insert(me.logMessages, messageFrame)

  if #me.logMessages > me.maxMessages then
    local oldMessage = table.remove(me.logMessages, 1)
    oldMessage:Hide()
    oldMessage:SetParent(nil)

    me.RepositionMessages()
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
  Create a message frame

  @param {Frame} parent - Parent frame
  @param {string} message - The message to display
  @param {string} messageType - Type of message
  @param {number} storedTimestamp - Optional stored timestamp from session data

  @return {Frame} - Created message frame
]]--
function me.CreateMessageFrame(parent, message, messageType, storedTimestamp)
  local frame = CreateFrame("Frame", nil, parent)
  frame:SetHeight(me.messageHeight)
  frame:SetWidth(parent:GetWidth())

  local timestamp = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  timestamp:SetPoint("LEFT", frame, "LEFT", 0, 0)

  local timestampText
  if storedTimestamp and storedTimestamp > 0 then
    local seconds = math.floor(storedTimestamp)
    timestampText = date("%H:%M:%S", seconds)
  else
    timestampText = date("%H:%M:%S")
  end
  timestamp:SetText(timestampText)

  timestamp:SetTextColor(unpack(me.messageColors.TIMESTAMP))
  timestamp:SetWidth(60)
  timestamp:SetJustifyH("LEFT")

  local messageText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  messageText:SetPoint("LEFT", timestamp, "RIGHT", 5, 0)
  messageText:SetPoint("RIGHT", frame, "RIGHT", -5, 0)
  messageText:SetText(message)
  messageText:SetJustifyH("LEFT")

  local color = me.messageColors[messageType] or me.messageColors.INFO
  messageText:SetTextColor(unpack(color))

  return frame
end

--[[
  Reposition all messages after removal
]]--
function me.RepositionMessages()
  for i, messageFrame in ipairs(me.logMessages) do
    local yOffset = -((i - 1) * (me.messageHeight + me.messagePadding))
    messageFrame:SetPoint("TOPLEFT", messageFrame:GetParent(), "TOPLEFT", 0, yOffset)
  end
end

--[[
  Clear all log messages
]]--
function me.ClearLog()
  for _, messageFrame in ipairs(me.logMessages) do
    messageFrame:Hide()
    messageFrame:SetParent(nil)
  end

  me.logMessages = {}

  local scrollChild = _G["PVPW_TestLogWindowScrollChild"]

  if scrollChild then
    scrollChild:SetHeight(1)
  end

  mod.logger.LogInfo(me.tag, "Test log cleared")
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
  Update dropdown when sessions change
]]--
function me.UpdateSessionDropdown()
  if sessionDropdown then
    mod.libUiDropDownMenu.UiDropDownMenu_Initialize(sessionDropdown, me.SessionDropdown_Initialize)
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

  -- Update dropdown to show current session
  me.UpdateSessionDropdown()

  -- Select current session and update dropdown text
  if mod.testSessionManager and mod.testSessionManager.IsSessionActive() then
    local currentSession = mod.testSessionManager.GetCurrentSession()
    me.selectedSession = "current"
    if sessionDropdown then
      mod.libUiDropDownMenu.UiDropDownMenu_SetText(sessionDropdown, "Current: " .. currentSession.sessionName)
      -- Disable dropdown while session is running
      mod.libUiDropDownMenu.UiDropDownMenu_DisableDropDown(sessionDropdown)
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
    mod.libUiDropDownMenu.UiDropDownMenu_EnableDropDown(sessionDropdown)
  end

  -- Add a small delay to allow TestReporter to finish writing to PVPWarnTestLog
  C_Timer.After(0.1, function()
    -- Update dropdown to reflect new state (reload from PVPWarnTestLog)
    me.UpdateSessionDropdown()

    -- Preselect the just-completed session if it exists in PVPWarnTestLog
    if completedSessionName and PVPWarnTestLog and PVPWarnTestLog[completedSessionName] then
      me.selectedSession = "session_" .. completedSessionName
      if sessionDropdown then
        mod.libUiDropDownMenu.UiDropDownMenu_SetText(sessionDropdown, completedSessionName)
      end
      me.ShowStoredSession(completedSessionName)
    else
      me.selectedSession = nil

      if sessionDropdown then
        mod.libUiDropDownMenu.UiDropDownMenu_SetText(sessionDropdown, "Select Session")
      end
      me.ShowEmptyState()
    end
  end)
end
