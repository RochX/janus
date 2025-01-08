local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

if mods.tenebris then
  data:extend{{
    type = "space-connection",
    name = "janus-tenebris",
    subgroup = "planet-connections",
    from = "janus",
    to = "tenebris",
    length = 20000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
  }}
end

if mods.maraxsis then
  data:extend{{
    type = "space-connection",
    name = "janus-maraxsis",
    subgroup = "planet-connections",
    from = "janus",
    to = "maraxsis",
    length = 20000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
  }}
end