PrefabFiles = 
{
        "sapling_cluster",
        "berrybush_cluster",
        "grass_cluster",
        "pinecone_cluster",
}

        Assets = 
{
        Asset("ATLAS", "images/inventoryimages/sapling_cluster.xml"),
        Asset("ATLAS", "images/inventoryimages/berrybush_cluster.xml"),
        Asset("ATLAS", "images/inventoryimages/grass_cluster.xml"),
        Asset("ATLAS", "images/inventoryimages/pinecone_cluster.xml"),
}

STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH

--Helper functions--

--GetSize
--Expects a string, gets data from modconfig, returns the size of the grid
local function GetSize(name)
        local option = GetModConfigData(name.."_size")
        if option == "3" then
                return {3, 3}
        elseif option == "5" then
                return {5, 5}
        else
                return {3, 3} --Return a default value
        end
end

--GetFudge
--Expects a string, gets fudge data from modconfig, returns a scalar value
local function GetFudge(name)
        local option = GetModConfigData(name.."_fudge")
        if option == "0" then
                return 0
        elseif option == "25" then
                return 0.25
        elseif option == "50" then
                return 0.5
        elseif option == "75" then
                return 0.75
        elseif option == "100" then
                return 1
        elseif option == "125" then
                return 1.25
        else
                return 1 --Return a default value
        end
end

--Initialization of reused variables
local name = "" --Name of the object
local basescale = nil --Number of basic plantable materials required for recipe, scales on size of grid selected in mod config 
local fudgescale = nil --Some secondary materials are worth more (berries) this fudges the scales for the secondary material requirements
local size = {} --Size obtained from mod configuration
local gendesc = "Plant more with some help!" --Generic description
local rec = nil --The recipe
local ing = {} --Table of ingredients and the number of each ingredient used in recipe

-----===== Sapling cluster =====-----
GLOBAL.STRINGS.NAMES.SAPLING_CLUSTER = "Sapling Cluster"
STRINGS.RECIPE_DESC.SAPLING_CLUSTER = gendesc

name = "sapling"
size = GetSize(name)
fudgescale = GetFudge(name)
scaling = (size[1] * size[2])

--INGREDIENTS--
if fudgescale ~= 0 then
        ing =
        {
                {ingrd = "dug_"..name, num = scaling},
                {ingrd = "twigs", num = scaling * fudgescale}
        }
        rec = Recipe(name.."_cluster",
        {
                Ingredient(ing[1].ingrd, ing[1].num),
                Ingredient(ing[2].ingrd, ing[2].num)
        },RECIPETABS.REFINE, TECH.NONE,"common/dug_"..name.."_placer" )
else
        ing =
        {
                {ingrd = "dug_"..name, num = scaling},
        }
        rec = Recipe(name.."_cluster",
        {
                Ingredient(ing[1].ingrd, ing[1].num)
        },RECIPETABS.REFINE, TECH.NONE,"common/dug_"..name.."_placer" )
end
rec.atlas = "images/inventoryimages/"..name.."_cluster.xml"

--SAVE TUNING--
TUNING.SAPLING_CLUSTER_SIZE = {x = size[1], z = size[2]}
TUNING.SAPLING_CLUSTER_INGRD = ing

-----===== Berrybush cluster =====-----
GLOBAL.STRINGS.NAMES.BERRYBUSH_CLUSTER = "Berrybush Cluster"
STRINGS.RECIPE_DESC.BERRYBUSH_CLUSTER = gendesc

name = "berrybush"
size = GetSize(name)
fudgescale = GetFudge(name)
scaling = (size[1] * size[2])

--INGREDIENTS--
if fudgescale ~= 0 then
        ing =
        {
                {ingrd = "dug_"..name, num = scaling},
                {ingrd = "berries", num = scaling * fudgescale}
        }
        rec = Recipe(name.."_cluster",
        { 
                Ingredient(ing[1].ingrd, ing[1].num),
                Ingredient(ing[2].ingrd, ing[2].num)
        },RECIPETABS.REFINE, TECH.NONE,"common/dug_"..name.."_placer" )
else
        ing =
        {
                {ingrd = "dug_"..name, num = scaling}
        }
        rec = Recipe(name.."_cluster",
        { 
                Ingredient(ing[1].ingrd, ing[1].num)
        },RECIPETABS.REFINE, TECH.NONE,"common/dug_"..name.."_placer" )
end
rec.atlas = "images/inventoryimages/"..name.."_cluster.xml"

--SAVE TUNING--
TUNING.BERRYBUSH_CLUSTER_SIZE = {x = size[1], z = size[2]}
TUNING.BERRYBUSH_CLUSTER_INGRD = ing

-----===== Grass cluster =====-----
GLOBAL.STRINGS.NAMES.GRASS_CLUSTER = "Grass Cluster"
STRINGS.RECIPE_DESC.GRASS_CLUSTER = gendesc

name = "grass"
size = GetSize(name)
fudgescale = GetFudge(name)
scaling = (size[1] * size[2])

--INGREDIENTS--
if fudgescale ~= 0 then
        ing =
        {
                {ingrd = "dug_"..name, num = scaling},
                {ingrd = "cutgrass", num = scaling * fudgescale}
        }
        rec = Recipe(name.."_cluster",
        { 
                Ingredient(ing[1].ingrd, ing[1].num),
                Ingredient(ing[2].ingrd, ing[2].num)
        },RECIPETABS.REFINE, TECH.NONE,"common/".."butterfly".."_placer" ) --dug_grass has no placer animation
else
        ing =
        {
                {ingrd = "dug_"..name, num = scaling}
        }
        rec = Recipe(name.."_cluster",
        { 
                Ingredient(ing[1].ingrd, ing[1].num)
        },RECIPETABS.REFINE, TECH.NONE,"common/".."butterfly".."_placer" ) --dug_grass has no placer animation
end
rec.atlas = "images/inventoryimages/"..name.."_cluster.xml"

--SAVE TUNING--
TUNING.GRASS_CLUSTER_SIZE = {x = size[1], z = size[2]}
TUNING.GRASS_CLUSTER_INGRD = ing

-----===== Pinecone cluster =====-----
GLOBAL.STRINGS.NAMES.PINECONE_CLUSTER = "Tree Cluster"
STRINGS.RECIPE_DESC.PINECONE_CLUSTER = gendesc

name = "pinecone"
size = GetSize(name)
fudgescale = GetFudge(name)
scaling = (size[1] * size[2])

--INGREDIENTS--
if fudgescale ~= 0 then
        ing =
        {
                {ingrd = name, num = scaling},
                {ingrd = "log", num = scaling * fudgescale}
        }
        rec = Recipe(name.."_cluster",
        { 
                Ingredient(name, scaling),
                Ingredient("log", scaling * fudgescale)
        },RECIPETABS.REFINE, TECH.NONE,"common/"..name.."_placer" )
else
        ing =
        {
                {ingrd = name, num = scaling}
        }
        rec = Recipe(name.."_cluster",
        { 
                Ingredient(name, scaling)
        },RECIPETABS.REFINE, TECH.NONE,"common/"..name.."_placer" )  
end
rec.atlas = "images/inventoryimages/"..name.."_cluster.xml"

--SAVE TUNING--
TUNING.PINECONE_CLUSTER_SIZE = {x = size[1], z = size[2]}
TUNING.PINECONE_CLUSTER_INGRD = ing