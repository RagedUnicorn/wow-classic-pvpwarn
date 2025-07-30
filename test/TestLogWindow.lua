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

-- Metadata keys that should be excluded from message processing
local METADATA_KEYS = {
  testCount = true,
  testSuccess = true,
  testFailure = true
}

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
  Load test logs from PVPWarnTestLog SavedVariable
]]--
function me.LoadTestLogs()
  if not PVPWarnTestLog then return end

  me.ClearLog()

  for groupName, groupData in pairs(PVPWarnTestLog) do
    if type(groupData) == "table" then
      me.AppendMessage("=== Test Group: " .. groupName .. " ===", "GROUP_HEADER")

      if groupData.testCount then
        me.AppendMessage(string.format("Total: %d, Success: %d, Failure: %d",
          groupData.testCount or 0,
          groupData.testSuccess or 0,
          groupData.testFailure or 0), "INFO")
      end

      for _, message in ipairs(groupData) do
        if type(message) == "string" then
          local messageType = me.DetermineMessageType(message)
          me.AppendMessage(message, messageType)
        end
      end

      for testName, testData in pairs(groupData) do
        if type(testData) == "table" and not METADATA_KEYS[testName] then
          me.ProcessTestMessages(testData)
        end
      end

      me.AppendMessage("", "SEPARATOR")
    end
  end
end

--[[
  Process test messages from test data

  @param {table} testData - Array of test messages
]]--
function me.ProcessTestMessages(testData)
  for _, testMessage in ipairs(testData) do
    if type(testMessage) == "string" then
      local messageType = me.DetermineMessageType(testMessage)
      me.AppendMessage(testMessage, messageType)
    end
  end
end

--[[
  Add a single new message to the window without clearing existing content

  @param {string} message - The message to add
  @param {string} messageType - Type of message (SUCCESS, FAILURE, INFO, etc.)
]]--
function me.AppendMessage(message, messageType)
  if not message or message == "" then
    return
  end

  local lines = {}

  for line in string.gmatch(message, "[^\r\n]+") do
    table.insert(lines, line)
  end

  if #lines == 0 then
    local messageTypeToUse = messageType or me.DetermineMessageType(message)
    me.AddLogMessage(message, messageTypeToUse)
  else
    for _, line in ipairs(lines) do
      local messageTypeToUse = messageType or me.DetermineMessageType(line)
      me.AddLogMessage(line, messageTypeToUse)
    end
  end
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

  testLogWindow:Show()
  testLogWindow:ClearAllPoints()

  mod.guiHelper.LoadFramePosition(testLogWindow, "PVPW_TestLogWindow")
  me.LoadTestLogs()
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
]]--
function me.AddLogMessage(message, messageType)
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

  local messageFrame = me.CreateMessageFrame(scrollChild, message, messageType)
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

  @return {Frame} - Created message frame
]]--
function me.CreateMessageFrame(parent, message, messageType)
  local frame = CreateFrame("Frame", nil, parent)
  frame:SetHeight(me.messageHeight)
  frame:SetWidth(parent:GetWidth())

  local timestamp = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
  timestamp:SetPoint("LEFT", frame, "LEFT", 0, 0)
  timestamp:SetText(date("%H:%M:%S"))
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
  elseif message:find("Tests failed:") then
    return "FAILURE"
  end

  return "INFO"
end
