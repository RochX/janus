local helper = require("__janus__.prototypes.helper")

local time_distorter_item = {
  type="item",
  name="janus-time-distorter",
  subgroup="janus-time-distorter-subgroup",
  icon=helper.sprite "time_distorter.png",
  icon_size=200,
  stack_size=10,
  weight=100000,
  place_result="janus-time-distorter"
}

data:extend({time_distorter_item})