local helper = require("__janus__.prototypes.helper")

-- containment unit
data:extend({{
  type = "item",
  name = "janus-containment-unit",
  icon = helper.sprite "containment-unit.png",
  subgroup = "janus-time-science",
  order = "b[containment-unit]",
  icon_size = 64,
  stack_size = 100,
  weight = 5000
}})