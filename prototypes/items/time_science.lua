local helper = require("__janus__.prototypes.helper")

-- time science
data:extend({
  {
    type="tool",
    name="janus-time-science-pack",
    subgroup="science-pack", -- as much as I want to keep this in the janus-time-science subgroup, tech tree is ordered weird if I don't do this; see https://forums.factorio.com/viewtopic.php?p=314699#p314699
    order = "j-a",
    icons={
      {
        icon=helper.sprite "time-science.png",
        icon_size=1024,
        scale=0.05
      }
    },
    stack_size=200,
    weight=1000,
    default_import_location = "janus",

    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
  }
})
