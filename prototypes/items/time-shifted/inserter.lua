local helper = require("__janus__.prototypes.helper")
local fast_inserter = table.deepcopy(data.raw['item']['fast-inserter'])

fast_inserter_time_shifted = fast_inserter
fast_inserter_time_shifted.name = "janus-fast-inserter"
fast_inserter_time_shifted.place_result = "janus-fast-inserter"
fast_inserter_time_shifted.subgroup = "janus-time-shifted"
fast_inserter_time_shifted.icon = "__janus__/graphics/time-shifted/inserter/time-shifted-fast-inserter-icon.png"
fast_inserter_time_shifted.weight = 20000

data:extend({fast_inserter_time_shifted})