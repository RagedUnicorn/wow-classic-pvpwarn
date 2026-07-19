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
  Headless spec for code/SpellMapAssembler.lua (rgpvpw.spellMapAssembler; rgpvpw.spellAvoidMapAssembler
  is a second instance of the same engine). Uses small synthetic
  base/overlay fixtures instead of the production Base.lua, so no WoW stubs are needed beyond the
  bootstrap. mod.logger.LogError is replaced with a capturing stub per test to assert the
  logged-and-skipped error branches without reaching the chat-frame printer.
]]--

-- busted extends `assert` with .same / .equal / etc. at runtime; luacheck
-- cannot verify those fields statically. Suppress warning 143 (accessing
-- undefined field of a global variable) for this file.
-- luacheck: globals describe it setup before_each after_each
-- luacheck: ignore 143

describe("spellMapAssembler", function()
  local assembler
  local loggedErrors
  local originalLogError

  local function BuildBase()
    return {
      MAGE = {
        [116] = {
          name = "Frostbolt",
          allRanks = {
            { spellId = 116, type = "SPELL_CAST_SUCCESS" }
          }
        },
        [12472] = {
          name = "Cold Snap"
        }
      },
      PRIEST = {
        [8122] = {
          name = "Psychic Scream"
        }
      }
    }
  end

  setup(function()
    dofile("code/SpellMapAssembler.lua")
    assembler = rgpvpw.spellMapAssembler
  end)

  before_each(function()
    loggedErrors = {}
    originalLogError = rgpvpw.logger.LogError
    rgpvpw.logger.LogError = function(tag, message)
      table.insert(loggedErrors, { tag = tag, message = message })
    end
  end)

  after_each(function()
    rgpvpw.logger.LogError = originalLogError
  end)

  describe("Apply", function()
    it("returns a clone of the base map when overlays is nil", function()
      local base = BuildBase()
      local result = assembler.Apply(base, nil)

      assert.are.same(base, result)
      assert.are_not.equal(base, result)
      assert.are_not.equal(base.MAGE[116], result.MAGE[116])
    end)

    it("returns a clone of the base map when overlays is empty", function()
      local base = BuildBase()
      local result = assembler.Apply(base, {})

      assert.are.same(base, result)
      assert.are_not.equal(base, result)
    end)

    it("applies overlays in the order given", function()
      local base = BuildBase()
      local overlays = {
        { MAGE = { add = { [999] = { name = "First" } } } },
        { MAGE = { replace = { [999] = { name = "Second" } } } }
      }
      local result = assembler.Apply(base, overlays)

      assert.are.equal(0, #loggedErrors)
      assert.are.equal("Second", result.MAGE[999].name)
    end)

    it("does not mutate base or overlay tables", function()
      local base = BuildBase()
      local overlays = {
        {
          MAGE = {
            remove = { 12472 },
            add = { [999] = { name = "New Spell" } },
            replace = { [116] = { name = "Replaced Frostbolt" } },
            appendRanks = { [116] = { { spellId = 205, type = "SPELL_CAST_SUCCESS" } } }
          }
        }
      }
      local pristineBase = BuildBase()
      local pristineOverlays = {
        {
          MAGE = {
            remove = { 12472 },
            add = { [999] = { name = "New Spell" } },
            replace = { [116] = { name = "Replaced Frostbolt" } },
            appendRanks = { [116] = { { spellId = 205, type = "SPELL_CAST_SUCCESS" } } }
          }
        }
      }

      assembler.Apply(base, overlays)

      assert.are.equal(0, #loggedErrors)
      assert.are.same(pristineBase, base)
      assert.are.same(pristineOverlays, overlays)
    end)

    it("clones added spellData instead of aliasing the overlay", function()
      local base = BuildBase()
      local spellData = { name = "New Spell" }
      local result = assembler.Apply(base, { { MAGE = { add = { [999] = spellData } } } })

      assert.are_not.equal(spellData, result.MAGE[999])

      spellData.name = "Mutated"

      assert.are.equal("New Spell", result.MAGE[999].name)
    end)

    it("clones replaced spellData instead of aliasing the overlay", function()
      local base = BuildBase()
      local spellData = { name = "Replaced Frostbolt" }
      local result = assembler.Apply(base, { { MAGE = { replace = { [116] = spellData } } } })

      assert.are_not.equal(spellData, result.MAGE[116])

      spellData.name = "Mutated"

      assert.are.equal("Replaced Frostbolt", result.MAGE[116].name)
    end)
  end)

  describe("ApplyOne remove", function()
    it("removes an existing spellId from the category", function()
      local map = BuildBase()

      assembler.ApplyOne(map, { MAGE = { remove = { 12472 } } })

      assert.are.equal(0, #loggedErrors)
      assert.is_nil(map.MAGE[12472])
      assert.is_table(map.MAGE[116])
    end)

    it("logs and skips a remove for a missing spellId", function()
      local map = BuildBase()

      assembler.ApplyOne(map, { MAGE = { remove = { 424242 } } })

      assert.are.equal(1, #loggedErrors)
      assert.matches("remove failed: spellId 424242 not present in category MAGE", loggedErrors[1].message)
      assert.are.same(BuildBase(), map)
    end)
  end)

  describe("ApplyOne add", function()
    it("adds a new spellId to the category", function()
      local map = BuildBase()

      assembler.ApplyOne(map, { MAGE = { add = { [999] = { name = "New Spell" } } } })

      assert.are.equal(0, #loggedErrors)
      assert.are.equal("New Spell", map.MAGE[999].name)
    end)

    it("creates the category when adding into one absent from the map", function()
      local map = BuildBase()

      assembler.ApplyOne(map, { WARLOCK = { add = { [5782] = { name = "Fear" } } } })

      assert.are.equal(0, #loggedErrors)
      assert.are.equal("Fear", map.WARLOCK[5782].name)
    end)

    it("logs and skips an add for an already existing spellId", function()
      local map = BuildBase()

      assembler.ApplyOne(map, { MAGE = { add = { [116] = { name = "Duplicate" } } } })

      assert.are.equal(1, #loggedErrors)
      assert.matches("add failed: spellId 116 already exists in category MAGE", loggedErrors[1].message)
      assert.are.equal("Frostbolt", map.MAGE[116].name)
    end)
  end)

  describe("ApplyOne replace", function()
    it("replaces an existing spellId in the category", function()
      local map = BuildBase()

      assembler.ApplyOne(map, { MAGE = { replace = { [116] = { name = "Replaced Frostbolt" } } } })

      assert.are.equal(0, #loggedErrors)
      assert.are.equal("Replaced Frostbolt", map.MAGE[116].name)
    end)

    it("logs and skips a replace for a missing spellId", function()
      local map = BuildBase()

      assembler.ApplyOne(map, { MAGE = { replace = { [424242] = { name = "Ghost" } } } })

      assert.are.equal(1, #loggedErrors)
      assert.matches("replace failed: spellId 424242 not present in category MAGE", loggedErrors[1].message)
      assert.are.same(BuildBase(), map)
    end)
  end)

  describe("ApplyOne appendRanks", function()
    it("appends new ranks onto an existing base entry", function()
      local map = BuildBase()

      assembler.ApplyOne(map, {
        MAGE = {
          appendRanks = { [116] = { { spellId = 205, type = "SPELL_CAST_SUCCESS" } } }
        }
      })

      assert.are.equal(0, #loggedErrors)
      assert.are.equal(2, #map.MAGE[116].allRanks)
      assert.are.equal(205, map.MAGE[116].allRanks[2].spellId)
    end)

    it("clones appended rank entries instead of aliasing the overlay", function()
      local map = BuildBase()
      local rank = { spellId = 205, type = "SPELL_CAST_SUCCESS" }

      assembler.ApplyOne(map, { MAGE = { appendRanks = { [116] = { rank } } } })

      assert.are_not.equal(rank, map.MAGE[116].allRanks[2])

      rank.spellId = 424242

      assert.are.equal(205, map.MAGE[116].allRanks[2].spellId)
    end)

    it("creates allRanks when the base entry has none", function()
      local map = BuildBase()

      assembler.ApplyOne(map, {
        MAGE = {
          appendRanks = { [12472] = { { spellId = 424243, type = "SPELL_CAST_SUCCESS" } } }
        }
      })

      assert.are.equal(0, #loggedErrors)
      assert.are.equal(1, #map.MAGE[12472].allRanks)
      assert.are.equal(424243, map.MAGE[12472].allRanks[1].spellId)
    end)

    it("logs and skips appendRanks for a missing base entry", function()
      local map = BuildBase()

      assembler.ApplyOne(map, {
        MAGE = {
          appendRanks = { [424242] = { { spellId = 205, type = "SPELL_CAST_SUCCESS" } } }
        }
      })

      assert.are.equal(1, #loggedErrors)
      assert.matches("appendRanks failed: spellId 424242 not present in category MAGE", loggedErrors[1].message)
      assert.are.same(BuildBase(), map)
    end)

    it("logs and skips a rank already present in allRanks but keeps appending others", function()
      local map = BuildBase()

      assembler.ApplyOne(map, {
        MAGE = {
          appendRanks = {
            [116] = {
              { spellId = 116, type = "SPELL_CAST_SUCCESS" },
              { spellId = 205, type = "SPELL_CAST_SUCCESS" }
            }
          }
        }
      })

      assert.are.equal(1, #loggedErrors)
      assert.matches("appendRanks failed: spellId 116 already in allRanks of 116 in category MAGE",
        loggedErrors[1].message)
      assert.are.equal(2, #map.MAGE[116].allRanks)
      assert.are.equal(205, map.MAGE[116].allRanks[2].spellId)
    end)

    it("logs and skips a malformed rank entry", function()
      local map = BuildBase()

      assembler.ApplyOne(map, {
        MAGE = {
          appendRanks = { [116] = { { type = "SPELL_CAST_SUCCESS" } } }
        }
      })

      assert.are.equal(1, #loggedErrors)
      assert.matches("appendRanks failed: malformed rank entry under spellId 116 in category MAGE",
        loggedErrors[1].message)
      assert.are.equal(1, #map.MAGE[116].allRanks)
    end)
  end)

  describe("SynthesizeRankAliases", function()
    local function BuildAssembled()
      return {
        SHAMAN = {
          [10463] = {
            name = "Healing Stream Totem",
            allRanks = {
              { spellId = 5394, type = "SPELL_TYPE_BASE" },
              { spellId = 10463, type = "SPELL_TYPE_BASE" }
            }
          }
        },
        MAGE = {
          [12042] = {
            name = "Arcane Power",
            allRanks = {
              { spellId = 12042, type = "SPELL_TYPE_BASE" }
            }
          }
        }
      }
    end

    it("synthesizes an alias for every non-primary rank", function()
      local map = BuildAssembled()

      assembler.SynthesizeRankAliases(map)

      assert.are.equal(0, #loggedErrors)
      assert.are.same({ refId = 10463 }, map.SHAMAN[5394])
    end)

    it("does not alias the primary's own key", function()
      local map = BuildAssembled()

      assembler.SynthesizeRankAliases(map)

      assert.are.equal("Healing Stream Totem", map.SHAMAN[10463].name)
      assert.are.equal("Arcane Power", map.MAGE[12042].name)
      assert.is_nil(next(map.MAGE, 12042))
    end)

    it("is idempotent when the alias already matches", function()
      local map = BuildAssembled()

      assembler.SynthesizeRankAliases(map)
      assembler.SynthesizeRankAliases(map)

      assert.are.equal(0, #loggedErrors)
      assert.are.same({ refId = 10463 }, map.SHAMAN[5394])
    end)

    it("covers ranks appended by an overlay", function()
      local map = BuildAssembled()

      assembler.ApplyOne(map, {
        SHAMAN = {
          appendRanks = { [10463] = { { spellId = 25567, type = "SPELL_TYPE_TBC" } } }
        }
      })
      assembler.SynthesizeRankAliases(map)

      assert.are.equal(0, #loggedErrors)
      assert.are.same({ refId = 10463 }, map.SHAMAN[25567])
    end)

    it("logs a conflict and keeps the existing entry when a rank id is another primary", function()
      local map = BuildAssembled()
      map.SHAMAN[5394] = {
        name = "Impostor",
        allRanks = {
          { spellId = 5394, type = "SPELL_TYPE_BASE" }
        }
      }

      assembler.SynthesizeRankAliases(map)

      assert.are.equal(1, #loggedErrors)
      assert.matches("rank alias synthesis failed: spellId 5394 of primary 10463 already exists in category SHAMAN",
        loggedErrors[1].message)
      assert.are.equal("Impostor", map.SHAMAN[5394].name)
    end)

    it("logs a conflict when a rank id is already aliased to a different primary", function()
      local map = BuildAssembled()
      map.SHAMAN[5394] = { refId = 99999 }

      assembler.SynthesizeRankAliases(map)

      assert.are.equal(1, #loggedErrors)
      assert.are.same({ refId = 99999 }, map.SHAMAN[5394])
    end)

    it("skips malformed rank entries", function()
      local map = BuildAssembled()
      table.insert(map.SHAMAN[10463].allRanks, 99999)

      assembler.SynthesizeRankAliases(map)

      assert.are.equal(0, #loggedErrors)
      assert.is_nil(map.SHAMAN[99999])
    end)
  end)

  describe("Validate", function()
    it("returns ok for nil overlays", function()
      local ok, errs = assembler.Validate(BuildBase(), nil)

      assert.is_true(ok)
      assert.is_nil(errs)
    end)

    it("returns ok for overlays that only use valid ops", function()
      local overlays = {
        { MAGE = { add = { [999] = { name = "New Spell" } } } },
        { MAGE = { replace = { [999] = { name = "Second" } }, remove = { 12472 } } }
      }
      local ok, errs = assembler.Validate(BuildBase(), overlays)

      assert.is_true(ok)
      assert.is_nil(errs)
    end)

    it("collects every violation instead of stopping at the first", function()
      local overlays = {
        { MAGE = { remove = { 424242 }, add = { [116] = { name = "Duplicate" } } } },
        {
          MAGE = {
            replace = { [424242] = { name = "Ghost" } },
            appendRanks = {
              [424243] = { { spellId = 205 } },
              [116] = {
                { spellId = 116, type = "SPELL_CAST_SUCCESS" },
                { type = "SPELL_CAST_SUCCESS" }
              }
            }
          }
        }
      }
      local ok, errs = assembler.Validate(BuildBase(), overlays)

      assert.is_false(ok)
      assert.are.equal(6, #errs)

      local joined = table.concat(errs, "\n")

      assert.matches("overlay #1 MAGE.remove: spellId 424242 not present", joined)
      assert.matches("overlay #1 MAGE.add: spellId 116 already exists", joined)
      assert.matches("overlay #2 MAGE.replace: spellId 424242 not present", joined)
      assert.matches("overlay #2 MAGE.appendRanks: spellId 424243 not present", joined)
      assert.matches("overlay #2 MAGE.appendRanks: spellId 116 already in allRanks of 116", joined)
      assert.matches("overlay #2 MAGE.appendRanks: malformed rank entry under spellId 116", joined)
    end)

    it("does not mutate base or overlay tables", function()
      local base = BuildBase()
      local overlays = {
        {
          MAGE = {
            remove = { 12472 },
            add = { [999] = { name = "New Spell" } },
            appendRanks = { [116] = { { spellId = 205, type = "SPELL_CAST_SUCCESS" } } }
          }
        }
      }
      local pristineOverlays = {
        {
          MAGE = {
            remove = { 12472 },
            add = { [999] = { name = "New Spell" } },
            appendRanks = { [116] = { { spellId = 205, type = "SPELL_CAST_SUCCESS" } } }
          }
        }
      }

      assembler.Validate(base, overlays)

      assert.are.same(BuildBase(), base)
      assert.are.same(pristineOverlays, overlays)
    end)
  end)
end)
