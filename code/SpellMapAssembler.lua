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

--[[
  Shared overlay op engine for both spell catalogs. Registers two independently tagged
  instances with identical semantics:

    mod.spellMapAssembler      - used by code/SpellMap.lua on the spellmap catalog
    mod.spellAvoidMapAssembler - used by code/SpellAvoidMap.lua on the spellavoidmap catalog

  The remove/add/replace/appendRanks rule set is encoded once in ApplyOverlay; ApplyOne and
  Validate are presentation wrappers around it (logged-and-skipped vs collected violations).
  tools/spellmap_core/assembler.py is the Python port of this file - keep the two in sync
  when changing op semantics.
]]--

local mod = rgpvpw

-- forward declaration
local ApplyOverlay
local CreateAssembler

--[[
  Violation messages for the ApplyOne flavor (sent to mod.logger.LogError). The rule
  predicates live in ApplyOverlay - these builders only differ from validateViolationMessage
  in presentation.
]]--
local applyViolationMessage = {
  removeMissing = function(category, spellId)
    return string.format(
      "overlay remove failed: spellId %d not present in category %s", spellId, tostring(category))
  end,
  addExists = function(category, spellId)
    return string.format(
      "overlay add failed: spellId %d already exists in category %s", spellId, tostring(category))
  end,
  replaceMissing = function(category, spellId)
    return string.format(
      "overlay replace failed: spellId %d not present in category %s", spellId, tostring(category))
  end,
  appendRanksMissing = function(category, baseSpellId)
    return string.format(
      "overlay appendRanks failed: spellId %d not present in category %s", baseSpellId, tostring(category))
  end,
  appendRanksMalformed = function(category, baseSpellId)
    return string.format(
      "overlay appendRanks failed: malformed rank entry under spellId %d in category %s",
      baseSpellId, tostring(category))
  end,
  appendRanksDuplicate = function(category, rankSpellId, baseSpellId)
    return string.format(
      "overlay appendRanks failed: spellId %d already in allRanks of %d in category %s",
      rankSpellId, baseSpellId, tostring(category))
  end
}

--[[
  Violation messages for the Validate flavor (collected into the errs list, prefixed with
  the overlay index so a test run can point at the offending overlay).
]]--
local validateViolationMessage = {
  removeMissing = function(overlayIndex, category, spellId)
    return string.format(
      "overlay #%d %s.remove: spellId %d not present", overlayIndex, tostring(category), spellId)
  end,
  addExists = function(overlayIndex, category, spellId)
    return string.format(
      "overlay #%d %s.add: spellId %d already exists", overlayIndex, tostring(category), spellId)
  end,
  replaceMissing = function(overlayIndex, category, spellId)
    return string.format(
      "overlay #%d %s.replace: spellId %d not present", overlayIndex, tostring(category), spellId)
  end,
  appendRanksMissing = function(overlayIndex, category, baseSpellId)
    return string.format(
      "overlay #%d %s.appendRanks: spellId %d not present", overlayIndex, tostring(category), baseSpellId)
  end,
  appendRanksMalformed = function(overlayIndex, category, baseSpellId)
    return string.format(
      "overlay #%d %s.appendRanks: malformed rank entry under spellId %d",
      overlayIndex, tostring(category), baseSpellId)
  end,
  appendRanksDuplicate = function(overlayIndex, category, rankSpellId, baseSpellId)
    return string.format(
      "overlay #%d %s.appendRanks: spellId %d already in allRanks of %d",
      overlayIndex, tostring(category), rankSpellId, baseSpellId)
  end
}

--[[
  The single encoding of the overlay op rule set. Applies one overlay to a working map in
  place, in the order remove, add, replace, appendRanks. Every rule violation is reported
  through onViolation and the op is skipped; valid ops are applied. Added/replaced spellData
  and appended rank entries are cloned so the overlay tables are never aliased or mutated.

  @param {table} map
    The working map; mutated.
  @param {table} overlay
    The overlay to apply.
  @param {function} onViolation
    Called as onViolation(kind, category, primaryId, secondaryId) where kind is a key of the
    violation message tables above. secondaryId is only set for appendRanksDuplicate.
]]--
ApplyOverlay = function(map, overlay, onViolation)
  for category, ops in pairs(overlay) do
    if map[category] == nil then
      map[category] = {}
    end

    if ops.remove ~= nil then
      for _, spellId in ipairs(ops.remove) do
        if map[category][spellId] == nil then
          onViolation("removeMissing", category, spellId)
        else
          map[category][spellId] = nil
        end
      end
    end

    if ops.add ~= nil then
      for spellId, spellData in pairs(ops.add) do
        if map[category][spellId] ~= nil then
          onViolation("addExists", category, spellId)
        else
          map[category][spellId] = mod.common.Clone(spellData)
        end
      end
    end

    if ops.replace ~= nil then
      for spellId, spellData in pairs(ops.replace) do
        if map[category][spellId] == nil then
          onViolation("replaceMissing", category, spellId)
        else
          map[category][spellId] = mod.common.Clone(spellData)
        end
      end
    end

    if ops.appendRanks ~= nil then
      for baseSpellId, ranksToAppend in pairs(ops.appendRanks) do
        local entry = map[category][baseSpellId]

        if entry == nil then
          onViolation("appendRanksMissing", category, baseSpellId)
        else
          if entry.allRanks == nil then
            entry.allRanks = {}
          end

          local existing = {}

          for _, r in ipairs(entry.allRanks) do
            if type(r) == "table" and type(r.spellId) == "number" then
              existing[r.spellId] = true
            end
          end

          for _, rank in ipairs(ranksToAppend) do
            if type(rank) ~= "table" or type(rank.spellId) ~= "number" then
              onViolation("appendRanksMalformed", category, baseSpellId)
            elseif existing[rank.spellId] then
              onViolation("appendRanksDuplicate", category, rank.spellId, baseSpellId)
            else
              table.insert(entry.allRanks, mod.common.Clone(rank))
              existing[rank.spellId] = true
            end
          end
        end
      end
    end
  end
