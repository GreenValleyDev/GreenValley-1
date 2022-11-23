local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local Tools = module("vrp","lib/Tools")
local idgens = Tools.newIDGenerator()

vRPEXR = {}
local blips = {}
Tunnel.bindInterface("Ca_raceexplosion",vRPEXR)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
local pay = {
	[1] = { ['min'] = 4000, ['max'] = 6000 },
	[2] = { ['min'] = 1500, ['max'] = 2000 },
	[3] = { ['min'] = 1500, ['max'] = 2000 },
	[4] = { ['min'] = 1500, ['max'] = 2500 },
	[5] = { ['min'] = 1300, ['max'] = 1800 }
}

function vRPEXR.paymentCheck(check,status)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRPclient.setStandBY(source,parseInt(480))
		local random = math.random(pay[check].min,pay[check].max)
		local policia = vRP.getUsersByPermission("policia.permissao")
		if parseInt(#policia) == 0 then
			vRP.giveInventoryItem(user_id,"dinheiro-sujo",parseInt(random*status))
		else
			vRP.giveInventoryItem(user_id,"dinheiro-sujo",parseInt(((random*#policia)*status)*0.9))
		end
	end
end

local racepoint = 1
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(180000)
		racepoint = math.random(#pay)
	end
end)

function vRPEXR.getRacepoint()
	return parseInt(racepoint)
end

function vRPEXR.checkPolice()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local policia = vRP.getUsersByPermission("policia.permissao")
		if #policia < 2 then
			return false
		end
	end
	return true
end

function vRPEXR.startBombRace()
	local source = source
	local x,y,z = vRPclient.getPosition(source)
	local policia = vRP.getUsersByPermission("policia.permissao")
	for l,w in pairs(policia) do
		local player = vRP.getUserSource(parseInt(w))
		if player then
			async(function()
				local ids = idgens:gen()
				blips[ids] = vRPclient.addBlip(player,x,y,z,1,1,"Corredor ilegal",0.5)
				--vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
				TriggerClientEvent('chatMessage',player,"Central",{65,130,255},"Encontramos um corredor ilegal na cidade, intercepte-o.")
				SetTimeout(15000,function() vRPclient.removeBlip(player,blips[ids]) idgens:free(ids) end)
			end)
		end
	end
end

function vRPEXR.removeBombRace()
	local source = source
	TriggerEvent('eblips:remove',source)
end

RegisterCommand('defuse',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('races:defuse',nplayer)
		end
	end
end)