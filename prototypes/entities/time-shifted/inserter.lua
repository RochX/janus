local helper = require("__janus__.prototypes.helper")
local fast_inserter = table.deepcopy(data.raw['inserter']['fast-inserter'])

fast_inserter_time_shifted = fast_inserter

fast_inserter_time_shifted.name = "janus-fast-inserter"
fast_inserter_time_shifted.insert_position = {1.2, 0}
fast_inserter_time_shifted.subgroup = "janus-time-shifted"
fast_inserter_time_shifted.minable.result = "janus-fast-inserter"
fast_inserter_time_shifted.allow_custom_vectors = true

fast_inserter_time_shifted.hand_base_picture.filename = "__janus__/graphics/time-shifted/inserter/time-shifted-fast-inserter-hand-base.png"
fast_inserter_time_shifted.hand_closed_picture.filename = "__janus__/graphics/time-shifted/inserter/time-shifted-fast-inserter-hand-closed.png"
fast_inserter_time_shifted.hand_open_picture.filename = "__janus__/graphics/time-shifted/inserter/time-shifted-fast-inserter-hand-open.png"
fast_inserter_time_shifted.platform_picture.sheet.filename = "__janus__/graphics/time-shifted/inserter/time-shifted-fast-inserter-platform.png"
fast_inserter_time_shifted.corpse = "janus-fast-inserter-remnants"

-- remnants
fast_inserter_time_shifted_corpse = {
  type = "corpse",
  name = "janus-fast-inserter-remnants",
  icon = "__base__/graphics/icons/fast-inserter.png",
  hidden_in_factoriopedia = true,
  flags = {"placeable-neutral", "not-on-map"},
  subgroup = "inserter-remnants",
  order = "a-d-a",
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  tile_width = 1,
  tile_height = 1,
  selectable_in_game = false,
  time_before_removed = 60 * 60 * 15, -- 15 minutes
  expires = false,
  final_render_layer = "remnants",
  remove_on_tile_placement = false,
  animation = make_rotated_animation_variations_from_sheet (4,
  {
    filename = "__janus__/graphics/time-shifted/inserter/remnants/time-shifted-fast-inserter-remnants.png",
    line_length = 1,
    width = 134,
    height = 94,
    direction_count = 1,
    shift = util.by_pixel(3.5, -2),
    scale = 0.5
  })
}

data:extend({fast_inserter_time_shifted, fast_inserter_time_shifted_corpse})