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
plutoniumprocessing.enabled = true
plutoniumprocessing.order = "plutonium-processing"
plutoniumprocessing.subgroup = "raw-resource"
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

recipe.name = "plutonium-fuel-recipe"

recipe.icons = {
    {
        icon = recipe.icon,
        tint = {r=0.75,b=0.25,g=0.25,a=0.03}
    },
}
recipe.ingredients = {
    {"plutonium", 10},
    {"nuclear-fuel", 1}
}
recipe.result = "plutonium-fuel"
recipe.enabled = true
plutoniumfuel.fuel_value = "10GJ"
plutoniumfuel.fuel_acceleration_multiplier = 15


data:extend{plutonium,plutoniumfuel,recipe,plutoniumprocessing}


data:extend(
{
    {
        type = "item",
        name = "fluxcap",
        icon = "__fluxcap__/graphics/fluxcap.png",
        icon_size = 64, icon_mipmaps = 4,
        flags = {"hidden"},
        subgroup = "other",
        order = "t[item]-o[fluxcap]",
        stack_size = 10,
        place_result = "fluxcap"
      },
    {
      name = "fluxcap",
      type = "burner-generator",
      icon = "__fluxcap__/graphics/fluxcap.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral","player-creation"},
      max_health = 400,
      dying_explosion = "medium-explosion",
      corpse = "steam-engine-remnants",
      collision_box = {{-1.35, -2.35}, {1.35, 2.35}},
      selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
      max_power_output = "1.21GW",
      minable = {mining_time = 1, result = "fluxcap"},
      animation =
      {
        north = util.table.deepcopy(data.raw.generator["steam-engine"].vertical_animation),
        east = util.table.deepcopy(data.raw.generator["steam-engine"].horizontal_animation),
        south = util.table.deepcopy(data.raw.generator["steam-engine"].vertical_animation),
        west = util.table.deepcopy(data.raw.generator["steam-engine"].horizontal_animation)
      },
      -- idle_animation can also be specified
      burner =
      {
        fuel_category = "chemical",
        effectivity = 0.5,
        fuel_inventory_size = 1,
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
            {"iron-plate", 100}
        },
        result = "fluxcap"
    }
}