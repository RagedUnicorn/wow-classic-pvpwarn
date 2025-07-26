--[[
  MIT License

  Copyright (c) 2025 Michael Wiesendanger

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]--

RGPVPW_COLORS = {
  NONE = 0,
  YELLOW = 1,
  VIOLET = 2,
  RED = 3,
  ORANGE = 4,
  GREEN = 5,
  BLUE = 6,
  BROWN = 7,
  WHITE = 8,
  PINK = 9,
  LIGHT_BLUE = 10,

  CLASSES = {
    warrior = {0.78, 0.61, 0.43, 1},
    priest = {1.00, 1.00, 1.00, 1},
    rogue = {1.00, 0.96, 0.41, 1},
    mage = {0.25, 0.78, 0.92, 1},
    hunter = {0.67, 0.83, 0.45, 1},
    warlock = {0.53, 0.53, 0.93, 1},
    paladin = {0.96, 0.55, 0.73, 1},
    druid = {1.00, 0.49, 0.04, 1},
    shaman = {0.00, 0.44, 0.87, 1}
  },

  CATEGORIES = {
    -- Class categories
    warrior = {0.78, 0.61, 0.43, 1},
    priest = {1.00, 1.00, 1.00, 1},
    rogue = {1.00, 0.96, 0.41, 1},
    mage = {0.25, 0.78, 0.92, 1},
    hunter = {0.67, 0.83, 0.45, 1},
    warlock = {0.53, 0.53, 0.93, 1},
    paladin = {0.96, 0.55, 0.73, 1},
    druid = {1.00, 0.49, 0.04, 1},
    shaman = {0.00, 0.44, 0.87, 1},
    -- Special categories
    racials = {0.94, 0.37, 0.36, 1},
    items = {0, 0.96, 0.83, 1},
    misc = {0.47, 0.21, 0.74, 1}
  },

  -- UI state colors
  UI = {
    neutral = {0.5, 0.5, 0.5, 1},
    combat_active = {1, 0.1, 0, 0.8},
    combat_inactive = {0.5, 0.5, 0.5, 0.5},
    stance_unknown = {0.7, 0.7, 0.7, 1}
  },

  -- Visual warning colors (used for spell alerts)
  WARNINGS = {
    none = {value = 0, rgb = {0, 0, 0, 0}, name = "none"},
    yellow = {value = 1, rgb = {1, 1, 0, 1}, name = "yellow"},
    violet = {value = 2, rgb = {0.58, 0, 0.83, 1}, name = "violet"},
    red = {value = 3, rgb = {1, 0, 0, 1}, name = "red"},
    orange = {value = 4, rgb = {1, 0.65, 0, 1}, name = "orange"},
    green = {value = 5, rgb = {0, 1, 0, 1}, name = "green"},
    blue = {value = 6, rgb = {0, 0, 1, 1}, name = "blue"},
    brown = {value = 7, rgb = {0.65, 0.16, 0.16, 1}, name = "brown"},
    white = {value = 8, rgb = {1, 1, 1, 1}, name = "white"},
    pink = {value = 9, rgb = {1, 0.75, 0.8, 1}, name = "pink"},
    light_blue = {value = 10, rgb = {0.68, 0.85, 0.9, 1}, name = "light_blue"}
  },

  GetClassColor = function(className)
    if not className then return RGPVPW_COLORS.UI.neutral end
    return RGPVPW_COLORS.CLASSES[string.lower(className)] or RGPVPW_COLORS.UI.neutral
  end,

  GetCategoryColor = function(categoryName)
    if not categoryName then return RGPVPW_COLORS.UI.neutral end
    return RGPVPW_COLORS.CATEGORIES[string.lower(categoryName)] or RGPVPW_COLORS.UI.neutral
  end,

  GetColorMetadata = function(colorValue)
    for _, data in pairs(RGPVPW_COLORS.WARNINGS) do
      if data.value == colorValue then
        return data
      end
    end
    return RGPVPW_COLORS.WARNINGS.none
  end
}
