-- from Factorio's lualib
local util = require("util")

sa_modules = data.raw['module']

efficiency_modules = {sa_modules['efficiency-module'], sa_modules['efficiency-module-2'], sa_modules['efficiency-module-3']}
productivity_modules = {sa_modules['productivity-module'], sa_modules['productivity-module-2'], sa_modules['productivity-module-3']}
quality_modules = {sa_modules['quality-module'], sa_modules['quality-module-2'], sa_modules['quality-module-3']}
speed_modules = {sa_modules['speed-module'], sa_modules['speed-module-2'], sa_modules['speed-module-3']}

module_types = {"efficiency", "productivity", "quality", "speed"}

-- types must be different
-- returns module prototype first, then its recipe prototype
local function combined_module(lvl, type1, type2)
  if type1 == type2 then
    error("In combined_module types cannot be the same."..type1)
  end
  -- put types in alphabetical order
  if type1 > type2 then
    type1, type2 = type2, type1
  end

  local function get_module(lvl, type)
    module_name = type.."-module"
    if lvl > 1 then
      module_name = module_name.."-"..lvl
    end
    if sa_modules[module_name] == nil then
      log("Module "..module_name.." not found.")
      error("Module "..module_name.." not found.")
    end

    return sa_modules[module_name]
  end

  module1 = get_module(lvl, type1)
  module2 = get_module(lvl, type2)

  combined_name = 'janus-'..type1..'-'..type2..'-module-'..lvl
  icon_file = type1..'-'..type2..'-module-'..lvl
  previous_lvl_name = 'janus-'..type1..'-'..type2..'-module-'..(lvl-1)

  new_module = util.merge({module1, module2})
  -- fields to change: name, category, effect, art_style, beacon_tint, subgroup, icon
  new_module.name = combined_name
  new_module.category = type1..'-'..type2
  new_module.subgroup = "janus-time-shifted"
  new_module.localised_description = {'item-description.janus-'..type1..'-'..type2..'-module'}

  -- TODO: beacon_tint
  -- new_module.beacon_tint = {}
  -- for _,k in pairs({"primary", "secondary", "tertiary", "quaternary"}) do  
  --   new_module.beacon_tint[k] = util.mix_color(module1.beacon_tint[k] or nil, module2.beacon_tint and module2.beacon_tint[k])
  -- end

  new_module.icon = "__janus__/graphics/modules/final/"..icon_file..".png"

  -- takes an effect and modifies it based on which module it came from
  local function determine_effect_amount(module_name, effect_name, value)
    -- keeps a negative consumption value if its from an efficiency module
    if string.find(module_name, "efficiency") and effect_name == "consumption" then
      return value
    end

    if effect_name == "pollution" then
      return 0
    end

    -- all other effects we want to make 0 if negative
    return math.max(0, value)
  end

  -- takes 2 effects and combines them
  -- if strict then adds them as is
  -- if not uses the custom function above
  local function merge_effects(effects, strict)
    merged_effect = {}
    energy_cost_decreased = false
    energy_cost_increased = false

    for module_name,effect in pairs(effects) do
      for k,v in pairs(effect) do
        -- track what consumption effects we've seen
        if k == "consumption" and v < 0 then
          energy_cost_decreased = true
        end
        if k == "consumption" and v > 0 then
          energy_cost_increased = true
        end

        if not merged_effect[k] then
          merged_effect[k] = 0
        end

        if strict then
          merged_effect[k] = merged_effect[k] + v
        else
          merged_effect[k] = merged_effect[k] + determine_effect_amount(module_name, k, v)
        end
      end
    end

    -- change the energy cost based on what energy effects were from the original modules
    -- skips this if strict mode is enabled
    if energy_cost_increased and energy_cost_decreased and not strict then
      merged_effect["consumption"] = 0
    elseif energy_cost_increased and not energy_cost_decreased and not strict then
      merged_effect["consumption"] = merged_effect["consumption"]
    end

    return merged_effect
  end

  tomerge = {}
  tomerge[module1.name] = module1.effect
  tomerge[module2.name] = module2.effect
  new_module.effect = merge_effects(tomerge)


  -- delete unnecessary fields inherited from vanilla modules
  -- fields to delete: localised_name, order, color_hint
  new_module.localised_name = nil
  new_module.order = nil
  new_module.color_hint = nil


  -- recipe
  new_recipe = {
    type = "recipe",
    name = combined_name,
    category = "janus-shiftite",
    subgroup = new_module.subgroup,
    energy_required = 30*lvl,
    ingredients = {
      {type="item", name=module1.name, amount=1},
      {type="item", name=module2.name, amount=1},
    },
    results = {{type="item", name=new_module.name, amount=1}},
    enabled = false
  }

  -- add previous combined module to ingredients if applicable
  if lvl > 1 then
    table.insert(new_recipe.ingredients, {type="item", name=previous_lvl_name, amount=4})
  end

  -- add relevant shiftite to ingredients
  BASE_SHIFTITE_COST = 10
  if string.find(combined_name, "efficiency") then
    table.insert(new_recipe.ingredients, {type="item", name="janus-shiftite-alpha", amount=BASE_SHIFTITE_COST*lvl})
    table.insert(new_recipe.ingredients, {type="item", name="janus-shiftite-beta", amount=BASE_SHIFTITE_COST*lvl})
  end

  if string.find(combined_name, "productivity") then
    table.insert(new_recipe.ingredients, {type="item", name="janus-shiftite-gamma", amount=BASE_SHIFTITE_COST*lvl})
    table.insert(new_recipe.ingredients, {type="item", name="janus-shiftite-delta", amount=BASE_SHIFTITE_COST*lvl})
  end

  if string.find(combined_name, "quality") then
    table.insert(new_recipe.ingredients, {type="item", name="janus-shiftite-epsilon", amount=BASE_SHIFTITE_COST*lvl})
    table.insert(new_recipe.ingredients, {type="item", name="janus-shiftite-zeta", amount=BASE_SHIFTITE_COST*lvl})
  end

  if string.find(combined_name, "speed") then
    table.insert(new_recipe.ingredients, {type="item", name="janus-shiftite-omega", amount=BASE_SHIFTITE_COST*lvl})
    table.insert(new_recipe.ingredients, {type="item", name="janus-shiftite-psi", amount=BASE_SHIFTITE_COST*lvl})
  end

  -- technology
  new_tech = {
    type = "technology",
    name = combined_name,
    icon = "__janus__/graphics/modules/final/"..icon_file.."-tech.png",
    icon_size = 256,
    localised_name = {"technology-name."..combined_name},
    localised_description = {"technology-description.janus-"..type1.."-"..type2.."-module"},
    unit = {
      count = 1000*lvl,
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
    effects = {{type="unlock-recipe", recipe=combined_name}}
  }

  -- add relevant prerequisites based on level
  if lvl == 1 then
    new_tech.prerequisites = {"janus-time-shifted"}
  else
    new_tech.prerequisites = {previous_lvl_name}
  end

  return new_module, new_recipe, new_tech
end

time_shifted_modules = {}
for lvl in pairs({1,2,3}) do
  for _, type1 in pairs(module_types) do
    for _, type2 in pairs(module_types) do
      if type1 < type2 then
        new_module, new_recipe, new_tech = combined_module(lvl, type1, type2)
        table.insert(time_shifted_modules, {type="module-category", name=type1..'-'..type2})
        table.insert(time_shifted_modules, new_module)
        table.insert(time_shifted_modules, new_recipe)
        table.insert(time_shifted_modules, new_tech)
        log(new_tech.name)
      end
    end
  end
end

data:extend(time_shifted_modules)