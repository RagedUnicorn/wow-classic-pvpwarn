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

local mod = rgpvpw
local me = {}
mod.testCombatEventsSelfAvoidShamanTbc = me

me.tag = "TestCombatEventsSelfAvoidShamanTbc"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent shaman")
    return
  end

  me.CollectTestCases()

  mod.testReporter.PlayTestQueueWithDelay(function()
    if type(completionCallback) == "function" then
      completionCallback()
    end
  end)
end

local function rel(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissed(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, mt)
end
local function irr(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_SELF, mt)
end

local entries = {
  { id = 25454, fnName = "EarthShock", spellName = "Earth Shock" },
  { id = 25457, fnName = "FlameShock", spellName = "Flame Shock" },
  { id = 25464, fnName = "FrostShock", spellName = "Frost Shock" },
}

function me.CollectTestCases()
  for _, e in ipairs(entries) do
    local prefix = "TestCombatEventSelfAvoid" .. e.fnName
    local suffix = "_" .. e.id
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Dodge" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Block" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Parry" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Miss" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Resist" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Immune" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "Reflect" .. suffix])
    mod.testReporter.AddToTestQueueImmediate(me[prefix .. "AbsorbIgnored" .. suffix])
  end
end

function me.TestCombatEventSelfAvoidEarthShockDodge_25454()
  rel("TestCombatEventSelfAvoidEarthShockDodge_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidEarthShockBlock_25454()
  rel("TestCombatEventSelfAvoidEarthShockBlock_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidEarthShockParry_25454()
  rel("TestCombatEventSelfAvoidEarthShockParry_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidEarthShockMiss_25454()
  rel("TestCombatEventSelfAvoidEarthShockMiss_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidEarthShockResist_25454()
  rel("TestCombatEventSelfAvoidEarthShockResist_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidEarthShockImmune_25454()
  rel("TestCombatEventSelfAvoidEarthShockImmune_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidEarthShockReflect_25454()
  rel("TestCombatEventSelfAvoidEarthShockReflect_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidEarthShockAbsorbIgnored_25454()
  irr("TestCombatEventSelfAvoidEarthShockAbsorbIgnored_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventSelfAvoidFlameShockDodge_25457()
  rel("TestCombatEventSelfAvoidFlameShockDodge_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidFlameShockBlock_25457()
  rel("TestCombatEventSelfAvoidFlameShockBlock_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidFlameShockParry_25457()
  rel("TestCombatEventSelfAvoidFlameShockParry_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidFlameShockMiss_25457()
  rel("TestCombatEventSelfAvoidFlameShockMiss_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidFlameShockResist_25457()
  rel("TestCombatEventSelfAvoidFlameShockResist_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidFlameShockImmune_25457()
  rel("TestCombatEventSelfAvoidFlameShockImmune_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidFlameShockReflect_25457()
  rel("TestCombatEventSelfAvoidFlameShockReflect_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidFlameShockAbsorbIgnored_25457()
  irr("TestCombatEventSelfAvoidFlameShockAbsorbIgnored_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventSelfAvoidFrostShockDodge_25464()
  rel("TestCombatEventSelfAvoidFrostShockDodge_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidFrostShockBlock_25464()
  rel("TestCombatEventSelfAvoidFrostShockBlock_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidFrostShockParry_25464()
  rel("TestCombatEventSelfAvoidFrostShockParry_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidFrostShockMiss_25464()
  rel("TestCombatEventSelfAvoidFrostShockMiss_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidFrostShockResist_25464()
  rel("TestCombatEventSelfAvoidFrostShockResist_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidFrostShockImmune_25464()
  rel("TestCombatEventSelfAvoidFrostShockImmune_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidFrostShockReflect_25464()
  rel("TestCombatEventSelfAvoidFrostShockReflect_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidFrostShockAbsorbIgnored_25464()
  irr("TestCombatEventSelfAvoidFrostShockAbsorbIgnored_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end
