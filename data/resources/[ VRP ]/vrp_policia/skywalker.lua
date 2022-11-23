local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local idgens = Tools.newIDGenerator()
src = {}
Tunnel.bindInterface("vrp_policia",src)
vCLIENT = Tunnel.getInterface('vrp_policia')
 
local pick = {}
local pickTime = {} 
local blips = {}
 
RegisterCommand('placa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
		if args[1] then
			local user_id = vRP.getUserByRegistration(args[1])
			if user_id then
				local identity = vRP.getUserIdentity(user_id)
				if identity then
					vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
					TriggerClientEvent('chatMessage',source,"911",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
				end
			else
				TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
			end
		else
			local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,7)
			local placa_user = vRP.getUserByRegistration(placa)
			if placa then
				if placa_user then
					local identity = vRP.getUserIdentity(placa_user)
					if identity then
						local vehicleName = vRP.vehicleName(vname)
						vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						TriggerClientEvent('chatMessage',source,"911",{64,64,255},"^1Passaporte: ^0"..identity.user_id.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Placa: ^0"..identity.registration.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.firstname.."   ^2|   ^1Modelo: ^0"..vehicleName.."   ^2|   ^1Idade: ^0"..identity.age.." anos   ^2|   ^1Telefone: ^0"..identity.phone)
					end
				else
					TriggerClientEvent("Notify",source,"importante","Placa inválida ou veículo de americano.")
				end
			end
		end
	end
end)
 
local policia = {}
RegisterCommand('p',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRPclient.getHealth(source) > 100 then
		if vRP.hasPermission(user_id,"policia.permissao") then
			local soldado = vRP.getUsersByPermission("policia.permissao")
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player and player ~= uplayer then
					async(function()
						local id = idgens:gen()
						policia[id] = vRPclient.addBlip(player,x,y,z,153,84,"Localização de "..identity.name.." "..identity.firstname,0.5,false)
						TriggerClientEvent("Notify",player,"importante","Localização recebida de <b>"..identity.name.." "..identity.firstname.."</b>.")
						vRPclient._playSound(player,"Out_Of_Bounds_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
						SetTimeout(60000,function() vRPclient.removeBlip(player,policia[id]) idgens:free(id) end)
					end)
				end
			end
			TriggerClientEvent("Notify",source,"sucesso","Localização enviada com sucesso.")
			vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		end
	end
end)
 
RegisterCommand('paytow',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			if nuser_id then
				vRP.giveMoney(nuser_id,200)
				vRPclient._playAnim(source,true,{{"mp_common","givetake1_a"}},false)
				vRPclient._playAnim(nplayer,true,{{"mp_common","givetake1_a"}},false)
				TriggerClientEvent("Notify",source,"sucesso","Efetuou o pagamento pelo serviço do mecânico.")
				TriggerClientEvent("Notify",nplayer,"sucesso","Recebeu <b>$200 dólares</b> pelo serviço de mecânico.")
			end
		end
	end
end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[ TOOGLE ]-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('toogle',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if args[1] then
        local nplayer = vRP.getUserSource(parseInt(args[1]))
        if nplayer then
            local nuser_id = vRP.getUserId(nplayer)
            local identitynu = vRP.getUserIdentity(nuser_id)
            RemoveAllPedWeapons(nplayer,0)
        end
    else
        RemoveAllPedWeapons(source,0)
    end
	local webhookstaff = ""
	

	--################################################################################################################
	--##############################################--Policia--#########################################################	
	if vRP.hasPermission(user_id,"comandopolicia.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"paisana-comandopolicia.permissao")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"negado","Você saiu em serviço.",10000)
		--SendWebhookMessage(webhookstaff,"```prolog\n[STAFF]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	elseif vRP.hasPermission(user_id,"paisana-comandopolicia.permissao") then
		TriggerEvent('eblips:add',{ name = "POLICIA", src = source, color = 3 })
		vRP.addUserGroup(user_id,"comandopolicia")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.",10000)
		--SendWebhookMessage(webhookstaff,"```prolog\n[STAFF]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========ENTROU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

	elseif vRP.hasPermission(user_id,"policia.permissao") then
		TriggerEvent('eblips:remove',source)
		vRP.addUserGroup(user_id,"paisana-policia")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"negado","Você saiu em serviço.",10000)
		--SendWebhookMessage(webhookstaff,"```prolog\n[STAFF]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========SAIU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

	elseif vRP.hasPermission(user_id,"paisana-policia.permissao") then
		TriggerEvent('eblips:add',{ name = "POLICIA", src = source, color = 3 })
		vRP.addUserGroup(user_id,"policia")
		vRPclient.setArmour(source,0)
		TriggerClientEvent("Notify",source,"sucesso","Você entrou em serviço.",10000)
		--SendWebhookMessage(webhookstaff,"```prolog\n[STAFF]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[===========ENTROU DE SERVICO==========] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		
	end
end)
 
RegisterCommand('multar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"staff.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local valor = vRP.prompt(source,"Valor:","")
		local motivo = vRP.prompt(source,"Motivo:","")
		if id == "" or valor == "" or motivo == "" then
			return
		end
		local value = vRP.getUData(parseInt(id),"vRP:multas")
		local multas = json.decode(value) or 0
		vRP.setUData(parseInt(id),"vRP:multas",json.encode(parseInt(multas)+parseInt(valor)))
		local oficialid = vRP.getUserIdentity(user_id)
		-- local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))

		randmoney = math.random(90,150)
		vRP.giveMoney(user_id,parseInt(randmoney))
		TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.")
		TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
		TriggerClientEvent("Notify",nplayer,"importante","Você foi multado em <b>$"..vRP.format(parseInt(valor)).." dólares</b>.<br><b>Motivo:</b> "..motivo..".")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")

		local nuser_id = parseInt(id)
		local identitynu = vRP.getUserIdentity(nuser_id)
				
		PerformHttpRequest(config.webhookFines, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	
					title = "REGISTRO DE MULTAS⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					}, 
					fields = {
						{ 
							name = "**IDENTIFICAÇÃO DO POLICIAL:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						},
						{
							name = "**INFORMAÇÕES DO PLAYER:**",
							value = "**"..identitynu.name.." "..identitynu.firstname.."** [**"..nuser_id.."**]\n⠀"
						},
						{
							name = "**MOTIVO DA MULTA:**",
							value = ""..motivo..""
						},
						{
							name = "**VALOR DA MULTA:**",
							value = "**"..valor.."**"
						}
					}, 
					footer = { 
						text = config.webhookBottom..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor 
				}
			}
		}), { ['Content-Type'] = 'application/json' })
	end
end)
 
RegisterCommand('ocorrencia',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		local id = vRP.prompt(source,"Passaporte:","")
		local ocorrencia = vRP.prompt(source,"Ocorrência:","")
		if id == "" or ocorrencia == "" then
			return
		end
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(id))
		local nplayer = vRP.getUserSource(parseInt(id))

		TriggerClientEvent("Notify",source,"sucesso","Ocorrência registrada com sucesso.")
		TriggerClientEvent("Notify",nplayer,"importante","Sua <b>Ocorrência</b> foi registrada com sucesso.")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end)
 
RegisterCommand('detido',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") then
        local vehicle,vnetid,placa,vname,lock,banned = vRPclient.vehList(source,5)
        local motivo = vRP.prompt(source,"Motivo:","")
        if motivo == "" then
			return
		end
		local identity = vRP.getUserIdentity(user_id)
        if vehicle then
            local puser_id = vRP.getUserByRegistration(placa)
            local rows = vRP.query("vRP/get_vehicles",{ user_id = parseInt(puser_id), vehicle = vname })
            if rows[1] then
                if parseInt(rows[1].detido) == 1 then
                    TriggerClientEvent("Notify",source,"importante","Este veículo já se encontra detido.",8000)
                else
					local nplayer = vRP.getUserSource(parseInt(puser_id))
					
					vRP.execute("vRP/set_detido",{ user_id = parseInt(puser_id), vehicle = vname, detido = 1, time = parseInt(os.time()) })

					randmoney = math.random(90,150)
					vRP.giveMoney(user_id,parseInt(randmoney))
					TriggerClientEvent("Notify",source,"sucesso","Carro apreendido com sucesso.")
					TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
					TriggerClientEvent("Notify",nplayer,"importante","Seu Veículo foi <b>Detido</b>.<br><b>Motivo:</b> "..motivo..".")
					vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")

					local identitynu = vRP.getUserIdentity(puser_id)
							
					PerformHttpRequest(config.webhookDetained, function(err, text, headers) end, 'POST', json.encode({
						embeds = {
							{ 	
								title = "REGISTRO DE DETIDO⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
								thumbnail = {
									url = config.webhookIcon
								}, 
								fields = {
									{ 
										name = "**IDENTIFICAÇÃO DO POLICIAL:**",
										value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
									},
									{
										name = "**INFORMAÇÕES DO PLAYER:**",
										value = "**"..identitynu.name.." "..identitynu.firstname.."** [**"..puser_id.."**]\n⠀"
									},
									{
										name = "**MOTIVO:**",
										value = motivo
									}
								}, 
								footer = { 
									text = config.webhookBottom..os.date("%d/%m/%Y | %H:%M:%S"),
									icon_url = config.webhookIcon
								},
								color = config.webhookColor 
							}
						}
					}), { ['Content-Type'] = 'application/json' })
                end
            end
        end
    end
end)
 
RegisterCommand('prender',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"staff.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
		local crimes = vRP.prompt(source,"Crimes:","")
		if crimes == "" then
			return
		end

		local player = vRP.getUserSource(parseInt(args[1]))
		if player then
			vRP.setUData(parseInt(args[1]),"vRP:prisao",json.encode(parseInt(args[2])))
			vRPclient.setHandcuffed(player,false)
			TriggerClientEvent('prisioneiro',player,true)
			vRPclient.teleport(player,1680.1,2513.0,45.5)
			prison_lock(parseInt(args[1]))
			TriggerClientEvent('removealgemas',player)
			TriggerClientEvent("vrp_sound:source",player,'jaildoor',0.7)
			TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)

			-- APLICAR ROUPA DE PRISIONEIRO
			local old_custom = vRPclient.getCustomization(player)
			local custom = {
				[1885233650] = {
					[1] = { 73,0,1 }, -- máscara
		            [3] = { 0,0 }, -- maos
		            [4] = { 5,7 }, -- calça
		            [5] = { -1,0 }, -- mochila
		            [6] = { 34,0,1 }, -- sapato
		            [7] = { -1,0 },  -- acessorios
		            [8] = { -1,0 }, -- blusa
		            [9] = { -1,0 }, -- colete
		            [10] = { -1,0 }, -- adesivo
		            [11] = { 22,0 }, -- jaqueta	
					["p0"] = { -1,0 }, -- chapeu
					["p1"] = { -1,0 },
					["p2"] = { -1,0 },
					["p6"] = { -1,0 },
					["p7"] = { -1,0 }
				},
				[-1667301416] = {
					[1] = { -1,0 },
		            [3] = { 14,0 },
		            [4] = { 66,6 },
		            [5] = { -1,0 },
		            [6] = { 35,0,1 },
		            [7] = { -1,0 },
		            [8] = { 6,0 },
		            [9] = { -1,0 },
		            [10] = { -1,0 },
		            [11] = { 73,0 },
					["p0"] = { -1,0 },
					["p1"] = { -1,0 },
					["p2"] = { -1,0 },
					["p6"] = { -1,0 },
					["p7"] = { -1,0 }
				}
			}

			local idle_copy = {}
			idle_copy.modelhash = nil
			for l,w in pairs(custom[old_custom.modelhash]) do
				idle_copy[l] = w
			end
			vRPclient._setCustomization(player, idle_copy)

			
			local identity = vRP.getUserIdentity(user_id)
			local identitynu = vRP.getUserIdentity(parseInt(args[1]))
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			
			randmoney = math.random(90,150)
			vRP.giveMoney(user_id,parseInt(randmoney))
			TriggerClientEvent("Notify",source,"sucesso","Prisão efetuada com sucesso.")
			TriggerClientEvent("Notify",source,"importante","Você recebeu <b>$"..vRP.format(parseInt(randmoney)).." dólares</b> de bonificação.")
			TriggerClientEvent("Notify",nplayer,"importante","Você foi preso por <b>"..vRP.format(parseInt(args[2])).." meses</b>.<br><b>Motivo:</b> "..crimes..".")
			vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
							
			PerformHttpRequest(config.webhookArrasted, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	
						title = "REGISTRO DE PRENDER⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**IDENTIFICAÇÃO DO POLICIAL:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**INFORMAÇÕES DO PLAYER:**",
								value = "**"..identitynu.name.." "..identitynu.firstname.."** [**"..parseInt(args[1]).."**]\n⠀"
							},
							{
								name = "**MOTIVO:**",
								value = ""..crimes..""
							},
							{
								name = "**TEMPO:**",
								value = ""..parseInt(args[2])..""
							}
						}, 
						footer = { 
							text = config.webhookBottom..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
		end 
	end
end)
 
RegisterServerEvent("vrp_policia:algemar")
AddEventHandler("vrp_policia:algemar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if nplayer then
		if not vRPclient.isHandcuffed(source) then
			if vRP.getInventoryItemAmount(user_id,"algemas") >= 1 then
				if vRPclient.isHandcuffed(nplayer) then
					TriggerClientEvent('carregar2',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
					SetTimeout(5000,function()
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar2',nplayer,source)
						TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
						TriggerClientEvent('removealgemas',nplayer)
					end)
				else
					TriggerClientEvent('cancelando',source,true)
					TriggerClientEvent('cancelando',nplayer,true)
					TriggerClientEvent('carregar2',nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
					vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
					SetTimeout(3500,function()
						vRPclient._stopAnim(source,false)
						vRPclient.toggleHandcuff(nplayer)
						TriggerClientEvent('carregar2',nplayer,source)
						TriggerClientEvent('cancelando',source,false)
						TriggerClientEvent('cancelando',nplayer,false)
						TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
						TriggerClientEvent('setalgemas',nplayer)
					end)
				end
			else
				if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"policia.permissao") then
					if vRPclient.isHandcuffed(nplayer) then
						TriggerClientEvent('carregar2',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arresting","a_uncuff"}},false)
						SetTimeout(5000,function()
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar2',nplayer,source)
							TriggerClientEvent("vrp_sound:source",source,'uncuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.1)
							TriggerClientEvent('removealgemas',nplayer)
						end)
					else
						TriggerClientEvent('cancelando',source,true)
						TriggerClientEvent('cancelando',nplayer,true)
						TriggerClientEvent('carregar2',nplayer,source)
						vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
						vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
						SetTimeout(3500,function()
							vRPclient._stopAnim(source,false)
							vRPclient.toggleHandcuff(nplayer)
							TriggerClientEvent('carregar2',nplayer,source)
							TriggerClientEvent('cancelando',source,false)
							TriggerClientEvent('cancelando',nplayer,false)
							TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
							TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
							TriggerClientEvent('setalgemas',nplayer)
						end)
					end
				end
			end
		end
	end
end)
 
RegisterServerEvent("vrp_policia:carregar")
AddEventHandler("vrp_policia:carregar",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") then
		if nplayer then
			if not vRPclient.isHandcuffed(source) then
				TriggerClientEvent('carregar',nplayer,source)
			end
		end
	end
end)
 
RegisterCommand('rcolete',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent('rcolete',nplayer)
		end
	end
end)
 
RegisterCommand('rmascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent("setmascara",nplayer,nil,nil)
		end
	end
end)
 
RegisterCommand('rchapeu',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent("setchapeu",nplayer,nil,nil)
		end
	end
end)
 
RegisterCommand('rcapuz',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			if vRPclient.isCapuz(nplayer) then
				vRPclient.setCapuz(nplayer)
				TriggerClientEvent("Notify",source,"sucesso","Capuz colocado com sucesso.")
			else
				TriggerClientEvent("Notify",source,"importante","A pessoa não está com o capuz na cabeça.")
			end
		end
	end
end)
 
RegisterCommand('cv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"coodernador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.putInNearestVehicleAsPassenger(nplayer,7)
		end
	end
end)
 
RegisterCommand('rv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"coodernador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		if nplayer then
			vRPclient.ejectVehicle(nplayer)
		end
	end
end)
 
RegisterCommand('extras',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") then
        if vRPclient.isInVehicle(source) then
            TriggerClientEvent('extras',source)
        end
    end
end)
 
RegisterServerEvent("tryextras")
AddEventHandler("tryextras",function(index,extra)
    TriggerClientEvent("syncextras",-1,index,parseInt(extra))
end)

RegisterCommand('cone',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") then
		TriggerClientEvent('cone',source,args[1])
	end
end)
 
RegisterCommand('barreira',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"ems.permissao") then
		TriggerClientEvent('barreira',source,args[1])
	end
end)
 
RegisterCommand('spike',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		TriggerClientEvent('spike',source,args[1])
	end
end)
 
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local player = vRP.getUserSource(parseInt(user_id))
	if player then
		SetTimeout(30000,function()
			local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
			local tempo = json.decode(value) or -1

			if tempo == -1 then
				return
			end

			if tempo > 0 then
				TriggerClientEvent('prisioneiro',player,true)
				vRPclient.teleport(player,1680.1,2513.0,46.5)
				prison_lock(parseInt(user_id))
			end
		end)
	end
end)

function prison_lock(target_id)
	local player = vRP.getUserSource(parseInt(target_id))
	if player then
		SetTimeout(60000,function()
			local value = vRP.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				TriggerClientEvent("Notify",player,"importante","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.")
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
				TriggerClientEvent('prisioneiro',player,false)
				vRPclient.teleport(player,1850.5,2604.0,45.5)
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				TriggerClientEvent("Notify",player,"importante","Sua sentença terminou, esperamos não ve-lo novamente.")
			end
			vRPclient.PrisionGod(player)
		end)
	end
end
 
RegisterServerEvent("diminuirpena78")
AddEventHandler("diminuirpena78",function()
	local source = source
	local user_id = vRP.getUserId(source)
	local value = vRP.getUData(parseInt(user_id),"vRP:prisao")
	local tempo = json.decode(value) or 0
	if tempo >= 20 then
		vRP.setUData(parseInt(user_id),"vRP:prisao",json.encode(parseInt(tempo)-2))
		TriggerClientEvent("Notify",source,"importante","Sua pena foi reduzida em <b>2 meses</b>, continue o trabalho.")
	else
		TriggerClientEvent("Notify",source,"importante","Atingiu o limite da redução de pena, não precisa mais trabalhar.")
	end
end)

function src.checkPermissao()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"policia.permissao") then
		return true
	end
	return false
end

function src.periciaDinheiro()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"dinheiro-sujo") >= 2 then
		TriggerClientEvent("progress",source,25000,"Analisando")
        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
		SetTimeout(25000,function()
			vRPclient._stopAnim(source,false)
			local totalDinheiro = parseInt(vRP.getInventoryItemAmount(user_id,"dinheiro-sujo"))
			TriggerClientEvent("Notify",source,"sucesso","Foram identificados <b>$"..totalDinheiro.." dólares</b> em dinheiro sujo.")
		end)	
	elseif vRP.getInventoryItemAmount(user_id,"dinheiro-sujo") == 1 then
		TriggerClientEvent("progress",source,10000,"Analisando")
        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
		SetTimeout(25000,function()
			vRPclient._stopAnim(source,false)
			local totalDinheiro = parseInt(vRP.getInventoryItemAmount(user_id,"dinheiro-sujo"))
			TriggerClientEvent("Notify",source,"sucesso","Foi identificado <b>$"..totalDinheiro.." dólar</b> em dinheiro sujo.")
		end)
	else
		TriggerClientEvent("progress",source,10000,"Analisando")
        vRPclient._playAnim(source,false,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)
		SetTimeout(25000,function()
			vRPclient._stopAnim(source,false)
			TriggerClientEvent("Notify",source,"negado","Não foram identificados quantidas de dinheiro sujo.")
		end)
	end
