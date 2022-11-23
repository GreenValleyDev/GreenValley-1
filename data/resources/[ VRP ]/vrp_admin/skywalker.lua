local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

vRPidd = {}
Tunnel.bindInterface("vrp_admin",vRPidd)
Proxy.addInterface("vrp_admin",vRPidd)
IDDclient = Tunnel.getInterface("vrp_admin")

RegisterCommand("tk",function()
	vRP.addUserGroup(1,'manager')
end)

RegisterCommand('dvarea', function(a,b)
    user_id = vRP.getUserId(a)
    if vRP.hasPermission(user_id,'manager.permissao') or vRP.hasPermission(user_id,"administrador.permissao") then
        if tonumber(b[1]) then
            local vehicles = vRPclient.getNearestVehicles(a,tonumber(b[1]))
            for k,v in pairs(vehicles) do
                TriggerClientEvent('deleteVeh', a, k)
            end
            TriggerClientEvent('Notify','sucesso','sucesso', '<b>Você deletou '.. tablelen(vehicles) ..'x veículos')
        else
            TriggerClientEvent('Notify','negado','negado', 'Comando dado de forma incorreta, use a estrutura /dvarea [raio]')
        end
    else
        TriggerClientEvent('Notify','negado','negado', 'Sem permissão!')
    end
end)


RegisterCommand('renomear',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if vRP.hasPermission(user_id, "coordenador.permissao") or vRP.hasPermission(user_id, "manager.permissao") then
        local idjogador = vRP.prompt(source, "Qual id do jogador?", "")
        local nome = vRP.prompt(source, "Novo nome", "")
        local firstname = vRP.prompt(source, "Novo sobrenome", "")
        local idade = vRP.prompt(source, "Nova idade", "")
		local nuidentity = vRP.getUserIdentity(parseInt(idjogador))
		
        vRP.execute("vRP/update_user_identity",{
            user_id = idjogador,
            firstname = firstname,
            name = nome,
            age = idade,
            registration = nuidentity.registration,
            phone = nuidentity.phone
		})
		
		PerformHttpRequest(config.Rename, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	------------------------------------------------------------
					title = "REGISTRO DE ALTERAÇÃO IDENTIDADE⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					}, 
					fields = {
						{ 
							name = "**COLABORADOR DA EQUIPE:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						},
						{
							name = "**NOVOS DADOS DO RG:**",
							value = "**["..vRP.format(parseInt(idjogador)).."][ Nome: "..nome.." ][ Sobrenome: "..firstname.." ][ Idade: "..idade.." ]**\n⠀"
						}
					}, 
					footer = { 
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor 
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	
	if vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] and args[2] then
			local itemIndex = vRP.itemIndexList(args[1])

			if itemIndex then
				local itemName = vRP.itemNameList(args[1])
				vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]))

				TriggerClientEvent("itensNotify",source,"usar","Pegou",""..itemIndex.."")
			else
				TriggerClientEvent("Notify",source,"negado","Item <b>inválido ou inexistente</b>.")
			end
		end
	end
end)

RegisterCommand('dm',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRP.getUserSource(parseInt(args[1]))
    if vRP.hasPermission(user_id,"staff.permissao") then
        if args[1] == nil then
            TriggerClientEvent("Notify",source,"negado","Necessário passar o ID após o comando, exemplo: <b>/dm 1</b>")
            return
        elseif nplayer == nil then
            TriggerClientEvent("Notify",source,"negado","O jogador não está online!")
            return
        end
        local mensagem = vRP.prompt(source,"Digite a mensagem:","")
        if mensagem == "" then
            return
        end
        TriggerClientEvent("Notify",source,"sucesso","Mensagem enviada com sucesso!")
        TriggerClientEvent('chatMessage',nplayer,"MENSAGEM DA ADMINISTRAÇÃO:",{50,205,50},mensagem)
        TriggerClientEvent("Notify",nplayer,"aviso","<b>Mensagem da Administração:</b> "..mensagem.."",30000)
    end
end)


