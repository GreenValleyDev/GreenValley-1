local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
src = {}
Tunnel.bindInterface("black_tablet",src)

local horario = os.date ("%Y-%m-%d")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("black/get_user_inssues","SELECT * FROM black_tablet WHERE user_id = @user_id")
vRP._prepare("black/get_user_arrest","SELECT * FROM black_tablet WHERE user_id = @user_id AND type = @type")
vRP._prepare("black/delete","UPDATE black_tablet SET type = @type WHERE user_id = @user_id")
--[[ vRP._prepare("black/delete","DELETE black_tablet WHERE user_id = @user_id") ]]
vRP._prepare("black/add_user_inssues","INSERT INTO black_tablet(user_id,type,value,data,info,officer) VALUES(@user_id,@type,@value,@data,@info,@officer)")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookprender =  config2.prender
local webhookmultas = config2.multar

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

--[[ func = {}
local auth = false
local ip

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PerformHttpRequest("https://pastebin.com/raw/R3tm2JSH", function(errorCode1, resultData2, resultHeaders1)
            PerformHttpRequest("https://api.ipify.org/", function(errorCode, resultData, resultHeaders)
                print('^1[FELIPEEX-NETWORKING] ^0Verificando a sua key...')
                Wait(2000)
                local data = json.decode(resultData2)
                ip = resultData
                if ip == nil then
                    while ip == nil do 
                        print('^1IP inválido ou você não possui licença, caso averiguarmos que você não possui acesso, seu IP será bloqueado.')
						print('^1IP no qual foi iniciado o Script: '..ip..'')
                        PerformHttpRequest("https://api.ipify.org/", function(errorCode3, resultData3, resultHeaders3)
                        ip = resultData3
                        end)
                        Wait(2000)
                        os.exit()
                    end
                end
                for k,v in pairs(data) do
                    if k == GetCurrentResourceName() then
                        for a,b in pairs(v) do
                            if ip == b then
        						print('^4[FELIPEEX-NETWORKING] ^2Autenticado com sucesso!')
								Wait(100)
       					 		print('^4[FELIPEEX-NETWORKING] ^7Key autenticada para o IP:^1 '..ip..'')
								Wait(100)
        						print('^4[FELIPEEX-NETWORKING] ^7Você está utilizando o TABLET POLICIAL^0')
								Wait(100)
        						print('^4[FELIPEEX-NETWORKING] ^7Suporte somente via ticket^0')
								Wait(100)
								print('^4[FELIPEEX-NETWORKING] ^7Discord: ! Felipeex#6328^0')
								Wait(100)
        						print('^4[FELIPEEX-NETWORKING] ^7Desenvolvedor: Felipeex^0')
								Wait(100)
        						print('^4[FELIPEEX-NETWORKING] ^7Loja: https://discord.gg/DhMFSWrdU3^0')
                                auth = true
                                return
								end
                            end
                        end
                    end
				print('^1IP inválido ou você não possui licença, caso averiguarmos que você não possui acesso, seu IP será bloqueado.')
				print('^1IP no qual foi iniciado o Script: '..ip..'')
				PerformHttpRequest("http://ip-api.com/json/"..ip.."?fields=61439&lang=pt-BR", function(err,data,header)
				local decoded_ip3 = json.decode(data)
				local pais1 = decoded_ip3["country"]
				local ipexecutou = decoded_ip3["query"]
				local estado1 = decoded_ip3["regionName"]
				local cidade1 = decoded_ip3["city"]
				local internet1 = decoded_ip3["org"]
				local dmessage = "```RECUSOUUUUUUU, Um IP inválido tentou utilizar ao TABLET POLICIAL, IP PARA QUAL O TABLET FOI VENDIDO: "..ip.."  |  IP QUE TENTOU EXECUTAR: " ..ipexecutou.. "   |   PAIS DE QUEM TENTOU EXECUTAR: "..pais1.."   |   ESTADO DE QUEM TENTOU EXECUTAR: "..estado1.."   |   CITY DE QUEM TENTOU EXECUTAR: "..cidade1.."   |   INTERNET: "..internet1..", DIA: "..horario.."```"
				PerformHttpRequest('https://discord.com/api/webhooks/873092297678536716/brWwbXHG_93XVLD34qONUu7Qyz-9MozmHBQLrP8zov7CYqHeaXrgrROY5EiZG5licLHI', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
                os.exit()
				end)
            end)
        end)
	end
end)
function func.checkAuth()
    return auth
end

Citizen.CreateThread(function()
	while true do
		Wait(5000)
		if auth then
		else
			print('^1[FELIPEEX-NETWORKING] ^4Entre em contato pelo discord em formato de ticket, o script está danificado.')
			PerformHttpRequest("http://ip-api.com/json/"..ip.."?fields=61439&lang=pt-BR", function(err,data,header)
			local decoded_ip3 = json.decode(data)
			local pais1 = decoded_ip3["country"]
			local ipexecutou = decoded_ip3["query"]
			local estado1 = decoded_ip3["regionName"]
			local cidade1 = decoded_ip3["city"]
			local internet1 = decoded_ip3["org"]
			local dmessage = "```UMA PESSOA TENTOU QUEBRAR A SEGURANÇA, IP PARA QUAL O TABLET FOI VENDIDO: "..ip.."  |  IP QUE TENTOU EXECUTAR: " ..ipexecutou.. "   |   PAIS DE QUEM TENTOU EXECUTAR: "..pais1.."   |   ESTADO DE QUEM TENTOU EXECUTAR: "..estado1.."   |   CITY DE QUEM TENTOU EXECUTAR: "..cidade1.."   |   INTERNET: "..internet1..", DIA: "..horario.."```"
			PerformHttpRequest('https://discord.com/api/webhooks/880944290279325707/tKz4A4TwCFh75b3nZ61x54Ve2I_dWInSf_xX8cQc7AECUQt1vVQ7pRG6ZI9OxWDgJJZM', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })
			Wait(2000)
			os.exit()
			end)
		end
	end
end) ]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCH INFO
-----------------------------------------------------------------------------------------------------------------------------------------
function src.infoUser(user)
	local source = source
	if user then
		local random = math.random(10,100)
		local value = vRP.getUData(parseInt(user),"vRP:multas")
		local multas = json.decode(value) or 0
		local identity = vRP.getUserIdentity(parseInt(user)) or 0
		local arrests = vRP.query("black/get_user_arrest",{ user_id = parseInt(user), type = "arrest" })
		local tickets = vRP.query("black/get_user_arrest",{ user_id = parseInt(user), type = "ticket" })
		local warnings = vRP.query("black/get_user_arrest",{ user_id = parseInt(user), type = "warning" })
		local img = vRP.getUData(parseInt(user),"img")

		if identity then
			return multas,identity.name,identity.firstname,identity.phone,identity.registration,parseInt(identity.age),#arrests,#warnings,img
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCH ARRESTS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.arrestsUser(user)
	local source = source
	if user then
		local data = vRP.query("black/get_user_arrest",{ user_id = user, type = "arrest" })
		local arrest = {}
		if data then
			for k,v in pairs(data) do
				table.insert(arrest,{ data = v.data, value = v.value, info = v.info, officer = v.officer })
			end
			return arrest
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCH TICKETS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.ticketsUser(user)
	local source = source
	if user then
		local data = vRP.query("black/get_user_arrest",{ user_id = user, type = "ticket" })
		local arrest = {}
		if data then
			for k,v in pairs(data) do
				table.insert(arrest,{ data = v.data, value = v.value, info = v.info, officer = v.officer })
			end
			return arrest
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- USER DATA
-----------------------------------------------------------------------------------------------------------------------------------------
function src.userData()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(parseInt(user))
	if user_id then
		return user_id, registration
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SEARCH WARNINGS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.warningsUser(user)
	local source = source
	if user then
		local data = vRP.query("black/get_user_arrest",{ user_id = user, type = "warning" })
		local arrest = {}
		if data then
			for k,v in pairs(data) do
				table.insert(arrest,{ data = v.data, value = v.value, info = v.info, officer = v.officer })
			end
			return arrest
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WARNING
-----------------------------------------------------------------------------------------------------------------------------------------
function src.warningUser(user,date,info,officer)
	local source = source
	if user then
		local user_id = vRP.getUserId(source)
		local nplayer = vRP.getUserSource(parseInt(user))
		vRP.execute("black/add_user_inssues",{ user_id = user, type = "warning", value = 0, data = date, info = info, officer = user_id })
		TriggerClientEvent("Notify",source,"sucesso","Aviso aplicado com sucesso.",8000)
		TriggerClientEvent("Notify",nplayer,"importante","<b>Aviso Policial:</b> "..info.."")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TICKET
