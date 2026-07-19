"""
Constants for parsing the SpellMap / SpellAvoidMap Lua source.
"""

# Lua environment setup constants
LUA_ADDON_NAMESPACE_MOCK = """
-- Mock the addon namespace
rgpvpw = {
    spellMap = {},
    logger = {
        LogError = function() end,
        LogInfo = function() end,
        LogDebug = function() end
    },
    common = {
        Clone = function(t) return t end
    }
}

-- Create RGPVPW_CONSTANTS mock
RGPVPW_CONSTANTS = {
    UNIT_ID_PLAYER = "player",
    SPELL_TYPE_SOD = "SPELL_TYPE_SOD",
    SPELL_TYPE_BASE = "SPELL_TYPE_BASE",
    SPELL_TYPE_TBC = "SPELL_TYPE_TBC",
    -- Add other constants as needed
}
"""

LUA_UNITFACTIONGROUP_MOCK = """
function UnitFactionGroup(unit)
    -- Return a value for parsing to continue
    return "Alliance"
end
"""

# Regex patterns
CATEGORY_PATTERN = r'\["(\w+)"\]\s*=\s*\{'

# Spell map markers
SPELLMAP_DEFINITION = "local spellMap = {"
SPELLMAP_GLOBAL = "_G.spellMap = {"
SPELLAVOIDMAP_DEFINITION = "local spellAvoidMap = {"
SPELLAVOIDMAP_GLOBAL = "_G.spellAvoidMap = {"
