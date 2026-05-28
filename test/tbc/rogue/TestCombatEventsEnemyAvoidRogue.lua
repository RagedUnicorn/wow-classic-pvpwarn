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
mod.testCombatEventsEnemyAvoidRogueTbc = me

me.tag = "TestCombatEventsEnemyAvoidRogueTbc"

local testCategory = "rogue"

function me.Test(completionCallback)
  if not mod.testSessionManager.IsSessionActive() then
    mod.logger.LogError(me.tag, "Cannot run tests directly. Use command line interface: " ..
      "/rgpvpw testenemycombatevent rogue")
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
  { id = 38768, spellName = "Kick", fnName = "Kick" },
  { id = 38764, spellName = "Gouge", fnName = "Gouge" },
  { id = 26866, spellName = "Expose Armor", fnName = "ExposeArmor" },
  { id = 26839, spellName = "Garrote", fnName = "Garrote" },
  { id = 26884, spellName = "Garrote", fnName = "Garrote" },
  { id = 26867, spellName = "Rupture", fnName = "Rupture" },
}

function me.CollectTestCases()
  for _, entry in ipairs(entries) do
    local prefix = "TestCombatEventEnemyAvoid" .. entry.fnName
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

function me.TestCombatEventEnemyAvoidKickDodge_38768()
  rel("TestCombatEventEnemyAvoidKickDodge_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidKickBlock_38768()
  rel("TestCombatEventEnemyAvoidKickBlock_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidKickParry_38768()
  rel("TestCombatEventEnemyAvoidKickParry_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidKickMiss_38768()
  rel("TestCombatEventEnemyAvoidKickMiss_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidKickResist_38768()
  rel("TestCombatEventEnemyAvoidKickResist_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidKickImmune_38768()
  rel("TestCombatEventEnemyAvoidKickImmune_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidKickReflect_38768()
  rel("TestCombatEventEnemyAvoidKickReflect_38768", 38768, "Kick", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidKickAbsorbIgnored_38768()
  irr("TestCombatEventEnemyAvoidKickAbsorbIgnored_38768", 38768, "Kick", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB)
end

function me.TestCombatEventEnemyAvoidGougeDodge_38764()
  rel("TestCombatEventEnemyAvoidGougeDodge_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidGougeBlock_38764()
  rel("TestCombatEventEnemyAvoidGougeBlock_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidGougeParry_38764()
  rel("TestCombatEventEnemyAvoidGougeParry_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidGougeMiss_38764()
  rel("TestCombatEventEnemyAvoidGougeMiss_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidGougeResist_38764()
  rel("TestCombatEventEnemyAvoidGougeResist_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidGougeImmune_38764()
  rel("TestCombatEventEnemyAvoidGougeImmune_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidGougeReflect_38764()
  rel("TestCombatEventEnemyAvoidGougeReflect_38764", 38764, "Gouge", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidGougeAbsorbIgnored_38764()
  irr(
    "TestCombatEventEnemyAvoidGougeAbsorbIgnored_38764", 38764, "Gouge", RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidExposeArmorDodge_26866()
  rel(
    "TestCombatEventEnemyAvoidExposeArmorDodge_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE
  )
end
function me.TestCombatEventEnemyAvoidExposeArmorBlock_26866()
  rel(
    "TestCombatEventEnemyAvoidExposeArmorBlock_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK
  )
end
function me.TestCombatEventEnemyAvoidExposeArmorParry_26866()
  rel(
    "TestCombatEventEnemyAvoidExposeArmorParry_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY
  )
end
function me.TestCombatEventEnemyAvoidExposeArmorMiss_26866()
  rel(
    "TestCombatEventEnemyAvoidExposeArmorMiss_26866", 26866, "Expose Armor", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS
  )
end
function me.TestCombatEventEnemyAvoidExposeArmorResist_26866()
  rel(
    "TestCombatEventEnemyAvoidExposeArmorResist_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST
  )
end
function me.TestCombatEventEnemyAvoidExposeArmorImmune_26866()
  rel(
    "TestCombatEventEnemyAvoidExposeArmorImmune_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE
  )
end
function me.TestCombatEventEnemyAvoidExposeArmorReflect_26866()
  rel(
    "TestCombatEventEnemyAvoidExposeArmorReflect_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT
  )
end
function me.TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_26866()
  irr(
    "TestCombatEventEnemyAvoidExposeArmorAbsorbIgnored_26866",
    26866,
    "Expose Armor",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_26839()
  rel("TestCombatEventEnemyAvoidGarroteDodge_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidGarroteBlock_26839()
  rel("TestCombatEventEnemyAvoidGarroteBlock_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidGarroteParry_26839()
  rel("TestCombatEventEnemyAvoidGarroteParry_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidGarroteMiss_26839()
  rel("TestCombatEventEnemyAvoidGarroteMiss_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidGarroteResist_26839()
  rel("TestCombatEventEnemyAvoidGarroteResist_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidGarroteImmune_26839()
  rel("TestCombatEventEnemyAvoidGarroteImmune_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidGarroteReflect_26839()
  rel("TestCombatEventEnemyAvoidGarroteReflect_26839", 26839, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26839()
  irr(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26839",
    26839,
    "Garrote",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidGarroteDodge_26884()
  rel("TestCombatEventEnemyAvoidGarroteDodge_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidGarroteBlock_26884()
  rel("TestCombatEventEnemyAvoidGarroteBlock_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidGarroteParry_26884()
  rel("TestCombatEventEnemyAvoidGarroteParry_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidGarroteMiss_26884()
  rel("TestCombatEventEnemyAvoidGarroteMiss_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidGarroteResist_26884()
  rel("TestCombatEventEnemyAvoidGarroteResist_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidGarroteImmune_26884()
  rel("TestCombatEventEnemyAvoidGarroteImmune_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidGarroteReflect_26884()
  rel("TestCombatEventEnemyAvoidGarroteReflect_26884", 26884, "Garrote", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26884()
  irr(
    "TestCombatEventEnemyAvoidGarroteAbsorbIgnored_26884",
    26884,
    "Garrote",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end

function me.TestCombatEventEnemyAvoidRuptureDodge_26867()
  rel("TestCombatEventEnemyAvoidRuptureDodge_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.DODGE)
end
function me.TestCombatEventEnemyAvoidRuptureBlock_26867()
  rel("TestCombatEventEnemyAvoidRuptureBlock_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.BLOCK)
end
function me.TestCombatEventEnemyAvoidRuptureParry_26867()
  rel("TestCombatEventEnemyAvoidRuptureParry_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.PARRY)
end
function me.TestCombatEventEnemyAvoidRuptureMiss_26867()
  rel("TestCombatEventEnemyAvoidRuptureMiss_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.MISS)
end
function me.TestCombatEventEnemyAvoidRuptureResist_26867()
  rel("TestCombatEventEnemyAvoidRuptureResist_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.RESIST)
end
function me.TestCombatEventEnemyAvoidRuptureImmune_26867()
  rel("TestCombatEventEnemyAvoidRuptureImmune_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.IMMUNE)
end
function me.TestCombatEventEnemyAvoidRuptureReflect_26867()
  rel("TestCombatEventEnemyAvoidRuptureReflect_26867", 26867, "Rupture", RGPVPW_CONSTANTS.RELEVANT_MISS_TYPES.REFLECT)
end
function me.TestCombatEventEnemyAvoidRuptureAbsorbIgnored_26867()
  irr(
    "TestCombatEventEnemyAvoidRuptureAbsorbIgnored_26867",
    26867,
    "Rupture",
    RGPVPW_CONSTANTS.IRRELEVANT_MISS_TYPES.ABSORB
  )
end
