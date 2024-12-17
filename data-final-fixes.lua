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



-- add the shiftite ore collision layer to all buildable entities
collision_mask_defaults = require("collision-mask-defaults")
shiftite_collision_exceptions = {"mining-drill", "character"}

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
