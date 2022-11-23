Config = {}

-------------------
-- false = use command to open the market | true = use blips to open the market
Config.UseBlipToAccessMarket = true

-- If false:
-- This will let the player open the market anywhere
Config.MarketCommand = "market" -- Command to open the market

-- If true:
Config.OpenMarketKey = 38 -- [E] Key to open the interaction, check here the keys ID: https://docs.fivem.net/docs/game-references/controls/#controls

Config.ShowFloorBlips = true -- If true it'll show the crafting markers on the floor

Config.UseOkokTextUI = false -- true = okokTextUI (I recommend you using this since it is way more optimized than the default ShowHelpNotification) | false = ShowHelpNotification

Config.ShowBlipsOnMap = false -- Will show the blips on the map (if true it'll use the blipId, blipColor, blipScale and blipText to create them)

Config.BlipCoords = { 
	{x = 46.48, y = -1749.11, z = 29.64, radius = 2, blipId = 78, blipColor = 2, blipScale = 0.9, blipText = "Marketplace", showMarkerRadius = 50, MarkerID = 29},
}
-- x, y, z, radius: Coordinates of the market blips and interaction radius
-- blipId, blipColor, blipScale, blipText: blips on the map: https://docs.fivem.net/docs/game-references/blips/
-- MarkerID: id of the marker on the ground https://docs.fivem.net/docs/game-references/markers/
-- showMarkerRadius: How close you need to be to see the marker
-------------------

-- Jobs that can access the blackmarket
-- Config.BlackmarketAllowedJobs = {
-- 	{
-- 		job = "police", -- Job that can access the blackmarket
-- 		grade = { -- Grades that can access the blackmarket
-- 			"boss",
-- 			"rookie",
-- 		}
-- 	},
-- 	{
-- 		job = "ballas",
-- 		grade = { -- If this field is blank all grades can access it
			
-- 		}
-- 	},
-- }

-- true = use dirty money on blackmarket | false = use bank money on blackmarket
-- Config.UseDirtyMoneyOnBlackmarket = false

-- Config.Blackmarket = { -- (item/weapon) / if is weapon then: {"weapon id", true}, if is item then: {"item id", false} (all blackmarket items need to be on the BlacklistItems)
-- 	{"WEAPON_ASSAULTRIFLE", true},
-- 	{"WEAPON_PISTOL", true},
-- 	{"bandage", false},
-- 	{"grip", false},
-- 	{"trigger", false},
-- }

Config.BlacklistItems = { -- items/weapons that are not allowed to be sold on normal market
	"dinheiro-sujo",
	"maconha",
	"lancaperfume",
	"adubo",
	"folhas-cannabis",
	"alvejante",
	"borrifador",
	"metanfetamina",
	"composito",
	"nitrato-amonia",
	"hidroxido-sodio",
	"peseudoefedrina",
	"eter",
	"crack",
	"cocaina",
	"pasta-base",
	"lsd",
	"ergolina",
	"acido-sulfurico",
	"folhas-coca",
	"calcio-po",
	"querosene",
	"colete",
	"corpo-fuzil",
	"corpo-sub",
	"corpo-pistola",
	"corpo-compactrifle",
	"corpo-ak47",
	"corpo-aks74u",
	"corpo-glock",
	"corpo-magnum",
	"corpo-uzi",
	"corpo-fiveseven",
	"corpo-tec9",
	"corpo-wide1911",
	"corpo-mp5x",
	"corpo-mtar",
	"corpo-deoze-canocurto",
	"corpo-g36",
	"wbody|WEAPON_DAGGER",
	"wbody|WEAPON_BAT",
	"wbody|WEAPON_BOTTLE",
	"wbody|WEAPON_CROWBAR",
	"wbody|WEAPON_FLASHLIGHT",
	"wbody|WEAPON_GOLFCLUB",
	"wbody|WEAPON_HAMMER",
	"wbody|WEAPON_WEAPON_HATCHET",
	"wbody|WEAPON_WEAPON_KNUCKLES",
	"wbody|WEAPON_KNIFE",
	"wbody|WEAPON_PISTOL",
	"wbody|WEAPON_PISTOL_MK2",
	"wbody|WEAPON_COMBATPISTOL",
	"wbody|WEAPON_APPISTOL",
	"wbody|WEAPON_STUNGUN",
	"wbody|WEAPON_PISTOL50",
	"wbody|WEAPON_SNSPISTOL",
	"wbody|WEAPON_SNSPISTOL_MK2",
	"wbody|WEAPON_HEAVYPISTOL",
	"wbody|WEAPON_VINTAGEPISTOL",
	"wbody|WEAPON_FLAREGUN",
	"wbody|WEAPON_MARKSMANPISTOL",
	"wbody|WEAPON_REVOLVER",
	"wbody|WEAPON_REVOLVER_MK2",
	"wbody|WEAPON_DOUBLEACTION",
	"wbody|WEAPON_RAYPISTOL",
	"wbody|WEAPON_CERAMICPISTOL",
	"wbody|WEAPON_NAVYREVOLVER",
	"wammo|WEAPON_PISTOL",
	"wammo|WEAPON_PISTOL_MK2",
	"wammo|WEAPON_COMBATPISTOL",
	"wammo|WEAPON_APPISTOL",
	"wammo|WEAPON_STUNGUN",
	"wammo|WEAPON_PISTOL50",
	"wammo|WEAPON_SNSPISTOL",
	"wammo|WEAPON_SNSPISTOL_MK2",
	"wammo|WEAPON_HEAVYPISTOL",
	"wammo|WEAPON_VINTAGEPISTOL",
	"wammo|WEAPON_FLAREGUN",
	"wammo|WEAPON_MARKSMANPISTOL",
	"wammo|WEAPON_REVOLVER",
	"wammo|WEAPON_REVOLVER_MK2",
	"wammo|WEAPON_DOUBLEACTION",
	"wammo|WEAPON_RAYPISTOL",
	"wammo|WEAPON_CERAMICPISTOL",
	"wammo|WEAPON_NAVYREVOLVER",
	"wbody|WEAPON_MICROSMG",
	"wbody|WEAPON_SMG",
	"wbody|WEAPON_SMG_MK2",
	"wbody|WEAPON_ASSAULTSMG",
	"wbody|WEAPON_COMBATPDW",
	"wbody|WEAPON_MACHINEPISTOL",
	"wbody|WEAPON_MINISMG",
	"wbody|WEAPON_RAYCARBINE",
	"wammo|WEAPON_MICROSMG",
	"wammo|WEAPON_SMG",
	"wammo|WEAPON_SMG_MK2",
	"wammo|WEAPON_ASSAULTSMG",
	"wammo|WEAPON_COMBATPDW",
	"wammo|WEAPON_MACHINEPISTOL",
	"wammo|WEAPON_MINISMG",
	"wammo|WEAPON_RAYCARBINE",
	"wbody|WEAPON_PUMPSHOTGUN",
	"wbody|WEAPON_PUMPSHOTGUN_MK2",
	"wbody|WEAPON_SAWNOFFSHOTGUN",
	"wbody|WEAPON_ASSAULTSHOTGUN",
	"wbody|WEAPON_BULLPUPSHOTGUN",
	"wbody|WEAPON_MUSKET",
	"wbody|WEAPON_HEAVYSHOTGUN",
	"wbody|WEAPON_DBSHOTGUN",
	"wbody|WEAPON_AUTOSHOTGUN",
}

-- Config.BlacklistVehicles = { -- all vehicles that are not allowed to be sold on the market (check the gameName on vehicles.meta -> <gameName>Supra</gameName>)
-- 	"Supra",
-- 	"M8",
-- }

-------------------------- DISCORD LOGS

-- To set your Discord Webhook URL go to server.lua, line 2

Config.BotName = 'ServerName' -- Write the desired bot name

Config.ServerName = 'ServerName' -- Write your server's name

Config.IconURL = '' -- Insert your desired image link

Config.DateFormat = '%d/%m/%Y [%X]' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html

Config.AddAdColor = '6225733'

Config.BuyItemColor = '224'

Config.RemoveAdColor = '16711680'

Config.ClaimAdColor = '12231480'