"""Lua parser for extracting spell data from PVPW_SpellMap.lua and PVPW_SpellAvoidMap.lua."""

import os
from typing import Dict, List, Optional, Set
from lupa import LuaRuntime
from .constants import SPELLMAP_RELATIVE_PATH, SPELLAVOIDMAP_RELATIVE_PATH


class LuaParser:
    """Parser for extracting spell data from the SpellMap.lua file."""

    def __init__(self, spellmap_path: Optional[str] = None, spellavoidmap_path: Optional[str] = None):
        """Initialize the parser with paths to SpellMap.lua and SpellAvoidMap.lua.

        Args:
            spellmap_path: Path to the SpellMap.lua file. If None, uses default path.
            spellavoidmap_path: Path to the SpellAvoidMap.lua file. If None, uses default path.
        """
        current_dir = os.path.dirname(os.path.abspath(__file__))

        if spellmap_path is None:
            spellmap_path = os.path.normpath(
                os.path.join(current_dir, SPELLMAP_RELATIVE_PATH)
            )

        if spellavoidmap_path is None:
            spellavoidmap_path = os.path.normpath(
                os.path.join(current_dir, SPELLAVOIDMAP_RELATIVE_PATH)
            )

        self.spellmap_path = spellmap_path
        self.spellavoidmap_path = spellavoidmap_path
        self.lua = LuaRuntime(unpack_returned_tuples=True)

    def parse_spellmap(self) -> Dict[str, List[Dict]]:
        """Parse the SpellMap.lua file and extract spell data.

        Returns:
            Dictionary mapping categories to lists of spell data
        """
        if not os.path.exists(self.spellmap_path):
            raise FileNotFoundError(f"SpellMap file not found: {self.spellmap_path}")

        # Read and execute the Lua file
        with open(self.spellmap_path, 'r', encoding='utf-8') as f:
            lua_content = f.read()

        # Create a sandboxed environment with required globals
        self.lua.execute("""
            -- Mock the addon namespace
            rgpvpw = {
                spellMap = {},
                spellAvoidMap = {},
                logger = {
                    LogError = function() end,
                    LogInfo = function() end,
                    LogDebug = function() end
                },
                common = {
                    Clone = function(t) return t end
                }
            }

            -- Initialize the lists
            PVPW_CLASSLIST = {}
            PVPW_RACELIST = {}
            PVPW_ITEMLIST = {}
            PVPW_MISCLIST = {}

            -- Add required constants
            RGPVPW_CONSTANTS = {
                UNIT_ID_PLAYER = "player",
                SPELL_TYPE_BASE = "SPELL_TYPE_BASE",
                SPELL_TYPE_SOD = "SPELL_TYPE_SOD",
                SPELL_TYPE_BS = "SPELL_TYPE_BS",
                SPELL_TYPE_TBC = "SPELL_TYPE_TBC"
            }

            -- Mock UnitFactionGroup function
            function UnitFactionGroup(unit)
                -- Return a value for parsing to continue
                return "Alliance"
            end
        """)

        # Modify the lua content to make spellMap global instead of local
        modified_content = lua_content.replace("local spellMap = {", "_G.spellMapData = {")

        # Execute the modified SpellMap content
        try:
            self.lua.execute(modified_content)
        except Exception as e:
            print(f"ERROR executing SpellMap.lua: {e}")
            raise

        # Extract the data directly from spellMap
        spell_data = {}

        # Get the spellMap variable (it's now global as spellMapData)
        spell_map = self.lua.eval("_G.spellMapData")
        if spell_map:
            # Iterate through all categories in spellMap
            for category_name in spell_map:
                category = str(category_name).lower()
                category_spells = spell_map[category_name]

                # Map categories to the expected format
                if category in ['warrior', 'priest', 'rogue', 'mage', 'hunter', 'warlock', 'paladin', 'druid', 'shaman']:
                    spell_data[f"class_{category}"] = self._extract_spells_from_map(category_spells)
                elif category == 'racials':
                    spell_data[f"race_{category}"] = self._extract_spells_from_map(category_spells)
                elif category == 'items':
                    spell_data[f"item_{category}"] = self._extract_spells_from_map(category_spells)
                elif category == 'misc':
                    spell_data[f"misc_{category}"] = self._extract_spells_from_map(category_spells)

        return spell_data

    def _extract_spells_from_map(self, spell_map) -> List[Dict]:
        """Extract spells from a category in the spell map.

        Args:
            spell_map: Lua table containing spells indexed by spell ID

        Returns:
            List of spell dictionaries
        """
        spells = []

        if not spell_map:
            return spells

        # Iterate through the spell map
        for spell_id in spell_map:
            spell = spell_map[spell_id]
            if spell and hasattr(spell, 'name'):
                spell_dict = {
                    'name': spell.name if hasattr(spell, 'name') else None,
                    'soundFileName': spell.soundFileName if hasattr(spell, 'soundFileName') else None,
                    'soundText': spell.soundText if hasattr(spell, 'soundText') else None,
                    'hasFade': spell.hasFade if hasattr(spell, 'hasFade') else False,
                    'active': spell.active if hasattr(spell, 'active') else True,
                    'spellId': int(spell_id) if spell_id else None,
                    'self_avoid': spell.self_avoid if hasattr(spell, 'self_avoid') else False,
                    'enemy_avoid': spell.enemy_avoid if hasattr(spell, 'enemy_avoid') else False,
                }

                # Only include spells with valid data
                if spell_dict['name'] and spell_dict['soundFileName']:
                    spells.append(spell_dict)

        return spells

    def parse_spellavoidmap(self) -> Dict[str, List[Dict]]:
        """Parse the SpellAvoidMap.lua file and extract spell avoid data.

        Returns:
            Dictionary mapping categories to lists of spell data
        """
        if not os.path.exists(self.spellavoidmap_path):
            raise FileNotFoundError(f"SpellAvoidMap file not found: {self.spellavoidmap_path}")

        # Read and execute the Lua file
        with open(self.spellavoidmap_path, 'r', encoding='utf-8') as f:
            lua_content = f.read()

        # Create a sandboxed environment with required globals
        self.lua.execute("""
            -- Mock the addon namespace
            rgpvpw = {
                spellMap = {},
                spellAvoidMap = {},
                logger = {
                    LogError = function() end,
                    LogInfo = function() end,
                    LogDebug = function() end
                },
                common = {
                    Clone = function(t) return t end
                }
            }

            -- Initialize the lists
            PVPW_CLASSLIST = {}
            PVPW_RACELIST = {}
            PVPW_ITEMLIST = {}
            PVPW_MISCLIST = {}

            -- Add required constants
            RGPVPW_CONSTANTS = {
                UNIT_ID_PLAYER = "player",
                SPELL_TYPE_BASE = "SPELL_TYPE_BASE",
                SPELL_TYPE_SOD = "SPELL_TYPE_SOD",
                SPELL_TYPE_BS = "SPELL_TYPE_BS",
                SPELL_TYPE_TBC = "SPELL_TYPE_TBC"
            }

            -- Mock UnitFactionGroup function
            function UnitFactionGroup(unit)
                -- Return a value for parsing to continue
                return "Alliance"
            end
        """)

        # Modify the lua content to make spellAvoidMap global instead of local
        modified_content = lua_content.replace("local spellAvoidMap = {", "_G.spellAvoidMapData = {")

        # Execute the modified SpellAvoidMap content
        self.lua.execute(modified_content)

        # Extract the data directly from spellAvoidMap
        spell_data = {}

        # Get the spellAvoidMap variable (it's now global as spellAvoidMapData)
        spell_map = self.lua.eval("_G.spellAvoidMapData")
        if spell_map:
            # Iterate through all categories in spellAvoidMap
            for category_name in spell_map:
                category = str(category_name).lower()
                category_spells = spell_map[category_name]

                # Map categories to the expected format
                if category in ['warrior', 'priest', 'rogue', 'mage', 'hunter', 'warlock', 'paladin', 'druid', 'shaman']:
                    spell_data[f"class_{category}_avoid"] = self._extract_spells_from_map(category_spells)
                elif category == 'racials':
                    spell_data[f"race_{category}_avoid"] = self._extract_spells_from_map(category_spells)
                elif category == 'items':
                    spell_data[f"item_{category}_avoid"] = self._extract_spells_from_map(category_spells)
                elif category == 'misc':
                    spell_data[f"misc_{category}_avoid"] = self._extract_spells_from_map(category_spells)

        return spell_data

    def _extract_spells(self, spell_list) -> List[Dict]:
        """Extract individual spells from a spell list.

        Args:
            spell_list: Lua table containing spell data

        Returns:
            List of spell dictionaries
        """
        spells = []

        if not spell_list:
            return spells

        # Iterate through the spell list
        for i in range(1, len(spell_list) + 1):
            spell = spell_list[i]
            if spell:
                spell_dict = {
                    'name': spell.name if hasattr(spell, 'name') else None,
                    'soundFileName': spell.soundFileName if hasattr(spell, 'soundFileName') else None,
                    'soundText': spell.soundText if hasattr(spell, 'soundText') else None,
                    'hasFade': spell.hasFade if hasattr(spell, 'hasFade') else False,
                    'active': spell.active if hasattr(spell, 'active') else True,
                    'spellId': spell.spellId if hasattr(spell, 'spellId') else None,
                    'self_avoid': spell.self_avoid if hasattr(spell, 'self_avoid') else False,
                    'enemy_avoid': spell.enemy_avoid if hasattr(spell, 'enemy_avoid') else False,
                }

                # Only include spells with valid data
                if spell_dict['name'] and spell_dict['soundFileName']:
                    spells.append(spell_dict)

        return spells

    def get_spells_for_voice_generation(self, categories: Optional[List[str]] = None) -> List[Dict]:
        """Get all spells that need voice generation.

        Args:
            categories: Optional list of categories to filter (e.g., ['warrior', 'priest'])

        Returns:
            List of spell dictionaries with metadata for voice generation
        """
        all_spell_data = self.parse_spellmap()
        spells_to_generate = []

        for category, spells in all_spell_data.items():
            # Extract the actual category name (e.g., "warrior" from "class_warrior")
            category_parts = category.split('_')
            if len(category_parts) > 1:
                category_name = category_parts[1]
            else:
                category_name = category

            # Skip if filtering by categories and this category is not in the list
            if categories and category_name.lower() not in [c.lower() for c in categories]:
                continue

            for spell in spells:
                # Skip inactive spells
                if not spell.get('active', True):
                    continue

                # Add category info for organization
                spell['full_category'] = category
                spells_to_generate.append(spell)

        return spells_to_generate

    def get_avoid_spells_for_voice_generation(self, categories: Optional[List[str]] = None) -> List[Dict]:
        """Get all avoid spells that need voice generation.

        Args:
            categories: Optional list of categories to filter (e.g., ['warrior', 'priest'])

        Returns:
            List of spell dictionaries with metadata for voice generation
        """
        all_spell_data = self.parse_spellavoidmap()
        spells_to_generate = []

        for category, spells in all_spell_data.items():
            # Extract the actual category name (e.g., "warrior" from "class_warrior_avoid")
            category_parts = category.split('_')
            if len(category_parts) > 1:
                # Remove "_avoid" suffix if present
                category_name = category_parts[1] if category_parts[-1] != 'avoid' else category_parts[1]
            else:
                category_name = category

            # Skip if filtering by categories and this category is not in the list
            if categories and category_name.lower() not in [c.lower() for c in categories]:
                continue

            for spell in spells:
                # Only include spells that have either self_avoid or enemy_avoid
                if not (spell.get('self_avoid', False) or spell.get('enemy_avoid', False)):
                    continue

                # Add category info for organization
                spell['full_category'] = category
                spells_to_generate.append(spell)

        return spells_to_generate

    def get_voice_files_with_text(self, categories: Optional[List[str]] = None) -> List[Dict[str, str]]:
        """Get a list of voice files needed with their text content.

        Args:
            categories: Optional list of categories to filter (e.g., ['warrior', 'priest'])

        Returns:
            List of dictionaries with 'file_name' and 'text' keys
        """
        # Get spells from both maps
        regular_spells = self.get_spells_for_voice_generation(categories)
        avoid_spells = self.get_avoid_spells_for_voice_generation(categories)

        voice_files = []
        seen_files = set()

        # Process regular spells
        for spell in regular_spells:
            sound_file = spell.get('soundFileName')
            spell_name = spell.get('name')
            sound_text = spell.get('soundText')

            if sound_file and spell_name:
                # Add normal version
                if sound_file not in seen_files:
                    # Extract category name from full_category (e.g., "warrior" from "class_warrior")
                    full_category = spell.get('full_category', '')
                    category_parts = full_category.split('_')
                    category = category_parts[1] if len(category_parts) > 1 else full_category
                    
                    # Use soundText if available, otherwise use spell name
                    voice_text = sound_text if sound_text else spell_name

                    voice_files.append({
                        'file_name': sound_file,
                        'text': voice_text,
                        'has_fade': spell.get('hasFade', False),
                        'category': category
                    })
                    seen_files.add(sound_file)

                # Add fade version if needed
                if spell.get('hasFade', False):
                    fade_file = f"{sound_file}_down"
                    if fade_file not in seen_files:
                        # Extract category name from full_category (e.g., "warrior" from "class_warrior")
                        full_category = spell.get('full_category', '')
                        category_parts = full_category.split('_')
                        category = category_parts[1] if len(category_parts) > 1 else full_category
                        
                        # Use soundText if available, otherwise use spell name
                        voice_text = sound_text if sound_text else spell_name

                        voice_files.append({
                            'file_name': fade_file,
                            'text': f"{voice_text} down",
                            'has_fade': False,  # This is already the fade version
                            'category': category
                        })
                        seen_files.add(fade_file)

        # Process avoid spells
        for spell in avoid_spells:
            sound_file = spell.get('soundFileName')
            spell_name = spell.get('name')
            sound_text = spell.get('soundText')

            if sound_file and spell_name:
                # Use soundText if available, otherwise use spell name
                voice_text = sound_text if sound_text else spell_name
                
                # Add enemy avoid version
                if spell.get('enemy_avoid', False):
                    enemy_file = f"enemy_avoided_{sound_file}"
                    if enemy_file not in seen_files:
                        # Extract category name from full_category (e.g., "warrior" from "class_warrior_avoid")
                        full_category = spell.get('full_category', '')
                        category_parts = full_category.split('_')
                        # Remove '_avoid' suffix if present
                        category = category_parts[1] if len(category_parts) > 1 else full_category

                        voice_files.append({
                            'file_name': enemy_file,
                            'text': f"enemy avoided {voice_text}",
                            'has_fade': False,
                            'category': category,
                            'subcategory': 'enemy_avoid'
                        })
                        seen_files.add(enemy_file)

                # Add self avoid version
                if spell.get('self_avoid', False):
                    self_file = f"you_avoided_{sound_file}"
                    if self_file not in seen_files:
                        # Extract category name from full_category (e.g., "warrior" from "class_warrior_avoid")
                        full_category = spell.get('full_category', '')
                        category_parts = full_category.split('_')
                        # Remove '_avoid' suffix if present
                        category = category_parts[1] if len(category_parts) > 1 else full_category

                        voice_files.append({
                            'file_name': self_file,
                            'text': f"you avoided {voice_text}",
                            'has_fade': False,
                            'category': category,
                            'subcategory': 'self_avoid'
                        })
                        seen_files.add(self_file)

        return voice_files

    def get_unique_voice_files_needed(self, categories: Optional[List[str]] = None) -> Set[str]:
        """Get a set of unique voice files that need to be generated.

        Args:
            categories: Optional list of categories to filter (e.g., ['warrior', 'priest'])

        Returns:
            Set of unique sound file names (without extension)
        """
        voice_files = set()

        # Get files from get_voice_files_with_text which handles both regular and avoid spells
        all_voice_data = self.get_voice_files_with_text(categories)

        for voice_data in all_voice_data:
            file_name = voice_data.get('file_name')
            if file_name:
                # Remove extension if present
                base_name = os.path.splitext(file_name)[0]
                voice_files.add(base_name)

        return voice_files
