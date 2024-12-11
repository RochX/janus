local helper = require("__janus__.prototypes.helper")
local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")

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
            ["janus-shiftite-ore"] = {
              frequency = 1.0,
              size = 1.0,
              richness = 1.0
            },
            ["janus-big-rock"] = {}
          }
      }
    }
  }
end

janus = {
  type = "planet",
  name = "janus",
  subgroup = "janus-planet-info",
  gravity_pull = 10,
  distance = 30,
  orientation = 0.4,
  asteroid_spawn_definitions = gleba_asteroids,
  icon = helper.sprite "planet_icon.png",
  icon_size = 1024,
  starmap_icon = helper.sprite "planet_icon.png",
  starmap_icon_size = 1024,

  map_gen_settings = janus_map_gen_settings()
}

planet_map_gen.janus = janus_map_gen_settings

janus_connection = {
  type = "space-connection",
  name = "janus-nauvis",
  subgroup = "janus-planet-info",
  from = "nauvis",
  to = "janus",
  asteroid_spawn_definitions = nauvis_fulgora_asteroids,
  icon = helper.sprite "planet_icon.png",
  icon_size = 1024,
  length = 15000
}

data:extend({janus, janus_connection})