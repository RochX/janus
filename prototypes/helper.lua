local helper = {}

function helper.sprite(name)
  return "__janus__/graphics/"..name
end

function helper.technology_icon_constant_shiftite(technology_icon)
  local icons = {
    {
      icon = technology_icon,
      icon_size = 256,
    },
    {
      icon = "__janus__/graphics/janus-shiftite-ore-icon.png",
      icon_size = 64,
      scale = 1,
      shift = {32, 32}
    }
  }

  return icons
end

-- copied from __base__/prototypes/tile/tiles.lua
function helper.tile_variations_template(high_res_picture, high_res_transition_mask, options)
  local function main_variation(size_)
    local y_ = ((size_ == 1) and 0) or ((size_ == 2) and 128) or ((size_ == 4) and 320) or 640
    local ret =
    {
      picture = high_res_picture,
      count = (options[size_] and options[size_].weights) and #options[size_].weights or 16,
      size = size_,
      y = y_,
      line_length = (size_ == 8) and 8 or 16,
      scale = 0.5
    }

    if options[size_] then
      for k, v in pairs(options[size_]) do
        ret[k] = v
      end
    end

    return ret
  end

  local result =
  {
    main =
    {
      main_variation(1),
      main_variation(2),
      main_variation(4)
    }
  }

  if (options.max_size == 8) then
    table.insert(result.main, main_variation(8))
  end

  if options.empty_transitions then
    result.empty_transitions = true
  else
    result.transition =
    {
      spritesheet = high_res_transition_mask,
      layout =
      {
        scale = 0.5,
        count = (options and options.mask_variations) or 8,
        double_side_count = 0,
        u_transition_count = 1,
        o_transition_count = 1,
        u_transition_line_length = 1,
        o_transition_line_length = 2,
        outer_corner_x = 576,
        side_x = 1152,
        u_transition_x = 1728,
        o_transition_x = 2304,
        mask = { y_offset = 0 }
      }
    }
  end
  return result

end


return helper