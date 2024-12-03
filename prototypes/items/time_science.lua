local helper = require("__janus__.prototypes.helper")

-- time science
data:extend({
  {
    type="tool",
    name="janus-time-science-pack",
    subgroup="janus-time-science",
    icons={
      {
        icon=helper.sprite "time_science.png",
        icon_size=64,
        tint={r=1,g=0,b=1, a=0.333}
      }
    },
    stack_size=200,
    weight=1000,

    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
  }
})