end

-- RegisterCommand('patrulha',function(source,args,rawCommand)
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)

-- 	if vRP.hasPermission(user_id,"policia-patrulha.permissao") then
-- 		vRP.removeUserGroup(user_id,"policia-patrulha")
-- 		TriggerClientEvent("Notify",source,"negado","Você saiu de patrulha.")
-- 	else
-- 		if vRP.hasPermission(user_id,"policia.permissao") then
-- 			vRP.addUserGroup(user_id,"policia-patrulha")
-- 			TriggerClientEvent("Notify",source,"sucesso","Você entrou em patrulha.")
-- 		end
-- 	end
-- end)

RegisterCommand('ptr',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local polices = vRP.getUsersByPermission("policia.permissao")
		-- local inservice = vRP.getUsersByPermission("policia-patrulha.permissao")
		TriggerClientEvent("Notify",source,"sucesso","Atualmente temos <b>"..#polices.."</b> policiais em serviço")
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(pickTime) do
			if v > 0 then
				pickTime[k] = v - 1
			end
		end
	end
end)
 
-- [ DISPAROS ] --
RegisterServerEvent('atirando')
AddEventHandler('atirando',function(x,y,z)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.hasPermission(user_id,"lspd.permission") then
			local policiais = vRP.getUsersByPermission("lspd.permission")
			for l,w in pairs(policiais) do
				local player = vRP.getUserSource(w)
				if player then
					TriggerClientEvent('notificacao',player,x,y,z,user_id)
				end
			end
		end
	end
end)

RegisterCommand(config.seizeCommand,function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) <= 101 or vRPclient.isInVehicle(source) or vRPclient.isHandcuffed(source) then
		return
	end
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			local identitynu = vRP.getUserIdentity(nuser_id)
			if nuser_id then
				local itens_apreendidos = {}

				TriggerClientEvent('cancelando',source,true)
				TriggerClientEvent('cancelando',nplayer,true)
				TriggerClientEvent('carregar2',nplayer,source)
				-- vCLIENT.toggleCarry(nplayer,source)
				vRPclient._playAnim(source,false,{config.seizeAnim},true)
				vRPclient._playAnim(nplayer,true,{config.nuSeizeAnim},true)
				TriggerClientEvent("progress",source,5000,"apreendendo")
				SetTimeout(5000,function()

					local weapons = vRPclient.replaceWeapons(nplayer,{})
					for k,v in pairs(weapons) do
						vRP.giveInventoryItem(parseInt(nuser_id),'wbody|'..k,1)
						if v.ammo > 0 then
							vRP.giveInventoryItem(parseInt(nuser_id),'wammo|'..k,parseInt(v.ammo))
						end
					end
					
					for k,v in pairs(config.itemlist) do
						local amount = vRP.getInventoryItemAmount(nuser_id,v)
						if amount > 0 then
							if vRP.tryGetInventoryItem(nuser_id,v,parseInt(amount)) then
								table.insert(itens_apreendidos, "[ITEM]: "..vRP.itemNameList(v).." [QUANTIDADE]: "..amount)
								vRP.giveInventoryItem(parseInt(user_id),v,parseInt(amount))
								TriggerClientEvent("itensNotify",source,"sucesso","Pegou",""..vRP.itemIndexList(v).."",""..vRP.format(parseInt(amount)).."",""..vRP.format(vRP.getItemWeight(v)*parseInt(amount)).."")
								TriggerClientEvent("itensNotify",nplayer,"sucesso","Subtraiu",""..vRP.itemIndexList(v).."",""..vRP.format(parseInt(amount)).."",""..vRP.format(vRP.getItemWeight(v)*parseInt(amount)).."")
							end
						end
					end

					local apreendidos = table.concat(itens_apreendidos, "\n")
					
					PerformHttpRequest(config.webhookSeize, function(err, text, headers) end, 'POST', json.encode({
						embeds = {
							{
								title = 'REGISTRO DE APREENDER:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀', 
								thumbnail = {
									url = config.webhookIcon
								}, 
								fields = {
									{
										name = '**QUEM ESTÁ APREENDENDO:**', 
										value = '**'..identity.name..' '..identity.firstname..'** [**'..user_id..'**]'
									}, 
									{
										name = '**QUEM ESTÁ SENDO APREENDIDO:**', 
										value = '**'..identitynu.name..' '..identitynu.firstname..'** [**'..nuser_id..'**]\n⠀⠀'
									}, 
									{
										name = '**LOCAL: '..tD(x)..', '..tD(y)..', '..tD(z)..'**', 
										value = '⠀'
									},
									{
										name = '**ITENS:**', 
										value = apreendidos
									}
								}, 
								footer = {
									text = config.webhookBottom..os.date('%d/%m/%Y | %H:%M:%S'), 
									icon_url = config.webhookIcon
								}, 
								color = config.webhookColor
							}
						}
					}), {['Content-Type'] = 'application/json'})

					vRPclient._stopAnim(source,false)
					vRPclient._stopAnim(nplayer,false)
					TriggerClientEvent('cancelando',source,false)
					TriggerClientEvent('cancelando',nplayer,false)
					TriggerClientEvent('carregar2',nplayer,source)
					-- vCLIENT.toggleCarry(nplayer,source)
					TriggerClientEvent("Notify",nplayer,"importante","Todos os seus pertences foram apreendidos.")
					TriggerClientEvent("Notify",source,"importante","Apreendeu todos os pertences da pessoa.")
				end)
			end
		end
	end
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end