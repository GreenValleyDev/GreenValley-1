local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_player",src)
local idgens = Tools.newIDGenerator()

RegisterCommand('uservehs',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") then
        	local nuser_id = parseInt(args[1])
            if nuser_id > 0 then 
                local vehicle = vRP.query("losanjos/get_vehicle",{ user_id = parseInt(nuser_id) })
                local car_names = {}
                for k,v in pairs(vehicle) do
                	table.insert(car_names, "<b>" .. vRP.vehicleName(v.vehicle) .. "</b>")
                end
                car_names = table.concat(car_names, ", ")
                local identity = vRP.getUserIdentity(nuser_id)
                TriggerClientEvent("Notify",source,"importante","Veículos de <b>"..identity.name.." " .. identity.firstname.. " ("..#vehicle..")</b>: "..car_names,10000)
            end
        end
    end
end)

RegisterCommand('status',function(source,args,rawCommand)
    local staff = vRP.getUsersByPermission("staff.permissao")
	local mec = vRP.getUsersByPermission("mecanico.permissao")
	local policia = vRP.getUsersByPermission("policia.permissao")
	local medicos = vRP.getUsersByPermission("ems.permissao")
    local user_id = vRP.getUserId(source)
    --if vRP.hasPermission(user_id,"suporte.permissao") then
        TriggerClientEvent("Notify",source,"importante","<bold><b>Administradores</b>: <b>"..#staff..
        "<br>Policiais</b>: <b>"..#policia..
		"<br>Medicos</b>: <b>"..#medicos..
		"<br>Mecanicos</b>: <b>"..#mec..
        "</b></bold>",8000) 
    --end
end)

RegisterCommand('reskin',function(source,rawCommand)
	local user_id = vRP.getUserId(source)		
	vRPclient._setCustomization(vRPclient.getCustomization(source))		
end)

RegisterCommand('id',function(source,rawCommand)	
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local nuser_id = vRP.getUserId(nplayer)
	if nuser_id then
		local identity = vRP.getUserIdentity(nuser_id)
		vRPclient.setDiv(source,"completerg",".div_completerg { background-color: rgba(0,0,0,0.60); font-size: 13px; font-family: arial; color: #fff; width: 420px; padding: 20px 20px 5px; bottom: 8%; right: 2.5%; position: absolute; border: 1px solid rgba(255,255,255,0.2); letter-spacing: 0.5px; } .local { width: 220px; padding-bottom: 15px; float: left; } .local2 { width: 200px; padding-bottom: 15px; float: left; } .local b, .local2 b { color: #d1257d; }","<div class=\"local\"><b>Passaporte:</b> ( "..vRP.format(identity.user_id).." )</div>")
		vRP.request(source,"Você deseja fechar o registro geral?",1000)
		vRPclient.removeDiv(source,"completerg")
	end
end)

local timers = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(timers) do
			if v > 0 then
				timers[k] = v - 1
			end
		end
	end
end)

RegisterCommand('malas',function(source,args,rawCommand)
    local nplayer = vRPclient.getNearestPlayer(source,5)
    local source = source
    local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	local classe = vRPclient.getCarroClass(source,vehicle)
    if vRPclient.getHealth(source) > 101 then
        if user_id then
            if not vRPclient.isHandcuffed(source) then
                if not vRPclient.getNoCarro(source) then
                    local vehicle = vRPclient.getNearestVehicle(source,7)
                    if vehicle then
                        if classe then
                            vRPclient.setMalas(source)
							PerformHttpRequest(config.Malas, function(err, text, headers) end, 'POST', json.encode({content = '```\n[ID]: ' .. user_id .. '\n[ID DO CARRO]: ' .. vehicle .. ' \n[LOCALIZAÇAO]: ' .. x,y,z .. '\r```'}), { ['Content-Type'] = 'application/json' })
                        end
                    end
                elseif vRPclient.isMalas(source) then
                    vRPclient.setMalas(source)
                end
            else
                TriggerClientEvent("Notify",source,"aviso","Você não pode executar esse comando algemado.")
            end
        end
    else
        TriggerClientEvent("Notify",source,"aviso","Você não pode executar esse comando morto.")
    end
end)