end

--[[
  Build an assembler instance. Both instances share ApplyOverlay; the tag only feeds the
  LogError calls so a violation names the catalog it happened in.

  @param {string} tag
    Log tag for the instance.

  @return {table}
    The assembler module table.
]]--
CreateAssembler = function(tag)
  local me = {}

  me.tag = tag

  --[[
    Apply a list of branch overlays to a base spell map.

    Each overlay is `{ [category] = { remove = { spellId, ... }, add = { [spellId] = data, ... },
    replace = { [spellId] = data, ... }, appendRanks = { [baseSpellId] = { { spellId, type }, ... } } } }`.
    Operations are applied per category in this order: remove, add, replace, appendRanks.

    - remove: spellId must exist in the working map for that category; otherwise the op is logged and skipped.
    - add: spellId must NOT exist in the working map for that category; otherwise logged and skipped.
    - replace: spellId must exist in the working map for that category; otherwise logged and skipped.
    - appendRanks: baseSpellId must exist in the working map for that category; each rank entry's
      spellId must NOT already be in the base entry's allRanks; otherwise logged and skipped. Use
      this to add new ranks (e.g. TBC rank 6 of Healing Stream Totem) to an existing Classic entry
      without duplicating the whole entry via replace.

    Overlays are applied in the order given. The function does not mutate base or any overlay.

    @param {table} base
      The base spell map keyed by category, e.g. mod.spellMapBase.GetMap().
    @param {table | nil} overlays
      A list (array) of overlay tables. May be nil or empty.

    @return {table}
      A new spell map with all overlays applied.
  ]]--
  function me.Apply(base, overlays)
    local result = mod.common.Clone(base)

    if overlays == nil then
      return result
    end

    for _, overlay in ipairs(overlays) do
      me.ApplyOne(result, overlay)
    end

    return result
  end

  --[[
    Apply a single overlay to a working map in place. Exposed for tests.

    @param {table} map
      The working map; mutated.
    @param {table} overlay
      The overlay to apply.
  ]]--
  function me.ApplyOne(map, overlay)
    ApplyOverlay(map, overlay, function(kind, category, primaryId, secondaryId)
      mod.logger.LogError(me.tag, applyViolationMessage[kind](category, primaryId, secondaryId))
    end)
  end

  --[[
    Synthesize `{ refId = <primarySpellId> }` rank-alias entries from each primary entry's
    allRanks array. Intended to run on an assembled map after Apply, so ranks appended by
    overlay appendRanks ops are covered. The primaries' allRanks arrays are the single source
    of truth for rank aliases - the data files carry no hand-written alias entries.

    A rank spellId equal to the primary's own key is skipped. A rank spellId that already has
    an entry in the category is a conflict (another primary or an alias to a different
    primary); the conflict is logged and the existing entry is left untouched.

    @param {table} map
      The assembled map keyed by category; mutated in place.
  ]]--
  function me.SynthesizeRankAliases(map)
    for category, spells in pairs(map) do
      local primaries = {}

      for spellId, spellData in pairs(spells) do
        if spellData.refId == nil and spellData.allRanks ~= nil then
          primaries[spellId] = spellData
        end
      end

      for primarySpellId, spellData in pairs(primaries) do
        for _, rank in ipairs(spellData.allRanks) do
          if type(rank) == "table" and type(rank.spellId) == "number"
              and rank.spellId ~= primarySpellId then
            local existing = spells[rank.spellId]

            if existing == nil then
              spells[rank.spellId] = { refId = primarySpellId }
            elseif existing.refId ~= primarySpellId then
              mod.logger.LogError(me.tag, string.format(
                "rank alias synthesis failed: spellId %d of primary %d already exists in category %s",
                rank.spellId, primarySpellId, tostring(category)))
            end
          end
        end
      end
    end
  end

  --[[
    Validate one or more overlays against a base map without mutating either side. Returns the
    full list of rule violations so a test run can show every problem at once instead of failing
    on the first.

    @param {table} base
    @param {table} overlays
      List of overlay tables.

    @return ({boolean}, {table | nil})
      ok, errs - errs is a list of strings when not ok; nil otherwise.
  ]]--
  function me.Validate(base, overlays)
    if overlays == nil then
      return true, nil
    end

    local errs = {}
    local working = mod.common.Clone(base)

    for overlayIndex, overlay in ipairs(overlays) do
      ApplyOverlay(working, overlay, function(kind, category, primaryId, secondaryId)
        table.insert(errs, validateViolationMessage[kind](overlayIndex, category, primaryId, secondaryId))
      end)
    end

    if #errs == 0 then
      return true, nil
    end

    return false, errs
  end

  return me
end

mod.spellMapAssembler = CreateAssembler("SpellMapAssembler")
mod.spellAvoidMapAssembler = CreateAssembler("SpellAvoidMapAssembler")
