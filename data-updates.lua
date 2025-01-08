
--[[

  Hello!
  
  The data stage of this tutorial mod is going to demonstrate the following things:
    
    > Reading mod startup settings
    
    > Using simple functions to make repetitive code shorter
    
    > Using name prefixes to ensure compatibility with other mods
    
    > Creating an entity 
    
    > Creating an item to place the entity
    
    > Creating a recipe to craft the item
    
    > Conditionally Creating a technology to unlock the recipe
    
    > Bonus: Changing existing prototypes based on what other mods are installed

  Abbreviations used:
    
    > HCG = Hand Crank Generator
    
    > data "stage", settings "stage" = In factorio each "stage" of the startup process
        is divided into three "phases". I.e. the data stage consists of data.lua,
        data-updates.lua and data-final-fixes.lua. This mod does not use updates or 
        final-fixes.
    
  ]]


-- First I define three simple functions, one for reading startup settings
-- and one for creating paths to the .png files for each prototype.

-- Everytime I need a "name=" I put a prefix before it, so that
-- Other mods with similar names do not interfere with mine and vice versa.
-- I use "er:" because my name is eradicator, but that's kinda long.
-- The prefix can be any string you like. I use a second prefix "hcg-"
-- because I have more than one mod, and this makes it easier to see what
-- belongs where.

-- This allows me to read settings values without repeating my prefix
-- all the time.
local function config(name)
  return settings.startup['bs:rm-'..name].value
  end

--And these two make defining common file paths much shorter.
local function graphics(name)
  return '__bitsabre-remelt__/graphics/'..name
  end
  
 

-- To add new prototypes to the game I descripe each prototype in a table.
-- Then each of these tables is put together into one large table, and that large
-- table is handed to data:extend() which will put it into data.raw where
-- the game engine can find them.

  
-- The next step is slightly more complicated. According to the "lore" of this
-- mod the player only gets a single HCG. But because some people might want
-- more than one there is a "mod setting" that enables a technology and recipe.

-- So I have to read the setting and only create the technology and recipe prototypes
-- if the setting is enabled.

data:extend({{
    type = "recipe",
    name = "bs-rm-copper-cable",
    category = "metallurgy",
    subgroup = "vulcanus-processes",
    order = "b[casting]-h[melting-copper-cable]",
    icon = "__bitsabre-remelt__/graphics/icons/casting-copper-cable.png",
    enabled = false,
    ingredients =
    {
      {type = "item", name = "copper-cable", amount = 2}
    },
    energy_required = 0.5,
    allow_decomposition = false,
    results = {{type = "fluid", name = "molten-copper", amount = 1.25, fluidbox_multiplier = 5}},
    allow_productivity = true
  }})

table.insert(data.raw.technology["foundry"].effects,
  { 
    type   = 'unlock-recipe',
    recipe = 'bs-rm-copper-cable'
  }
)