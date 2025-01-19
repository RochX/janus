local helper = require("__janus__.prototypes.helper")

-- recipe categories
data:extend({
  {
    type="recipe-category",
    name="janus-shiftite"
  }
})

-- recipes
data:extend({
  {
    type="recipe",
    name="janus-alpha-shift-to-beta",
    category="janus-shiftite",
    subgroup="janus-transform-shiftite",
    main_product="janus-shiftite-beta",
    ingredients={
      {type="item", name="janus-shiftite-alpha", amount=1},
      {type="item", name="janus-shiftite-gamma", amount=1},
      {type="item", name="janus-shiftite-epsilon", amount=1}
    },
    results={
      {type="item", name="janus-shiftite-beta", amount=1},
      {type="item", name="janus-shiftite-delta", amount=1},
      {type="item", name="janus-shiftite-zeta", amount=1}
    },
    energy_required = 1,
    enabled=false
  },
  {
    type="recipe",
    name="janus-beta-shift-to-alpha",
    category="janus-shiftite",
    subgroup="janus-transform-shiftite",
    main_product="janus-shiftite-alpha",
    ingredients={
      {type="item", name="janus-shiftite-beta", amount=1},
      {type="item", name="janus-shiftite-delta", amount=1},
      {type="item", name="janus-shiftite-zeta", amount=1}
    },
    results={
      {type="item", name="janus-shiftite-alpha", amount=1},
      {type="item", name="janus-shiftite-gamma", amount=1},
      {type="item", name="janus-shiftite-epsilon", amount=1}
    },
    energy_required = 1,
    enabled=false
  },
  {
    type="recipe",
    name="janus-shiftite-omega",
    category="janus-shiftite",
    subgroup="janus-transform-shiftite",
    ingredients={
      {type="item", name="janus-shiftite-alpha", amount=1},
      {type="item", name="janus-shiftite-beta", amount=1},
      {type="item", name="janus-shiftite-gamma", amount=1},
      {type="item", name="janus-shiftite-delta", amount=1},
      {type="item", name="janus-shiftite-epsilon", amount=1},
      {type="item", name="janus-shiftite-zeta", amount=1}
    },
    results={{type="item", name="janus-shiftite-omega", amount=1}},
    energy_required = 4,
    enabled=false
  }
})

data:extend({
  {
    type = "recipe",
    name = "janus-simple-oil",
    category = "chemistry",
    subgroup = "janus-simple-oil",
    ingredients={{type="item", name="janus-shiftite-zeta", amount=5}},
    results={{type="fluid", name="crude-oil", amount=50}},
    energy_required = 2.5,
    enabled=false
  }
})

base_resources = {
  {
    type="recipe",
    name="janus-shiftite-to-iron",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-alpha", amount=1}},
    results={{type="item", name="iron-plate", amount=5}},
    energy_required = 2.5,
    order="a",
    enabled=false,
    auto_recycle=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-copper",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-beta", amount=1}},
    results={{type="item", name="copper-plate", amount=5}},
    energy_required = 2.5,
    order="b",
    enabled=false,
    auto_recycle=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-stone",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-gamma", amount=1}},
    results={{type="item", name="stone", amount=5}},
    energy_required = 2.5,
    order="c",
    enabled=false,
    auto_recycle=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-water",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-delta", amount=1}},
    results={{type="fluid", name="water", amount=100}},
    energy_required = 1,
    order="d",
    enabled=false,
    auto_recycle=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-coal",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-epsilon", amount=1}},
    results={{type="item", name="coal", amount=5}},
    energy_required = 2.5,
    order="e",
    enabled=false,
    auto_recycle=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-crude-oil",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-zeta", amount=1}},
    results={{type="fluid", name="crude-oil", amount=100}},
    energy_required = 1,
    order="f",
    enabled=false,
    auto_recycle=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-concrete",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={
      {type="item", name="janus-shiftite-alpha", amount=1},
      {type="item", name="janus-shiftite-gamma", amount=1}
    },
    results={{type="item", name="concrete", amount=5}},
    energy_required = 2.5,
    order="g",
    enabled=false,
    auto_recycle=false
  }
}

data:extend(base_resources)

-- advanced recipes
-- shiftite = {alpha = int, beta = int, gamma = int, etc}
-- results = {name=ITEM, amount=A}
-- subgroup = string
local function shiftite_to_X_recipe(params)
  shiftite = params.shiftite
  results = params.results
  subgroup = params.subgroup
  energy_required = params.energy_required

  shiftite_ingredients = {}
  for k, v in pairs(shiftite) do
    table.insert(shiftite_ingredients, {type="item", name="janus-shiftite-"..k, amount=v})
  end

  results.type = results.type or "item"

  return {
    type = "recipe",
    name = "janus-shiftite-to-" .. results.name,
    category = "janus-shiftite",
    subgroup = subgroup,
    ingredients = shiftite_ingredients,
    results = {results},
    energy_required = energy_required,
    enabled = false,
    result_is_always_fresh = true,
    auto_recycle=false
  }
end