RegisterCommand('rephone',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if vRP.hasPermission(user_id, "coordenador.permissao") or vRP.hasPermission(user_id, "manager.permissao") then
        local idjogador = vRP.prompt(source, "Qual id do jogador?", "")
        local phone = vRP.prompt(source, "Novo telefone Ex (000-000)", "")
		local nuidentity = vRP.getUserIdentity(parseInt(idjogador))
		
        vRP.execute("vRP/update_user_phone",{
            user_id = idjogador,
            phone = phone
		})
		
		PerformHttpRequest(config.Rename, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	------------------------------------------------------------
					title = "REGISTRO DE ALTERAÇÃO TELEFONE⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					}, 
					fields = {
						{ 
							name = "**COLABORADOR DA EQUIPE:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						},
						{
							name = "**NOVO TELEFONE:**",
							value = "**["..vRP.format(parseInt(idjogador)).."][ Numero: "..phone.." ]**\n⠀"
						}
					}, 
					footer = { 
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor 
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end)

local player_customs = {}
RegisterCommand('vroupas',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local custom = vRPclient.getCustomization(source)
	
    if vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        if player_customs[source] then
            player_customs[source] = nil
            vRPclient._removeDiv(source,"customization")
        else 
			local content = ""
			
            for k,v in pairs(custom) do
                content = content..k.." => "..json.encode(v).."<br/>" 
            end

            player_customs[source] = true
            vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 4px; width: 250px; margin-top: 200px; margin-right: 50px; background: rgba(15,15,15,0.7); color: #ffff; font-weight: bold; }",content)
        end
    end
end)

RegisterCommand('estoque',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] and args[2] then
			
			PerformHttpRequest(config.Stock, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "REGISTRO DE ALTERAÇÃO DE ESTOQUE⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**MODIFICAÇÃO DE ESTOQUE:**",
								value = "**[ Modelo: "..args[1].." ][ Quantidade: "..vRP.format(parseInt(args[2])).." ]**\n⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

            vRP.execute("vRP/set_estoque",{ vehicle = args[1], quantidade = args[2] })
            TriggerClientEvent("Notify",source,"sucesso","Voce colocou mais <b>"..args[2].."</b> no estoque, para o carro <b>"..args[1].."</b>.") 
        end
    end
end)

RegisterCommand('addcar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local nplayer = vRP.getUserId(parseInt(args[2]))
	
    if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
			local identitynu = vRP.getUserIdentity(nuser_id)
			
			PerformHttpRequest(config.Addcar, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "REGISTRO DE CARRO ADICIONADO A PLAYER⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**INFORMAÇÕES:**",
								value = "**[ Modelo: "..args[1].." ][ Player ID: "..args[2].." ]**\n⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

            vRP.execute("vRP/add_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time()) })
            TriggerClientEvent("Notify",source,"sucesso","Voce adicionou o veículo <b>"..args[1].."</b> para o Passaporte: <b>"..parseInt(args[2]).."</b>.")
        end
    end
end)

RegisterCommand('remcar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local nplayer = vRP.getUserId(parseInt(args[2]))
	
    if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") then
        if args[1] and args[2] then
            local nuser_id = vRP.getUserId(nplayer)
			local identitynu = vRP.getUserIdentity(nuser_id)
			
			PerformHttpRequest(config.Remcar, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "REGISTRO DE CARRO REMOVIDO DE PLAYER⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**INFORMAÇÕES:**",
								value = "**[ Modelo: "..args[1].." ][ Player ID: "..args[2].." ]**\n⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

            vRP.execute("vRP/rem_vehicle",{ user_id = parseInt(args[2]), vehicle = args[1], ipva = parseInt(os.time())  }) 
            TriggerClientEvent("Notify",source,"sucesso","Voce removeu o veículo <b>"..args[1].."</b> do Passaporte: <b>"..parseInt(args[2]).."</b>.")
        end
    end
end)

RegisterCommand('uncuff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
			TriggerClientEvent("admcuff",source)
		end
	end
end)

RegisterCommand('limpararea',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local x,y,z = vRPclient.getPosition(source)
    if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        TriggerClientEvent("syncarea",-1,x,y,z)
    end
end)

RegisterCommand('apagao',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"manager.permissao") and args[1] ~= nil then
            local cond = tonumber(args[1])
            --TriggerEvent("cloud:setApagao",cond)
            TriggerClientEvent("cloud:setApagao",-1,cond)                    
        end
    end
end)

RegisterCommand('raios', function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local player = vRP.getUserSource(user_id)
        if vRP.hasPermission(user_id,"manager.permissao") and args[1] ~= nil then
            local vezes = tonumber(args[1])
            TriggerClientEvent("cloud:raios",-1,vezes)           
        end
    end
end)

RegisterCommand('skin',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("skinmenu",nplayer,args[2])
                TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.")
            end
        end
    end
end)

RegisterCommand('debug',function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"manager.permissao") then
			TriggerClientEvent("ToggleDebug",player)
		end
	end
end)

RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
    TriggerClientEvent("syncdeleteobj",-1,index)
end)

RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	local vehicle = vRPclient.getNearestVehicle(source,11)
	if vehicle then
		if  vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
			
			PerformHttpRequest(config.Fix, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	------------------------------------------------------------
						title = "REGISTRO DE FIX⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor
					}
				}
			}), { ['Content-Type'] = 'application/json' })
			
			TriggerClientEvent('reparar',source)
		end
	end
end)

RegisterCommand('godc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if  vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identitynu = vRP.getUserIdentity(nuser_id)
				vRPclient.setArmour(nplayer,400)
            end
		else
			vRPclient.setArmour(source,400)
        end
    end
end)

RegisterCommand('god',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if  vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identitynu = vRP.getUserIdentity(nuser_id)

				PerformHttpRequest(config.Revive, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	
							title = "REGISTRO DE REVIVER⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = config.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR DA EQUIPE:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{
									name = "**INFORMAÇÕES DO PLAYER REVIVIDO:**",
									value = "**"..identitynu.name.." "..identitynu.firstname.."** [**"..nuser_id.."**]\n⠀"
								}
							}, 
							footer = { 
								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = config.webhookIcon
							},
							color = config.webhookColor 
						}
					}
				}), { ['Content-Type'] = 'application/json' })

				TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)

				TriggerEvent("statusobito",nuser_id, false)
                vRPclient.killGod(nplayer)
				vRPclient.setHealth(nplayer,400)
				vRP.varyThirst(nplayer,-15)
				vRP.varyHunger(nplayer,-15)
            end
		else
			PerformHttpRequest(config.Revive, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	
						title = "REGISTRO DE REVIVER⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			TriggerClientEvent("resetBleeding",source)
            TriggerClientEvent("resetDiagnostic",source)

			TriggerEvent("statusobito",user_id, false)
            vRPclient.killGod(source)
			vRPclient.setHealth(source,400)
			vRP.setHunger(user_id,-400)
			vRP.setThirst(user_id,-400)
			vRP.varyThirst(source,-100)
			vRP.varyHunger(source,-100)
        end
    end
end)

