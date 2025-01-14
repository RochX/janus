-- Rocs-Hardcore-Delayed-Tech-Tree splits research productivity into two separate techs
-- adds time science as requirement to it
if mods["Rocs-Hardcore-Delayed-Tech-Tree"] then
  local science_to_update = {"research-productivity-1", "research-productivity-2"}

  for _, tech in pairs(science_to_update) do
    if data.raw['technology'][tech] then
      table.insert(data.raw["technology"][tech].unit.ingredients, {"janus-time-science-pack", 1})
      table.insert(data.raw["technology"][tech].prerequisites, "janus-time-science-pack")
    else
      log("Technology "..tech.." doesn't exist.")
    end
  end
end