advanced_resources = {
  shiftite_to_X_recipe({
    shiftite={alpha=2},
    results={name="steel-plate", amount=5},
    subgroup="janus-advanced-from-shiftite",
    energy_required = 5
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=1, beta=1},
    results={name="electronic-circuit", amount=5},
    subgroup="janus-advanced-from-shiftite",
    energy_required = 5
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=1, beta=1, zeta=1},
    results={name="advanced-circuit", amount=5},
    subgroup="janus-advanced-from-shiftite",
    energy_required = 5
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=2, beta=3, zeta=2},
    results={name="processing-unit", amount=5},
    subgroup="janus-advanced-from-shiftite",
    energy_required = 10
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=3, beta=5, zeta=2},
    results={name="low-density-structure", amount=5},
    subgroup="janus-advanced-from-shiftite",
    energy_required = 10
  }),
  shiftite_to_X_recipe({
    shiftite={zeta=2},
    results={name="rocket-fuel", amount=5},
    subgroup="janus-advanced-from-shiftite",
    energy_required = 10
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=2, gamma=1, delta=1},
    results={name="refined-concrete", amount=5},
    subgroup="janus-advanced-from-shiftite",
    energy_required = 5
  }),
}

data:extend(advanced_resources)

interplanetary_resources = {
  -- vulcanus
  shiftite_to_X_recipe({
    shiftite={omega=1, alpha=5, epsilon=2},
    results={name="tungsten-carbide", amount=5},
    subgroup="janus-interplanetary-from-shiftite",
    energy_required = 5
  }),
  shiftite_to_X_recipe({
    shiftite={omega=1, alpha=6},
    results={name="tungsten-plate", amount=5},
    subgroup="janus-interplanetary-from-shiftite",
    energy_required = 5
  }),
  shiftite_to_X_recipe({
    shiftite={psi=1},
    results={name="calcite", amount=5},
    subgroup="janus-interplanetary-from-shiftite",
    energy_required = 5
  }),
  -- fulgora
  -- shiftite_to_X_recipe({
  --   shiftite={psi=1},
  --   results={name="scrap", amount=200},
  --   subgroup="janus-interplanetary-from-shiftite"
  -- }),
  shiftite_to_X_recipe({
    shiftite={psi=1, gamma=1, delta=1},
    results={name="holmium-plate", amount=5},
    subgroup="janus-interplanetary-from-shiftite",
    energy_required = 5
  }),
}

data:extend(interplanetary_resources)

-- time distorter
data:extend({
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
    results={{type="item", name="janus-time-distorter", amount=1}},
    energy_required = 10,
    enabled=false
  }
})


-- time science and containment unit
data:extend({
  {
    type = "recipe",
    name = "janus-containment-unit",
    subgroup = "janus-time-science",
    ingredients = {
      {type = "item", name = "low-density-structure", amount=1},
      {type = "item", name = "processing-unit", amount=1},
      {type = "item", name = "battery", amount=1}
    },
    results = {
      {type = "item", name = "janus-containment-unit", amount=1}
    },
    energy_required = 5,
    enabled = false
  },
  {
    type="recipe",
    name="janus-time-science-pack",
    category="janus-shiftite",
    subgroup="janus-time-science",
    ingredients={
      {type="item", name="janus-containment-unit", amount=1},
      {type="item", name="janus-shiftite-psi", amount=1},
      {type="item", name="janus-shiftite-omega", amount=1}
    },
    results={
      {type="item", name="janus-time-science-pack", amount=2}
    },
    energy_required = 5,
    enabled=false
  }
})

-- science replication
-- shiftite = {alpha = int, beta = int, gamma = int, etc}
-- results = {name=ITEM, amount=A}
-- subgroup = string
local function science_replication_recipe(params)
  -- get initial recipe
  recipe = shiftite_to_X_recipe(params)

  -- add one of result to input
  for _, result_item in pairs(recipe.results) do
    table.insert(recipe.ingredients, {type="item", name=result_item.name, amount=1})
  end

  return recipe
end

-- science replication recipes
data:extend({
  science_replication_recipe({
    shiftite = {alpha=1, beta=1},
    results = {name="automation-science-pack", amount=4},
    subgroup = "janus-science-replication",
    energy_required = 1
  }),
  science_replication_recipe({
    shiftite = {alpha=2, beta=1},
    results = {name="logistic-science-pack", amount=4},
    subgroup = "janus-science-replication",
    energy_required = 2
  }),
  science_replication_recipe({
    shiftite = {alpha=2, beta=1, gamma=1, epsilon=1},
    results = {name="military-science-pack", amount=4},
    subgroup = "janus-science-replication",
    energy_required = 3
  }),
  science_replication_recipe({
    shiftite = {alpha=2, beta=2, epsilon=1, zeta=1},
    results = {name="chemical-science-pack", amount=4},
    subgroup = "janus-science-replication",
    energy_required = 3
  }),
  science_replication_recipe({
    shiftite = {alpha=4, beta=2, gamma=4, zeta=2},
    results = {name="production-science-pack", amount=3},
    subgroup = "janus-science-replication",
    energy_required = 4
  }),
  science_replication_recipe({
    shiftite = {alpha=1, beta=1},
    results = {name="utility-science-pack", amount=3},
    subgroup = "janus-science-replication",
    energy_required = 4
  }),
  science_replication_recipe({
    shiftite = {alpha=1, beta=1, delta=1},
    results = {name="space-science-pack", amount=3},
    subgroup = "janus-science-replication",
    energy_required = 4
  }),

  -- planetary sciences
  science_replication_recipe({
    shiftite = {psi=1, gamma=1, delta=1},
    results = {name="agricultural-science-pack", amount=2},
    subgroup = "janus-science-replication",
    energy_required = 7
  }),
  science_replication_recipe({
    shiftite = {psi=1, alpha=1, beta=1},
    results = {name="electromagnetic-science-pack", amount=2},
    subgroup = "janus-science-replication",
    energy_required = 7
  }),
  science_replication_recipe({
    shiftite = {psi=1, epsilon=1, zeta=1},
    results = {name="metallurgic-science-pack", amount=2},
    subgroup = "janus-science-replication",
    energy_required = 7
  })
})