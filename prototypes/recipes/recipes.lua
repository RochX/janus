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
    results={{type="item", name="iron-plate", amount=20}},
    order="a",
    enabled=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-copper",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-beta", amount=1}},
    results={{type="item", name="copper-plate", amount=20}},
    order="b",
    enabled=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-stone",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-gamma", amount=1}},
    results={{type="item", name="stone", amount=20}},
    order="c",
    enabled=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-water",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-delta", amount=1}},
    results={{type="fluid", name="water", amount=100}},
    order="d",
    enabled=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-coal",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-epsilon", amount=1}},
    results={{type="item", name="coal", amount=20}},
    order="e",
    enabled=false
  },
  {
    type="recipe",
    name="janus-shiftite-to-crude-oil",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-zeta", amount=1}},
    results={{type="fluid", name="crude-oil", amount=100}},
    order="f",
    enabled=false
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
    results={{type="item", name="concrete", amount=20}},
    order="g",
    enabled=false
  }
}

data:extend(base_resources)

-- advanced recipes
-- shiftite = {alpha = int, beta = int, gamma = int, etc}
local function shiftite_to_X_recipe(params)
  shiftite = params.shiftite
  results = params.results
  subgroup = params.subgroup

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
    enabled = false
  }
end

advanced_resources = {
  shiftite_to_X_recipe({
    shiftite={alpha=2}, 
    results={name="steel-plate", amount=20},
    subgroup="janus-advanced-from-shiftite"
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=1, beta=1}, 
    results={name="electronic-circuit", amount=20},
    subgroup="janus-advanced-from-shiftite"
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=1, beta=1, zeta=1}, 
    results={name="advanced-circuit", amount=20},
    subgroup="janus-advanced-from-shiftite"
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=2, beta=3, zeta=2}, 
    results={name="processing-unit", amount=20},
    subgroup="janus-advanced-from-shiftite"
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=3, beta=5, zeta=2}, 
    results={name="low-density-structure", amount=20},
    subgroup="janus-advanced-from-shiftite"
  }),
  shiftite_to_X_recipe({
    shiftite={zeta=2}, 
    results={name="rocket-fuel", amount=20},
    subgroup="janus-advanced-from-shiftite"
  }),
  shiftite_to_X_recipe({
    shiftite={alpha=2, gamma=1, delta=1}, 
    results={name="refined-concrete", amount=20},
    subgroup="janus-advanced-from-shiftite"
  }),
}

data:extend(advanced_resources)

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
    enabled=false
  }
})


-- time science
data:extend({
  {
    type="recipe",
    name="janus-time-science-pack",
    category="janus-shiftite",
    subgroup="janus-time-science",
    ingredients={
      {type="item", name="low-density-structure", amount=1},
      {type="item", name="janus-shiftite-psi", amount=1},
      {type="item", name="janus-shiftite-omega", amount=1}
    },
    results={
      {type="item", name="janus-time-science-pack", amount=2}
    },
    enabled=false
  }
})
