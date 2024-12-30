-- place shiftite tile under every created shiftite ore entity
script.on_event(defines.events.on_chunk_generated, function(event)
  if game.surfaces["janus"] then
    local shiftite_ore_entities = game.surfaces["janus"].find_entities_filtered({area = event.area, name = "janus-shiftite-ore"})

    local tile_locations = {}
    for _,v in pairs(shiftite_ore_entities) do
      table.insert(tile_locations, {name = "janus-shiftite-tile", position = v.position})
    end

    game.surfaces["janus"].set_tiles(tile_locations)
  end
end)
