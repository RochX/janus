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