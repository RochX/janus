-- item groups
data:extend({
  {
    type = "item-group",
    name = "janus-group",
    order = "e",
    icon = "__janus__/thumbnail.png",
    icon_size = 144,
  }
})

-- subgroups
-- order of this list determines order in gui
subgroups_names = {"janus-shiftite", "janus-basic-from-shiftite", "janus-transform-shiftite", "janus-time-distorter-subgroup"}
local function make_janus_subgroup(names)
  local t = {}
  for i,v in ipairs(names) do
    t[i] = {
      type = "item-subgroup",
      name = v,
      group = "janus-group",
      order=tostring(i)
    }
  end
  return t
end

data:extend(make_janus_subgroup(subgroups_names))
