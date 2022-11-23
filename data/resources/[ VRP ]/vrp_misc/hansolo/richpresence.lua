local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONEXÃO ]---------------------------------------------------------------------------------------

misc = Tunnel.getInterface("vrp_misc")

--[ DISCORD ]---------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
        SetDiscordAppId(910464728642486273)

	    local players = misc.discord() or 0
		
	    SetDiscordRichPresenceAsset('greenvalley')
		SetDiscordRichPresenceAssetText('Cidadãos: '..players..' de 1024')
	    SetRichPresence('Faça parte da nossa família: discord.gg/yvagJKtM')
		
		SetDiscordRichPresenceAssetSmall('greenvalley')
		SetDiscordRichPresenceAssetSmallText('Green Valley RP discord.gg/yvagJKtM')
        SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/yvagJKtM")
		SetDiscordRichPresenceAction(1, "Jogar", "fivem://connect/191.96.79.246:30120")
		Citizen.Wait(10000)
	end
end)