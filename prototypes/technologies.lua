local helper = require("__janus__.prototypes.helper")
-- Technologies:
technologies = {}
-- Basic oil from shiftite
-- - Requirements: obtain epsilon zeta
-- - Unlocks crude oil from zeta: 
--     - 5 zeta —> 100 crude oil
-- technologies.insert({
--   type="technology",
--   name="janus-simple-oil"
-- })


-- Time Distorter
-- - Requirements: obtain epsilon shiftite
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
    {
      type = "unlock-recipe",
      recipe = "janus-time-distorter"
    }
  },
  research_trigger = {
    type = "craft-item",
    item = "janus-shiftite-alpha"
  }
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
    }
  },
  research_trigger = {
    type = "craft-item",
    item = "janus-shiftite-omega"
  },
  prerequisites = {"janus-shiftite-omega"}
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
-- - Requirements: (red, green, blue, white, purple, yellow, time) x 2000
-- - Unlocks:
--     - 2a = 20x steel
--     - a+b = green circuit
--     - a+b+z = red circuit
--     - 2a+3b+2z = blue circuit
--     - 3a+5b+2z = LDS
--     - 2z = rocket fuel
--     - 2a+g+d = 20x refined concrete

-- Vulcanus from Shiftite
-- - Requirements: (red, green, blue, white, purple, yellow, orange, time) x 3000
-- - Unlocks:
--     - o+5a+2e = 20x tungsten carbide
--     - o+6a = 20x tungsten plate
--     - p = 20x calcite

-- Fulgora from Shiftite
-- - Requirements: (red, green, blue, white, purple, yellow, pink, time) x 3000
-- - Unlocks:
--     - p+g+d = 5x holminum plates

-- Simple Science Replication
-- - Requirements: (red, green, blue, white, purple, yellow, time) x 1000
-- - Unlocks:
--     - o+a+red = 2red
--     - o+b+green = 2green
--     - o+g+blue = 2blue
--     - o+g+gray = 2gray
--     - o+d+white = 2white
--     - o+e+purple = 2purple
--     - o+z+yellow = 2yellow
-- - This needs some rebalancing… (esp for red/green)


data:extend(technologies)