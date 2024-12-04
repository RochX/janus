local helper = require("__janus__.prototypes.helper")
local resource_autoplace = require("resource-autoplace")

resource_autoplace.initialize_patch_set("janus-shiftite-ore", true)

shiftite_ore = helper.resource(
  {
    name = "janus-shiftite-ore",
    order = "b",
    map_color = {r=1,g=0,b=1},
    mining_time = 1,
  },
  {
    base_density = 10
  }
)

-- remove unneeded things
shiftite_ore.minable.mining_particle = nil

-- redefine mining result
shiftite_ore.minable.result = nil
shiftite_ore.minable.results = {
  {type = "item", name = "janus-shiftite-alpha", amount=1},
  {type = "item", name = "janus-shiftite-beta", amount=1}
}

-- redefine icons
shiftite_ore.icon = helper.sprite "janus-shiftite-ore-icon.png"

-- sprite sheet
shiftite_ore.stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50}
shiftite_ore.stages = {
  sheet = {
    filename = helper.sprite "janus-shiftite-ore-sheet.png",
    frame_count = 8,
    height = 128,
    priority = "extra-high",
    scale = 0.5,
    variation_count = 8,
    width = 128
  }
}

-- subgroup
shiftite_ore.subgroup = "janus-planet-info"

-- after all modifications add shiftite ore
data:extend({shiftite_ore})

-- add autoplace controller to add sliders to game setup
data:extend({
  {
    type = "autoplace-control",
    name = "janus-shiftite-ore",
    richness = true,
    order = "b-e",
    category = "resource"
  }
})