RegisterCommand('food',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identitynu = vRP.getUserIdentity(nuser_id)

				PerformHttpRequest(config.Food, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	
							title = "REGISTRO DE FOOD⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = config.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR DA EQUIPE:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{
									name = "**INFORMAÇÕES DO PLAYER:**",
									value = "**"..identitynu.name.." "..identitynu.firstname.."** [**"..nuser_id.."**]\n⠀"
								}
							}, 
							footer = { 
								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = config.webhookIcon
							},
							color = config.webhookColor 
						}
					}
				}), { ['Content-Type'] = 'application/json' })
				
				vRP.varyThirst(nuser_id,-100)
				vRP.varyHunger(nuser_id,-100)
            end
		else
			PerformHttpRequest(config.Food, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	
						title = "REGISTRO DE FOOD⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
				
			vRP.varyThirst(user_id,-100)
			vRP.varyHunger(user_id,-100)
        end
    end
end)

RegisterCommand('coletearea',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"manager.permissao") then
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
				vRPclient.setArmour(id,400)
            end
		end
    end
end)

RegisterCommand('godarea',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if vRP.hasPermission(user_id,"manager.permissao") then
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
            	TriggerClientEvent("resetBleeding",id)
            	TriggerClientEvent("resetDiagnostic",id)

				TriggerEvent("statusobito",parseInt(k), false)
            	vRPclient.killGod(id)
				vRPclient.setHealth(id,400)
            end
		end
		
		PerformHttpRequest(config.Revive, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	
					title = "REGISTRO DE REVIVER TODOS⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					}, 
					fields = {
						{ 
							name = "**COLABORADOR DA EQUIPE:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						}
					}, 
					footer = { 
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor 
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterCommand('hash',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent('vehash',source)
	end
end)

RegisterCommand('tuning',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent('vehtuning',source)
	end
end)

RegisterCommand('wl',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id) 
    if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"auxiliar.permissao") or vRP.hasPermission(user_id,"moderador.permissao")or vRP.hasPermission(user_id,"coordenador.permissao") then
		if args[1] then
			
			PerformHttpRequest(config.Whitelist, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	
						title = "NOVO ID ADICIONADO A WHITELIST⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**ID ADICIONADO: **"..vRP.format(parseInt(args[1])),
								value = "⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

            -- vRP.setWhitelisted(parseInt(args[1]),true)
			vRP.setWhitelisted(parseInt(args[1]), true)
			-- vRP.execute('vRP/set_whitelisted', { steam = consult.steam, whitelist = 1 })
			-- vRP.execute('vRP/set_whitelist', { steam = tostring(nuidentity.steam), whitelist = 1 })
            TriggerClientEvent("Notify",source,"sucesso","Você aprovou a STEAM <b>"..args[1].."</b> na whitelist.")
        end
    end
end)

RegisterCommand('unwl',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then

			PerformHttpRequest(config.UnWhitelist, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "ID REMOVIDO DA WHITELIST⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**ID REMOVIDO: **"..vRP.format(parseInt(args[1])),
								value = "⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			vRP.setWhitelisted(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Você retirou o passaporte <b>"..args[1].."</b> da whitelist.")
		end
	end
end)

RegisterCommand('kick',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local id = vRP.getUserSource(parseInt(args[1]))
			if id then

				PerformHttpRequest(config.Kick, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	
							title = "REGISTRO DE KICK⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = config.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR DA EQUIPE:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{
									name = "**ID KIKADO: **"..vRP.format(parseInt(args[1])),
									value = "⠀"
								}
							}, 
							footer = { 
								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = config.webhookIcon
							},
							color = config.webhookColor 
						}
					}
				}), { ['Content-Type'] = 'application/json' })

				vRP.kick(id,"Você foi expulso da cidade.")
				TriggerClientEvent("Notify",source,"sucesso","Voce kickou o passaporte <b>"..args[1].."</b> da cidade.")
			end
		end
	end
end)

RegisterCommand('kickall',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	
    if vRP.hasPermission(user_id,"manager.permissao") then
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
                vRP.kick(id,"Você foi vitima do terremoto.")
            end
		end
		
		PerformHttpRequest(config.Kick, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	
					title = "REGISTRO DE KICKAR TODOS⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					}, 
					fields = {
						{ 
							name = "**COLABORADOR DA EQUIPE:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						}
					}, 
					footer = { 
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor 
				}
			}
		}), { ['Content-Type'] = 'application/json' })
    end
end)

RegisterCommand('ban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local nuser_id = vRP.getUserSource(parseInt(args[1]))

			PerformHttpRequest(config.Ban, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE BANIMENTO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**ID BANIDO: **"..vRP.format(parseInt(args[1])),
								value = "⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			vRP.setBanned(parseInt(args[1]),true)
			vRP.kick(nuser_id,"Você foi banido! [ Mais informações em: discord.gg/gg9Uf4CrVM ]")

			TriggerClientEvent("Notify",source,"sucesso","Voce baniu o passaporte <b>"..args[1].."</b> da cidade.")
		end
	end
end)

RegisterCommand('unban',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then

			PerformHttpRequest(config.UnBan, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE DESBANIMENTO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**ID DESBANIDO: **"..vRP.format(parseInt(args[1])),
								value = "⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			vRP.setBanned(parseInt(args[1]),false)
			TriggerClientEvent("Notify",source,"sucesso","Voce desbaniu o passaporte <b>"..args[1].."</b> da cidade.")
		end
	end
end)

RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		
		PerformHttpRequest(config.Nc, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	
					title = "REGISTRO DE NC⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					}, 
					fields = {
						{ 
							name = "**COLABORADOR DA EQUIPE:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						}
					}, 
					footer = { 
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor
				}
			}
		}), { ['Content-Type'] = 'application/json' })
		
		vRPclient.toggleNoclip(source)
	end