RegisterServerEvent('salario:pagamento')
AddEventHandler('salario:pagamento',function()
	local source = source
	local user_id = vRP.getUserId(source)


	if timers[user_id] == 0 or not timers[user_id] then
		timers[user_id] = 5
		if user_id then
			for k,v in pairs(config.payments) do
				if vRP.hasPermission(user_id,v.permissao) then
					TriggerClientEvent("vrp_sound:source",source,'coins',0.5)
					TriggerClientEvent("Notify",source,"importante","Obrigado por colaborar com a cidade, seu salario de <b>$"..vRP.format(parseInt(v.payment)).." dólares</b> foi depositado.")
					vRP.giveBankMoney(user_id,parseInt(v.payment))
					local identity = vRP.getUserIdentity(user_id)
					PerformHttpRequest(config.Salarys, function(err, text, headers) end, 'POST', json.encode({
						embeds = {
							{ 	
								title = "REGISTRO DE SALARIO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
								thumbnail = {
									url = config.webhookIcon
								}, 
								fields = {
									{
										name = "**INFORMAÇÕES DO PLAYER:**",
										value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]\n⠀"
									},
									{
										name = "**GRUPO DE PAGAMENTO: **"..v.nome,
										value = "VALOR RECEBIDO: **"..v.payment.."**\n⠀"
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
	else
		PerformHttpRequest(config.Dumb, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	
					title = "REGISTRO DE BANIMENTO POR CHEAT:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					}, 
					fields = {
						{
							name = "**ID BANIDO: **"..user_id,
							value = "Banido ao tentar usar o evento de salário."
						}
					}, 
					footer = { 
						text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
						icon_url = config.webhookIcon
					},
					color = 15906321 
				}
			}
		}), { ['Content-Type'] = 'application/json' })

		vRP.setBanned(user_id,true)
		vRP.kick(source,"Você foi banido, PAU NO CU!")
	end
end)

local veiculos = {}
RegisterServerEvent("TryDoorsEveryone")
AddEventHandler("TryDoorsEveryone",function(veh,doors,placa)
	if not veiculos[placa] then
		TriggerClientEvent("SyncDoorsEveryone",-1,veh,doors)
		veiculos[placa] = true
	end
end)

RegisterServerEvent("kickAFK")
AddEventHandler("kickAFK",function()
    local source = source
    local user_id = vRP.getUserId(source)
    if not vRP.hasPermission(user_id,"manager.permissao") or vRP.hasPermission(user_id,"administrador.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"ultimate.permissao") or vRP.hasPermission(user_id,"platinum.permissao") or vRP.hasPermission(user_id,"gold.permissao") or vRP.hasPermission(user_id,"standard.permissao") then
        DropPlayer(source,"Voce foi desconectado por ficar ausente.")
    end
end)

RegisterCommand('sequestro',function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,5)
	if nplayer then
		if vRPclient.isHandcuffed(nplayer) then
			if not vRPclient.getNoCarro(source) then
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					if vRPclient.getCarroClass(source,vehicle) then
						vRPclient.setMalas(nplayer)
					end
				end
			elseif vRPclient.isMalas(nplayer) then
				vRPclient.setMalas(nplayer)
			end
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
		end
	end
end)

RegisterServerEvent("trytow")
AddEventHandler("trytow",function(nveh,rveh)
	TriggerClientEvent("synctow",-1,nveh,rveh)
end)

RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)

RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)

RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)

