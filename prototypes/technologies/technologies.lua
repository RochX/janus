local helper = require("__janus__.prototypes.helper")
-- Technologies:
technologies = {}

-- Planet Discovery Janus
table.insert(technologies, {
  type = "technology",
  name = "planet-discovery-janus",
  icon_size = 256,
  icons = {
    {
      icon = helper.sprite "planet_icon.png",
      icon_size = 1024
    },
    {
      icon = "__core__/graphics/icons/technology/constants/constant-planet.png",
      icon_size = 128,
      scale = 0.5,
      shift = {
        50,
        50
      }
    }
  },
  effects = {
    {
      space_location = "janus",
      type = "unlock-space-location",
      use_icon_overlay_constant = true
    },
  },
  unit = {
    count = 1000,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"space-science-pack", 1},
    },
    time = 60
  },
  prerequisites = {"space-platform-thruster"},
  essential = true
})

-- Basic oil from shiftite
-- - Requirements: obtain epsilon zeta
-- - Unlocks crude oil from zeta: 
--     - 5 zeta —> 50 crude oil
table.insert(technologies, {
  type="technology",
  name="janus-simple-oil",
  icon = helper.sprite "zeta.png",
  icon_size = 64,
  effects = {
    {type = "unlock-recipe", recipe = "janus-simple-oil"}
  },
  research_trigger = {
    type = "craft-item",
    item = "janus-shiftite-alpha"
  },
  prerequisites = {"planet-discovery-janus"}
})


-- Time Distorter
-- - Requirements: obtain epsilon alpha
-- - Unlocks Time Distorter building, crafted using 30x electronic circuits, 10x advanced circuits, 10x LDS, 20x α, 20x β
-- - Unlocks basic resources from shiftite
--     - α —> 20x iron plate
--     - β —> 20x copper plate
--     - γ —> 20x stone
--     - δ —> 100x water
--     - ε —> 20x coal
--     - ζ —> 100x crude oil
--     - α+γ —> 20x concrete
table.insert(technologies, {
  type = "technology",
  name = "janus-time-distorter",
  icon = helper.sprite "time_distorter.png",
  icon_size = 64,
  effects = {
    {type = "unlock-recipe", recipe = "janus-time-distorter"},
    {type = "unlock-recipe", recipe = "janus-shiftite-to-iron"},
    {type = "unlock-recipe", recipe = "janus-shiftite-to-copper"},
    {type = "unlock-recipe", recipe = "janus-shiftite-to-stone"},
    {type = "unlock-recipe", recipe = "janus-shiftite-to-water"},
    {type = "unlock-recipe", recipe = "janus-shiftite-to-coal"},
    {type = "unlock-recipe", recipe = "janus-shiftite-to-crude-oil"},
    {type = "unlock-recipe", recipe = "janus-shiftite-to-concrete"}
  },
  research_trigger = {
    type = "craft-item",
    item = "janus-shiftite-alpha"
  },
  prerequisites = {"planet-discovery-janus"}
})

-- Shiftite Omega
-- - Requirements: Craft Time Distorter
-- - Unlocks: shiftite omega recipe; one each gives one omega
table.insert(technologies, {
  type = "technology",
  name = "janus-shiftite-omega",
  icon = helper.sprite "omega.png",
  icon_size = 64,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "janus-shiftite-omega"
    }
  },
  research_trigger = {
    type = "craft-item",
    item = "janus-time-distorter"
  },
  prerequisites = {"janus-time-distorter"}
})

-- Time Science
-- - Requirements: Craft shiftite Omega
-- - Unlocks time science recipe:
--     - LDS + ω + ψ —> 2x time science
table.insert(technologies, {
  type = "technology",
  name = "janus-time-science-pack",
  icons={
    {
      icon=helper.sprite "time_science.png",
      icon_size=64,
      tint={r=1,g=0,b=1, a=0.333}
    }
  },
  effects = {
    {
      type = "unlock-recipe",
      recipe = "janus-time-science-pack"
    },
    {
      type = "unlock-recipe",
      recipe = "janus-containment-unit"
    }
  },
  research_trigger = {
    type = "craft-item",
    item = "janus-shiftite-omega"
  },
  prerequisites = {"janus-shiftite-omega"},
  essential = true
})

-- Phase Change
-- - Requirements: (red, green, blue, white, time) x 500
-- - Unlocks: phase change recipes
--     - α + γ + ε —> β + δ + ζ
--     - α + γ + ε <— β + δ + ζ
-- janus-alpha-shift-to-beta=Shiftite Phase Change Beta
-- janus-beta-shift-to-alpha=Shiftite Phase Change Alpha
table.insert(technologies, {
  type = "technology",
  name = "janus-phase-change",
  icon = helper.sprite "alpha.png",
  icon_size = 64,
  effects = {
    {
      type = "unlock-recipe",
      recipe = "janus-alpha-shift-to-beta"
    },
    {
      type = "unlock-recipe",
      recipe = "janus-beta-shift-to-alpha"
    }
  },
  unit = {
    count = 500,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"space-science-pack", 1},
      {"janus-time-science-pack", 1}
    },
    time = 60
  },
  prerequisites = {"janus-time-science-pack"}
})

