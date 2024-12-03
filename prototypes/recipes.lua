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
    order="a"
  },
  {
    type="recipe",
    name="janus-shiftite-to-copper",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-beta", amount=1}},
    results={{type="item", name="copper-plate", amount=20}},
    order="b"
  },
  {
    type="recipe",
    name="janus-shiftite-to-stone",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-gamma", amount=1}},
    results={{type="item", name="stone", amount=20}},
    order="c"
  },
  {
    type="recipe",
    name="janus-shiftite-to-water",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-delta", amount=1}},
    results={{type="fluid", name="water", amount=100}},
    order="d"
  },
  {
    type="recipe",
    name="janus-shiftite-to-coal",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-epsilon", amount=1}},
    results={{type="item", name="coal", amount=20}},
    order="e"
  },
  {
    type="recipe",
    name="janus-shiftite-to-crude-oil",
    category="janus-shiftite",
    subgroup="janus-basic-from-shiftite",
    ingredients={{type="item", name="janus-shiftite-zeta", amount=1}},
    results={{type="fluid", name="crude-oil", amount=100}},
    order="f"
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
    order="g"
  }
}

data:extend(base_resources)


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
