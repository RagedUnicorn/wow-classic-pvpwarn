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
mod.spellMapAssembler = me

me.tag = "SpellMapAssembler"

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
  for category, ops in pairs(overlay) do
    if map[category] == nil then
      map[category] = {}
    end

    if ops.remove ~= nil then
      for _, spellId in ipairs(ops.remove) do
        if map[category][spellId] == nil then
          mod.logger.LogError(me.tag, string.format(
            "overlay remove failed: spellId %d not present in category %s", spellId, tostring(category)))
        else
          map[category][spellId] = nil
        end
      end
    end

    if ops.add ~= nil then
      for spellId, spellData in pairs(ops.add) do
        if map[category][spellId] ~= nil then
          mod.logger.LogError(me.tag, string.format(
            "overlay add failed: spellId %d already exists in category %s", spellId, tostring(category)))
        else
          map[category][spellId] = mod.common.Clone(spellData)
        end
      end
    end

    if ops.replace ~= nil then
      for spellId, spellData in pairs(ops.replace) do
        if map[category][spellId] == nil then
          mod.logger.LogError(me.tag, string.format(
            "overlay replace failed: spellId %d not present in category %s", spellId, tostring(category)))
        else
          map[category][spellId] = mod.common.Clone(spellData)
        end
      end
    end

    if ops.appendRanks ~= nil then
      for baseSpellId, ranksToAppend in pairs(ops.appendRanks) do
        local entry = map[category][baseSpellId]

        if entry == nil then
          mod.logger.LogError(me.tag, string.format(
            "overlay appendRanks failed: spellId %d not present in category %s",
            baseSpellId, tostring(category)))
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
              mod.logger.LogError(me.tag, string.format(
                "overlay appendRanks failed: malformed rank entry under spellId %d in category %s",
                baseSpellId, tostring(category)))
            elseif existing[rank.spellId] then
              mod.logger.LogError(me.tag, string.format(
                "overlay appendRanks failed: spellId %d already in allRanks of %d in category %s",
                rank.spellId, baseSpellId, tostring(category)))
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
  local errs = {}
  local working = mod.common.Clone(base)

  if overlays == nil then
    return true, nil
  end

  for overlayIndex, overlay in ipairs(overlays) do
    for category, ops in pairs(overlay) do
      if working[category] == nil then
        working[category] = {}
      end

      if ops.remove ~= nil then
        for _, spellId in ipairs(ops.remove) do
          if working[category][spellId] == nil then
            table.insert(errs, string.format(
              "overlay #%d %s.remove: spellId %d not present", overlayIndex, tostring(category), spellId))
          else
            working[category][spellId] = nil
          end
        end
      end

      if ops.add ~= nil then
        for spellId, spellData in pairs(ops.add) do
          if working[category][spellId] ~= nil then
            table.insert(errs, string.format(
              "overlay #%d %s.add: spellId %d already exists", overlayIndex, tostring(category), spellId))
          else
            working[category][spellId] = spellData
          end
        end
      end

      if ops.replace ~= nil then
        for spellId, spellData in pairs(ops.replace) do
          if working[category][spellId] == nil then
            table.insert(errs, string.format(
              "overlay #%d %s.replace: spellId %d not present", overlayIndex, tostring(category), spellId))
          else
            working[category][spellId] = spellData
          end
        end
      end

      if ops.appendRanks ~= nil then
        for baseSpellId, ranksToAppend in pairs(ops.appendRanks) do
          local entry = working[category][baseSpellId]

          if entry == nil then
            table.insert(errs, string.format(
              "overlay #%d %s.appendRanks: spellId %d not present",
              overlayIndex, tostring(category), baseSpellId))
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
                table.insert(errs, string.format(
                  "overlay #%d %s.appendRanks: malformed rank entry under spellId %d",
                  overlayIndex, tostring(category), baseSpellId))
              elseif existing[rank.spellId] then
                table.insert(errs, string.format(
                  "overlay #%d %s.appendRanks: spellId %d already in allRanks of %d",
                  overlayIndex, tostring(category), rank.spellId, baseSpellId))
              else
                table.insert(entry.allRanks, rank)
                existing[rank.spellId] = true
              end
            end
          end
        end
      end
    end
  end

  if #errs == 0 then
    return true, nil
  end

  return false, errs
end
