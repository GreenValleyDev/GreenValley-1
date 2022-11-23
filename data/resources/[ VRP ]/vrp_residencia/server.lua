local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()


vTASKBAR = Tunnel.getInterface("vrp_taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("vrp_residencia",src)
vCLIENT = Tunnel.getInterface("vrp_residencia")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookhomesrobbery = "https://discord.com/api/webhooks/849375940625563728/u49YgAsj36-i0FWNe8HiUarEXZIItReU5DSIqmOjNW7v5R0a30nqGRiWBf9xKsWpCHig"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local timehouses = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timehouses) do
			if v > 0 then
				timehouses[k] = v - 1
				if v == 0 then
					timehouses[k] = nil
				end
			end
			Citizen.Wait(10)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKLOCKPICK
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkLockpick(id,x,y,z,x2,y2,z2,h)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local policia = vRP.getUsersByPermission("policia.permissao")
	if user_id then
		if #policia >= 1 then
			if parseInt(timehouses[id]) > 0 then
				TriggerClientEvent("Notify",source,"importante","Aguarde "..vRPclient.getTimeFunction(source,parseInt(timehouses[id]))..".",8000)
			else
				if vRP.getInventoryItemAmount(user_id,"lockpick") >= 1  then
					local taskResult = vTASKBAR.taskLockpick(source)
					if taskResult then
						timehouses[id] = 1000
						vCLIENT.checkStatus(source,true)
						vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
						TriggerClientEvent("progress",source,20000,"Roubando")
						SetTimeout(20000,function()
							if math.random(100) <= 10 then
								timehouses[id] = 0
								vCLIENT.checkStatus(source,false)
								vRPclient._stopAnim(source,false)
								TriggerClientEvent("Notify",source,"aviso","Fechadura emperrada.",8000)
							else
								if math.random(100) >= 70 then
									vCLIENT.createLocker(source,true,x2,y2,z2,h)
								else
									vCLIENT.createLocker(source,false,x2,y2,z2,h)
								end
								vRPclient.teleport(source,x,y,z)
								SendWebhookMessage(webhookhomesrobbery,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[CASA]: "..tostring(id).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
							end
						end)
					else
						src.Policia(x,y,z)
						TriggerClientEvent("Notify",source,"negado","O roubo falhou, a policia foi notificada.",8000)
					end
				else
				TriggerClientEvent("Notify",source,"negado","<b>Lockpick</b> não encontrada.",8000)
			end
		end
		else
			TriggerClientEvent("Notify",source,"negado","Número de policiais em serviço abaixo do necessário.",8000)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["creative01"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative02"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative03"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative04"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative05"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative06"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative07"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative08"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative09"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["creative10"] = {
		[1] = { "lockpick",1 },
		[2] = { "maconha",1 },
		[3] = { "cocaina",1 },
		[4] = { "cocaina",1 },
		[5] = { "metanfetamina",math.random(4,8) },
		[6] = { "repairkit",1 },
		[7] = { "dinheirosujo",math.random(3000,6000) },
		[8] = { "repairkit",1 },
		[9] = { "militec",1 },
		[10] = { "energetico",math.random(5,10) },
		[11] = { "maconha",math.random(4,8) },
		[12] = { "placa",1 },

	},
	["locker"] = {
		[1] = { "dinheirosujo",math.random(8000,10000) },
		[2] = { "wbody|WEAPON_PISTOL_MK2",1 },
		[3] = { "wammo|WEAPON_PISTOL_MK2",30 }
	}
}



-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAMAR POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
function src.Policia(x,y,z)

	local source = source
	local user_id = vRP.getUserId(source)
	TriggerClientEvent("vrp_sound:source",source,"alarm",0.5)
	
	local policia = vRP.getUsersByPermission("policia.permissao")
	for k,v in pairs(policia) do
		local player = vRP.getUserSource(parseInt(v))
		if player then
			local ids = idgens:gen()
			vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
			blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
			TriggerClientEvent("Notify",player,"importante","O alarme da residência <b>"..tostring(house).."</b> disparou, verifique o ocorrido.")
			--TriggerClientEvent("NotifyPush",player,{ code = 35, title = "O alarme da residência "..tostring(house).." disparou, verifique o ocorrido.", x = x, y = y, z = z, badge = "Casa "..tostring(house).."." })
			SetTimeout(50000,function()
				idgens:free(ids)
				vRPclient.removeBlip(player,blips[ids])
				blips[ids] = nil
			end)
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPayment(house,mod,x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local randlist = math.random(100)
		if randlist <= 79 then
			local randitem = math.random(#itemlist[mod])
			vRP.giveInventoryItem(user_id,itemlist[mod][randitem][1],itemlist[mod][randitem][2])
			TriggerClientEvent("Notify",source,"sucesso","Você encontrou <b>"..itemlist[mod][randitem][2].."x "..vRP.itemNameList(itemlist[mod][randitem][1]).."</b>.",8000)
		elseif randlist >= 80 then
			TriggerClientEvent("Notify",source,"importante","Compartimento vazio.",8000)
			vRP.searchTimer(user_id,600)
			local policia = vRP.getUsersByPermission("policia.permissao")
			for k,v in pairs(policia) do
				local player = vRP.getUserSource(parseInt(v))
				if player then
					local ids = idgens:gen()
					vRPclient.playSound(player,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
					blips[ids] = vRPclient.addBlip(player,x,y,z,1,59,"Roubo em andamento",0.5,true)
					TriggerClientEvent("Notify",player,"importante","O alarme da residência <b>"..tostring(house).."</b> disparou, verifique o ocorrido.")
					--TriggerClientEvent("NotifyPush",player,{ code = 35, title = "O alarme da residência "..tostring(house).." disparou, verifique o ocorrido.", x = x, y = y, z = z, badge = "Casa "..tostring(house).."." })
					SetTimeout(30000,function()
						idgens:free(ids)
						vRPclient.removeBlip(player,blips[ids])
						blips[ids] = nil
					end)
				end
			end

			local homeResult = vRP.query("homes/get_homepermissions",{ home = tostring(house) })
			if homeResult[1] then
				for k,v in pairs(homeResult) do
					local player = vRP.getUserSource(parseInt(v.user_id))
					if player then
						async(function()
							TriggerClientEvent('chatMessage',player,"Dispatch",{65,130,255},"O alarme da residência ^1"..tostring(house).."^0 disparou, notifique as autoridades.")
						end)
					end
				end
			end
		end
	end
end