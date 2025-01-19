-- checks if table t has val in it
local function contains(t, val)
  in_table = false
  for _, v in pairs(t) do
    if (v == val) then in_table = true end
  end
  return in_table
end

-- add time science to labs
for _, lab in pairs(data.raw.lab) do
  if not contains(lab.inputs, "janus-time-science-pack") then
      table.insert(lab.inputs, "janus-time-science-pack")
  end
end

-- add time science to final technologies
local science_to_update = {"promethium-science-pack", "research-productivity"}

for _, tech in pairs(science_to_update) do
  if data.raw['technology'][tech] then
    table.insert(data.raw["technology"][tech].unit.ingredients, {"janus-time-science-pack", 1})
    table.insert(data.raw["technology"][tech].prerequisites, "janus-time-science-pack")
  else
    log("Technology "..tech.." doesn't exist.")
  end
end



-- add the shiftite ore collision layer to certain buildable entities
collision_mask_defaults = require("collision-mask-defaults")
shiftite_collision_categories = {'accumulator', 'ammo-turret', 'arithmetic-combinator', 'artillery-turret', 'assembling-machine', 'beacon', 'boiler', 'burner-generator', 'cargo-bay', 'cargo-landing-pad', 'constant-combinator', 'container', 'curved-rail-a', 'curved-rail-b', 'decider-combinator', 'display-panel', 'electric-energy-interface', 'electric-pole', 'electric-turret', 'fluid-turret', 'furnace', 'fusion-generator', 'fusion-reactor', 'gate', 'generator', 'half-diagonal-rail', 'heat-interface', 'heat-pipe', 'infinity-container', 'infinity-pipe', 'inserter', 'lab', 'lamp', 'land-splitter', 'legacy-curved-rail', 'legacy-straight-rail', 'lightning-attractor', 'linked-belt', 'linked-container', 'loader', 'loader-1x1', 'logistic-container', 'market', 'pipe', 'pipe-to-ground', 'power-switch', 'programmable-speaker', 'pump', 'radar', 'reactor', 'roboport', 'rocket-silo', 'selector-combinator', 'solar-panel', 'space-platform-hub', 'splitter', 'storage-tank', 'straight-rail', 'thruster', 'train-stop', 'transport-belt', 'turret', 'underground-belt', 'wall'}

for k, _ in pairs(defines.prototypes['entity']) do
  if contains(shiftite_collision_categories, k) and data.raw[k] then
    -- loop through each entity of type k
    for _, v in pairs(data.raw[k]) do
      -- add shiftite layer to existing collision_mask if one exists
      if v.collision_mask then
        -- and only if the existing collision_mask is none empty
        -- nesting the if matters since some mods want the collision mask to be empty when default is not.
        if next(v.collision_mask.layers) then
          log("Collision mask before modification is "..v.name.." is "..serpent.block(v.collision_mask))
          log("Modified collision mask of "..v.name.." which is in data.raw["..k.."]")
          v.collision_mask.layers["janus_shiftite_layer"] = true
        end
      -- otherwise add shiftite layer to the default layer
      elseif collision_mask_defaults[k] then
        log("Modified default collision mask of "..v.name.." which is in data.raw["..k.."]")
        v.collision_mask = collision_mask_defaults[k]
        v.collision_mask.layers["janus_shiftite_layer"] = true
      end
    end
  end
end

-- handle concrete tile collision
-- note that for tile collision from a placed item, you edit the condition on the *item* that places the tile, not the tile itself.
concretes = {"stone-brick", "concrete", "hazard-concrete", "refined-concrete", "refined-hazard-concrete"}

for _,v in pairs(concretes) do
  c = data.raw['item'][v]
  
  log(v)

  if c.place_as_tile then
    if c.place_as_tile.condition then
      c.place_as_tile.condition.layers["janus_shiftite_tile_layer"] = true
    else
      c.place_as_tile.condition = {layers={janus_shiftite_tile_layer=true}}
    end
  else
    log("WARN: Attempted to add collision layer to item "..v.." which doesn't place a tile!")
  end
end

-- compatibility final fixes
require("__janus__.compatibility.final-fixes.technologies")