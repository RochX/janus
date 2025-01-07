janus_briefing = {
  type = "tips-and-tricks-item",
  name = "janus-briefing",
  tag = "[planet=janus]",
  category = "space-age",
  order = "j-a",
  trigger = {type = "research", technology = "planet-discovery-janus"},
  simulation = {
    planet = "janus",
    mods = {"janus"},
    init = [[
      game.forces.player.technologies["electronics"].researched=true
      game.forces.player.technologies["janus-time-distorter"].researched=true
      game.forces.player.technologies["inserter-capacity-bonus-2"].researched=true

      game.simulation.camera_alt_info = true
      game.simulation.camera_zoom = 1.5
      game.simulation.hide_cursor = true

      for x = -20, 20, 1 do
        for y = -15, 15 do
          game.surfaces[1].set_tiles{{position = {x,y}, name="dirt-1"}}
        end
      end

      template_locations = {
        left = {{-2,-9},{-3,-8},{-4,-7},{-5,-6},{-6,-5},{-7,-4},{-7,-3},{-7,-2},{-7,-1},{-7,0},{-8,1},{-8,2},{-8,3},{-8,4},{-8,5},{-9,6}},
        down = {{-5,6},{-4,5},{-3,5},{-2,4},{-1,3},{0,3},{1,4},{2,4},{3,5},{4,5},{5,7},{6,8}},
        right = {{6,-11},{5,-10},{3,-9},{3,-8},{3,-7},{4,-6},{4,-5},{4,-4},{4,-3},{5,-2},{6,-1},{7,0},{8,1},{9,2},{10,2}}
      }

      shiftite_locations = {}

      for _, pos in pairs(template_locations['left']) do
        for offset=2,10 do
          table.insert(shiftite_locations, {pos[1]-offset, pos[2]})
        end
      end

      for _, pos in pairs(template_locations['down']) do
        for offset=0,10 do
          table.insert(shiftite_locations, {pos[1], pos[2]+offset})
        end
      end

      for _, pos in pairs(template_locations['right']) do
        for offset=0,10 do
          table.insert(shiftite_locations, {pos[1]+offset, pos[2]})
        end
      end

      for _, pos in pairs(shiftite_locations) do
        game.surfaces[1].set_tiles{{position = {pos[1], pos[2]}, name="janus-shiftite-tile"}}
        game.surfaces[1].create_entity{name="janus-shiftite-ore", position = {pos[1], pos[2]}, amount=500}
      end
    ]]
  }
}

