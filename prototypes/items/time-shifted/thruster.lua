afterburner_thruster = table.deepcopy(data.raw['item']['thruster'])

afterburner_thruster.name = "janus-thruster"
afterburner_thruster.place_result = "janus-thruster"
afterburner_thruster.subgroup = "janus-time-shifted"
afterburner_thruster.icon = "__janus__/graphics/time-shifted/thruster/janus-thruster.png"
afterburner_thruster.icon_size = 256

data:extend({afterburner_thruster})