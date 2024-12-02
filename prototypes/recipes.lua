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
    }
  },
  {
    type="recipe",
    name="janus-beta-shift-to-alpha",
    category="janus-shiftite",
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
    }
  },
  {
    type="recipe",
    name="janus-shiftite-omega",
    category="janus-shiftite",
    ingredients={
      {type="item", name="janus-shiftite-alpha", amount=1},
      {type="item", name="janus-shiftite-beta", amount=1},
      {type="item", name="janus-shiftite-gamma", amount=1},
      {type="item", name="janus-shiftite-delta", amount=1},
      {type="item", name="janus-shiftite-epsilon", amount=1},
      {type="item", name="janus-shiftite-zeta", amount=1}
    },
    results={{type="item", name="janus-shiftite-omega", amount=1}}
  }
})

base_resources = {
  {
    type="recipe",
    name="janus-shiftite-to-iron",
    category="janus-shiftite",
    ingredients={{type="item", name="janus-shiftite-alpha", amount=1}},
    results={{type="item", name="iron-ore", amount=5}}
  },
  {
    type="recipe",
    name="janus-shiftite-to-copper",
    category="janus-shiftite",
    ingredients={{type="item", name="janus-shiftite-beta", amount=1}},
    results={{type="item", name="copper-ore", amount=5}}
  },
  {
    type="recipe",
    name="janus-shiftite-to-stone",
    category="janus-shiftite",
    ingredients={{type="item", name="janus-shiftite-gamma", amount=1}},
    results={{type="item", name="stone", amount=5}}
  },
  {
    type="recipe",
    name="janus-shiftite-to-water",
    category="janus-shiftite",
    ingredients={{type="item", name="janus-shiftite-delta", amount=1}},
    results={{type="fluid", name="water", amount=100}}
  },
  {
    type="recipe",
    name="janus-shiftite-to-coal",
    category="janus-shiftite",
    ingredients={{type="item", name="janus-shiftite-epsilon", amount=1}},
    results={{type="item", name="coal", amount=5}}
  },
  {
    type="recipe",
    name="janus-shiftite-to-crude-oil",
    category="janus-shiftite",
    ingredients={{type="item", name="janus-shiftite-zeta", amount=1}},
    results={{type="fluid", name="crude-oil", amount=100}}
  }
}

data:extend(base_resources)