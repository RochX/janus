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
  table.insert(data.raw["technology"][tech].unit.ingredients, {"janus-time-science-pack", 1})
  table.insert(data.raw["technology"][tech].prerequisites, "janus-time-science-pack")
end



-- -- add the shiftite ore collision layer to certain buildable entities
collision_mask_defaults = require("collision-mask-defaults")
shiftite_collision_exceptions = {"arrow", "artillery-flare", "artillery-projectile", "artillery-wagon", "beam", "cargo-wagon", "character", "character-corpse", "corpse", "deconstructible-tile-proxy", "elevated-curved-rail-a", "elevated-curved-rail-b", "elevated-half-diagonal-rail", "elevated-straight-rail", "entity-ghost", "explosion", "fire", "fluid-wagon", "highlight-box", "item-entity", "item-request-proxy", "locomotive", "mining-drill", "particle-source", "projectile", "rail-ramp", "rail-support", "resource", "smoke-with-trigger", "speech-bubble","spider-leg", "tile-ghost"}

-- TODO: make rail ramps and supports still collide with shiftite even after fulgora oil supports are researched

for k, _ in pairs(defines.prototypes['entity']) do
  -- skip exceptions
  if contains(shiftite_collision_exceptions, k) then
    goto continue
  end

  if data.raw[k] then
    -- loop through each entity of type k
    for _, v in pairs(data.raw[k]) do
      log(v.name)

      -- add shiftite layer to existing collision_mask if one exists
      if v.collision_mask then
        log("Modified collision mask of "..v.name)
        v.collision_mask.layers["janus_shiftite_layer"] = true
      -- otherwise add shiftite layer to the default layer
      elseif collision_mask_defaults[k] then
        log("Modified default collision mask of "..v.name)
        v.collision_mask = collision_mask_defaults[k]
        v.collision_mask.layers["janus_shiftite_layer"] = true
      end
    end
  end
    ::continue::
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
