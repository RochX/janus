local helper = require("__janus__.prototypes.helper")

-- containment unit
data:extend({{
  type = "item",
  name = "janus-containment-unit",
  subgroup = "janus-time-science",
  order = "b[containment-unit]",
  icons = {
    {
      icon=helper.sprite "containment-unit.png",
      icon_size=1024,
      scale=0.05
    }
  },
  stack_size = 100,
  weight = 5000
}})