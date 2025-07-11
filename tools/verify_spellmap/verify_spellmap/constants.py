"""
Constants and configuration for the SpellMap Verifier.
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
    SPELL_TYPE_BS = "SPELL_TYPE_BS",
    SPELL_TYPE_TBC = "SPELL_TYPE_TBC",
    -- Add other constants as needed
}
"""

LUA_DYNAMIC_VALUE_TRACKING = """
_G.dynamic_values = {}
_G.current_spell_id = nil
_G.current_category = nil
"""

LUA_UNITFACTIONGROUP_MOCK = """
function UnitFactionGroup(unit)
    -- Track that this spell has faction-specific properties
    if _G.current_spell_id and _G.current_category then
        if not _G.dynamic_values[_G.current_category] then
            _G.dynamic_values[_G.current_category] = {}
        end
        _G.dynamic_values[_G.current_category][_G.current_spell_id] = true
    end
    -- Return a value for parsing to continue
    return "Alliance"
end
"""

# Regex patterns
CATEGORY_PATTERN = r'\["(\w+)"\]\s*=\s*\{'
SPELL_ID_PATTERN = r'\[(\d+)\]\s*=\s*\{'
DYNAMIC_NAME_PATTERN = r'\[(\d+)\]\s*=\s*\{[^}]*name\s*=\s*\(function\(\)'
NAME_VALUE_PATTERN = r'name\s*=\s*"([^"]+)"'

# Spell map markers
SPELLMAP_DEFINITION = "local spellMap = {"
SPELLMAP_GLOBAL = "_G.spellMap = {"

# Report formatting
REPORT_WIDTH = 60
REPORT_TITLE = "SpellMap Verification Report (Lua Parser)"

# Error/Success prefixes
ERROR_PREFIX = "[ERROR]"
SUCCESS_PREFIX = "[OK]"