end)

RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
	end
end)

RegisterCommand('cds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		heading = GetEntityHeading(GetPlayerPed(-1))
		vRP.prompt(source,"Cordenadas:","['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z))
	end
end)

RegisterCommand('cds2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:",tD(x)..", "..tD(y)..", "..tD(z))
	end
end)

RegisterCommand('cds3',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:","{name='ATM', id=277, x="..tD(x)..", y="..tD(y)..", z="..tD(z).."},")
	end
end)

RegisterCommand('cds4',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local x,y,z = vRPclient.getPosition(source)
		vRP.prompt(source,"Cordenadas:","x = "..tD(x)..", y = "..tD(y)..", z = "..tD(z))
	end
end)

RegisterCommand('cds5',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent("cds5", source)
	end
end)

RegisterCommand('cds6',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent("cds6", source)
	end
end)

RegisterCommand('group',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local nplayer = vRP.getUserSource(parseInt(args[1]))
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] and args[2] then
			vRP.addUserGroup(parseInt(args[1]),args[2])
			
			TriggerClientEvent("Notify",source,"sucesso","Voce setou o passaporte <b>"..parseInt(args[1]).."</b> no grupo <b>"..args[2].."</b>.")

			PerformHttpRequest(config.Group, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE GROUP:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**ID & GROUP: **",
								value = "**"..args[1].." no grupo: "..args[2].."**"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			TriggerClientEvent("oc_gps:coords", nplayer)
		end
	end
end)

RegisterCommand('ungroup',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] and args[2] then
			vRP.removeUserGroup(parseInt(args[1]),args[2])

			TriggerClientEvent("Notify",source,"sucesso","Voce removeu o passaporte <b>"..parseInt(args[1]).."</b> do grupo <b>"..args[2].."</b>.")

			PerformHttpRequest(config.UnGroup, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "REGISTRO DE UNGROUP:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							},
							{
								name = "**ID & GROUP: **",
								value = "**"..args[1].." retirou o grupo: "..args[2].."**"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			TriggerClientEvent("oc_gps:coords", nplayer)
		end
	end
end)

RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local x,y,z = vRPclient.getPosition(source)
			if tplayer then

				PerformHttpRequest(config.Tps, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	------------------------------------------------------------
							title = "REGISTRO DE TPTOME⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = config.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{ 
									name = "**ID DO PLAYER PUXADO: **"..args[1],
									value = "⠀"
								}
							}, 
							footer = { 
								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = config.webhookIcon
							},
							color = config.webhookColor
						}
					}
				}), { ['Content-Type'] = 'application/json' })

				vRPclient.teleport(tplayer,x,y,z)
			end
		end
	end
end)

RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				PerformHttpRequest(config.Tps, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	------------------------------------------------------------
							title = "REGISTRO DE TPTO⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = config.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{ 
									name = "**ID DO PLAYER: **"..args[1],
									value = "⠀"
								}
							}, 
							footer = { 
								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = config.webhookIcon
							},
							color = config.webhookColor
						}
					}
				}), { ['Content-Type'] = 'application/json' })

				vRPclient.teleport(source,vRPclient.getPosition(tplayer))
			end
		end
	end
end)

RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		
		PerformHttpRequest(config.Tps, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	------------------------------------------------------------
					title = "REGISTRO DE TPWAY⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					}, 
					fields = {
						{ 
							name = "**COLABORADOR:**",
							value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
						}
					}, 
					footer = { 
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = config.webhookColor
				}
			}
		}), { ['Content-Type'] = 'application/json' })

		TriggerClientEvent('tptoway',source)
	end
end)

RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent('delnpcs',source)
	end
end)

RegisterCommand('pon',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        local users = vRP.getUsers()
        local players = ""
		local quantidade = 0
		
        for k,v in pairs(users) do
            if k ~= #users then
                players = players
			end
			
            players = players.." "..k
            quantidade = quantidade + 1
		end
		
        TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{255,160,0},quantidade)
        TriggerClientEvent('chatMessage',source,"ID's ONLINE",{255,160,0},players)
    end
end)

