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
