-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
sergin = {}
Tunnel.bindInterface("nation_garages",sergin)
vCLIENT = Tunnel.getInterface("nation_garages")
local inventory = module("vrp","zirix/vehicles")
local idgens = Tools.newIDGenerator()
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("creative/get_vehicle","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("creative/rem_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_update_vehicles","UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_detido","UPDATE vrp_user_vehicles SET detido = @detido, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/set_ipva","UPDATE vrp_user_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP._prepare("creative/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)")
vRP._prepare("creative/con_maxvehs","SELECT COUNT(vehicle) as qtd FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP._prepare("creative/rem_srv_data","DELETE FROM vrp_srv_data WHERE dkey = @dkey")
vRP._prepare("creative/get_estoque","SELECT * FROM vrp_estoque WHERE vehicle = @vehicle")
vRP._prepare("creative/set_estoque","UPDATE vrp_estoque SET quantidade = @quantidade WHERE vehicle = @vehicle")
vRP._prepare("creative/get_users","SELECT * FROM vrp_users WHERE id = @user_id")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookadmin = "https://discord.com/api/webhooks/913192114110726204/XgjMwpv4iZpBTUHVjyJQPZFiLMxscwFgJ06E2v8D6S370wSUaKeLVZSo7f-gtnlfC4cy"
local webhookvehs = "https://discord.com/api/webhooks/913192180267487263/T9YCSIMUFLw3A5VMzN9ORhQWHDZn7CxM9IxpOHJrdm_e5pNxFLXPUepIi2tkfHtLNrGF"
local webhookdesmanche = "https://discord.com/api/webhooks/913192231505109004/dyWokPnTDiTcWH4tJdqxPaCFPOhUWojA1w9GuBVOUbE1-W1dzBDDPbDVLH5BtgYCeWcx"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local police = {}
local vehlist = {}
local trydoors = {}
trydoors["CLONADOS"] = true
trydoors["CREATIVE"] = true

-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURNVEHICLESEVERYONE
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.returnVehicleEveryone(placa)
	return trydoors[placa]
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPLATEEVERYONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("setPlateEveryone")
AddEventHandler("setPlateEveryone",function(placa)
	trydoors[placa] = true
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- MYVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.myVehicles(work)
	local source = source
	local user_id = vRP.getUserId(source)
	local myvehicles = {}
	local ipva = ""
	local status = ""
	if user_id then
		if workgarage[work] then
			for k,v in pairs(workgarage) do
				if k == work then
					for k2,v2 in pairs(v) do
						status = ""..k..""
						ipva = "Pago"
						table.insert(myvehicles,{ name = v2, name2 = vRP.vehicleName(v2) or "Sem nome", engine = 100, body = 100, fuel = 100, status = status, ipva = ipva })
					end
				end
			end
			return myvehicles
		else
			local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(user_id) })
			local address = vRP.query("homes/get_homeuserid",{ user_id = parseInt(user_id) })
			if #address > 0 then
				for k,v in pairs(address) do
					if v.home == work then
						for k2,v2 in pairs(vehicle) do
							if parseInt(os.time()) <= parseInt(vehicle[k2].time+24*60*60) then
								status = ""..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.5))..""
							elseif vehicle[k2].detido == 1 then
								status = ""..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.1))..""
							else
								status = "Gratuita"
							end

							if parseInt(os.time()) >= parseInt(vehicle[k2].ipva+24*15*60*60) then
								ipva = "Atrasado"
							else
								ipva = "Pago"
							end
							table.insert(myvehicles,{ name = vehicle[k2].vehicle, name2 = vRP.vehicleName(vehicle[k2].vehicle), engine = parseInt(vehicle[k2].engine*0.1), body = parseInt(vehicle[k2].body*0.1), fuel = parseInt(vehicle[k2].fuel), status = status, ipva = ipva })
						end
						return myvehicles
					else
						for k2,v2 in pairs(vehicle) do
							if parseInt(os.time()) <= parseInt(vehicle[k2].time+24*60*60) then
								status = ""..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.5))..""
							elseif vehicle[k2].detido == 1 then
								status = ""..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.1))..""
							else
								status = ""..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k2].vehicle)*0.005))..""
							end

							if parseInt(os.time()) >= parseInt(vehicle[k2].ipva+24*15*60*60) then
								ipva = "Atrasado"
							else
								ipva = "Pago"
							end
							table.insert(myvehicles,{ name = vehicle[k2].vehicle, name2 = vRP.vehicleName(vehicle[k2].vehicle), engine = parseInt(vehicle[k2].engine*0.1), body = parseInt(vehicle[k2].body*0.1), fuel = parseInt(vehicle[k2].fuel), status = status, ipva = ipva })
						end
						return myvehicles
					end
				end
			else
				for k,v in pairs(vehicle) do
					if vRP.vehiclePrice(vehicle[k].vehicle) ~= nil and vRP.vehicleName(vehicle[k].vehicle) ~= nil then
						if parseInt(os.time()) <= parseInt(vehicle[k].time+24*60*60) then
							status = ""..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k].vehicle)*0.5))..""
						elseif vehicle[k].detido == 1 then
							status = ""..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k].vehicle)*0.1))..""
						else
							status = ""..vRP.format(parseInt(vRP.vehiclePrice(vehicle[k].vehicle)*0.005))..""
						end

						if parseInt(os.time()) >= parseInt(vehicle[k].ipva+24*15*60*60) then
							ipva = "Atrasado"
						else
							ipva = "Pago"
						end
						table.insert(myvehicles,{ name = vehicle[k].vehicle, name2 = vRP.vehicleName(vehicle[k].vehicle), engine = parseInt(vehicle[k].engine*0.1), body = parseInt(vehicle[k].body*0.1), fuel = parseInt(vehicle[k].fuel), status = status, ipva = ipva })
					end
				end
				return myvehicles
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.spawnVehicles(name,use)
	if name then
		local source = source
		local user_id = vRP.getUserId(source)
		if user_id then
			local identity = vRP.getUserIdentity(user_id)
			local value = vRP.getUData(parseInt(user_id),"vRP:multas")
			local multas = json.decode(value) or 0
			if multas >= 10000 then
				TriggerClientEvent("Notify",source,"negado","Você tem multas pendentes.",10000)
				return true
			end
			if not vCLIENT.returnVehicle(source,name) then
				local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(user_id), vehicle = name })
				local tuning = vRP.getSData("custom:u"..user_id.."veh_"..name) or {}
				local custom = json.decode(tuning) or {}
				if vehicle[1] ~= nil then
					if parseInt(os.time()) <= parseInt(vehicle[1].time+24*60*60) then
						local ok = vRP.request(source,"Veículo na retenção, deseja acionar o seguro pagando <b>$"..vRP.format(parseInt(vRP.vehiclePrice(name)*0.1)).."</b> dólares ?",60)
						if ok then
							if vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(name)*0.5)) then
								vRP.execute("creative/set_detido",{ user_id = parseInt(user_id), vehicle = name, detido = 0, time = 0 })
								TriggerClientEvent("Notify",source,"sucesso","Veículo liberado.",10000)
							else
								TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
							end
						end
					elseif parseInt(vehicle[1].detido) >= 1 then
						local ok = vRP.request(source,"Veículo na detenção, deseja acionar o seguro pagando <b>$"..vRP.format(parseInt(vRP.vehiclePrice(name)*0.1)).."</b> dólares ?",60)
						if ok then
							if vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(name)*0.1)) then
								vRP.execute("creative/set_detido",{ user_id = parseInt(user_id), vehicle = name, detido = 0, time = 0 })
								TriggerClientEvent("Notify",source,"sucesso","Veículo liberado.",10000)
							else
								TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
							end
						end
					else
						if parseInt(os.time()) <= parseInt(vehicle[1].ipva+24*15*60*60) then
							if garages[use].payment then
								if vRP.vehicleType(tostring(name)) == "exclusive" or vRP.vehicleType(tostring(name)) == "rental" or vRP.vehicleType(tostring(name)) == "carros" or vRP.vehicleType(tostring(name)) == "import" or vRP.vehicleType(tostring(name)) == "motos" then
									local spawnveh,vehid = vCLIENT.spawnVehicle(source,name,vehicle[1].engine,vehicle[1].body,vehicle[1].fuel,custom)
									vehlist[vehid] = { parseInt(user_id),name }
									TriggerEvent("setPlateEveryone",identity.registration)
									TriggerClientEvent("Notify",source,"sucesso","Veículo <b>Exclusivo ou Alugado</b>, Não será cobrado a taxa de liberação.",10000)
								end
								if (vRP.getBankMoney(user_id)+vRP.getMoney(user_id)) >= parseInt(vRP.vehiclePrice(name)*0.005 and not vRP.vehicleType(tostring(name)) == "exclusive" or vRP.vehicleType(tostring(name)) == "rental") then
									local spawnveh,vehid = vCLIENT.spawnVehicle(source,name,vehicle[1].engine,vehicle[1].body,vehicle[1].fuel,custom)
									if spawnveh and vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(name)*0.005)) then
										vehlist[vehid] = { parseInt(user_id),name }
										TriggerEvent("setPlateEveryone",identity.registration)
									end
								else
									TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
								end
							else
								local spawnveh,vehid = vCLIENT.spawnVehicle(source,name,vehicle[1].engine,vehicle[1].body,vehicle[1].fuel,custom,parseInt(vehicle[1].colorR),parseInt(vehicle[1].colorG),parseInt(vehicle[1].colorB),parseInt(vehicle[1].color2R),parseInt(vehicle[1].color2G),parseInt(vehicle[1].color2B),false)
								if spawnveh then
									vehlist[vehid] = { user_id,name }
									TriggerEvent("setPlateEveryone",identity.registration)
								end
							end
						else
							if vRP.vehicleType(tostring(name)) == "exclusive" or vRP.vehicleType(tostring(name)) == "rental" then
								local ok = vRP.request(source,"Deseja pagar o <b>Vehicle Tax</b> do veículo <b>"..vRP.vehicleName(name).."</b> por <b>$"..vRP.format(parseInt(vRP.vehiclePrice(name)*0.00)).."</b> dólares?",60)
								if ok then
									if vRP.tryFullPayment(user_id,parseInt(vRP.vehiclePrice(name)*0.00)) then
										vRP.execute("creative/set_ipva",{ user_id = parseInt(user_id), vehicle = name, ipva = parseInt(os.time()) })
										TriggerClientEvent("Notify",source,"sucesso","Pagamento do <b>Vehicle Tax</b> conclúido com sucesso.",10000)
									else
										TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
									end
								end
							else
								local price_tax = parseInt(vRP.vehiclePrice(name)*0.10)
								if price_tax > 10000 then
									price_tax = 10000
								end
								local ok = vRP.request(source,"Deseja pagar o <b>Vehicle Tax</b> do veículo <b>"..vRP.vehicleName(name).."</b> por <b>$"..vRP.format(price_tax).."</b> dólares?",60)
								if ok then
									if vRP.tryFullPayment(user_id,price_tax) then
										vRP.execute("creative/set_ipva",{ user_id = parseInt(user_id), vehicle = name, ipva = parseInt(os.time()) })
										TriggerClientEvent("Notify",source,"sucesso","Pagamento do <b>Vehicle Tax</b> conclúido com sucesso.",10000)
									else
										TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",10000)
									end
								end
							end
						end
					end
				else
					local spawnveh,vehid = vCLIENT.spawnVehicle(source,name,1000,1000,100,custom,0,0,0,0,0,0,true)
					if spawnveh then
						vehlist[vehid] = { user_id,name }
						TriggerEvent("setPlateEveryone",identity.registration)
					end
				end
			else
				TriggerClientEvent("Notify",source,"aviso","Já possui um veículo deste modelo fora da garagem.",10000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETEVEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.deleteVehicles()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle = vRPclient.getNearestVehicle(source,30)
		if vehicle then
			vCLIENT.deleteVehicle(source,vehicle)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHPRICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("desmancheVehicles")
AddEventHandler("desmancheVehicles",function()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
		if vehicle and placa then
			local puser_id = vRP.getUserByRegistration(placa)
			if puser_id then
				vRP.execute("creative/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })
				vRP.giveInventoryItem(user_id,"dinheirosujo",parseInt(vRP.vehiclePrice(vname)*0.1))
				vCLIENT.deleteVehicle(source,vehicle)
				local identity = vRP.getUserIdentity(user_id)
				SendWebhookMessage(webhookdesmanche,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[DESMANCHOU]: "..vname.." [ID]: "..puser_id.." \n[VALOR]: $"..vRP.format(parseInt(vRP.vehiclePrice(vname)*0.1)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ DV ]---------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(cfg.cmddv,function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao")  then
		local identity = vRP.getUserIdentity(user_id)
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			PerformHttpRequest(cfg.deletevehicle, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "REGISTRO DE DV⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = cfg.webhookIcon
						}, 
						fields = {
							{ 
								name = "**IDENTIFICAÇÃO:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							}
						}, 
						footer = { 
							text = cfg.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = cfg.webhookIcon
						},
						color = cfg.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
			vCLIENT.deleteVehicle(source,vehicle)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ VEHICLELOCK ]------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.vehicleLock()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
		if vehicle and placa then
			local placa_user_id = vRP.getUserByRegistration(placa)
			if user_id == placa_user_id then
				vCLIENT.vehicleClientLock(-1,vnetid,lock)
				TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
				vRPclient.playAnim(source,true,{"anim@mp_player_intmenu@key_fob@","fob_click"},false)
				if lock == 1 then
					TriggerClientEvent("Notify",source,"importante","Veículo <b>destrancado</b> com sucesso.",8000)
				else
					TriggerClientEvent("Notify",source,"importante","Veículo <b>trancado</b> com sucesso.",8000)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRYDELETE ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.tryDelete(vehid,vehengine,vehbody,vehfuel)
	if vehlist[vehid] and vehid ~= 0 then
		local user_id = vehlist[vehid][1]
		local vehname = vehlist[vehid][2]
		local player = vRP.getUserSource(user_id)
		if player then
			vCLIENT.syncNameDelete(player,vehname)
		end

		if vehengine <= 100 then
			vehengine = 100
		end

		if vehbody <= 100 then
			vehbody = 100
		end

		if vehfuel >= 100 then
			vehfuel = 100
		end

		local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(user_id), vehicle = vehname })
		if vehicle[1] ~= nil then
			vRP.execute("creative/set_update_vehicles",{ user_id = parseInt(user_id), vehicle = vehname, engine = parseInt(vehengine), body = parseInt(vehbody), fuel = parseInt(vehfuel) })
		end
	end
	vCLIENT.syncVehicle(-1,vehid)
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRYDELETEVEH ]-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteveh984101")
AddEventHandler("trydeleteveh984101",function(vehid)
	vCLIENT.syncVehicle(-1,vehid)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ RETURNHOUSES ]-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.returnHouses(nome,garage)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.searchReturn(source,user_id) then
			local address = vRP.query("homes/get_homeuserid",{ user_id = parseInt(user_id) })
			if #address > 0 then
				for k,v in pairs(address) do
					if v.home == garages[garage].name then
						if parseInt(v.garage) == 1 then
							local resultOwner = vRP.query("homes/get_homeuseridowner",{ home = tostring(nome) })
							if resultOwner[1] then
								if parseInt(os.time()) >= parseInt(resultOwner[1].tax+24*15*60*60) then
									TriggerClientEvent("Notify",source,"aviso","A <b>Property Tax</b> da residência está atrasada.",10000)
									return false
								else
									vCLIENT.openGarage(source,nome,garage)
								end
							end
						end
					end
				end
			end
			if garages[garage].perm == "livre" then
				return vCLIENT.openGarage(source,nome,garage)
			elseif garages[garage].perm then
				if vRP.hasPermission(user_id,garages[garage].perm) or vRP.hasPermission(user_id,"manager.permissao") then
					return vCLIENT.openGarage(source,nome,garage)
				end
			elseif garages[garage].public then
				return vCLIENT.openGarage(source,nome,garage)
			end
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ VEHICLE ANCORAR ]--------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('travar',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		--if vRP.hasPermission(user_id,"dpla.permissao") then
			if vRPclient.isInVehicle(source) then
				local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
				if vehicle then
					TriggerClientEvent("progress",source,5000,"travar/destravar")
					SetTimeout(5000,function()
						vCLIENT.vehicleAnchor(source,vehicle)
					end)
				end
			end
		--end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ BOAT ANCORAR ]-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(cfg.cmdancorar,function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.isInVehicle(source) then
			local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
			if vehicle then
				vCLIENT.boatAnchor(source,vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ POLICEALERT ]------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.policeAlert()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehicle,vnetid,placa,vname,lock,banned,trunk,model,street = vRPclient.vehList(source,7)
		if vehicle then
			if math.random(100) >= 50 then
				local policia = vRP.getUsersByPermission("dpla.permissao")
				local x,y,z = vRPclient.getPosition(source)
				for k,v in pairs(policia) do
					local player = vRP.getUserSource(parseInt(v))
					if player then
						async(function()
							local id = idgens:gen()
							TriggerClientEvent('chatMessage',player,"911",{64,64,255},"Roubo na ^1"..street.."^0 do veículo ^1"..model.."^0 de placa ^1"..placa.."^0 verifique o ocorrido.")
							police[id] = vRPclient.addBlip(player,x,y,z,304,3,"Ocorrência",0.6,false)
							SetTimeout(60000,function() vRPclient.removeBlip(player,police[id]) idgens:free(id) end)
						end)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CAR ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(cfg.cmgcar,function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
			if args[1] then
				PerformHttpRequest(cfg.spawnvehicle, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 
							title = "REGISTRO DE SPAWNCAR⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = cfg.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR DA EQUIPE:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{
									name = "**CARRO SPAWNADO: **"..args[1],
									value = "⠀"
								}
							}, 
							footer = { 
								text = cfg.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = cfg.webhookIcon
							},
							color = cfg.webhookColor 
						}
					}
				}), { ['Content-Type'] = 'application/json' })
				
				TriggerClientEvent('spawnarveiculo17',source,args[1])
				TriggerEvent("setPlateEveryone",identity.registration)
			end
		end
	end