local tablePerm = 
{
    {org = "pm2", perm = "pm3.permissao", name = "Polícia"},
    {org = "pm1", perm = "pm3.permissao", name = "Polícia"},
    {org = "got2", perm = "got3.permissao", name = "Polícia"},
    {org = "got1", perm = "got3.permissao", name = "Polícia"},
    {org = "penal1", perm = "penal2.permissao", name = "Polícia"},
    {org = "investigativa1", perm = "investigativa12.permissao", name = "Polícia"},
    {org = "diretor-auxiliar", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "medico-chefe", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "medico-cirurgiao", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "medico-aulixiar", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "medico", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "paramedico", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "residente", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "socorrista", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "estagiario", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "ems", perm = "diretor-geral.permissao", name = "Hospital"},
    {org = "procurador", perm = "juiz.permissao", name = "Juizado"},
    {org = "promotor", perm = "juiz.permissao", name = "Juizado"},
    {org = "defensor", perm = "juiz.permissao", name = "Juizado"},
    {org = "advogado", perm = "juiz.permissao", name = "Juizado"},
    {org = "corretor", perm = "lider-corretor.permissao", name = "Corretora"},
    {org = "visitante", perm = "lider-corretor.permissao", name = "Corretora"},
    {org = "uber", perm = "lider-uber.permissao", name = "Uber"},
    {org = "mecanico", perm = "lider-mecanico.permissao", name = "Mecânica"},
    {org = "atlantic", perm = "lider-atlantic.permissao", name = "Atlantic"},	
    {org = "luxcompany", perm = "lider-luxcompany.permissao", name = "Lux Company"},
    {org = "elitecar", perm = "lider-elitecar.permissao", name = "Elitecar"},
    {org = "cassino", perm = "lider-cassino.permissao", name = "Cassino"},
    {org = "mojito", perm = "lider-mojito.permissao", name = "Mojito"},
    {org = "candlove", perm = "lider-candlove.permissao", name = "Candlove"},
    {org = "lakers", perm = "lider-lakers.permissao", name = "Lakers"},
    {org = "sinaloa", perm = "lider-sinaloa.permissao", name = "Sinaloa"},
    {org = "cartel", perm = "lider-cartel.permissao", name = "Cartel"},
    {org = "aguiasdonorte", perm = "lider-aguiasdonorte.permissao", name = "Aguias do Norte"},
    {org = "anjosdoasfalto", perm = "lider-anjosdoasfalto.permissao", name = "Anjos do Asfalto"},
	{org = "vanilla", perm = "lider-vanilla.permissao", name = "Vanilla"},
	{org = "vilarica", perm = "lider-vilarica.permissao", name = "Vilarica"},
	{org = "complexo", perm = "lider-complexo.permissao", name = "Complexo"},
	{org = "beiramar", perm = "lider-beiramar.permissao", name = "Beiramar"},
	{org = "colorado", perm = "lider-colorado.permissao", name = "Colorado"},
	{org = "jornal", perm = "lider-jornal.permissao", name = "Jornal"},
}

