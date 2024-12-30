shiftite_ore = require("__janus__.prototypes.entities.shiftite-ore")
helper = require("__janus__.prototypes.helper")

shiftite_tile = table.deepcopy(data.raw['tile']['grass-1'])

shiftite_tile.name = "janus-shiftite-tile"
shiftite_tile.subgroup = "janus-planet-info"
shiftite_tile.autoplace = {probability_expression = shiftite_ore.autoplace.probability_expression}
shiftite_tile.map_color = {r=0.322,g=0.009,b=0.056}

shiftite_tile.variants = helper.tile_variations_template(
  "__janus__/graphics/tiles/shiftite_tile.png", "__base__/graphics/terrain/masks/transition-3.png",
  {
    max_size = 4,
    [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
    [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
    [4] = { probability = 0.91, weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }, },
    --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
  }
)

data:extend({shiftite_tile})

-- data:extend({
--   {
--     type = "tile",
--     name = "janus-purple",
--     subgroup = "janus-planet-info",

--     autoplace = shiftite_ore.autoplace
--   }
-- })