end)

-- RegisterCommand('chave',function(source, args)
--     local user_id = vRP.getUserId(source)
--     local keyCommands = {
--         ["add"] = function(vehicle, id)
--             if not vRP.getUserSource(id) then
--                 TriggerClientEvent("Notify", source, "aviso", "ID "..id.." não está online", 5000)
--                 return
--             end
--             local index = "key-"..vehicle.."-"..user_id
--             if not sharedKeys[index] then
--                 sharedKeys[index] = { id }
--                 TriggerClientEvent("Notify", source, "sucesso", "Chave do veículo <b>"..vehicle.."<.b> emprestada para o ID <b>"..id.."<.b>", 5000)
--             else
--                 for k,v in pairs(sharedKeys[index]) do
--                     if id == v then
--                         TriggerClientEvent("Notify", source, "aviso", "ID "..id.." já possui a chave desse veículo", 5000)
--                         return
--                     end
--                 end
--                 table.insert(sharedKeys[index], id)
--                 TriggerClientEvent("Notify", source, "sucesso", "Chave do veículo <b>"..vehicle.."<.b> emprestada para o ID <b>"..id.."<.b>", 5000)  
--             end
--         end,
--         ["remove"] = function(vehicle, id)
--             local index = "key-"..vehicle.."-"..user_id
--             if sharedKeys[index] then
--                 for k,v in ipairs(sharedKeys[index]) do
--                     if id == v then
--                         table.remove(sharedKeys[index], k)
--                         TriggerClientEvent("Notify", source, "importante", "Chave do veículo <b>"..vehicle.."<.b> removida do ID <b>"..id.."<.b>", 5000)  
--                         return
--                     end
--                 end
--                 TriggerClientEvent("Notify", source, "aviso", "ID "..id.." não possui a chave desse veículo", 5000)
--             else
--                 TriggerClientEvent("Notify", source, "aviso", "ID "..id.." não possui a chave desse veículo", 5000)
--             end
--         end,
--         ["list"] = function()
--             local myvehicles = vRP.query("creative/getVehicles", {user_id = user_id})
--             local list = "Chaves emprestadas:"
--             if #myvehicles > 0 then
--                 for i, veh in ipairs(myvehicles) do
--                     local vehicle = veh.vehicle
--                     local index = "key-"..vehicle.."-"..user_id
--                     if sharedKeys[index] and #sharedKeys[index] > 0 then
--                         list = list.."<br><b>"..vehicle.."<.b>: "
--                         for k,v in ipairs(sharedKeys[index]) do
--                             if k == #sharedKeys[index] then
--                                 list = list..v
--                             else
--                                 list = list..v..",<br>"
--                             end
--                         end
--                     end
--                 end
--                 if string.len(list) > 24 then
--                     TriggerClientEvent("Notify",source,"importante", list)
--                 end
--             end
--         end
--     }
--     if args[1] and args[1] == "list" then
--         keyCommands[args[1]]()
--         return
--     end
--     if #args < 3 or not keyCommands[args[1]] then
--         TriggerClientEvent("Notify", source, "aviso", "Utilize .chave <b>(add.remove) (veículo) (id)<.b>", 5000)
--         return
--     end
--     local vehInfo = sergin.getVehicleInfo(args[2])
--     local id = parseInt(args[3])
--     local hasVehicle = vehInfo and #vRP.query("creative/getVehicle", { user_id = user_id, vehicle = vehInfo.name }) > 0
--     if not hasVehicle then
--         TriggerClientEvent("Notify", source, "aviso", "Você não possui o veículo <b>"..args[2].."<.b>", 5000)
--         return
--     elseif not id or id < 1 or id == user_id then
--         TriggerClientEvent("Notify", source, "aviso", "ID inválido", 5000)
--         return
--     end
--     keyCommands[args[1]](vehInfo.name, id)
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ VEHS ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(cfg.cmdvehs,function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] and parseInt(args[2]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[2]))
			local myvehicles = vRP.query("creative/get_vehicles",{ user_id = parseInt(user_id), vehicle = tostring(args[1]) })
			if myvehicles[1] then
				if vRP.vehicleType(tostring(args[1])) == "exclusive" or vRP.vehicleType(tostring(args[1])) == "rental" and not vRP.hasPermission(user_id,"admin.permissao") then
					TriggerClientEvent("Notify",source,"negado","<b>"..vRP.vehicleName(tostring(args[1])).."</b> não pode ser transferido por ser um veículo <b>Exclusivo ou Alugado</b>.",10000)
				else
					local identity = vRP.getUserIdentity(parseInt(args[2]))
					local identity2 = vRP.getUserIdentity(user_id)
					local price = tonumber(sanitizeString(vRP.prompt(source,"Valor:",""),"\"[]{}+=?!_()#@%/\\|,.",false))			
					if vRP.request(source,"Deseja vender um <b>"..vRP.vehicleName(tostring(args[1])).."</b> para <b>"..identity.name.." "..identity.firstname.."</b> por <b>$"..vRP.format(parseInt(price)).."</b> dólares ?",30) then	
						if vRP.request(nplayer,"Aceita comprar um <b>"..vRP.vehicleName(tostring(args[1])).."</b> de <b>"..identity2.name.." "..identity2.firstname.."</b> por <b>$"..vRP.format(parseInt(price)).."</b> dólares ?",30) then
							local vehicle = vRP.query("creative/get_vehicles",{ user_id = parseInt(args[2]), vehicle = tostring(args[1]) })
							if parseInt(price) > 0 then
								if vRP.tryFullPayment(parseInt(args[2]),parseInt(price)) then
									if vehicle[1] then
										TriggerClientEvent("Notify",source,"negado","<b>"..identity.name.." "..identity.firstname.."</b> já possui este modelo de veículo.",10000)
									else
										vRP.execute("creative/move_vehicle",{ user_id = parseInt(user_id), nuser_id = parseInt(args[2]), vehicle = tostring(args[1]) })

										local custom = vRP.getSData("custom:u"..parseInt(user_id).."veh_"..tostring(args[1]))
										local custom2 = json.decode(custom)
										if custom2 then
											vRP.setSData("custom:u"..parseInt(args[2]).."veh_"..tostring(args[1]),json.encode(custom2))
											vRP.execute("creative/rem_srv_data",{ dkey = "custom:u"..parseInt(user_id).."veh_"..tostring(args[1]) })
										end

										local chest = vRP.getSData("chest:u"..parseInt(user_id).."veh_"..tostring(args[1]))
										local chest2 = json.decode(chest)
										if chest2 then
											vRP.setSData("chest:u"..parseInt(args[2]).."veh_"..tostring(args[1]),json.encode(chest2))
											vRP.execute("creative/rem_srv_data",{ dkey = "chest:u"..parseInt(user_id).."veh_"..tostring(args[1]) })
										end

										TriggerClientEvent("Notify",source,"sucesso","Você Vendeu <b>"..vRP.vehicleName(tostring(args[1])).."</b> e Recebeu <b>$"..vRP.format(parseInt(price)).."</b> dólares.",20000)
										TriggerClientEvent("Notify",nplayer,"importante","Você recebeu as chaves do veículo <b>"..vRP.vehicleName(tostring(args[1])).."</b> de <b>"..identity2.name.." "..identity2.firstname.."</b> e pagou <b>$"..vRP.format(parseInt(price)).."</b> dólares.",40000)
											vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
											vRPclient.playSound(nplayer,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
											local consulta = vRP.getUData(user_id,"vRP:paypal")
											local resultado = json.decode(consulta) or 0
											vRP.setUData(user_id,"vRP:paypal",json.encode(parseInt(resultado + price)))
											SendWebhookMessage(webhookvehs,"```prolog\n[ID]: "..user_id.." "..identity2.name.." "..identity2.firstname.." \n[VENDEU]: "..vRP.vehicleName(tostring(args[1])).." \n[PARA]: "..(args[2]).." "..identity.name.." "..identity.firstname.." \n[VALOR]: $"..vRP.format(parseInt(price)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
										end
									else
										TriggerClientEvent("Notify",nplayer,"negado","Dinheiro insuficiente.",8000)
										TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.",8000)
									end
								end	
							end
						end
					end
				end
			else
				local vehicle = vRP.query("creative/get_vehicle",{ user_id = parseInt(user_id) })
				if #vehicle > 0 then 
	                local car_names = {}
	                for k,v in pairs(vehicle) do
	                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b> ("..v.vehicle..")")
	                    --TriggerClientEvent("Notify",source,"importante","<b>Modelo:</b> "..v.vehicle,10000)
	                end
	                car_names = table.concat(car_names, ", ")
	                TriggerClientEvent("Notify",source,"importante","Seus veículos: " .. car_names, 20000)
				else 
					TriggerClientEvent("Notify",source,"importante","Você não possui nenhum veículo.",20000)
				end
			end
		end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ REPARAR ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryreparar")
AddEventHandler("tryreparar",function(nveh)
	TriggerClientEvent("syncreparar",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ MOTOR ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trymotor")
AddEventHandler("trymotor",function(nveh)
	TriggerClientEvent("syncmotor",-1,nveh)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ SAVELIVERY ]-------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(cfg.savelivery,function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
		local vehicle,vnetid,placa,vname = vRPclient.vehList(source,7)
		if vehicle and placa then
			local puser_id = vRP.getUserByRegistration(placa)
			if puser_id then
				local custom = json.decode(vRP.getSData("custom:u"..parseInt(puser_id).."veh_"..vname))
				local livery = vCLIENT.returnlivery(source,livery)
				custom.liveries = livery
				vRP.setSData("custom:u"..parseInt(puser_id).."veh_"..vname,json.encode(custom))	
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CHECK LIVERY PERMISSION ]------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function sergin.CheckLiveryPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"manager.permissao") 
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ HASH ]-------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand('hash',function(source,args,rawCommand)
--     local user_id = vRP.getUserId(source)
--     if vRP.hasPermission(user_id,cfg.h) then
--         local vehassh = vCLIENT.getHash(source,vehiclehash)
--         vRP.prompt(source,"Hash:",""..vehassh)
--     end
-- end)