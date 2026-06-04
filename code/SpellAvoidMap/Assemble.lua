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
mod.spellAvoidMapAssembler = me

me.tag = "SpellAvoidMapAssembler"

--[[
  Apply a list of branch overlays to a base spell-avoid map. See mod.spellMapAssembler.Apply for
  the full overlay shape - semantics are identical.

  @param {table} base
  @param {table | nil} overlays

  @return {table}
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
  Validate one or more overlays against a base map. Returns ok, errs.
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