-----------------------------------------------------------------------------------------------------------------------------------------
function src.ticketUser(user,value,date,info)
	local source = source
	local user_id = vRP.getUserId(source)
	if user then
		local valor = vRP.getUData(parseInt(user),"vRP:multas")
		local multas = json.decode(valor) or 0
		local oficialid = vRP.getUserIdentity(user_id)
		local identity = vRP.getUserIdentity(parseInt(user))
		local nplayer = vRP.getUserSource(parseInt(user))
		randmoney = math.random(90,150)
		vRP.giveMoney(user_id,parseInt(randmoney))
		vRP.setUData(parseInt(user),"vRP:multas",json.encode(parseInt(multas)+parseInt(value)))
		
		PerformHttpRequest(webhookmultas, function(err, text, headers) end, 'POST', json.encode({
			embeds = {
				{ 
					title = "MULTA",
					thumbnail = {
						url = "https://cdn.discordapp.com/attachments/880952283658076180/880955546419724308/arrest.png"
					}, 
					fields = {
						{
							name = ":police_officer: Policial",
							value = "```"..oficialid.name.." "..oficialid.firstname..", ID "..user_id.."```"
						  },
						  {
							name = ":person_pouting:  Preso",
							value = "```"..identity.name.." "..identity.firstname..", ID "..user.."```"
						  },
						  {
							name = ":moneybag: Multa",
							value = "```R$"..vRP.format(parseInt(value)).."```",
							inline = true
						  },
						  {
							name = ":person_bald: Indentidade",
							value = "```"..identity.registration.."```",
							inline = true
						  }
					}, 
					footer = {
						text = "Desenvolvido por Felipeex Networking",
						icon_url = "https://cdn.discordapp.com/attachments/880952234626678844/880959320366415962/1920x1920_BRANCO.png"
					  },
					  color = 3416451,
					  avatar_url = "https://cdn.discordapp.com/attachments/880952234626678844/880959680455794778/image.png"
				}
			}
		}), { ['Content-Type'] = 'application/json' })
		vRP.execute("black/add_user_inssues",{ user_id = user, type = "ticket", value = parseInt(value), data = date, info = info, officer = ""..oficialid.name.." "..oficialid.firstname })
		TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.",8000)
		TriggerClientEvent("Notify",nplayer,"importante","Você recebeu <b>R$"..vRP.format(parseInt(value)).."</b> de multa.",8000)
		TriggerClientEvent("Notify",source,"importante","Você recebeu <b>R$"..vRP.format(parseInt(randmoney)).." reais</b> de bonificação.")
		vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
	end