local blips = {}
RegisterCommand('chamar',function(source,args,rawCommand)
	local source = source
	local answered = false
	local user_id = vRP.getUserId(source)
	local uplayer = vRP.getUserSource(user_id)
	vida = vRPclient.getHealth(source)
	vRPclient._CarregarObjeto(source,"cellphone@","cellphone_call_to_text","prop_amb_phone",50,28422)
	if user_id then
		local descricao = vRP.prompt(source,"Descrição:","")
		if descricao == "" then
			vRPclient._stopAnim(source,false)
			vRPclient._DeletarObjeto(source)
			return
		end

		local x,y,z = vRPclient.getPosition(source)
		local players = {}
		local playerstwo = {}
		local playersthree = {}
		vRPclient._stopAnim(source,false)
		vRPclient._DeletarObjeto(source)
		local especialidade = false

		if args[1] == "190" then
			players = vRP.getUsersByPermission("policia.permissao")
			especialidade = "agentes do <b>departamento de policia</b>"
		elseif args[1] == "112" then
			players = vRP.getUsersByPermission("ems.permissao")
			especialidade = "colaboradores do <b>departamento médico</b>"
		elseif args[1] == "mec" then
			players = vRP.getUsersByPermission("mecanico.permissao")
			especialidade = "mecânicos"
		elseif args[1] == "taxi" or args[1] == "uber" then
			players = vRP.getUsersByPermission("uber.permissao")
			especialidade = "uber"
		elseif args[1] == "adv" then
			players = vRP.getUsersByPermission("advogado.permissao")
			especialidade = "advogados"
		elseif args[1] == "staff" then
			players = vRP.getUsersByPermission("administrador.permissao")
			playerstwo = vRP.getUsersByPermission("moderador.permissao")
			playersthree = vRP.getUsersByPermission("manager.permissao")
			playersfour = vRP.getUsersByPermission("suporte.permissao")
			especialidade = "staff"
		end

		local adm = ""

		if especialidade == "Staff" then
			adm = "[STAFF] "
		end
		
		vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
		
		local identitys = vRP.getUserIdentity(user_id)
		TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.")

		for l,w in pairs(players) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			if player and player ~= uplayer then
				async(function()
					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
					if ok then
						if not answered then
							answered = true
							local identity = vRP.getUserIdentity(nuser_id)
							TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							vRPclient._setGPS(player,x,y)
						else
							TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
						end
					end
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end

		for l,w in pairs(playerstwo) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			if player and player ~= uplayer then
				async(function()
					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
					if ok then
						if not answered then
							answered = true
							local identity = vRP.getUserIdentity(nuser_id)
							TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							vRPclient._setGPS(player,x,y)
						else
							TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
						end
					end
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end

		for l,w in pairs(playersthree) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			if player and player ~= uplayer then
				async(function()
					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
					if ok then
						if not answered then
							answered = true
							local identity = vRP.getUserIdentity(nuser_id)
							TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							vRPclient._setGPS(player,x,y)
						else
							TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
						end
					end
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end

		for l,w in pairs(playersfour) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			if player and player ~= uplayer then
				async(function()
					vRPclient.playSound(player,"Out_Of_Area","DLC_Lowrider_Relay_Race_Sounds")
					TriggerClientEvent('chatMessage',player,"CHAMADO",{19,197,43},adm.."Enviado por ^1"..identitys.name.." "..identitys.firstname.."^0 ["..user_id.."], "..descricao)
					local ok = vRP.request(player,"Aceitar o chamado de <b>"..identitys.name.." "..identitys.firstname.."</b>?",30)
					if ok then
						if not answered then
							answered = true
							local identity = vRP.getUserIdentity(nuser_id)
							TriggerClientEvent("Notify",source,"importante","Chamado atendido por <b>"..identity.name.." "..identity.firstname.."</b>, aguarde no local.")
							vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
							vRPclient._setGPS(player,x,y)
						else
							TriggerClientEvent("Notify",player,"importante","Chamado ja foi atendido por outra pessoa.")
							vRPclient.playSound(player,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
						end
					end
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,358,71,"Chamado",0.6,false)
					SetTimeout(300000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /mascara
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
		return
	end
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao") then
			TriggerClientEvent("setmascara",source,args[1],args[2])
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
		end	
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /blusa
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
		return
	end
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"roupas") >= 1  or vRP.hasPermission(user_id,"roupas.permissao") then
			TriggerClientEvent("setblusa",source,args[1],args[2])
		else
			TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
		end		
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /colete
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('colete',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
		return
	end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao") then
			TriggerClientEvent("setColeteUser",source,args[1],args[2])
		   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end) 
-----------------------------------------------------------------------------------------------------------------------------------------
-- /jaqueta
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao")  then
		   TriggerClientEvent("setjaqueta",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao")  then
		   TriggerClientEvent("setmaos",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maose
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maose',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao") then
		   TriggerClientEvent("setmaose",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maosd
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maosd',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao") then
		   TriggerClientEvent("setmaosd",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /calca
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao") then
		   TriggerClientEvent("setcalca",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /acessorios
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao") then
		   TriggerClientEvent("setacessorios",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sapatos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isInVehicle(source) or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao") then
		   TriggerClientEvent("setsapatos",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /chapeu
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 and args[1] ~= 39 or vRP.hasPermission(user_id,"roupas.permissao") then
		   TriggerClientEvent("setchapeu",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /oculos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
   local user_id = vRP.getUserId(source)
   if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
	   return
   end
   if user_id then
	   if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id,"roupas.permissao") then
		   TriggerClientEvent("setoculos",source,args[1],args[2])
	   else
		   TriggerClientEvent("Notify",source,"negado","Você não possui <b>Roupas Secundárias</b> na mochila.") 
	   end
   end
end)

local vips = {
	"policia.permissao",
	"vipgreenvalley.permissao",
	"vipdiamante.permissao",
	"vipplatina.permissao",
	"vipouro.permissao",
	"vipprata.permissao",
	"vipbronze.permissao",
	"vipgratis.permissao",
	"viptucano.permissao",
}

function src.checkPassGold()
	local source = source
	local user_id = vRP.getUserId(source)
	local check = false
	for k, v in pairs(vips) do
		if vRP.hasPermission(user_id,v) then
			check = true
		end
	end
	return check
end

function src.checkPassPlatinum()
	local source = source
	local user_id = vRP.getUserId(source)
	for k, v in pairs(vips) do
		if k <= 4 then
			if vRP.hasPermission(user_id,v) then
				check = true
			end
		end
	end
	return check
end

-- RegisterCommand("servico",function(source,args)
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id then
-- 		local identity = vRP.getUserIdentity(user_id)
-- 		for k, v in pairs(config.toggles) do
-- 			local player = GetPlayerPed(source)
-- 			local ucoords = GetEntityCoords(player)
-- 			local position = vector3(v.x, v.y, v.z)
-- 			local distance = #(ucoords - position) 
-- 			if distance <= 1.5 then
-- 				local status = nil
-- 				if vRP.hasPermission(user_id,v.perm1) then
-- 					local group1 = string.gsub(v.perm1,".permissao","")
-- 					local group2 = string.gsub(v.perm2,".permissao","")
-- 					vRP.addUserGroup(user_id,group2)
-- 					vRP.removeUserGroup(user_id,group1)
-- 					status = "saiu de serviço"
-- 					cargo = group2

-- 					if v.blip ~= nil then
-- 						TriggerEvent("eblips:remove",source)
-- 					end
-- 				elseif vRP.hasPermission(user_id,v.perm2) then
-- 					local group1 = string.gsub(v.perm1,".permissao","")
-- 					local group2 = string.gsub(v.perm2,".permissao","")
-- 					vRP.addUserGroup(user_id,group1)
-- 					vRP.removeUserGroup(user_id,group2)
-- 					status = "entrou em serviço"
-- 					cargo = group1

-- 					if v.blip ~= nil then
-- 						TriggerEvent("eblips:add2",{ name = v.blip.name, src = source, color = v.blip.color })
-- 					end
-- 				end

-- 				TriggerClientEvent("Notify",source,"sucesso","Você "..status)

-- 				local webhook = config.Toogle

-- 				if v.perm1 == "policia.permissao" or v.perm2 == "paisana-policia.permissao" then
-- 					webhook = config.recordPolice
-- 				elseif v.perm1 == "ems.permissao" or v.perm2 == "paisana-ems.permissao" then
-- 					webhook = config.recordMedical
-- 				elseif v.perm1 == "mecanico.permissao" or v.perm2 == "paisana-mecanico.permissao" then
-- 					webhook = config.recordMechanic
-- 				end

-- 				PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
-- 					embeds = {
-- 						{ 	
-- 							title = "REGISTRO DE PRONTO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
-- 							thumbnail = {
-- 								url = config.webhookIcon
-- 							},
-- 							fields = {
-- 								{ 
-- 									name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]",
-- 									value = "⠀"
-- 								},
-- 								{ 
-- 									name = "**CARGO: **"..cargo,
-- 									value = "⠀",
-- 									inline = true
-- 								},
-- 								{ 
-- 									name = "**STATUS: **"..status,
-- 									value = "⠀",
-- 									inline = true
-- 								}
-- 							},
-- 							footer = { 
-- 								text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"),
-- 								icon_url = config.webhookIcon
-- 							},
-- 							color = config.webhookColor
-- 						}
-- 					}
-- 				}), { ['Content-Type'] = 'application/json' })
-- 			end
-- 		end
-- 	end
-- end)

RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)

RegisterServerEvent("trypneus")
AddEventHandler("trypneus",function(nveh)
    TriggerClientEvent("syncpneus",-1,nveh)
end)

RegisterCommand("seat",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) > 101 then
			if not vRPclient.isHandcuffed(source) then
				TriggerClientEvent("seatplayer",source,args[1])
			end
		end
	end
end)

RegisterCommand("me",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] then
			TriggerClientEvent("vrp_player:pressMe",-1,source,rawCommand:sub(4),{ 10,250,0,255,100 })
		end
	end
end)

RegisterCommand("cp",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"policia.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
			players = vRP.getUsersByPermission("policia.permissao")
			adms = vRP.getUsersByPermission("manager.permissao")
			for l,w in pairs(players) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player then
					async(function()
						TriggerClientEvent("vrp_sound:source",player,'message',0.5)
						TriggerClientEvent('chatMessage',player,"COPOM | "..identity.name.." "..identity.firstname.."",{19,197,43},rawCommand:sub(4))
					end)
				end
			end
			for l,w in pairs(adms) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player then
					async(function()
						TriggerClientEvent("vrp_sound:source",player,'message',0.5)
						TriggerClientEvent('chatMessage',player,"COPOM | "..identity.name.." "..identity.firstname.."",{19,197,43},rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)

RegisterCommand("192",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"ems.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
			players = vRP.getUsersByPermission("ems.permissao")
			adms = vRP.getUsersByPermission("manager.permissao")
			for l,w in pairs(players) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player then
					async(function()
						TriggerClientEvent("vrp_sound:source",player,'message',0.5)
						TriggerClientEvent('chatMessage',player,"HOSPITAL | "..identity.name.." "..identity.firstname.."",{210,20,40},rawCommand:sub(4))
					end)
				end
			end
			for l,w in pairs(adms) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player then
					async(function()
						TriggerClientEvent("vrp_sound:source",player,'message',0.5)
						TriggerClientEvent('chatMessage',player,"HOSPITAL | "..identity.name.." "..identity.firstname.."",{210,20,40},rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)

RegisterCommand("mec",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"ems.permissao") or vRP.hasPermission(user_id,"manager.permissao") then
			players = vRP.getUsersByPermission("ems.permissao")
			adms = vRP.getUsersByPermission("manager.permissao")
			for l,w in pairs(players) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player then
					async(function()
						TriggerClientEvent("vrp_sound:source",player,'message',0.5)
						TriggerClientEvent('chatMessage',player,"MECANICA | "..identity.name.." "..identity.firstname.."",{252,164,49},rawCommand:sub(4))
					end)
				end
			end
			for l,w in pairs(adms) do
				local player = vRP.getUserSource(parseInt(w))
				local nuser_id = vRP.getUserId(player)
				if player then
					async(function()
						TriggerClientEvent("vrp_sound:source",player,'message',0.5)
						TriggerClientEvent('chatMessage',player,"MECANICA | "..identity.name.." "..identity.firstname.."",{252,164,49},rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)

RegisterCommand('garmas',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local rtime = math.random(3,8)
	TriggerClientEvent("Notify",source,"aviso","<b>Aguarde!</b> Suas armas estão sendo desequipadas.",9500)
	TriggerClientEvent("progress",source,10000,"guardando")
	SetTimeout(1000*rtime,function()
		if user_id then
			local weapons = vRPclient.replaceWeapons(source,{})
			for k,v in pairs(weapons) do
				vRP.giveInventoryItem(user_id,"wbody|"..k,1)
				PerformHttpRequest(config.webhookUnequip, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = "REGISTRO DE ITEM DESEQUIPADO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀", thumbnail = {url = config.webhookIcon}, fields = {{name = "**QUEM DESEQUIPOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"}, {name = "**ITEM EQUIPADO:**", value = "[ **Item: "..k.."** ][ **Quantidade: 1** ]"}}, footer = {text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = config.webhookIcon}, color = config.webhookColor}}}), {['Content-Type'] = 'application/json'})
				if v.ammo > 0 then
					vRP.giveInventoryItem(user_id,"wammo|"..k,v.ammo)
					PerformHttpRequest(config.webhookUnequip, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = "REGISTRO DE ITEM DESEQUIPADO:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀", thumbnail = {url = config.webhookIcon}, fields = {{name = "**QUEM DESEQUIPOU:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"}, {name = "**ITEM DESEQUIPADO:**", value = "[ **Item: "..k.."** ][ **Quantidade: "..vRP.format(parseInt(v.ammo)).."** ]"}}, footer = {text = config.webhookBottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = config.webhookIcon}, color = config.webhookColor}}}), {['Content-Type'] = 'application/json'})
				end
			end
			TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
		end
	end)
	SetTimeout(10000,function()
		TriggerClientEvent("Notify",source,"sucesso","Guardou seu armamento na mochila.")
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tow",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "mecanico.permissao") or vRP.hasPermission(user_id, "manager.permissao") then
			if vRPclient.getHealth(source) > 101 then
				TriggerClientEvent("towPlayer",source)
			end
		else
			TriggerClientEvent("Notify",source,"importante","Somente trabalhadores do <b>Reboque</b> podem utilizar deste serviço.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
function src.tryTow(vehid01,vehid02,mod)
	TriggerClientEvent("vrp_player:syncTow",-1,vehid01,vehid02,tostring(mod))
end

RegisterServerEvent('Prefech:playerDied')
AddEventHandler('Prefech:playerDied',function(args)
	local source = source
	local user_id = vRP.getUserId(source)
	local fields = {}
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if args.weapon == nil then _Weapon = "" else _Weapon = ""..args.weapon.."" end
		if args.type == 1 then  -- Suicide/died
			fields = {
				{ 
					name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]",
					value = "⠀"
				},
				{ 
					name = "**RAZÃO MORTE: **",
					value = args.death_reason
				},
				{ 
					name = "**ARMA: **",
					value = _Weapon
				},
				{ 
					name = "**POSIÇÃO: **",
					value = args.coords
				}
			}
		elseif args.type == 2 then -- Killed by other player
			local nuser_id = vRP.getUserId(args.player_2_id)
			local identity2 = vRP.getUserIdentity(nuser_id)
			fields = {
				{ 
					name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]",
					value = "⠀"
				},
				{ 
					name = "**MORTO POR: "..identity2.name.." "..identity2.firstname.."** [**"..nuser_id.."**]",
					value = "⠀"
				},
				{ 
					name = "**RAZÃO MORTE: **",
					value = args.death_reason
				},
				{ 
					name = "**ARMA: **",
					value = _Weapon
				},
				{ 
					name = "**POSIÇÃO: **",
					value = ""..args.coords.x..", "..args.coords.y..", "..args.coords.z
				}
			}
		else -- When gets killed by something else
			fields = {
				{ 
					name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]",
					value = "⠀"
				},
				{ 
					name = "**RAZÃO MORTE: **",
					value = args.death_reason
				},
				{ 
					name = "**ARMA: **",
					value = _Weapon
				},
				{ 
					name = "**POSIÇÃO: **",
					value = ""..args.coords.x..", "..args.coords.y..", "..args.coords.z
				}
			}
		end

		PerformHttpRequest(config.webhookKill, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 	
					title = "REGISTRO DE MORTE:⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n⠀",
					thumbnail = {
						url = config.webhookIcon
					},
					fields = fields,
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


-- cabecada

RegisterServerEvent("vrp_tackle:Update")
AddEventHandler("vrp_tackle:Update",function(Tackled,ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
	TriggerClientEvent("vrp_tackle:Player",Tackled,ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
end)

-- mochila

RegisterNetEvent('setmochila')
AddEventHandler('setmochila',function(modelo,cor)
    local ped = PlayerPedId()
    if GetEntityHealth(ped) > 101 and src.checkRoupas() then
        if not modelo then
            vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
            Wait(2500)
            ClearPedTasks(ped)
            SetPedComponentVariation(ped,5,0,0,2)
            return
        end
        if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
            vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
            Wait(2500)
            ClearPedTasks(ped)
            SetPedComponentVariation(ped,5,parseInt(modelo),parseInt(cor),2)
        elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
            vRP._playAnim(true,{{"clothingshirt","try_shirt_positive_d"}},false)
            Wait(2500)
            ClearPedTasks(ped)
            SetPedComponentVariation(ped,11,parseInt(modelo),parseInt(cor),2)
        end
    end
end)