-- Advanced Resources from Shiftite
-- - Requirements: (red, green, blue, white, purple, yellow, time) x 500
-- - Unlocks:
--     - 2a = 20x steel
--     - a+b = 20x green circuit
--     - a+b+z = 20x red circuit
--     - 2a+3b+2z = 20x blue circuit
--     - 3a+5b+2z = 20x LDS
--     - 2z = 20x rocket fuel
--     - 2a+g+d = 20x refined concrete
table.insert(technologies, {
  type = "technology",
  name = "janus-advanced-from-shiftite",
  icon = helper.sprite "alpha.png",
  icon_size = 64,
  effects = {
    {type="unlock-recipe", recipe="janus-shiftite-to-steel-plate"},
    {type="unlock-recipe", recipe="janus-shiftite-to-electronic-circuit"},
    {type="unlock-recipe", recipe="janus-shiftite-to-advanced-circuit"},
    {type="unlock-recipe", recipe="janus-shiftite-to-processing-unit"},
    {type="unlock-recipe", recipe="janus-shiftite-to-low-density-structure"},
    {type="unlock-recipe", recipe="janus-shiftite-to-rocket-fuel"},
    {type="unlock-recipe", recipe="janus-shiftite-to-refined-concrete"},
  },
  unit = {
    count = 500,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"space-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"janus-time-science-pack", 1}
    },
    time = 60
  },
  prerequisites = {"janus-time-science-pack"}
})

-- Vulcanus from Shiftite
-- - Requirements: (red, green, blue, white, purple, yellow, orange, time) x 3000
-- - Unlocks:
--     - o+5a+2e = 20x tungsten carbide
--     - o+6a = 20x tungsten plate
--     - p = 20x calcite
table.insert(technologies, {
  type = "technology",
  name = "janus-shiftite-to-vulcanus",
  icon = "__space-age__/graphics/icons/tungsten-plate.png",
  effects = {
    {type="unlock-recipe", recipe="janus-shiftite-to-calcite"},
    {type="unlock-recipe", recipe="janus-shiftite-to-tungsten-carbide"},
    {type="unlock-recipe", recipe="janus-shiftite-to-tungsten-plate"}
  },
  unit = {
    count = 3000,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"space-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"metallurgic-science-pack", 1},
      {"janus-time-science-pack", 1}
    },
    time = 60
  },
  prerequisites = {"metallurgic-science-pack", "janus-advanced-from-shiftite"}
})

-- Fulgora from Shiftite
-- - Requirements: (red, green, blue, white, purple, yellow, pink, time) x 3000
-- - Unlocks:
--     - p+g+d = 20x holminum plates
table.insert(technologies, {
  type = "technology",
  name = "janus-shiftite-to-fulgora",
  icon = "__space-age__/graphics/icons/holmium-plate.png",
  effects = {
    {type="unlock-recipe", recipe="janus-shiftite-to-holmium-plate"},
    {type="unlock-recipe", recipe="janus-shiftite-to-scrap"}
  },
  unit = {
    count = 3000,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"space-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"electromagnetic-science-pack", 1},
      {"janus-time-science-pack", 1}
    },
    time = 60
  },
  prerequisites = {"electromagnetic-science-pack", "janus-advanced-from-shiftite"}
})

-- Simple Science Replication
-- - Requirements: (red, green, blue, white, purple, yellow, time) x 1000
-- - Unlocks:
--     - science replication for red, green, blue, white, purple, yellow
table.insert(technologies, {
  type = "technology",
  name = "janus-simple-science-replication",
  icons = {
    {
      icon = "__base__/graphics/technology/automation-science-pack.png",
      icon_size = 256
    },
    {
      icon = helper.sprite "janus-shiftite-ore-icon.png",
      icon_size = 64,
      scale = 1,
      shift = {32, 32}
    }
  },
  effects = {
    {type="unlock-recipe", recipe="janus-shiftite-to-automation-science-pack"},
    {type="unlock-recipe", recipe="janus-shiftite-to-logistic-science-pack"},
    {type="unlock-recipe", recipe="janus-shiftite-to-military-science-pack"},
    {type="unlock-recipe", recipe="janus-shiftite-to-chemical-science-pack"},
    {type="unlock-recipe", recipe="janus-shiftite-to-production-science-pack"},
    {type="unlock-recipe", recipe="janus-shiftite-to-utility-science-pack"},
    {type="unlock-recipe", recipe="janus-shiftite-to-space-science-pack"}
  },
  unit = {
    count = 1000,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"military-science-pack", 1},
      {"chemical-science-pack", 1},
      {"space-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"janus-time-science-pack", 1}
    },
    time = 60
  },
  prerequisites = {"janus-time-science-pack"}
})

-- Planetary Science Replication
-- Requirements - (red, green, blue, white, purple, yellow, orange, pink, lime, time) x 2000
-- - Unlocks:
-- - p+e+z+orange = 2orange
-- - p+a+b+pink = 2pink
-- - p+g+d+lime = 2lime (always fresh!)
table.insert(technologies, {
  type = "technology",
  name = "janus-planetary-science-replication",
  icons = {
    {
      icon = "__space-age__/graphics/technology/agricultural-science-pack.png",
      icon_size = 256
    },
    {
      icon = helper.sprite "janus-shiftite-ore-icon.png",
      icon_size = 64,
      scale = 1,
      shift = {32, 32}
    }
  },
  effects = {
    {type="unlock-recipe", recipe="janus-shiftite-to-agricultural-science-pack"},
    {type="unlock-recipe", recipe="janus-shiftite-to-electromagnetic-science-pack"},
    {type="unlock-recipe", recipe="janus-shiftite-to-metallurgic-science-pack"}
  },
  unit = {
    count = 2000,
    ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"military-science-pack", 1},
      {"chemical-science-pack", 1},
      {"space-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"agricultural-science-pack", 1},
      {"electromagnetic-science-pack", 1},
      {"metallurgic-science-pack", 1},
      {"janus-time-science-pack", 1}
    },
    time = 60
  },
  prerequisites = {"janus-time-science-pack", "janus-simple-science-replication"}
})

-- ordering
for i, tech in ipairs(technologies) do
  tech.order = tostring(i)
end

data:extend(technologies)