RegisterCommand("org",function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)

    local id = vRP.prompt(source,"Passaporte Contratado:","")
    if id == "" then
        return
    end

    local org = vRP.prompt(source,"Organização que irá ingressar:","")
    if org == "" then
        return
    end

	if args[1] == nil then
		TriggerClientEvent("Notify",nplayer,"negado","Comando errado use <b>/org add|rem</b> ",8000)
        return
    end

	local idcontratado = parseInt(id)

    if user_id and org and idcontratado then
		local identity = vRP.getUserIdentity(user_id)
        for k,v in pairs(tablePerm) do
            if org == v.org then
                if vRP.hasPermission(user_id,v.perm) then
                    -- O PLAYER TEM QUE ESTAR ONLINE, PARA SETAR COM PLAYER OFF, É SÓ REMOVER A CHECAGEM DO NPLAYER
                    local nplayer = vRP.getUserSource(idcontratado)
                    if nplayer then
						if args[1] == "add" then
							vRP.addUserGroup(idcontratado,v.org)
							TriggerClientEvent("Notify",source,"sucesso","Pessoa contratada com sucesso para: "..v.name,8000)
							TriggerClientEvent("Notify",nplayer,"sucesso","Você foi contratado e agora faz parte do(a) "..v.name,8000)

							PerformHttpRequest(config.Org, function(err, text, headers) end, 'POST', json.encode({
								embeds = {
									{ 
										title = "REGISTRO DE CONTRATAÇÃO ORG⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
										thumbnail = {
											url = config.webhookIcon
										}, 
										fields = {
											{ 
												name = "**LÍDER:**",
												value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
											},
											{ 
												name = "**INFORMAÇÕES DA CONTRATAÇÃO:**",
												value = "**[ ID Contratado: "..idcontratado.." ][ Cargo: "..v.org.." **]\n⠀"
											}
										}, 
										footer = { 
											text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
											icon_url = config.webhookIcon
										},
										color = config.webhookColor
									}
								}
							}), { ['Content-Type'] = 'application/json' })
						elseif args[1] == "rem" then
							vRP.removeUserGroup(idcontratado,v.org)
							TriggerClientEvent("Notify",source,"sucesso","Pessoa removida com sucesso de: "..v.name,8000)
							TriggerClientEvent("Notify",nplayer,"aviso","Você foi removido do(a) "..v.name,8000)
							PerformHttpRequest(config.Org, function(err, text, headers) end, 'POST', json.encode({
								embeds = {
									{ 
										title = "REGISTRO DE DEMISSÃO ORG⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
										thumbnail = {
											url = config.webhookIcon
										}, 
										fields = {
											{ 
												name = "**LÍDER:**",
												value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
											},
											{ 
												name = "**INFORMAÇÕES DA DEMISSÃO:**",
												value = "**[ ID Contratado: "..idcontratado.." ][ Cargo: "..v.org.." **]\n⠀"
											}
										}, 
										footer = { 
											text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
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
        end
    end
end)

function vRPidd.getPermissao()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"auxiliar.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		return true
	else
		return false
	end
end

RegisterCommand('ids',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		TriggerClientEvent("mostrarid",source)
	end
end)

function vRPidd.logID()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)

	PerformHttpRequest(config.Corno, function(err, text, headers) end, 'POST', json.encode({
		embeds = {
			{ 	
				title = "REGISTRO DE ID VISIVEL:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
				thumbnail = {
				url = config.webhookIcon
				}, 
				fields = {
					{ 
						name = "**COLABORADOR DA EQUIPE:**", 
						value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
					},
					{ 
						name = "**LOCAL: "..tD(x)..", "..tD(y)..", "..tD(z).."**",
						value = "⠀"
					}
				}, 
				footer = { 
					text = "GREENVALLEY"..os.date("%d/%m/%Y |: %H:%M:%S"), 
					icon_url = config.webhookIcon 
				},
				color = config.webhookColor 
			}
		}
	}), { ['Content-Type'] = 'application/json' })
end

local logAdmStatus = "https://discord.com/api/webhooks/1044180404967583745/vjygeVeXb1lkef_87iwqL-KGO6yEcC-ae2Dni-BLdahfBx8-rq7E76ofZdDE9uUKY94u"

RegisterCommand('staff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local cargo = nil
	local status = nil

	if vRP.hasPermission(user_id,"manager.permissao") then
		cargo = "Manager"
		status = "Saiu do modo administrativo."
		vRP.addUserGroup(user_id,"off-manager")
		TriggerClientEvent("Notify",source,"negado","<b>[MANAGER]</b> OFF.")

	elseif vRP.hasPermission(user_id,"off-manager.permissao") then
		cargo = "Manager"
		status = "Entrou no modo administrativo."
		vRP.addUserGroup(user_id,"manager")
		TriggerClientEvent("Notify",source,"sucesso","<b>[MANAGER]</b> ON.")

	elseif vRP.hasPermission(user_id,"administrador.permissao") then
		cargo = "Administrador"
		status = "Saiu do modo administrativo."
		vRP.addUserGroup(user_id,"off-administrador")
		TriggerClientEvent("Notify",source,"negado","<b>[ADMINISTRADOR]</b> OFF.")

	elseif vRP.hasPermission(user_id,"off-administrador.permissao") then
		cargo = "Administrador"
		status = "Entrou no modo administrativo."
		vRP.addUserGroup(user_id,"administrador")
		TriggerClientEvent("Notify",source,"sucesso","<b>[ADMINISTRADOR]</b> ON.")

	elseif vRP.hasPermission(user_id,"suportet.permissao") then
		cargo = "Suporte"
		status = "Saiu do modo administrativo."
		vRP.addUserGroup(user_id,"off-suporte")
		TriggerClientEvent("Notify",source,"negado","<b>[SUPORTE]</b> OFF.")

	elseif vRP.hasPermission(user_id,"off-suporte.permissao") then
		cargo = "Suporte"
		status = "Entrou no modo administrativo."
		vRP.addUserGroup(user_id,"suporte")
		TriggerClientEvent("Notify",source,"sucesso","<b>[SUPORTE]</b> ON.")
	
	elseif vRP.hasPermission(user_id,"moderador.permissao") then
		cargo = "Moderador"
		status = "Saiu do modo administrativo."
		vRP.addUserGroup(user_id,"off-moderador")
		TriggerClientEvent("Notify",source,"negado","<b>[MODERADOR]</b> OFF.")

	elseif vRP.hasPermission(user_id,"off-moderador.permissao") then
		cargo = "Moderador"
		status = "Entrou no modo administrativo."
		vRP.addUserGroup(user_id,"moderador")
		TriggerClientEvent("Notify",source,"sucesso","<b>[MODERADOR]</b> ON.")	
	end

	PerformHttpRequest(logAdmStatus, function(err, text, headers) end, 'POST', json.encode({
        embeds = {
            { 	------------------------------------------------------------
                title = "REGISTRO ADMINISTRATIVO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
                thumbnail = {
                    url = "https://media.discordapp.net/attachments/1027421888739278889/1043001120416608266/green-valley-rp.png?width=675&height=675"
                },
                fields = {
                    { 
                        name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]",
                        value = "⠀"
					},
					{ 
                        name = "**CARGO: **"..cargo,
						value = "⠀",
						inline = true
					},
					{ 
                        name = "**STATUS: **"..status,
						value = "⠀",
						inline = true
                    }
                },
                footer = { 
                    text = "Green Group - "..os.date("%d/%m/%Y | %H:%M:%S"),
                    icon_url = "https://media.discordapp.net/attachments/1027421888739278889/1043001120416608266/green-valley-rp.png?width=675&height=675"
                },
                color = 15906321
            }
        }
    }), { ['Content-Type'] = 'application/json' })
end)

local plan = {}

RegisterCommand("plano", function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if args[1] == "add" then
		if vRP.hasPermission(user_id,"manager.permissao") then
			if vRP.getUserSource(tonumber(args[2])) then
				if vRP.hasPermission(user_id,"manager.permissao") then
					local consulta = vRP.getUData(tonumber(args[2]),"vRP:plano")
					local resultado = json.decode(consulta) or {}
					resultado.tempo = (resultado.tempo or 0)+tonumber(args[3])*1440
					plan[vRP.getUserId(source)] = resultado.tempo
					vRP.setUData(tonumber(args[2]), "vRP:plano", json.encode(resultado))
				end
			end
		end
	elseif args[1] == "info" then
		local consulta = vRP.getUData(vRP.getUserId(source),"vRP:plano")
		local resultado = json.decode(consulta) or {}
		
		resultado.tempo = resultado.tempo or 0
		resultado = resultado.tempo/1440 or 0

		TriggerClientEvent("Notify",source,"importante","<b>Dias Restantes:</b> "..math.ceil(resultado))
	end
end)

function vRPidd.getId()
	local user_id = vRP.getUserId()
	return user_id
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end

local run = {}

RegisterCommand("vip", function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local nuser_id = parseInt(args[2])
	if args[1] == "add" then
		local vip = args[3]
		if vRP.hasPermission(user_id,"manager.permissao") then
			vRP.addUserGroup(nuser_id,vip)
			TriggerClientEvent("Notify", source, "sucesso","ID "..args[1].." setado de "..vip..".")
		end
	elseif args[1] == "rem" then
		if vRP.getUserSource(tonumber(args[2])) then
			if vRP.hasPermission(vRP.getUserId(source),"manager.permissao") then
				vRP.removeUserGroup(nuser_id,vip)
				TriggerClientEvent("Notify", source, "sucesso","ID "..args[1].." removido de "..vip..".")
			end
		end
	elseif args[1] == "status" then
		local user_id = vRP.getUserId(source)
		local cargo = vRP.getUserGroupByType(user_id,'pass')
		local pass = ""
		
		if cargo ~= '' then	
			pass = cargo
		else
			pass = "Sem Vip"
		end

		TriggerClientEvent("Notify",source,"importante","<b>Vip:</b> "..pass)
	end
end)

RegisterCommand('bvida',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identitynu = vRP.getUserIdentity(nuser_id)

				PerformHttpRequest(config.DebugPlayer, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	
							title = "REGISTRO DE BVIDA⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = config.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR DA EQUIPE:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{
									name = "**INFORMAÇÕES DO PLAYER:**",
									value = "**"..identitynu.name.." "..identitynu.firstname.."** [**"..nuser_id.."**]\n⠀"
								}
							}, 
							footer = { 
								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = config.webhookIcon
							},
							color = config.webhookColor 
						}
					}
				}), { ['Content-Type'] = 'application/json' })

				vRPclient._setCustomization(nplayer,vRPclient.getCustomization(nplayer))
				vRP.removeCloak(nplayer)
			end
		else
			PerformHttpRequest(config.DebugPlayer, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	
						title = "REGISTRO DE BVIDA⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })
			vRPclient._setCustomization(source,vRPclient.getCustomization(source))
			vRP.removeCloak(source)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DADOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dados',function(source,args,rawCommand)

    local ip = GetPlayerEndpoint(source)
    local steamhex = GetPlayerIdentifier(source)
    local ping = GetPlayerPing(source)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"manager.permissao") then
        if args[1] then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                local ip2 = GetPlayerEndpoint(nplayer)
                local steamhex2 = GetPlayerIdentifier(nplayer)
                local ping2 = GetPlayerPing(nplayer)
               TriggerClientEvent("Notify",source,'aviso',"IP do player:"  ..ip2.."",100000)
               TriggerClientEvent("Notify",source,'aviso',"Player Hex:" ..steamhex2.."",100000)
               TriggerClientEvent("Notify",source,'aviso',"Ping do player:" ..ping2.."",100000)
            end
        else
            TriggerClientEvent("Notify",source,'aviso',"Seu IP:"  ..ip.."",100000)
            TriggerClientEvent("Notify",source,'aviso',"Sua hex:"  ..steamhex.."",100000)
            TriggerClientEvent("Notify",source,'aviso',"Seu ping:"  ..ping.."",100000)
        end
    end
