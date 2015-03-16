-- This information tells other players more about the mod
name = "Cluster Plant"
description = "Plant things, in clusters!"
author = "GhostRequiemZX"
version = "0.9.4"

-- This is the URL name of the mod's thread on the forum; the part after the index.php? and before the first & in the URL
-- Example:
-- http://forums.kleientertainment.com/index.php?/files/file/202-sample-mods/
-- becomes
-- /files/file/202-sample-mods/
forumthread = ""

-- This lets other players know if your mod is out of date, update it to match the current version in the game
api_version = 10

---- Can specify a custom icon for this mod!
icon_atlas = "clusterplant.xml"
icon = "clusterplant.tex"

--This lets the clients know that they need to download the mod before they can join a server that is using it.
all_clients_require_mod = true


--Let the mod system know that this mod is functional with Don't Starve Together
--dont_starve_compatible = true
--reign_of_giants_compatible = true
dst_compatible = true

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {"clusterplant"}

configuration_options =
{
    -----===== Sapling Configuration Options =====-----
    {
        name = "sapling_size",
        label = "Sapling Cluster Size",
        options = 
        {
            {description = "3x3", data = "3"},
			{description = "5x5", data = "5"},
        },
        default = "3",
    },
    {
        name = "sapling_fudge",
        label = "Twig Requirement Scale",
        hover = "Adjust secondary resource requirement. Scaled off cluster size.",
        options =
        {
            {description = "Off", data = "0"},
            {description = "25%", data = "25"},
            {description = "50%", data = "50"},
            {description = "75%", data = "75"},
            {description = "100%", data = "100"},
            {description = "125%", data = "125"},
        },
        default = "100",
    },
    ----===== Berrybush Configuration Options =====-----
    {
        name = "berrybush_size",
        label = "Berrybush Cluster Size",
        options = 
        {
            {description = "3x3", data = "3"},
			{description = "5x5", data = "5"},
        },
        default = "3",
    },
    {
        name = "berrybush_fudge",
        label = "Berry Requirement Scale",
        hover = "Adjust secondary resource requirement. Scaled off cluster size.",
        options =
        {
            {description = "Off", data = "0"},
            {description = "25%", data = "25"},
            {description = "50%", data = "50"},
            {description = "75%", data = "75"},
            {description = "100%", data = "100"},
            {description = "125%", data = "125"},
        },
        default = "50",
    },
    -----===== Grass Configuration Options =====-----    
    {
        name = "grass_size",
        label = "Grass Cluster Size",
        options = 
        {
            {description = "3x3", data = "3"},
			{description = "5x5", data = "5"},
        },
        default = "3",
    },
        {
        name = "grass_fudge",
        label = "Grass Requirement Scale",
        hover = "Adjust secondary resource requirement. Scaled off cluster size.",
        options =
        {
            {description = "Off", data = "0"},
            {description = "25%", data = "25"},
            {description = "50%", data = "50"},
            {description = "75%", data = "75"},
            {description = "100%", data = "100"},
            {description = "125%", data = "125"},
        },
        default = "100",
    },
    -----===== Pinecone Configuration Options =====-----
    {
        name = "pinecone_size",
        label = "Tree Cluster Size",
        options = 
        {
            {description = "3x3", data = "3"},
			{description = "5x5", data = "5"},
        },
        default = "3",
    },
        {
        name = "pinecone_fudge",
        label = "Log Requirement Scale",
        hover = "Adjust secondary resource requirement. Scaled off cluster size.",
        options =
        {
            {description = "Off", data = "0"},
            {description = "25%", data = "25"},
            {description = "50%", data = "50"},
            {description = "75%", data = "75"},
            {description = "100%", data = "100"},
            {description = "125%", data = "125"},
        },
        default = "75",
    },
}
