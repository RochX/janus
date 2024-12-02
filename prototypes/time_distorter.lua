local helper = require("__janus__.prototypes.helper")

time_distorter = {
  -- item
  {
    type="item",
    name="janus-time-distorter",
    icon=helper.sprite "time_distorter.png",
    icon_size=64,
    stack_size=50,
    place_result="janus-time-distorter"
  },
  -- entity
  {
    type="assembling-machine",
    name="janus-time-distorter",
    icon=helper.sprite "time_distorter.png",
    icon_size=64,
    crafting_speed=1,
    crafting_categories={"janus-shiftite"},
    energy_usage = "90kW",
    energy_source = {type = "void"},

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
            height = 64,
            line_length = 8,
            priority = "high",
            -- TODO figure out exactly how this scaling works;
            -- 2.5 fits 64x64px image in 5x5 tiles in game
            scale=2.5,
            width = 64
          }
        }
      }
    }
  },

  -- receipe
  {
    type="recipe",
    name="janus-time-distorter",
    subgroup="janus-time-distorter-subgroup",
    ingredients={
      {type="item", name="electronic-circuit", amount=30},
      {type="item", name="advanced-circuit", amount=10},
      {type="item", name="low-density-structure", amount=10},
      {type="item", name="janus-shiftite-alpha", amount=20},
      {type="item", name="janus-shiftite-beta", amount=20}
    },
    results={{type="item", name="janus-time-distorter", amount=1}}
  }
}

data:extend(time_distorter)