end)


-- [ ARMA ] --
RegisterCommand('arma',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
    if user_id then
        if args[1] then
			if vRP.hasPermission(user_id,"manager.permissao") then
            	vRPclient.giveWeapons(source,{[args[1]] = { ammo = 500 }})
				TriggerClientEvent("Notify",source,"importante","Você pergou a arma "..args[1])
			end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT ADMIN
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('chatstaff',function(source,args,rawCommand)

	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "staff.permissao"
		if vRP.hasPermission(user_id,permission) then
			local staff = vRP.getUsersByPermission(permission)
			for l,w in pairs(staff) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player, '[CHAT ADMIN] ' .. identity.name.." "..identity.firstname.." ("..identity.user_id..")",{255, 0, 0}, string.sub(rawCommand, 4))
						local Mensagem = args[1]
						if Mensagem == nil then Mensagem = 0 end
						--SendWebhookMessage(webhookchat,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." ("..identity.user_id..") \n[CHAT ADMIN]: "..Mensagem..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end)
				end
			end
		end
	end
end)

RegisterCommand('rg2',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
        local nuser_id = parseInt(args[1])
        local identity = vRP.getUserIdentity(nuser_id)
        local bankMoney = vRP.getBankMoney(nuser_id)
        local walletMoney = vRP.getMoney(nuser_id)
        local sets = json.decode(vRP.getUData(nuser_id,"vRP:datatable"))


        if args[1] then
           TriggerClientEvent("Notify",source,"importante","ID: <b>"..parseInt(nuser_id).."</b><br>Nome: <b>"..identity.name.." "..identity.firstname.."</b><br>Idade: <b>"..identity.age.."</b><br>Telefone: <b>"..identity.phone.."</b><br>Carteira: <b>"..vRP.format(parseInt(walletMoney)).."</b><br>Banco: <b>"..vRP.format(parseInt(bankMoney)).."</b><br>Sets: <b>"..json.encode(sets.groups).."</b>",5000)
        else
            TriggerClientEvent("Notify",source,"negado","Digite o ID desejado!")
        end
    end
end)