janus_tip = {
  type = "tips-and-tricks-item",
  name = "janus-tip",
  trigger = {type = "research", technology = "planet-discovery-janus"},
  tag = "[entity=janus-time-distorter]",
  category = "space-age",
  order = "j-b",
  indent = 1,
  simulation = {
    planet = "janus",
    mods = {"janus"},
    init = [[
      game.forces.player.technologies["electronics"].researched=true
      game.forces.player.technologies["janus-time-distorter"].researched=true
      game.forces.player.technologies["inserter-capacity-bonus-2"].researched=true

      game.simulation.camera_alt_info = true
      game.simulation.camera_zoom = 1.5
      game.simulation.hide_cursor = true

      for x = -20, 20, 1 do
        for y = -15, 15 do
          game.surfaces[1].set_tiles{{position = {x,y}, name="dirt-1"}}
        end
      end

      template_locations = {
        left = {{-2,-9},{-3,-8},{-4,-7},{-5,-6},{-6,-5},{-7,-4},{-7,-3},{-7,-2},{-7,-1},{-7,0},{-8,1},{-8,2},{-8,3},{-8,4},{-8,5},{-9,6}},
        down = {{-5,6},{-4,5},{-3,5},{-2,4},{-1,3},{0,3},{1,4},{2,4},{3,5},{4,5},{5,7},{6,8}},
        right = {{6,-11},{5,-10},{3,-9},{3,-8},{3,-7},{4,-6},{4,-5},{4,-4},{4,-3},{5,-2},{6,-1},{7,0},{8,1},{9,2},{10,2}}
      }

      shiftite_locations = {}

      for _, pos in pairs(template_locations['left']) do
        for offset=2,10 do
          table.insert(shiftite_locations, {pos[1]-offset, pos[2]})
        end
      end

      for _, pos in pairs(template_locations['down']) do
        for offset=0,10 do
          table.insert(shiftite_locations, {pos[1], pos[2]+offset})
        end
      end

      for _, pos in pairs(template_locations['right']) do
        for offset=0,10 do
          table.insert(shiftite_locations, {pos[1]+offset, pos[2]})
        end
      end

      for _, pos in pairs(shiftite_locations) do
        game.surfaces[1].set_tiles{{position = {pos[1], pos[2]}, name="janus-shiftite-tile"}}
        game.surfaces[1].create_entity{name="janus-shiftite-ore", position = {pos[1], pos[2]}, amount=500}
      end

      game.surfaces[1].create_entities_from_blueprint_string{
        string="0eNrNmd1yqzYQx9+FaziDJD5sz/RJMmcYDHKiFgSVRFs343fvAgYnxyJnl3PTXDgEi9+upP3vrsh7cG4G2RulXXB6D1TVaRucXt4Dq1512Yz3dNnK4BT8XurBRk61MqqVdZ1x0gS3MFC6lv8EJ3YLPQ85U2rbw9joLBv3YTi/fQ8DqZ1ySs4Gpz+uhR7aM4BPLFwYspGVM6qKpJbm9RqBq9JcykoGYdB3FgidHk0CNYKnruMvAZbOw+UiTWHVv0Bh8fozOvqDMb4aa2WthjZabfZd47HDvqV3Q/xbevMAxV5g5uclRF6ULMDED0zDL/fVs7IfgWFgZKX6x+P2TV2ALyPXRVXX9xNiHlP8OZQNmIaxujMthIfHnWx151JaB1tspd+P1Y10cqNWYGT+msEmdn9JY1QtC+vK6o/71nOPvRxrj3+eNtrAIdyQwPPKZosJ/uOUDh7wcQdYYMAsXslNp1+jtxKUWn+xNI8Y4+i9YD7DDLsZD4tPMwKBXFQDT83JZElKK3kOyqhvSjfK5SkmQxjR9qUpQQBw97dgzE8zsWi7ekScG5hHAxKBwYOVxWrPmUESQoNx/BammxNmXrTYgd5IYeyRc0prZXtuFERFW1ZvSstIfCEV/jlD3Je+Ks9TpiJkBZY+F4FW6dGP2qim8czquDgRP0WIz0CGX698k+xVU75DpzjyntTCUOTjjuhh/ujh8Q5WvMFi5Gwd07I1pzYA0eFuaWv6gh5YqN3nCR2M2nye0sMKB87oYNxS5HsLVvxL9Yof6KG9Fdk7FLcRcSImV1FGLaLKdPp/UUIF29u+xj/rXsc50qqU4NTmlf1S7yr2Hi42glBQC734NI11LWcvOg1+VMpUg3LEdaRXexbfXeGYai8ImehAAuf0pIxq9sUj1dgeFtAf2/kEfG7yx8N2P7gCTvedmVe/kRfnXfsdxwrUDJIdfYDYOAMzOmqjt03I9V78xDeBzQEfQQTRJwl9gxJM7CYpfVU33ikkeH0Jkot4eaUkLr6QJyQuXkzLVqUYLaUxmZuguHhhLdkrw6xDysn+4rj45vpI4uI1diBx8RJjjATGC26tlDgwXnFMkMB4yTFOAuM1x1IKOMOLjiUkMF51jCS7DC87RtJdhtcdIwkvwwuPkZSX4ZXHF4HkmJSZZXRwhgLndPARBT7QwQcU+EgHM9SbgzzeQUa9OsjZDjKq380f4lP6AqcXd42qN2m/JM/VfxlfWOkcnHrsOM7IFnrEYtDzUVnWBZxT2/uJ2deE5eLDW5Gy9r4lWw0nTycGd+1n3+HgMB3g/4avx9cBLzxMQxGm38MX+AyT6Qo+Q87XSzF/P94Jk/m2EMs1sEbXp7cAy38cwwD6XzvZTjN+TI7HNOVpJji73f4DXaJmfw==",
        position={4,1}
      }
    ]]
  }
}

data:extend({janus_briefing, janus_tip})