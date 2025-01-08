
--[[

  Hello!
  
  The settings stage of this tutorial mod is going to demonstrate the following things:
    
    > Creating mod startup settings

  Abbreviations used:
    
    > HCG = Hand Crank Generator
    
  ]]


-- Mod settings make it possible to let the player decide about certain
-- aspects of a mod themselves. Every setting has to be defined in settings stage.
-- During data stage you can only read "startup" type settings, while during
-- control stage you can read all types of settings.

-- It's important to always set minimum, maximum and default so that the player
-- can not enter unexpected values.

-- The goal here is to let the user fully customize the output of the HCG.
-- The default settings should produce 20kW power for 5 minutes at the cost of 
-- cranking for 10 seconds. Which is equal to 30 presses of the hotkey.


data:extend{
  --If additional generators can be crafted. In data state this will
  --determine if the recipe and technology are created.
  { name          = 'bs:rm-lds-remelt',
    type          = 'bool-setting',
    setting_type  = 'startup'     ,
    default_value =  true         ,
    order         = 'g-a'         ,
  },
}
  