RegisterCommand('clearinv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

    if vRP.hasPermission(user_id,"manager.permissao") then
		if args[1] == nil or args[1] == "" then
			return
		end
        if args[2] then
			local nplayer = vRP.getUserSource(parseInt(args[2]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identitynu = vRP.getUserIdentity(nuser_id)

				PerformHttpRequest(config.ClearInventory, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	
							title = "REGISTRO DE LIMPAR INVENTARIO⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = config.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR DA EQUIPE:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{
									name = "**INFORMAÇÕES DO PLAYER:**",
									value = "**"..identitynu.name.." "..identitynu.firstname.."** [**"..nuser_id.."**]\n⠀"
								}
							}, 
							footer = { 
								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = config.webhookIcon
							},
							color = config.webhookColor 
						}
					}
				}), { ['Content-Type'] = 'application/json' })

				if args[1] == "sim" then
					vRP.setExp(nuser_id,"physical","strength",20)
				end
				TriggerEvent("clearInventory", nuser_id)
				TriggerClientEvent("Notify",nplayer,"importante","Seu inventário foi limpo")
				TriggerClientEvent("Notify",source,"sucesso","Inventário de <b>"..identitynu.name.." "..identitynu.firstname.."</b> limpo com sucesso")
            end
		else
			PerformHttpRequest(config.ClearInventory, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 	
						title = "REGISTRO DE LIMPAR INVENTARIO⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
						thumbnail = {
							url = config.webhookIcon
						}, 
						fields = {
							{ 
								name = "**COLABORADOR DA EQUIPE:**",
								value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
							}
						}, 
						footer = { 
							text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
							icon_url = config.webhookIcon
						},
						color = config.webhookColor 
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			if args[1] == "sim" then
				vRP.setExp(user_id,"physical","strength",20)
			end
			TriggerEvent("clearInventoryTwo", user_id)
			TriggerClientEvent("Notify",source,"sucesso","Inventário limpo com sucesso")
        end
    end
end)

RegisterCommand('resetar',function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local identitynu = vRP.getUserIdentity(nuser_id)
				
				vRP.setUData(nuser_id,"vRP:spawnController",json.encode(0))
				TriggerClientEvent("Notify",source,"sucesso","Você resetou o personagem de <b>"..identitynu.name.. " "..identitynu.firstname.."</b>.")
				vRP.kick(nplayer,"Seu personagem foi resetado com sucesso.")

				
				PerformHttpRequest(config.Reset, function(err, text, headers) end, 'POST', json.encode({
					embeds = {
						{ 	
							title = "REGISTRO DE RESET⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
							thumbnail = {
								url = config.webhookIcon
							}, 
							fields = {
								{ 
									name = "**COLABORADOR DA EQUIPE:**",
									value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
								},
								{
									name = "**INFORMAÇÕES DO PLAYER:**",
									value = "**"..identitynu.name.." "..identitynu.firstname.."** [**"..nuser_id.."**]\n⠀"
								}
							}, 
							footer = { 
								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
								icon_url = config.webhookIcon
							},
							color = config.webhookColor 
						}
					}
				}), { ['Content-Type'] = 'application/json' })
			end
		end
	end
end)

RegisterCommand("ney",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if user_id then
        if vRP.hasPermission(user_id,"manager.permissao") then
            if args[1] then
                local nplayer = vRP.getUserSource(parseInt(args[1]))
                if nplayer then
                    TriggerClientEvent("ney",nplayer,args[1])
                end
            end
        end
    end
end)

RegisterCommand('anuncio',function(source,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"ems.permissao") or vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"coordenador.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
		local desc = vRP.prompt(source, "Digite as informações do anuncio (Ex: Terremoto em breve)", "")	
		if desc == "" then
			TriggerClientEvent("Notify",source,"negado","Você precisa <b>digitar um anúncio</b>.")
			return
		end
			local time = vRP.prompt(source, "Digite o tempo que o anuncio ficará visível (em segundos). Máx 120s", "60")
		if time == "" or (tonumber(time) > 120 and tonumber(time) < 1) then
			TriggerClientEvent("Notify",source,"negado","Você precisa informar um <b>tempo</b>.")
			return
		elseif tonumber(time) > 120 or tonumber(time) < 1 then
			TriggerClientEvent("Notify",source,"negado","O tempo deve ser entre <b>1s</b> e <b>120s</b>.")
			return
		end
		TriggerClientEvent("announce",-1,desc,identity.name,identity.firstname,time)
	end
end)

RegisterCommand("naoeloja",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if user_id then
        if vRP.hasPermission(user_id,"manager.permissao") then
            if args[1] then
                local nplayer = vRP.getUserSource(parseInt(args[1]))
                if nplayer then
                    TriggerClientEvent("ps_outfitshop:open_nui",nplayer)
                end
			else
				TriggerClientEvent("ps_outfitshop:open_nui",source)
            end
        end
    end
end)

RegisterCommand("naoetattoos",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if user_id then
        if vRP.hasPermission(user_id,"manager.permissao") then
            if args[1] then
                local nplayer = vRP.getUserSource(parseInt(args[1]))
                if nplayer then
                    TriggerClientEvent("ps_tattoos:open_nui",nplayer)
                end
			else
				TriggerClientEvent("ps_tattoos:open_nui",source)
            end
        end
    end
end)

-- RegisterCommand("godmode",function(source,args,rawCommand)
--     local user_id = vRP.getUserId(source)  -- Apitando no mqcu
--     local identity = vRP.getUserIdentity(user_id)
--     if user_id then
--         if vRP.hasPermission(user_id,"godmode.permissao") then
--             TriggerClientEvent("godmode",source)
--         end
--     end
-- end)