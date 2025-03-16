afterburner_thruster = table.deepcopy(data.raw['thruster']['thruster'])
afterburner_thruster.name = "janus-thruster"
afterburner_thruster.fuel_fluid_box.filter = "janus-thruster-fuel"
afterburner_thruster.minable.result = "janus-thruster"
afterburner_thruster.icon = "__janus__/graphics/time-shifted/thruster/janus-thruster.png"
afterburner_thruster.graphics_set.flame_effect.filename = "__janus__/graphics/time-shifted/thruster/janus-thruster-flame.png"
afterburner_thruster.graphics_set.working_visualisations[5]['animation']['filenames'] = {"__janus__/graphics/time-shifted/thruster/janus-thruster-light-1.png", "__janus__/graphics/time-shifted/thruster/janus-thruster-light-2.png"}

afterburner_fuel = table.deepcopy(data.raw['fluid']['thruster-fuel'])
afterburner_fuel.name = "janus-thruster-fuel"
afterburner_fuel.fuel_value = "350kJ"
afterburner_fuel.icon = "__janus__/graphics/time-shifted/thruster/janus-thruster-fuel.png"
afterburner_fuel.base_color = {0.91, 0.10, 1}
afterburner_fuel.flow_color = {0.91, 0.10, 1}

data:extend({afterburner_fuel, afterburner_thruster})