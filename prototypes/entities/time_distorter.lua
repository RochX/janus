local helper = require("__janus__.prototypes.helper")

local time_distorter_entity = {
  type="assembling-machine",
  name="janus-time-distorter",
  subgroup="janus-time-distorter-subgroup",
  icon=helper.sprite "time_distorter.png",
  icon_size=200,
  crafting_speed=1,
  crafting_categories={"janus-shiftite"},
  energy_usage = "1MW",
  energy_source = {type = "electric", usage_priority = "secondary-input"},

  minable={mining_time=0.5, result="janus-time-distorter"},
  collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  drawing_box = {{-2.5, -2.5}, {2.5, 2.5}},

  flags = {
    "placeable-neutral",
    "placeable-player",
    "player-creation"
  },

  fluid_boxes = {
    {
      production_type = "output",
      volume = 200,
      pipe_connections = {
        {flow_direction="output", direction = defines.direction.north, position = {0,-2}}
      }
    }
  },

  graphics_set = {
    animation = {
      layers = {
        {
          filename = helper.sprite "time_distorter.png",
          frame_count = 1,
          height = 200,
          line_length = 8,
          priority = "high",
          -- TODO figure out exactly how this scaling works;
          -- 2.5 fits 64x64px image in 5x5 tiles in game
          scale=0.8,
          width = 200
        }
      }
    }
  },

  surface_conditions = {
    {
      property = "instability",
      min = 99
    }
  }
}

data:extend({time_distorter_entity})