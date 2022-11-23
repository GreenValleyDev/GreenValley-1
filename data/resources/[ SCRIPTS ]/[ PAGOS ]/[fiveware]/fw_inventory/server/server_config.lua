local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
local idgens = Tools.newIDGenerator()

fivewareItens = {}
Tunnel.bindInterface(GetCurrentResourceName().."-itens_config",fivewareItens)

vCLIENT = Tunnel.getInterface(GetCurrentResourceName().."-itens_config")

local pick = {}

local cooldown = {}
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(cooldown) do
			if cooldown[k] > 0 then
				cooldown[k] = cooldown[k] - 1
			end
		end
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent("inventory:useItem")
AddEventHandler("inventory:useItem",function(slot, v_amount)
	local source = source
    local user_id = vRP.getUserId(source)
	-- print(v_amount)
	-- print(amount)
	-- print(json.encode(v_amount))
	if user_id then
		if v_amount == nil then v_amount = 1 end
		if v_amount <= 0 then v_amount = 1 end
		if cooldown[user_id] == nil or cooldown[user_id] == 0 then
			local inv = vRP.getInventory(user_id)
			if inv then
				if not inv[tostring(slot)] or inv[tostring(slot)].item == nil then
					return
				end
				local itemName = inv[tostring(slot)].item
				if vRP.itemTypeList(itemName) == "use" then

					if itemName == "bandagem" then
						if vRPclient.getHealth(source) > 101 then
							cooldown[user_id] = 15
							vCLIENT.closeInventory(source)
							TriggerClientEvent('cancelando',source,true)
							TriggerClientEvent("progress",source,15000,"usando")
							vRPclient._playAnim(source,true,{{"amb@world_human_clipboard@male@idle_a","idle_c"}},true)
							SetTimeout(15000, function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								TriggerClientEvent('cancelando',source,false)
								if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
									TriggerClientEvent("tratamento",source)
									TriggerClientEvent("resetWarfarina",source)
									TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
								end
							end)
						else
							TriggerClientEvent("Notify",source,"aviso","Você não pode utilizar de vida cheia ou nocauteado.",5000)
						end
					end

					if itemName == "maconha" then
						cooldown[user_id] = 30
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,30000,"usando")
						vRPclient._playAnim(source,true,{{"mp_player_int_uppersmoke","mp_player_int_smoke"}},true)
						SetTimeout(30000, function()
							cooldown[user_id] = nil
							vRPclient._stopAnim(source,false)
							TriggerClientEvent('cancelando',source,false)
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								TriggerClientEvent("setEffectDrugs",source)
							end
						end)
					end

					if itemName == "c4" then
						vCLIENT.closeInventory(source)
					TriggerClientEvent("vrp_cashmachine:machineRobbery",source)
				end


					if itemName == "cocaina" then
						cooldown[user_id] = 30
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,30000,"usando")
						vRPclient._playAnim(source,true,{{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"}},true)
						SetTimeout(30000, function()
							cooldown[user_id] = nil
							vRPclient._stopAnim(source,false)
							TriggerClientEvent('cancelando',source,false)
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								TriggerClientEvent("setEffectDrugs",source)
							end
						end)
					end

					if itemName == "lsd" then
						cooldown[user_id] = 30
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,30000,"usando")
						vRPclient._playAnim(source,true,{{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"}},true)
						SetTimeout(30000, function()
							cooldown[user_id] = nil
							vRPclient._stopAnim(source,false)
							TriggerClientEvent('cancelando',source,false)
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								TriggerClientEvent("setEffectDrugs",source)
							end
						end)
					end

					if itemName == "metanfetamina" then
						cooldown[user_id] = 30
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,30000,"usando")
						vRPclient._playAnim(source,true,{{"anim@amb@nightclub@peds@","missfbi3_party_snort_coke_b_male3"}},true)
						SetTimeout(30000, function()
							cooldown[user_id] = nil
							vRPclient._stopAnim(source,false)
							TriggerClientEvent('cancelando',source,false)
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								TriggerClientEvent("setEffectDrugs",source)
							end
						end)
					end

					if itemName == "colete" then
						cooldown[user_id] = 10
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,10000,"equipando")
						vRPclient._playAnim(source,true,{{"clothingtie","try_tie_negative_a"}},true)
						SetTimeout(10000, function()
							cooldown[user_id] = nil
							vRPclient._stopAnim(source,false)
							TriggerClientEvent('cancelando',source,false)
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRPclient.setArmour(source,100)
								TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
							end
						end)
					end

					if itemName == "GADGET_PARACHUTE" then
						cooldown[user_id] = 10
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,10000,"equipando")
						SetTimeout(10000, function()
							cooldown[user_id] = nil
							TriggerClientEvent('cancelando',source,false)
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								GiveWeaponToPed(source, "GADGET_PARACHUTE", 1, true, true)
								TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
							end
						end)
					end

					if itemName == "lockpick" then
						local vehicle,vnetid,placa,vname,lock,banned,trunk,model,street = vRPclient.vehList(source,7)
						local policia = vRP.getUsersByPermission("policia.perm")
						if #policia < 2 then
							TriggerClientEvent("Notify",source,"aviso","Policiais insuficientes em serviço.")
							return true
						end
						if vRP.getInventoryItemAmount(user_id,itemName) >= 1 and vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) and vehicle then
							vCLIENT.closeInventory(source)
							TriggerClientEvent("progress",source,30000,"roubando")
							TriggerClientEvent('cancelando',source,true)
							vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
							SetTimeout(30000, function()
								local porcentagem = math.random(0, 100)
								if porcentagem >= 50 then
									TriggerEvent("setPlateEveryone",placa)
									TriggerClientEvent("inventory:lockpickVehicle",-1,vnetid)
									TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
									TriggerClientEvent('cancelando',source,false)
									vRPclient._stopAnim(source,false)
									TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
								else
									TriggerClientEvent("Notify",source,"negado","Roubo do veículo falhou e as autoridades foram acionadas.",8000)
									TriggerClientEvent('cancelando',source,false)
									vRPclient._stopAnim(source,false)
									local policia = vRP.getUsersByPermission("policia.permissao")
									local x,y,z = vRPclient.getPosition(source)
									for k,v in pairs(policia) do
										local player = vRP.getUserSource(parseInt(v))
										if player then
											async(function()
												local id = idgens:gen()
												vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
												TriggerClientEvent("Notify", player, "importante", "Roubo na <b>"..street.."</b> do veículo <b>"..model.."</b> de placa <b>"..placa.."</b>, verifique o ocorrido.")
												-- TriggerClientEvent('chatMessage',player,"911",{64,64,255},"Roubo na ^1"..street.."^0 do veículo ^1"..model.."^0 de placa ^1"..placa.."^0 verifique o ocorrido.")
												-- TriggerClientEvent("NotifyPush",player,{ code = 31, title = "Crime em andamento", x = x, y = y, z = z, badge = "Roubo de veículo", veh = vRP.vehicleName(vname).." - "..placa })
												pick[id] = vRPclient.addBlip(player,x,y,z,10,5,"Ocorrência - Roubo de Veículo",0.5,false)
												SetTimeout(20000,function() vRPclient.removeBlip(player,pick[id]) idgens:free(id) end)
											end)
										end
									end
								end
							end)
						end
					end

					if itemName == "energetico" then
						cooldown[user_id] = 10
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,10000,"tomando")
						TriggerClientEvent("emotes",source,"beber2")
						SetTimeout(10000, function()
							cooldown[user_id] = nil
							TriggerClientEvent('cancelando',source,false)
							vRPclient._DeletarObjeto(source)
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								TriggerClientEvent("setEnergetic",source,true)
							end
						end)
						SetTimeout(30000, function()
							TriggerClientEvent("setEnergetic",source,false)
						end)
					end

					if itemName == "cafe" then
						cooldown[user_id] = 10
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,10000,"tomando")
						TriggerClientEvent("emotes",source,"cafe2")
						SetTimeout(10000, function()
							cooldown[user_id] = nil
							TriggerClientEvent('cancelando',source,false)
							vRPclient._DeletarObjeto(source)
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								TriggerClientEvent("setEnergetic",source,true)
							end
						end)
						SetTimeout(30000, function()
							TriggerClientEvent("setEnergetic",source,false)
						end)
					end

					if itemName == "sanduiche" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_sandwich_01",49,60309)
							TriggerClientEvent("progress",source,10000,"comendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,-20)
						        vRP.varyHunger(user_id,0)
								vRPclient._DeletarObjeto(source)
								vRP.updateFome(user_id,35)
							end)
						end
					end

					if itemName == "xgreen" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							TriggerClientEvent("emotes",source,"comer")
							TriggerClientEvent("progress",source,10000,"comendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,-20)
						        vRP.varyHunger(user_id,0)
								vRPclient._DeletarObjeto(source)
								vRP.updateFome(user_id,35)
							end)
						end
					end

					if itemName == "chocolate" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"mp_player_inteat@burger","mp_player_int_eat_burger","prop_choc_ego",49,60309)
							TriggerClientEvent("progress",source,10000,"comendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,-20)
						        vRP.varyHunger(user_id,0)
								vRPclient._DeletarObjeto(source)
								vRP.updateFome(user_id,25)
							end)
						end
					end

					if itemName == "hotdog" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_cs_hotdog_02",49,28422)
							TriggerClientEvent("progress",source,10000,"comendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,-20)
						        vRP.varyHunger(user_id,0)
								vRPclient._DeletarObjeto(source)
								vRP.updateFome(user_id,25)
							end)
						end
					end

					if itemName == "pizza" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","v_res_tt_pizzaplate",49,28422)
							TriggerClientEvent("progress",source,10000,"comendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,0)
						        vRP.varyHunger(user_id,-20)
								vRPclient._DeletarObjeto(source)
								vRP.updateFome(user_id,25)
							end)
						end
					end

					if itemName == "batatafrita" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"amb@code_human_wander_eating_donut@male@idle_a","idle_c","prop_food_bs_chips",49,28422)
							TriggerClientEvent("progress",source,10000,"comendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,0)
						        vRP.varyHunger(user_id,-20)
								vRPclient._DeletarObjeto(source)
								vRP.updateFome(user_id,25)
							end)
						end
					end

					if itemName == "xburguer" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							TriggerClientEvent("emotes",source,"comer")
							TriggerClientEvent("progress",source,10000,"comendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,0)
						        vRP.varyHunger(user_id,-20)
								vRPclient._DeletarObjeto(source)
								vRP.updateFome(user_id,25)
							end)
						end
					end

					if itemName == "agua" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","prop_ld_flow_bottle",49,60309)
							TriggerClientEvent("progress",source,10000,"bebendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,0)
						        vRP.varyHunger(user_id,-20)
								vRPclient._DeletarObjeto(source)
								vRP.updateSede(user_id,35)
							end)
						end
					end

					if itemName == "cola" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","ng_proc_sodacan_01a",49,28422)
							TriggerClientEvent("progress",source,10000,"bebendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,0)
						        vRP.varyHunger(user_id,-20)
								vRPclient._DeletarObjeto(source)
								vRP.updateSede(user_id,25)
							end)
						end
					end

					if itemName == "sprunk" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","ng_proc_sodacan_01b",49,28422)
							TriggerClientEvent("progress",source,10000,"bebendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,0)
						        vRP.varyHunger(user_id,-20)
								vRPclient._DeletarObjeto(source)
								vRP.updateSede(user_id,25)
							end)
						end
					end

					if itemName == "suco" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_tequsunrise",49,28422)
							TriggerClientEvent("progress",source,10000,"bebendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,0)
						        vRP.varyHunger(user_id,-20)
								vRPclient._DeletarObjeto(source)
								vRP.updateSede(user_id,25)
							end)
						end
					end

					if itemName == "refrigerante" then
						if vRP.tryGetInventoryItem(user_id,itemName,1) then
							cooldown[user_id] = 10
							vCLIENT.closeInventory(source)
							vRPclient._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_cs_bs_cup",49,28422)
							TriggerClientEvent("progress",source,10000,"bebendo")
							SetTimeout(10000,function()
								cooldown[user_id] = nil
								vRPclient._stopAnim(source,false)
								vRP.varyThirst(user_id,0)
						        vRP.varyHunger(user_id,-20)
								vRPclient._DeletarObjeto(source)
								vRP.updateSede(user_id,25)
							end)
						end
					end

					if itemName == "mochila" then
						local exp = vRP.getInventoryMaxWeight(user_id)
						if exp < 25 then
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRP.setBackpack(user_id,25)
								TriggerClientEvent("inventory:Update",source,"updateInventory")
								TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
							end
						elseif exp >= 25 and exp < 50 then
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRP.setBackpack(user_id,50)
								TriggerClientEvent("inventory:Update",source,"updateInventory")
								TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
							end
						elseif exp >= 50 and exp < 75 then
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRP.setBackpack(user_id,75)
								TriggerClientEvent("inventory:Update",source,"updateInventory")
								TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
							end
						elseif exp >= 75 and exp < 100 then
							if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
								vRP.setBackpack(user_id,100)
								TriggerClientEvent("inventory:Update",source,"updateInventory")
								TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
							end
						end
					end

					if itemName == "repairkit" then
						if not vRPclient.isInVehicle(source) then
							local vehicle = vRPclient.getNearestVehicle(source,3.5)
							if vehicle then
								if vRP.hasPermission(user_id,"mecanico.perm") then
									cooldown[user_id] = 60
									vCLIENT.closeInventory(source)
									TriggerClientEvent('cancelando',source,true)
									vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
									SetTimeout(30000, function()
										cooldown[user_id] = nil
										TriggerClientEvent('cancelando',source,false)
										TriggerClientEvent('reparar',source)
										TriggerClientEvent('repararmotor',source,vehicle)
										vRPclient._stopAnim(source,false)
										TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
									end)
								else
									if vRP.tryGetInventoryItem(user_id,itemName,1) then
										cooldown[user_id] = 60
										vCLIENT.closeInventory(source)
										TriggerClientEvent('cancelando',source,true)
										vRPclient._playAnim(source,false,{{"mini@repair","fixing_a_player"}},true)
										SetTimeout(30000, function()
											cooldown[user_id] = nil
											TriggerClientEvent('cancelando',source,false)
											TriggerClientEvent('reparar',source)
											TriggerClientEvent('repararmotor',source,vehicle)
											vRPclient._stopAnim(source,false)
											TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
										end)
									end
								end
							end
						end
					end

					if itemName == "pneus" then
						if not vRPclient.inVehicle(source) then
							local vehicle,vehNet = vRPclient.vehList(source,3)
							if vehicle then
								cooldown[user_id] = 60
								vCLIENT.closeInventory(source)
								TriggerClientEvent('cancelando',source,true)
								vRPclient._playAnim(source,false,{{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"}},true)
								TriggerClientEvent("progress",source,30000,"trocando pneus")
								SetTimeout(60000, function()
									if vRP.tryGetInventoryItem(user_id,itemName,1,true,slot) then
										cooldown[user_id] = nil
										TriggerClientEvent('cancelando',source,false)
										vRPclient._stopAnim(source,false)
										TriggerClientEvent("inventory:repairTires",-1,vehNet)
										TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
									end
								end)
							end
						end
					end

					if item == "skate" then
						actived[user_id] = true
						vCLIENT.closeInventory(source)
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent("progress",source,3000,"Utilizando")
			
						SetTimeout(3000,function()
							actived[user_id] = nil
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent("skate",source)
						end)
					end

					if itemName == "placa" then
						if vRPclient.GetVehicleSeat(source) then
							if vRP.tryGetInventoryItem(user_id,"placa",1,slot) then
								local placa = vRP.generatePlate()
								vCLIENT.closeInventory(source)
								--TriggerClientEvent("dpn_inventory_chest:updateInventory", source)
			
								TriggerClientEvent('cancelando',source,true)
								TriggerClientEvent("vehicleanchor",source)
								TriggerClientEvent("progress",source,2000,"clonando")
								SetTimeout(2000,function()
									TriggerClientEvent('cancelando',source,false)
									TriggerClientEvent("cloneplates",source,placa)
									--TriggerEvent("setPlateEveryone",placa)
									TriggerClientEvent("Notify",source,"fome","Placa clonada com sucesso.",8000)
								end)
							end
						end
					end

					if itemName == "capuz" then
						local nplayer = vRPclient.getNearestPlayer(source,2)
						if nplayer then
							vRPclient.setCapuz(nplayer)
							vRP.closeMenu(nplayer)
							TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
						end
					end
				end

				if vRP.itemTypeList(itemName) == "equipar" then
					if vRP.tryGetInventoryItem(user_id,itemName,1,true) then
						cooldown[user_id] = 10
						local playerWeapons = {}
						playerWeapons[string.gsub(itemName,config.armamentos_formatos.arma,"")] = { ammo = 0 }
						vRPclient._giveWeapons(source,playerWeapons)
						TriggerClientEvent("inventory:Update",source,"updateInventory")
						TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
						SetTimeout(10000, function()
							cooldown[user_id] = nil
						end)
					end 
				end
				if vRP.itemTypeList(itemName) == "recarregar" then
					local uweapons = vRPclient.getWeapons(source)
					local weaponuse = string.gsub(itemName,config.armamentos_formatos.municao,"")
					local weaponusename = config.armamentos_formatos.municao..weaponuse
					local identity = vRP.getUserIdentity(user_id)
					if uweapons[weaponuse] then
						if parseInt(v_amount) >= 250 then
							v_amount = 250
						end
						if vRP.tryGetInventoryItem(user_id, weaponusename, parseInt(v_amount)) then
							cooldown[user_id] = 10
							local weapons = {}
							weapons[weaponuse] = { ammo = v_amount }
							vRPclient._giveWeapons(source,weapons,false)
							TriggerClientEvent("inventory:Update",source,"updateInventory")
							TriggerClientEvent("Notify", source, "sucesso", "<b>"..vRP.itemNameList(itemName).."</b> utilizado(a) com sucesso.", 10000)
							SetTimeout(10000, function()
								cooldown[user_id] = nil
							end)
						end
					end
				end
				x,y,z = vRPclient.getPosition(source) PerformHttpRequest(config.webhooks.usar_item, function(err, text, headers) end, 'POST', json.encode({ embeds = { { author = { name = "Usar - Logs", icon_url = config.webhook_config.icon }, fields = { { name = "**__JOGADOR:__**", value = "```"..vRP.getUserIdentity(user_id).name.." "..vRP.getUserIdentity(user_id).firstname.." [ "..user_id.." ]```" }, { name = "**__USOU:__**", value = "```"..vRP.itemNameList(itemName).." - "..parseInt(v_amount).."x```" }, { name = "**__LOCAL:__**", value = "```"..x..", "..y..", "..z.."```" } }, footer = { text = os.date("%d/%m/%Y - %H:%M:%S") }, color = config.webhook_config.color } } }), { ['Content-Type'] = 'application/json' })
			end
		else
			TriggerClientEvent("Notify", source, "negado", "Você já utilizou um item recentemente, aguarde <b>"..cooldown[user_id].." segundo(s)</b> para poder utilizar outro item novamente.", 10000)
		end
	end
end)