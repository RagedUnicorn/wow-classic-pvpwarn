--[[
  MIT License

  Copyright (c) 2026 Michael Wiesendanger

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

--[[
  Headless spec for code/Comm.lua (rgpvpw.comm), the version broadcast and update notice.

  The module broadcasts the running version over GUILD/RAID/PARTY/INSTANCE_CHAT on roster edges (with a
  cooldown so GROUP_ROSTER_UPDATE bursts stay within the native per-prefix throttle) and, on
  CHAT_MSG_ADDON, shows the localized update notice once per session when a strictly newer
  version is seen from another player, persisting it in PVPWarnConfiguration.lastNotifiedVersion.

  The WoW surface (C_ChatInfo, C_AddOns, UnitName, group/guild predicates, GetTime) is stubbed
  via WowStubs. code/Configuration.lua is re-dofile'd for the real SemVer comparator
  (IsVersionBefore) Comm reuses and for a fresh PVPWarnConfiguration with its defaults; Comm.lua
  is re-dofile'd in before_each to reset its file-local state (broadcast cooldown,
  notified-this-session flag). The logger's LogDebug/LogInfo are no-op'd and PrintUserMessage is
  captured because the real print path reaches mod.filter which does not exist headlessly; the
  replaced deep fields of the shared rgpvpw table are restored in after_each.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it before_each after_each
-- luacheck: ignore 143

local wowStubs = require("WowStubs")

describe("Comm", function()
  local comm
  local restoreGlobals
  -- captured C_ChatInfo traffic and update notices
  local registeredPrefixes
  local sentMessages
  local notices
  -- controllable stub state
  local clock
  local inGuild
  local inRaid
  local inGroup
  local inInstanceGroup
  -- C_Timer.After callbacks captured so the trailing broadcast fires explicitly
  local timers
  -- the client's party category values
  local PARTY_CATEGORY_HOME = 1
  local PARTY_CATEGORY_INSTANCE = 2

  -- deep fields of the shared `rgpvpw` table replaced below; busted's file insulation only
  -- snapshots the top-level `rgpvpw` reference, so restore them manually in after_each
  local originalConfiguration = rgpvpw.configuration
  local originalComm = rgpvpw.comm
  local originalL = rgpvpw.L
  local originalPrintUserMessage = rgpvpw.logger.PrintUserMessage
  local originalLogDebug = rgpvpw.logger.LogDebug
  local originalLogInfo = rgpvpw.logger.LogInfo

  before_each(function()
    registeredPrefixes = {}
    sentMessages = {}
    notices = {}
    clock = { now = 1000 }
    inGuild = false
    inRaid = false
    inGroup = false
    inInstanceGroup = false
    timers = {}

    restoreGlobals = wowStubs.install({
      C_AddOns = wowStubs.stubs.C_AddOns({ Version = "v1.2.0", Title = "PVPWarn" }),
      C_ChatInfo = {
        RegisterAddonMessagePrefix = function(prefix)
          registeredPrefixes[#registeredPrefixes + 1] = prefix
        end,
        SendAddonMessage = function(prefix, message, channel)
          sentMessages[#sentMessages + 1] = { prefix = prefix, message = message, channel = channel }
        end
      },
      UnitName = function() return "Selfplayer" end,
      IsInGuild = function() return inGuild end,
      LE_PARTY_CATEGORY_HOME = PARTY_CATEGORY_HOME,
      LE_PARTY_CATEGORY_INSTANCE = PARTY_CATEGORY_INSTANCE,
      -- inRaid / inGroup describe the home group; without a category the client also
      -- counts the instance group, which the production code must not rely on
      IsInRaid = function(category)
        if category == PARTY_CATEGORY_HOME then return inRaid end

        return inRaid or (category == nil and inInstanceGroup)
      end,
      IsInGroup = function(category)
        if category == PARTY_CATEGORY_HOME then return inGroup or inRaid end
        if category == PARTY_CATEGORY_INSTANCE then return inInstanceGroup end

        return inGroup or inRaid or inInstanceGroup
      end,
      GetTime = wowStubs.stubs.GetTime(clock),
      C_Timer = {
        After = function(delay, callback)
          timers[#timers + 1] = { delay = delay, callback = callback }
        end
      }
    })

    -- the real logger print path reaches mod.filter and C_AddOns; capture the user facing
    -- notice and silence the log noise instead
    rgpvpw.logger.PrintUserMessage = function(msg) notices[#notices + 1] = msg end
    rgpvpw.logger.LogDebug = function() end
    rgpvpw.logger.LogInfo = function() end
    rgpvpw.L = { ["update_available"] = "New version %s is available" }

    -- the real comparator (rgpvpw.configuration.IsVersionBefore) plus a fresh
    -- PVPWarnConfiguration carrying the defaults, including lastNotifiedVersion = ""
    dofile("code/Configuration.lua")
    -- fresh file-local state (broadcast cooldown, notified-this-session flag)
    dofile("code/Comm.lua")
    comm = rgpvpw.comm
  end)

  after_each(function()
    restoreGlobals()
    rgpvpw.configuration = originalConfiguration
    rgpvpw.comm = originalComm
    rgpvpw.L = originalL
    rgpvpw.logger.PrintUserMessage = originalPrintUserMessage
    rgpvpw.logger.LogDebug = originalLogDebug
    rgpvpw.logger.LogInfo = originalLogInfo
  end)

  describe("Initialize", function()
    it("registers the addon message prefix", function()
      comm.Initialize()

      assert.are.same({ RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX }, registeredPrefixes)
    end)
  end)

  describe("BroadcastVersion", function()
    it("broadcasts over GUILD and RAID when in a guild and a raid", function()
      inGuild = true
      inRaid = true

      comm.BroadcastVersion(true)

      assert.are.equal(2, #sentMessages)
      assert.are.same(
        { prefix = RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, message = "v1.2.0", channel = "GUILD" },
        sentMessages[1]
      )
      assert.are.same(
        { prefix = RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, message = "v1.2.0", channel = "RAID" },
        sentMessages[2]
      )
    end)

    it("broadcasts over GUILD and PARTY when in a guild and a party", function()
      inGuild = true
      inGroup = true

      comm.BroadcastVersion(true)

      assert.are.equal(2, #sentMessages)
      assert.are.equal("GUILD", sentMessages[1].channel)
      assert.are.equal("PARTY", sentMessages[2].channel)
    end)

    it("broadcasts over INSTANCE_CHAT only when in a battleground instance group", function()
      inInstanceGroup = true

      comm.BroadcastVersion(false)

      assert.are.equal(1, #sentMessages)
      assert.are.equal("INSTANCE_CHAT", sentMessages[1].channel)
    end)

    it("broadcasts over PARTY and INSTANCE_CHAT for a premade party in a battleground", function()
      inGroup = true
      inInstanceGroup = true

      comm.BroadcastVersion(false)

      assert.are.equal(2, #sentMessages)
      assert.are.equal("PARTY", sentMessages[1].channel)
      assert.are.equal("INSTANCE_CHAT", sentMessages[2].channel)
    end)

    it("broadcasts nothing when solo and unguilded", function()
      comm.BroadcastVersion(true)

      assert.are.same({}, sentMessages)
    end)

    it("sends to the group only when the guild is not asked for", function()
      inGuild = true
      inGroup = true

      comm.BroadcastVersion(false)

      assert.are.equal(1, #sentMessages)
      assert.are.equal("PARTY", sentMessages[1].channel)
    end)

    it("defers a broadcast within the cooldown to one trailing broadcast", function()
      inGuild = true
      inGroup = true

      comm.BroadcastVersion(true)
      assert.are.equal(2, #sentMessages)

      -- a roster burst right after the first broadcast folds into one trailing broadcast
      clock.now = clock.now + 4
      comm.BroadcastVersion(false)
      comm.BroadcastVersion(false)
      assert.are.equal(2, #sentMessages)
      assert.are.equal(1, #timers)
      assert.are.equal(6, timers[1].delay)

      clock.now = clock.now + 6
      timers[1].callback()
      assert.are.equal(3, #sentMessages)
      assert.are.equal("PARTY", sentMessages[3].channel)
    end)

    it("keeps the guild in a deferred broadcast when any folded call asked for it", function()
      inGuild = true

      comm.BroadcastVersion(false)
      comm.BroadcastVersion(true)
      comm.BroadcastVersion(false)
      assert.are.equal(1, #timers)

      clock.now = clock.now + 10
      timers[1].callback()
      assert.are.equal(1, #sentMessages)
      assert.are.equal("GUILD", sentMessages[1].channel)
    end)

    it("schedules a new trailing broadcast once the previous one fired", function()
      inGroup = true

      comm.BroadcastVersion(false)
      comm.BroadcastVersion(false)
      clock.now = clock.now + 10
      timers[1].callback()
      assert.are.equal(2, #sentMessages)

      comm.BroadcastVersion(false)
      assert.are.equal(2, #timers)
    end)

    it("sends immediately again after the cooldown elapsed", function()
      inGroup = true

      comm.BroadcastVersion(false)
      clock.now = clock.now + 60
      comm.BroadcastVersion(false)

      assert.are.equal(2, #sentMessages)
      assert.are.same({}, timers)
    end)
  end)

  describe("OnChatMsgAddon", function()
    it("notifies once for a strictly newer version and persists it", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.3.0", "GUILD", "Otherplayer")

      assert.are.same({ "New version v1.3.0 is available" }, notices)
      assert.are.equal("v1.3.0", PVPWarnConfiguration.lastNotifiedVersion)

      -- even a newer version stays silent for the rest of the session
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.4.0", "GUILD", "Otherplayer")

      assert.are.equal(1, #notices)
    end)

    it("does not suppress the very first notice on the empty string default", function()
      assert.are.equal("", PVPWarnConfiguration.lastNotifiedVersion)

      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.2.1", "PARTY", "Otherplayer")

      assert.are.equal(1, #notices)
    end)

    it("ignores an equal version", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.2.0", "GUILD", "Otherplayer")

      assert.are.same({}, notices)
    end)

    it("ignores an older version", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.1.9", "GUILD", "Otherplayer")

      assert.are.same({}, notices)
    end)

    it("ignores a foreign prefix", function()
      comm.OnChatMsgAddon("SOME_OTHER_ADDON", "v9.9.9", "GUILD", "Otherplayer")

      assert.are.same({}, notices)
    end)

    it("ignores self-sent messages, realm-qualified or not", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.3.0", "GUILD", "Selfplayer")
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.3.0", "GUILD", "Selfplayer-SomeRealm")

      assert.are.same({}, notices)
    end)

    it("does not re-nag after a reload for a version already announced", function()
      _G.PVPWarnConfiguration.lastNotifiedVersion = "v1.3.0"

      -- simulate a /reload: fresh file-local session state, persisted saved variables
      dofile("code/Comm.lua")
      comm = rgpvpw.comm

      -- the announced version and anything older than it stay silent
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.3.0", "GUILD", "Otherplayer")
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.2.5", "GUILD", "Otherplayer")
      assert.are.same({}, notices)

      -- a version newer than the announced one notifies again
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.4.0", "GUILD", "Otherplayer")
      assert.are.same({ "New version v1.4.0 is available" }, notices)
    end)

    it("accepts a version on every broadcast channel", function()
      for _, channel in ipairs({ "GUILD", "RAID", "PARTY", "INSTANCE_CHAT" }) do
        dofile("code/Comm.lua")
        comm = rgpvpw.comm
        _G.PVPWarnConfiguration.lastNotifiedVersion = ""

        comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.3.0", channel, "Otherplayer")
      end

      assert.are.equal(4, #notices)
    end)

    it("ignores a version whispered by another player", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v1.3.0", "WHISPER", "Otherplayer")

      assert.are.same({}, notices)
      assert.are.equal("", _G.PVPWarnConfiguration.lastNotifiedVersion)
    end)

    it("ignores a version followed by trailing text and persists nothing", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v99.0.0 |cFFFF0000click", "GUILD", "Otherplayer")

      assert.are.same({}, notices)
      assert.are.equal("", _G.PVPWarnConfiguration.lastNotifiedVersion)
    end)

    it("ignores an oversized message even when it is all digits", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "v99999999999999.0.0", "GUILD", "Otherplayer")

      assert.are.same({}, notices)
      assert.are.equal("", _G.PVPWarnConfiguration.lastNotifiedVersion)
    end)

    it("ignores a message that is not a string", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, nil, "GUILD", "Otherplayer")

      assert.are.same({}, notices)
    end)

    it("persists and prints the normalized version only", function()
      comm.OnChatMsgAddon(RGPVPW_CONSTANTS.ADDON_MESSAGE_PREFIX, "1.03.0", "GUILD", "Otherplayer")

      assert.are.same({ "New version v1.3.0 is available" }, notices)
      assert.are.equal("v1.3.0", _G.PVPWarnConfiguration.lastNotifiedVersion)
    end)
  end)

  describe("SetupConfiguration", function()
    it("backfills lastNotifiedVersion for saved variables from before the notifier", function()
      -- an upgraded install: spell lists and zone configuration already present so
      -- SetupConfiguration touches neither mod.profile nor mod.zone headlessly
      _G.PVPWarnConfiguration = {
        ["spellList"] = {},
        ["spellSelfAvoidList"] = {},
        ["spellEnemyAvoidList"] = {},
        ["addonZoneConfiguration"] = {}
      }

      rgpvpw.configuration.SetupConfiguration()

      assert.are.equal("", PVPWarnConfiguration.lastNotifiedVersion)
    end)
  end)

  describe("IsVersionBefore", function()
    it("compares major, minor and patch numerically with an optional v prefix", function()
      assert.is_true(rgpvpw.configuration.IsVersionBefore("v1.2.0", "v1.10.0"))
      assert.is_true(rgpvpw.configuration.IsVersionBefore("1.2.0", "v2.0.0"))
      assert.is_false(rgpvpw.configuration.IsVersionBefore("v1.2.0", "v1.2.0"))
      assert.is_false(rgpvpw.configuration.IsVersionBefore("v1.2.1", "v1.2.0"))
    end)

    it("never treats a missing or unparseable version as older", function()
      assert.is_false(rgpvpw.configuration.IsVersionBefore(nil, "v1.2.0"))
      assert.is_false(rgpvpw.configuration.IsVersionBefore("garbage", "v1.2.0"))
      assert.is_false(rgpvpw.configuration.IsVersionBefore("v1.2.0", "garbage"))
    end)
  end)
end)