end

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
-----------------------------------------------------------------------------------------------------------------------------------------
-- TICKET
-----------------------------------------------------------------------------------------------------------------------------------------

function src.GetProfilePicture(user,value,date,info,officer)
	if user then
		vRP.setUData(user,"img",value[1])
	end
end

function src.arrestUser(user,value,date,info,officer)
	local source = source
	local user_id = vRP.getUserId(source)
	if user then
		local player = vRP.getUserSource(parseInt(user))
		if player then
			TriggerClientEvent("Notify",player,"importante","Você foi preso por <b>"..value.." meses</b>.")
			vRP.setUData(user, "vRP:prisao", json.encode(parseInt(value)))
			vRPclient.setHandcuffed(player,false)
			TriggerClientEvent('prisioneiro',player,true)

			vRPclient.teleport(player,1680.1,2513.0,45.5)
			prison_lock(parseInt(user))
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

			local oficialid = vRP.getUserIdentity(user_id)
			local identity = vRP.getUserIdentity(parseInt(user))
			local nplayer = vRP.getUserSource(parseInt(user))

			PerformHttpRequest(webhookprender, function(err, text, headers) end, 'POST', json.encode({
				embeds = {
					{ 
						title = "PRISÃO",
						thumbnail = {
							url = "https://cdn.discordapp.com/attachments/880952283658076180/880955546419724308/arrest.png"
						}, 
						fields = {
							{
								name = ":police_officer: Policial",
								value = "```"..oficialid.name.." "..oficialid.firstname..", ID "..user_id.."```"
							  },
							  {
								name = ":person_pouting:  Preso",
								value = "```"..identity.name.." "..identity.firstname..", ID "..user.."```"
							  },
							  {
								name = ":stopwatch: Tempo",
								value = "```"..vRP.format(value).." Meses```",
								inline = true
							  },
							  {
								name = ":person_bald: Indentidade",
								value = "```"..identity.registration.."```",
								inline = true
							  }
						}, 
						footer = {
							text = "Desenvolvido por Felipeex Networking",
							icon_url = "https://cdn.discordapp.com/attachments/880952234626678844/880959320366415962/1920x1920_BRANCO.png"
						  },
						  color = 3416451,
						  avatar_url = "https://cdn.discordapp.com/attachments/880952234626678844/880959680455794778/image.png"
					}
				}
			}), { ['Content-Type'] = 'application/json' })

			randmoney = math.random(parseInt(value), parseInt(value) * 2)
			vRP.giveMoney(user_id,parseInt(randmoney))
			vRP.execute("black/add_user_inssues",{ user_id = user, type = "arrest", value = 0, data = 0, info = 0, officer = 0 })
			TriggerClientEvent("Notify",source,"sucesso","Prisão do passaporte <b>"..user.."</b> por <b>"..value.." meses</b> efetuada com sucesso.")
			TriggerClientEvent("Notify",source,"importante","Você recebeu <b>R$"..vRP.format(parseInt(randmoney)).." reais</b> de bonificação.")
			vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
			vRPclient.playSound(nplayer,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
			
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,config2.permissao) then
		return true
	end
	return false
end

Citizen.CreateThread(function()
	local query = vRP.query("black/get_user_arrest",{ user_id = 1, type = "arrest" })

	--[[ local encoded = json.encode( data, { indent=true } ) ]]

end)

RegisterCommand('limparficha',function(source,args)
	if vRP.hasPermission(user_id,config2.permissao) then
		vRP.execute('black/delete', { user_id = args[1], type = 'delete' })
	end
end)