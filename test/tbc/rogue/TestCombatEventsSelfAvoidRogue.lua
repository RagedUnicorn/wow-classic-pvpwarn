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
mod.testCombatEventsSelfAvoidRogueTbc = me

me.tag = "TestCombatEventsSelfAvoidRogueTbc"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testselfavoidcombatevent rogue")
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
  { id = 38768, spellName = "Kick", fnName = "Kick" },
  { id = 38764, spellName = "Gouge", fnName = "Gouge" },
  { id = 26866, spellName = "Expose Armor", fnName = "ExposeArmor" },
  { id = 26839, spellName = "Garrote", fnName = "Garrote" },
  { id = 26884, spellName = "Garrote", fnName = "Garrote" },
  { id = 26867, spellName = "Rupture", fnName = "Rupture" },
}

function me.CollectTestCases()
  for _, entry in ipairs(entries) do
    local prefix = "TestCombatEventSelfAvoid" .. entry.fnName
    local suffix = "_" .. entry.id
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

function me.TestCombatEventSelfAvoidKickDodge_38768()
  rel("TestCombatEventSelfAvoidKickDodge_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidKickBlock_38768()
  rel("TestCombatEventSelfAvoidKickBlock_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidKickParry_38768()
  rel("TestCombatEventSelfAvoidKickParry_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidKickMiss_38768()
  rel("TestCombatEventSelfAvoidKickMiss_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidKickResist_38768()
  rel("TestCombatEventSelfAvoidKickResist_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidKickImmune_38768()
  rel("TestCombatEventSelfAvoidKickImmune_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidKickReflect_38768()
  rel("TestCombatEventSelfAvoidKickReflect_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidKickAbsorbIgnored_38768()
  irr("TestCombatEventSelfAvoidKickAbsorbIgnored_38768", 38768, "Kick", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventSelfAvoidGougeDodge_38764()
  rel("TestCombatEventSelfAvoidGougeDodge_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidGougeBlock_38764()
  rel("TestCombatEventSelfAvoidGougeBlock_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidGougeParry_38764()
  rel("TestCombatEventSelfAvoidGougeParry_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidGougeMiss_38764()
  rel("TestCombatEventSelfAvoidGougeMiss_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidGougeResist_38764()
  rel("TestCombatEventSelfAvoidGougeResist_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidGougeImmune_38764()
  rel("TestCombatEventSelfAvoidGougeImmune_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidGougeReflect_38764()
  rel("TestCombatEventSelfAvoidGougeReflect_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidGougeAbsorbIgnored_38764()
  irr("TestCombatEventSelfAvoidGougeAbsorbIgnored_38764", 38764, "Gouge", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventSelfAvoidExposeArmorDodge_26866()
  rel(
    "TestCombatEventSelfAvoidExposeArmorDodge_26866", 26866, "Expose Armor", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventSelfAvoidExposeArmorBlock_26866()
  rel(
    "TestCombatEventSelfAvoidExposeArmorBlock_26866", 26866, "Expose Armor", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventSelfAvoidExposeArmorParry_26866()
  rel(
    "TestCombatEventSelfAvoidExposeArmorParry_26866", 26866, "Expose Armor", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventSelfAvoidExposeArmorMiss_26866()
  rel("TestCombatEventSelfAvoidExposeArmorMiss_26866", 26866, "Expose Armor", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidExposeArmorResist_26866()
  rel(
    "TestCombatEventSelfAvoidExposeArmorResist_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventSelfAvoidExposeArmorImmune_26866()
  rel(
    "TestCombatEventSelfAvoidExposeArmorImmune_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventSelfAvoidExposeArmorReflect_26866()
  rel(
    "TestCombatEventSelfAvoidExposeArmorReflect_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_26866()
  irr(
    "TestCombatEventSelfAvoidExposeArmorAbsorbIgnored_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_26839()
  rel("TestCombatEventSelfAvoidGarroteDodge_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidGarroteBlock_26839()
  rel("TestCombatEventSelfAvoidGarroteBlock_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidGarroteParry_26839()
  rel("TestCombatEventSelfAvoidGarroteParry_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidGarroteMiss_26839()
  rel("TestCombatEventSelfAvoidGarroteMiss_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidGarroteResist_26839()
  rel("TestCombatEventSelfAvoidGarroteResist_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidGarroteImmune_26839()
  rel("TestCombatEventSelfAvoidGarroteImmune_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidGarroteReflect_26839()
  rel("TestCombatEventSelfAvoidGarroteReflect_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_26839()
  irr(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_26839",
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidGarroteDodge_26884()
  rel("TestCombatEventSelfAvoidGarroteDodge_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidGarroteBlock_26884()
  rel("TestCombatEventSelfAvoidGarroteBlock_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidGarroteParry_26884()
  rel("TestCombatEventSelfAvoidGarroteParry_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidGarroteMiss_26884()
  rel("TestCombatEventSelfAvoidGarroteMiss_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidGarroteResist_26884()
  rel("TestCombatEventSelfAvoidGarroteResist_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidGarroteImmune_26884()
  rel("TestCombatEventSelfAvoidGarroteImmune_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidGarroteReflect_26884()
  rel("TestCombatEventSelfAvoidGarroteReflect_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidGarroteAbsorbIgnored_26884()
  irr(
    "TestCombatEventSelfAvoidGarroteAbsorbIgnored_26884",
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventSelfAvoidRuptureDodge_26867()
  rel("TestCombatEventSelfAvoidRuptureDodge_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventSelfAvoidRuptureBlock_26867()
  rel("TestCombatEventSelfAvoidRuptureBlock_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventSelfAvoidRuptureParry_26867()
  rel("TestCombatEventSelfAvoidRuptureParry_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventSelfAvoidRuptureMiss_26867()
  rel("TestCombatEventSelfAvoidRuptureMiss_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventSelfAvoidRuptureResist_26867()
  rel("TestCombatEventSelfAvoidRuptureResist_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventSelfAvoidRuptureImmune_26867()
  rel("TestCombatEventSelfAvoidRuptureImmune_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventSelfAvoidRuptureReflect_26867()
  rel("TestCombatEventSelfAvoidRuptureReflect_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventSelfAvoidRuptureAbsorbIgnored_26867()
  irr(
    "TestCombatEventSelfAvoidRuptureAbsorbIgnored_26867",
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
