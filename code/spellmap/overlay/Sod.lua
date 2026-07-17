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

-- luacheck: globals UnitFactionGroup

local mod = rgpvpw
local me = {}
mod.spellMapOverlaySod = me

me.tag = "SpellMapOverlaySod"

--[[
  Branch overlay applied when Season of Discovery is the active client. Contains every SoD-only
  spell PVPWarn knows about. The hunter block additionally removes the four Classic hunter trap
  primaries so the SoD-reworked traps fully take their place (their rank aliases never exist at
  overlay time - SynthesizeRankAliases runs after overlay application and only covers surviving
  primaries); everything else is a pure `add`.

  @return {table}
    Overlay table consumed by mod.spellMapAssembler.Apply.
]]--
function me.GetOverlay()
  return {
    warrior = {
      add = {
        [402911] = {
          name = "Raging Blow",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "raging_blow",
          spellIcon = "ability_hunter_swiftstrike",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 402911, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425418] = {
          name = "Consumed By Rage",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "consumed_by_rage",
          spellIcon = "spell_nature_shamanrage",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 425418, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [429765] = {
          name = "Quick Strike",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "quick_strike",
          spellIcon = "inv_axe_03",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 429765, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [402913] = {
          name = "Enraged Regeneration",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "enraged_regeneration",
          spellIcon = "ability_hunter_harass",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 402913, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [426490] = {
          name = "Rallying Cry",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "rallying_cry",
          spellIcon = "ability_warrior_commandingshout",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 426490, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [403338] = {
          name = "Intervene",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "intervene",
          spellIcon = "ability_warrior_victoryrush",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 403338, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [403215] = {
          name = "Commanding Shout",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "commanding_shout",
          spellIcon = "ability_warrior_rallyingcry",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 403215, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [426940] = {
          name = "Rampage",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "rampage",
          spellIcon = "ability_warrior_rampage",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 426940, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [403228] = {
          name = "Meathook",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "meathook",
          spellIcon = "inv_belt_18",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 403228, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [440488] = {
          name = "Shockwave",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "shockwave",
          spellIcon = "ability_warrior_shockwave",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 440488, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [440113] = {
          name = "Sudden Death",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "sudden_death",
          spellIcon = "ability_warrior_improveddisciplines",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 440113, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [461475] = {
          name = "Valor of Azeroth",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "valor_of_azeroth",
          spellIcon = "ability_warrior_innerrage",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 461475, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [402927] = {
          name = "Victory Rush",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "victory_rush",
          spellIcon = "ability_warrior_devastate",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 402927, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [412513] = {
          name = "Gladiator Stance",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "gladiator_stance",
          spellIcon = "achievement_featsofstrength_gladiator_08",
          hasFade = false,
          isStanceSpell = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED"
          },
          allRanks = {
            { spellId = 412513, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    priest = {
      add = {
        [402289] = {
          name = "Penance",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "penance",
          spellIcon = "spell_holy_penance",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 402289, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 402284, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
          -- When using offensive 402284
          -- When using healing 402289
        },
        [401946] = {
          name = "Circle of Healing",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "circle_of_healing",
          spellIcon = "spell_holy_circleofrenewal",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 401946, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [401955] = {
          name = "Shadow Word: Death",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "shadow_word_death",
          soundText = "Shadowword death",
          spellIcon = "spell_shadow_demonicfortitude",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 401955, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [402799] = {
          name = "Homunculi",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "homunculi",
          spellIcon = "spell_shadow_twistedfaith",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 402799, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [401977] = {
          name = "Shadowfiend",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "shadowfiend",
          spellIcon = "spell_shadow_shadowfiend",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 401977, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [401859] = {
          name = "Prayer of Mending",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "prayer_of_mending",
          spellIcon = "spell_holy_prayerofmendingtga",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 401859, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425204] = {
          name = "Void Plague",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "void_plague",
          spellIcon = "spell_deathknight_bloodplague",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 425204, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [431655] = {
          name = "Mind Spike",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "mind_spike",
          spellIcon = "spell_shadow_painspike",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 431655, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [402789] = {
          name = "Eye of the Void",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "eye_of_the_void",
          spellIcon = "inv_misc_eye_03",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 402789, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [431681] = {
          name = "Void Zone",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "void_zone",
          spellIcon = "inv_enchant_voidsphere",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 431681, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [402668] = {
          name = "Vampiric Touch",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "vampiric_touch",
          spellIcon = "spell_holy_stoicism",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 402668, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425284] = {
          name = "Spirit of the Redeemer",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "spirit_of_the_redeemer",
          spellIcon = "inv_enchant_essenceeternallarge",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 425284, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [431664] = {
          name = "Surge of Light",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "surge_of_light",
          spellIcon = "spell_holy_surgeoflight",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 431664, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [413248] = {
          name = "Serendipity",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "serendipity",
          spellIcon = "spell_holy_serendipity",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED",
            "SPELL_AURA_REFRESH"
          },
          allRanks = {
            { spellId = 413248, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425294] = {
          name = "Dispersion",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "dispersion",
          spellIcon = "spell_shadow_dispersion",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 425294, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [402004] = {
          name = "Pain Suppression",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "pain_suppression",
          spellIcon = "spell_holy_painsupression",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 402004, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    rogue = {
      add = {
        [398196] = {
          name = "Quick Draw",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "quick_draw",
          spellIcon = "inv_musket_02",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 398196, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [400009] = {
          name = "Between the Eyes",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "between_the_eyes",
          spellIcon = "inv_weapon_rifle_01",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 400009, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [400012] = {
          name = "Blade Dance",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "blade_dance",
          spellIcon = "ability_warrior_punishingblow",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 400012, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [399960] = {
          name = "Mutilate",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "mutilate",
          spellIcon = "ability_rogue_shadowstrikes",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 399960, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [399985] = {
          name = "Shadowstrike",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "shadowstrike",
          spellIcon = "ability_rogue_envelopingshadows",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 399985, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [424785] = {
          name = "Saber Slash",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "saber_slash",
          spellIcon = "inv_1h_haremmatron_d_01",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 424785, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [400029] = {
          name = "Shadowstep",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "shadowstep",
          spellIcon = "ability_rogue_shadowstep",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 400029, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425012] = {
          name = "Poisoned Knife",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "poisoned_knife",
          spellIcon = "ability_rogue_deadlybrew",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 425012, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [399986] = {
          name = "Shuriken Toss",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "shuriken_toss",
          spellIcon = "ability_upgrademoonglaive",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 399986, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [399963] = {
          name = "Envenom",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "envenom",
          spellIcon = "ability_rogue_disembowel",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 399963, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [424919] = {
          name = "Main Gauche",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "main_gauche",
          spellIcon = "spell_deathknight_spelldeflection",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 424919, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425096] = {
          name = "Master of Subtlety",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "master_of_subtlety",
          spellIcon = "ability_rogue_masterofsubtlety",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 425096, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [462708] = {
          name = "Cutthroat",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "cutthroat",
          spellIcon = "ability_rogue_slaughterfromtheshadows",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 462708, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [436610] = {
          name = "Blunderbuss",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "blunderbuss",
          spellIcon = "inv_musket_04",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 436610, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [412096] = {
          name = "Crimson Tempest",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "crimson_tempest",
          spellIcon = "inv_sword_17",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 412096, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409240] = {
          name = "Fan of Knives",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "fan_of_knives",
          spellIcon = "ability_rogue_fanofknives",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409240, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    mage = {
      add = {
        [400647] = {
          name = "Fingers of Frost",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "fingers_of_frost",
          spellIcon = "ability_mage_wintersgrasp",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 400647, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425121] = {
          name = "Icy Veins",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "icy_veins",
          spellIcon = "spell_frost_coldhearted",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 425121, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425124] = {
          name = "Arcane Surge",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "arcane_surge",
          spellIcon = "spell_arcane_arcanetorrent",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 425124, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [400613] = {
          name = "Living Bomb",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "living_bomb",
          spellIcon = "ability_mage_livingbomb",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 400613, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [436516] = {
          name = "Chronostatic Preservation",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "chronostatic_preservation",
          spellIcon = "spell_arcane_arcane02",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 436516, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [401556] = {
          name = "Living Flame",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "living_flame",
          spellIcon = "spell_fire_masterofelements",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 401556, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [400640] = {
          name = "Ice Lance",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "ice_lance",
          spellIcon = "spell_frost_frostblast",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 400640, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [428739] = {
          name = "Deep Freeze",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "deep_freeze",
          spellIcon = "ability_mage_deepfreeze",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 428739, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [401502] = {
          name = "Frostfire Bolt",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "frostfire_bolt",
          soundText = "Frostfirebolt",
          spellIcon = "ability_mage_frostfirebolt",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 401502, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [412532] = {
          name = "Spellfrost Bolt",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "spellfrost_bolt",
          spellIcon = "spell_fire_blueflamebolt",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 412532, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [428878] = {
          name = "Balefire Bolt",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "balefire_bolt",
          spellIcon = "spell_fire_firebolt",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 428878, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [400624] = {
          name = "Hot Streak",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "hot_streak",
          spellIcon = "ability_mage_hotstreak",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 400624, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [400731] = {
          name = "Brain Freeze",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "brain_freeze",
          spellIcon = "ability_mage_brainfreeze",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 400731, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [440802] = {
          name = "Frozen Orb",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "frozen_orb",
          spellIcon = "spell_frost_frozencore",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 440802, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    hunter = {
      remove = {
        14317,    -- Explosive Trap
        14311,    -- Freezing Trap
        14305,    -- Immolation Trap
        13809,    -- Frost Trap
      },
      add = {
        [409535] = {
          name = "Explosive Trap",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "explosive_trap",
          spellIcon = "spell_fire_selfdestruct",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409532, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 409534, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 409535, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409519] = {
          name = "Freezing Trap",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "freezing_trap",
          spellIcon = "spell_frost_chainsofice",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409510, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 409512, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 409519, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409530] = {
          name = "Immolation Trap",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "immolation_trap",
          spellIcon = "spell_fire_flameshock",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409521, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 409524, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 409526, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 409528, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 409530, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409520] = {
          name = "Frost Trap",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "frost_trap",
          spellIcon = "spell_frost_freezingbreath",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409520, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [415399] = {
          name = "Sniper Training",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "sniper_training",
          spellIcon = "ability_hunter_snipershot",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 415399, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409974] = {
          name = "Kill Shot",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "kill_shot",
          spellIcon = "ability_hunter_assassinate2",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409974, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [415320] = {
          name = "Flanking Strike",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "flanking_strike",
          spellIcon = "ability_hunter_harass",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 415320, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409433] = {
          name = "Chimera Shot",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "chimera_shot",
          spellIcon = "ability_hunter_chimerashot2",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409433, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409552] = {
          name = "Explosive Shot",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "explosive_shot",
          spellIcon = "ability_hunter_explosiveshot",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409552, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [415413] = {
          name = "Lock and Load",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "lock_and_load",
          spellIcon = "ability_hunter_lockandload",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 415413, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [440533] = {
          name = "Hit and Run",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "hit_and_run",
          spellIcon = "ability_hunter_displacement",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 440533, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [469145] = {
          name = "Aspect of the Falcon",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "aspect_of_the_falcon",
          spellIcon = "ability_hunter_pet_dragonhawk",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 469145, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [415423] = {
          name = "Aspect of the Viper",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "aspect_of_the_viper",
          spellIcon = "ability_hunter_aspectoftheviper",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 415423, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    warlock = {
      add = {
        [425463] = {
          name = "Demonic Grace",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "demonic_grace",
          spellIcon = "ability_warlock_demonicpower",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 425463, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [403501] = {
          name = "Haunt",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "haunt",
          spellIcon = "ability_warlock_haunt",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 403501, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [426195] = {
          name = "Vengeance",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "vengeance",
          spellIcon = "ability_warlock_improveddemonictactics",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 426195, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [427726] = {
          name = "Immolation Aura",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "immolation_aura",
          spellIcon = "spell_fire_felimmolation",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 427726, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [427717] = {
          name = "Unstable Affliction",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "unstable_affliction",
          spellIcon = "spell_shadow_unstableaffliction_3",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 427717, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [427713] = {
          name = "Backdraft",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "backdraft",
          spellIcon = "ability_warlock_backdraft",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 427713, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [440882] = {
          name = "Infernal Armor",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "infernal_armor",
          spellIcon = "achievement_boss_kiljaedan",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 440882, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [403789] = {
          name = "Metamorphosis",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "metamorphosis",
          spellIcon = "spell_shadow_demonform",
          hasFade = true,
          isStanceSpell = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 403789, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    paladin = {
      add = {
        [425589] = {
          name = "Aegis",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "aegis",
          spellIcon = "inv_shield_48",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 425589, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [407804] = {
          name = "Divine Sacrifice",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "divine_sacrifice",
          spellIcon = "spell_holy_powerwordbarrier",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 407804, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [407880] = {
          name = "Inspiration Exemplar",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "inspiration_exemplar",
          spellIcon = "spell_holy_power",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 407880, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [407669] = {
          name = "Avenger's Shield",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "avengers_shield",
          spellIcon = "spell_holy_avengersshield",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 407669, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425609] = {
          name = "Rebuke",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "rebuke",
          spellIcon = "inv_relics_totemofrage",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 425609, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [407676] = {
          name = "Crusader Strike",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "crusader_strike",
          spellIcon = "spell_holy_crusaderstrike",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 407676, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [407778] = {
          name = "Divine Storm",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "divine_storm",
          spellIcon = "ability_paladin_divinestorm",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 407778, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [461607] = {
          name = "Divine Steed",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "divine_steed",
          spellIcon = "spell_holy_crusaderaura",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 461607, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [462853] = {
          name = "Hand of Sacrifice",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "hand_of_sacrifice",
          spellIcon = "spell_holy_sealofsacrifice",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 462853, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409925] = {
          name = "Divine Light",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "divine_light",
          spellIcon = "spell_holy_surgeoflight",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409925, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [407788] = {
          name = "Avenging Wrath",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "avenging_wrath",
          spellIcon = "spell_holy_avenginewrath",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 407788, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    druid = {
      add = {
        [410176] = {
          name = "Skull Bash",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "skull_bash",
          spellIcon = "inv_misc_bone_taurenskull_01",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 410176, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [407988] = {
          name = "Savage Roar",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "savage_roar",
          spellIcon = "ability_druid_skinteeth",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 407988, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [414644] = {
          name = "Lacerate",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "lacerate",
          spellIcon = "ability_druid_lacerate",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 414644, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [408120] = {
          name = "Wild Growth",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "wild_growth",
          spellIcon = "ability_druid_flourish",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 408120, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [407995] = {
          name = "Mangle",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "mangle",
          spellIcon = "ability_druid_mangle2",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 407995, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [417141] = {
          name = "Berserk",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "berserk",
          spellIcon = "ability_druid_berserk",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 417141, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [408024] = {
          name = "Survival Instincts",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "survival_instincts",
          spellIcon = "ability_mount_whitedirewolf",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 408024, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [439733] = {
          name = "Tree of Life",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "tree_of_life",
          spellIcon = "ability_druid_treeoflife",
          hasFade = true,
          isStanceSpell = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 439733, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [414799] = {
          name = "Fury of Stormrage",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "fury_of_stormrage",
          spellIcon = "inv_staff_90",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 414799, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [408250] = {
          name = "Eclipse: Solar",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "eclipse_solar",
          spellIcon = "ability_druid_eclipseorange",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 408250, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [441260] = {
          name = "Eclipse: Lunar",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "eclipse_lunar",
          spellIcon = "ability_druid_eclipse",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 441260, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    shaman = {
      add = {
        [415236] = {
          name = "Healing Rain",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "healing_rain",
          spellIcon = "spell_nature_tranquility",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 415236, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409324] = {
          name = "Ancestral Guidance",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "ancestral_guidance",
          spellIcon = "ability_druid_lunarguidance",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 409324, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [408514] = {
          name = "Earth Shield",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "earth_shield",
          spellIcon = "spell_nature_skinofearth",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 408514, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [408510] = {
          name = "Water Shield",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "water_shield",
          spellIcon = "ability_shaman_watershield",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 408510, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [425874] = {
          name = "Decoy Totem",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "decoy_totem",
          spellIcon = "inv_misc_toy_04",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 425874, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [437009] = {
          name = "Totemic Projection",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "totemic_projection",
          spellIcon = "spell_shaman_totemrecall",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 437009, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [408498] = {
          name = "Maelstrom Weapon",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "maelstrom_weapon",
          spellIcon = "spell_shaman_maelstromweapon",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 408498, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [432042] = {
          name = "Tidal Waves",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "tidal_waves",
          spellIcon = "spell_shaman_tidalwaves",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 432042, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [409954] = {
          name = "Riptide",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "riptide",
          spellIcon = "spell_nature_riptide",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 409954, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [415100] = {
          name = "Power Surge",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "power_surge",
          spellIcon = "inv_misc_orb_05",
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 415100, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [440580] = {
          name = "Feral Spirit",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "feral_spirit",
          spellIcon = "spell_shaman_feralspirit",
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 440580, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        }
      }
    },
    items = {
      add = {
        --[[
          The itemId is the same for both factions, but the name and icon
          are different. The spellId is also used for the Dark Heart of Darkness
          trinket (228093) which has a different name and icon.

          Note that the opposite faction's itemId is used for the spell icon because usually
          the player will want to track the insignia of the opposing faction. It does however only
          matter for the icon, the itemId is always correct for the player faction.
        ]]--
        [438273] = {
          name = (function()
            if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
              return "Greater Insignia of the Horde"
            else
              return "Greater Insignia of the Alliance"
            end
          end)(),
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "greater_insignia",
          soundText = "Insignia",
          spellIcon = (function()
            if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
              return "inv_jewelry_trinketpvp_01" -- alliance
            else
              return "inv_jewelry_trinketpvp_02" -- horde
            end
          end)(),
          itemId = (function()
            if UnitFactionGroup(RGPVPW_CONSTANTS.UNIT_ID_PLAYER) == "Horde" then
              return 216938 -- alliance
            else
              return 216939 -- horde
            end
            -- also used for dark heart of darkness (228093)
          end)(),
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 438273, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [474386] = {
          name = "Blood-Caked Insignia",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "blood_caked_insignia",
          soundText = "Insignia",
          spellIcon = "spell_deathknight_runetap",
          itemId = 233728,
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 474386, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [429868] = {
          name = "Void-Touched Leather Gauntlets/Gloves",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "void_touched_leather_gauntlets_gloves",
          soundText = "Void madness",
          spellIcon = "inv_gauntlets_24",
          itemId = 211502,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 429868, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [428489] = {
          name = "Extraplanar Spidersilk Boots",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "extraplanar_spidersilk_boots",
          soundText = "Planar shift",
          spellIcon = "inv_boots_05",
          itemId = 210795,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 428489, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [437327] = {
          name = "Gneuro-Linked Arcano-Filament Monocle",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "gneuro_linked_arcano_filament_monocle",
          soundText = "Charged inspiration",
          spellIcon = "inv_misc_enggizmos_27",
          itemId = 215111,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 437327, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [437349] = {
          name = "Glowing Gneuro-Linked Cowl",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "glowing_gneuro_linked_cowl",
          soundText = "Gneuro logical shock",
          spellIcon = "inv_helmet_15",
          itemId = 215166,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 437349, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [437377] = {
          name = "Tempered Interference-Negating Helmet",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "tempered_interference_negating_helmet",
          soundText = "Intense concentration",
          spellIcon = "inv_helmet_49",
          itemId = 215161,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 437377, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [437357] = {
          name = "Gneuro-Conductive Channeler's Hood",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "gneuro_conductive_chanelers_hood",
          soundText = "Gneuromantic meditation",
          spellIcon = "inv_helmet_42",
          itemId = 215381,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 437357, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [437382] = {
          name = "Reflective Truesilver Braincage",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "reflective_truesilver_braincage",
          soundText = "Reinforced willpower",
          spellIcon = "inv_helmet_49",
          itemId = 215167,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 437382, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [437362] = {
          name = "Glowing Hyperconductive Scale Coif",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "glowing_hyperconductive_scale_coif",
          soundText = "Hyperconductive shock",
          spellIcon = "inv_helmet_43",
          itemId = 215114,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 437362, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [437699] = {
          name = "Hyperconductive Goldwrap",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "hyperconductive_goldwrap",
          soundText = "Coin flip",
          spellIcon = "inv_belt_32",
          itemId = 215115,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 437699, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
            { spellId = 437698, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [13494] = {
          name = "Catnip",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "catnip",
          soundText = "Haste",
          spellIcon = "inv_misc_plant_01",
          itemId = 213407,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 13494, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [436069] = {
          name = "Domesticated Attack Chicken",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "domesticated_attack_chicken",
          soundText = "Chicken",
          spellIcon = "spell_magic_polymorphchicken",
          itemId = 215461,
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 436069, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [435895] = {
          name = "Gniodine Pill Bottle",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "gniodine_pill_bottle",
          soundText = "Gniodine dispel",
          spellIcon = "inv_valentinecolognebottle",
          itemId = 213349,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 435895, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [435359] = {
          name = "Wirdal's Hardened Core",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "wirdals_hardened_core",
          soundText = "Hardened to the core",
          spellIcon = "inv_gizmo_khoriumpowercore",
          itemId = 213350,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 435359, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [461231] = {
          name = "Miniaturized Fire Extinguisher",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "miniaturized_fire_extinguisher",
          soundText = "Extinguish fire",
          spellIcon = "inv_misc_enggizmos_essencedistiller",
          itemId = 228084,
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 461231, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [461235] = {
          name = "Woodcarved Moonstalker",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "woodcarved_moonstalker",
          soundText = "Moonstalker fury",
          spellIcon = "inv_jewelcrafting_blackpearlpanther",
          itemId = 228089,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 461235, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [461227] = {
          name = "Germinating Poisonseed",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "germinating_poisonseed",
          soundText = "Guardian of nature",
          spellIcon = "inv_misc_herb_nightmareseed",
          itemId = 228081,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 461227, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [461224] = {
          name = "Accursed Chalice",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "accursed_chalice",
          spellIcon = "inv_offhand_pvealliance_d_01",
          itemId = 228078,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 461224, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [467720] = {
          name = "Mar'li's Eye",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "marlis_eye",
          spellIcon = "inv_zulgurubtrinket",
          itemId = 230920,
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 467720, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
        [461253] = {
          name = "Shadowflame Sword",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "shadowflame_sword",
          soundText = "shadowflame fury",
          spellIcon = "inv_sword_35",
          itemId = 228143,
          hasFade = true,
          active = true,
          trackedEvents = {
            "SPELL_AURA_APPLIED",
            "SPELL_AURA_REMOVED"
          },
          allRanks = {
            { spellId = 461253, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD },
          }
        },
      }
    },
    misc = {
      add = {
        [470345] = {
          name = "First Aid",
          type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD,
          soundFileName = "first_aid",
          spellIcon = "inv_misc_bandage_netherweave_heavy",
          itemId = 232433,
          hasFade = false,
          active = true,
          trackedEvents = {
            "SPELL_CAST_SUCCESS"
          },
          allRanks = {
            { spellId = 470345, type = RGPVPW_CONSTANTS.SPELL_TYPE_SOD }, -- Dense Runecloth Bandage
          }
        }
      }
    },
  }
end