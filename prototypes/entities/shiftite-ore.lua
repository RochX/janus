local helper = require("__janus__.prototypes.helper")

data:extend({
  {
    type = "collision-layer",
    name = "janus_shiftite_layer"
  }
})

shiftite_ore = {
  type = "resource",
  name = "janus-shiftite-ore",
  icon = helper.sprite "janus-shiftite-ore-icon.png",
  subgroup = "janus-planet-info",
  map_color = {r=1,g=0,b=1},
  flags = {"placeable-neutral"},
  order="a-b",
  tree_removal_probability = 0.8,
  tree_removal_max_distance = 32 * 32,
  collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},

  minable = {
    mining_time = 1,
    results = {
      {type = "item", name = "janus-shiftite-alpha", amount=1},
      {type = "item", name = "janus-shiftite-beta", amount=1}
    }
  },

  stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
  stages = {
    sheet = {
      filename = helper.sprite "janus-shiftite-ore-sheet.png",
      frame_count = 8,
      height = 128,
      priority = "extra-high",
      scale = 0.5,
      variation_count = 8,
      width = 128
    }
  },

  collision_mask = {layers = {resource=true, janus_shiftite_layer=true}}
}

-- autoplace
shiftite_frequency = "var(\"control:janus-shiftite-ore:frequency\")" -- controls persistence
shiftite_size = "var(\"control:janus-shiftite-ore:size\")" -- controls scale
shiftite_richness = "var(\"control:janus-shiftite-ore:richness\")" -- controls amount per resource tile

shiftite_ore.autoplace = {
  control = "janus-shiftite-ore",
  -- use a noise function to place shiftite
  -- based on multioctave_noise for placement
  -- richness generally based on distance, but some rich patches occasionally occur; this part not finished yet.
  probability_expression = "clamp(multioctave_noise{\z
    x = x, \z
    y = y, \z
    seed0 = map_seed, \z
    seed1 = 0, \z
    persistence=max(slider_to_linear{slider_value="..shiftite_frequency..", min=0, max=1}, 0.01), \z
    octaves=3, \z
    input_scale = 1/(6.5*"..shiftite_size.."), output_scale = 6.5*"..shiftite_size.."}, 0, 1)",
  richness_expression = "max(vulcanus_coal_richness, gleba_stone_richness, \z 
    random_penalty{x=x, y=y, seed=map_seed, source=distance+200, amplitude=100} \z
    )*"..shiftite_richness
}
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
