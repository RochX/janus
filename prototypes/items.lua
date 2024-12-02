local helper = require("__janus__.prototypes.helper")

local DEFAULT_SPOIL_TIME = 60*2

local function create_shiftite(ore_name, spoil_to, spoil_time)

  local shiftite_template = {
    type = "item",
    icon_size = 64,
    stack_size = 50,
    subgroup = "janus-shiftite"
  }

  shiftite_template.name = "janus-shiftite-"..ore_name
  shiftite_template.icon = helper.sprite(ore_name..".png")
  
  if spoil_to ~= nil then
    spoil_time = spoil_time or DEFAULT_SPOIL_TIME

    shiftite_template.spoil_result = "janus-shiftite-"..spoil_to
    shiftite_template.spoil_ticks = spoil_time
  end

  return shiftite_template
end

-- alpha loop
data:extend({create_shiftite("alpha", "gamma")})
data:extend({create_shiftite("gamma", "epsilon")})
data:extend({create_shiftite("epsilon", "alpha")})

-- beta loop
data:extend({create_shiftite("beta", "delta")})
data:extend({create_shiftite("delta", "zeta")})
data:extend({create_shiftite("zeta", "beta")})

-- omega loop
data:extend({create_shiftite("omega", "psi", 60*5)})
data:extend({create_shiftite("psi", "omega", 60*5)})
