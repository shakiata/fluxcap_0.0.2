--item.lua

local plutonium = table.deepcopy(data.raw["item"]["uranium-235"])
plutonium.name = "plutonium"
plutonium.enabled = true
plutonium.icons = {
    {
    icon = plutonium.icon,
    tint = {r=0.75,b=0.25,g=0.25,a=0.03}
    },
}
local plutoniumprocessing = table.deepcopy(data.raw["recipe"]["uranium-processing"])
plutoniumprocessing.name = "plutonium-processing"
plutoniumprocessing.ingredients = {{"uranium-235", 10}}
plutoniumprocessing.enabled = false
plutoniumprocessing.order = "l[plutonium-processing]"
plutoniumprocessing.subgroup = "raw-material"
plutoniumprocessing.icons = {
    {
        icon = plutoniumprocessing.icon,
    tint = {r=0.75,b=0.25,g=0.25,a=0.25},
    },
}
plutoniumprocessing.results =
{
    {
    name = "plutonium",
    probability = 1,
    amount = 1,
    type = "item"
    },
}

local recipe = table.deepcopy(data.raw["recipe"]["nuclear-fuel"])

local plutoniumfuel = table.deepcopy(data.raw["item"]["nuclear-fuel"])

plutoniumfuel.name = "plutonium-fuel"
plutoniumfuel.icons = {
    {
    icon = plutoniumfuel.icon,
    tint = {r=0.75,b=0.25,g=0.25,a=0.25},
    },
}
plutoniumfuel.order = "q[plutonium-fuel]"
recipe.name = "plutonium-fuel-recipe"

recipe.icons = {
    {
        icon = recipe.icon,
        tint = {r=0.75,b=0.25,g=0.25,a=0.03}
    },
}
recipe.ingredients = {
    {"plutonium", 20},
    {"nuclear-fuel", 2}
}
recipe.result = "plutonium-fuel"
recipe.enabled = false
plutoniumfuel.fuel_value = "50GJ"
plutoniumfuel.fuel_acceleration_multiplier = 25
plutoniumfuel.fuel_top_speed_multiplier = 2


data:extend{plutonium,plutoniumfuel,recipe,plutoniumprocessing}


data:extend(
{
    {
        type = "item",
        name = "fluxcap",
        icon = "__fluxcap__/graphics/fluxcapico.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"hidden"},
        subgroup = "energy",
        order = "f[item]-b[fluxcap]",
        stack_size = 10,
        place_result = "fluxcap"
      },
    {
      name = "fluxcap",
      type = "burner-generator",
      icon = "__fluxcap__/graphics/fluxcapico.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral","player-creation"},
      max_health = 4000,
      dying_explosion = "medium-explosion",
      corpse = "steam-engine-remnants",
      selection_box = {{-1.25, -0.75}, {1.25, 0.75}},
	  animation =
      {
		priority = "high",
		width = 99,
		height = 66,
		frame_count = 1,
		line_length = 1,
		shift = {0, 0},
	    north = {
          filename = "__fluxcap__/graphics/fluxcap.png",
		  priority = "high",
		  width = 99,
		  height = 66,
		  frame_count = 1,
		  line_length = 1,
		  shift = {0, 0}
	    },
	    south = {
          filename = "__fluxcap__/graphics/fluxcap.png",
		  priority = "high",
		  width = 99,
		  height = 66,
		  frame_count = 1,
		  line_length = 1,
		  shift = {0, 0}
	    },
	    east = {
          filename = "__fluxcap__/graphics/fluxcapv.png",
		  priority = "high",
		  width = 66,
		  height = 99,
		  frame_count = 1,
		  line_length = 1,
		  shift = {0, 0}
	    },
	    west = {
          filename = "__fluxcap__/graphics/fluxcapv.png",
		  priority = "high",
		  width = 66,
		  height = 99,
		  frame_count = 1,
		  line_length = 1,
		  shift = {0, 0}
	    },
	  },
	  open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
	  close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
      max_power_output = "1.21GW",
      minable = {mining_time = 1, result = "fluxcap"},
      burner =
      {
        fuel_category = "chemical",
        effectivity = 2,
        fuel_inventory_size = 3,
        emissions_per_minute = 10,
        smoke =
        {
          {
            name = "smoke",
            north_position = {0.9, 0.0},
            east_position = {-2.0, -2.0},
            deviation = {0.1, 0.1},
            frequency = 9
          }
        }
      },
      energy_source =
      {
        type = "electric",
        usage_priority = "secondary-output"
      }
    }})
    
data:extend{
    {
        name = "fluxcapacitorrecipe",
        type = "recipe",
        enabled = true,
        ingredients = {
            {"iron-plate", 300},
            {"nuclear-reactor", 2},
            {"processing-unit", 467},
            {"steam-turbine", 57}

        },
        result = "fluxcap",
        icon = "__fluxcap__/graphics/fluxcap.png",
        icon_size = 64, icon_mipmaps = 4,
        order = "r[fluxcapacitorrecipe]"

    }
}