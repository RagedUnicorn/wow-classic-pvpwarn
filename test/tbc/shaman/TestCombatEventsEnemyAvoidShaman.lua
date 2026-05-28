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
mod.testCombatEventsEnemyAvoidShamanTbc = me

me.tag = "TestCombatEventsEnemyAvoidShamanTbc"

local testCategory = "shaman"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent shaman")
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
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, mt)
end
local function irr(name, id, spellName, mt)
  mod.testHelper.TestCombatEventSpellMissedIrrelevant(name, testCategory, id, spellName,
    RGPVPW_CONSTANTS.SPELL_TYPES.MISSED_ENEMY, mt)
end

local entries = {
  { id = 25454, fnName = "EarthShock", spellName = "Earth Shock" },
  { id = 25457, fnName = "FlameShock", spellName = "Flame Shock" },
  { id = 25464, fnName = "FrostShock", spellName = "Frost Shock" },
}

function me.CollectTestCases()
  for _, e in ipairs(entries) do
    local prefix = "TestCombatEventEnemyAvoid" .. e.fnName
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

function me.TestCombatEventEnemyAvoidEarthShockDodge_25454()
  rel("TestCombatEventEnemyAvoidEarthShockDodge_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidEarthShockBlock_25454()
  rel("TestCombatEventEnemyAvoidEarthShockBlock_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidEarthShockParry_25454()
  rel("TestCombatEventEnemyAvoidEarthShockParry_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidEarthShockMiss_25454()
  rel("TestCombatEventEnemyAvoidEarthShockMiss_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidEarthShockResist_25454()
  rel("TestCombatEventEnemyAvoidEarthShockResist_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidEarthShockImmune_25454()
  rel("TestCombatEventEnemyAvoidEarthShockImmune_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidEarthShockReflect_25454()
  rel("TestCombatEventEnemyAvoidEarthShockReflect_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_25454()
  irr("TestCombatEventEnemyAvoidEarthShockAbsorbIgnored_25454", 25454, "Earth Shock", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventEnemyAvoidFlameShockDodge_25457()
  rel("TestCombatEventEnemyAvoidFlameShockDodge_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidFlameShockBlock_25457()
  rel("TestCombatEventEnemyAvoidFlameShockBlock_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidFlameShockParry_25457()
  rel("TestCombatEventEnemyAvoidFlameShockParry_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidFlameShockMiss_25457()
  rel("TestCombatEventEnemyAvoidFlameShockMiss_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidFlameShockResist_25457()
  rel("TestCombatEventEnemyAvoidFlameShockResist_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidFlameShockImmune_25457()
  rel("TestCombatEventEnemyAvoidFlameShockImmune_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidFlameShockReflect_25457()
  rel("TestCombatEventEnemyAvoidFlameShockReflect_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_25457()
  irr("TestCombatEventEnemyAvoidFlameShockAbsorbIgnored_25457", 25457, "Flame Shock", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventEnemyAvoidFrostShockDodge_25464()
  rel("TestCombatEventEnemyAvoidFrostShockDodge_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidFrostShockBlock_25464()
  rel("TestCombatEventEnemyAvoidFrostShockBlock_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidFrostShockParry_25464()
  rel("TestCombatEventEnemyAvoidFrostShockParry_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidFrostShockMiss_25464()
  rel("TestCombatEventEnemyAvoidFrostShockMiss_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidFrostShockResist_25464()
  rel("TestCombatEventEnemyAvoidFrostShockResist_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidFrostShockImmune_25464()
  rel("TestCombatEventEnemyAvoidFrostShockImmune_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidFrostShockReflect_25464()
  rel("TestCombatEventEnemyAvoidFrostShockReflect_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_25464()
  irr("TestCombatEventEnemyAvoidFrostShockAbsorbIgnored_25464", 25464, "Frost Shock", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end
