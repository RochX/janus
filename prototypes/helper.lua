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


return helper