data:extend({
  {
    type = "resource",
    name = "janus-shiftite-ore",
    subgroup = "janus-planet-info",
    icons = {
      {
        icon = "__base__/graphics/icons/uranium-ore.png",
        icon_size = 64,
        tint={r=1,g=0,b=1, a=0.333}
      }
    },
    flags = {
      "placeable-neutral"
    },
    selection_box = {
      {-0.5, -0.5}, {0.5, 0.5}
    },
    minable = {
      mining_time = 1,
      results = {
        {type = "item", name = "janus-shiftite-alpha", amount=1},
        {type = "item", name = "janus-shiftite-beta", amount=1}
      }
    },
    -- for now use uranium ore sprite sheet
    stage_counts = {10000, 6330, 3670, 1930, 870, 270, 100, 50},
    stages = {
      sheet = {
        filename = "__base__/graphics/entity/uranium-ore/uranium-ore.png",
        frame_count = 8,
        height = 128,
        priority = "extra-high",
        scale = 0.5,
        variation_count = 8,
        width = 128
      }
    },
  }
})