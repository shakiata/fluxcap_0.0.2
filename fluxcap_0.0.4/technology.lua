--technology.lua

data:extend(
    {
        type = "technology",
        name = "plutonium-processing",
        icon_size = 256, icon_mipmaps = 4,
        icon = "__base__/graphics/technology/uranium-processing.png",
        effects = 
        {
            {
                type = "unlock-recipe",
                recipe = "plutonium-processing"
            },
            {
                type = "unlock-recipe-recipe",
                recipe = "plutonium-fuel"
            },
        },
        prerequisites = {"uranium-processing", "kovarex-enrichment-process"},
        unit =
        {
            ingredients =
            {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1}
            },
            time = 30,
            count = 2000
        },
        order = "e-p-b-c"
    }
)