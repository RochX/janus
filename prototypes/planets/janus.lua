local helper = require("__janus__.prototypes.helper")
local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")
local nauvis = data.raw['planet']['nauvis']

data:extend({{
  type = "surface-property",
  name = "instability",
  default_value = 0
}})

gleba_asteroids = table.deepcopy(data.raw['planet']['gleba'].asteroid_spawn_definitions)
nauvis_fulgora_asteroids = table.deepcopy(data.raw['space-connection']['nauvis-fulgora'].asteroid_spawn_definitions)

janus_map_gen_settings = function() 
  return {
    autoplace_controls = {
      ["janus-shiftite-ore"] = {}
    },
    autoplace_settings = {
      ["entity"] = {
          settings = {
            ["janus-shiftite-ore"] = {},
            ["janus-big-rock"] = {}
          }
      },
      ["tile"] = {
        settings = {
          ["dirt-1"] = {},
          ["dirt-2"] = {},
          ["dirt-3"] = {},
          -- ["janus-shiftite-tile"] = {}
        }
      }
    }
  }
end
planet_map_gen.janus = janus_map_gen_settings

janus = {
  type = "planet",
  name = "janus",
  subgroup = "planets",
  order = "d[janus]",
  gravity_pull = 10,
  orbit = {
    parent = {
      type = "space-location",
      name = "star"
    },
    distance = 15,
    orientation = 0.4
  },
  asteroid_spawn_definitions = gleba_asteroids,
  icon = helper.sprite "janus-icon.png",
  icon_size = 1024,
  starmap_icon = helper.sprite "janus-icon.png",
  starmap_icon_size = 1024,

  map_gen_settings = janus_map_gen_settings(),
  pollutant_type = nil,
  solar_power_in_space = 400,
  surface_properties = {
    ["day-night-cycle"] = 1.5 * minute,
    ["instability"] = 100,
    ["solar-power"] = 100,
    -- apparently robot drain multiplier is equal to 100 * gravity / pressure, so this gives us 2x drain as desired
    -- this is not documented from what I could find; credit to factorio discord.
    gravity = 20,
    pressure = 1000
  }
}

log(serpent.block(janus.orbit))

janus_connection = {
  type = "space-connection",
  name = "janus-nauvis",
  subgroup = "planet-connections",
  from = "nauvis",
  to = "janus",
  asteroid_spawn_definitions = nauvis_fulgora_asteroids,
  -- no need for icon since __space-age__/data-updates.lua in automatically generates icons for space connections
  length = 15000
}

PlanetsLib.borrow_music(nauvis, janus)
PlanetsLib:extend({janus})

data:extend({janus_connection})