local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

misc = {}
Tunnel.bindInterface("vrp_misc",misc)

local cooldown = {}

function misc.discord()
	local quantidade = 0
	local users = vRP.getUsers()

	for k,v in pairs(users) do
		quantidade = quantidade + 1
	end

	return parseInt(quantidade)
end

function misc.permissaoDpla()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"policia.permissao")
end

function misc.permissaoDmla()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"ems.permissao")
end

function misc.permissaoTaxista()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"taxista.permissao")
end

function misc.permissaoMecanico()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"mecanico.permissao")
end

function misc.permissaoBennys()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"bennys.permissao")
end

function misc.permissaoBallas()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"ballas.permissao")
end

function misc.permissaoGrove()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"grove.permissao")
end

function misc.permissaoFamilies()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"families.permissao")
end

function misc.permissaoMedellin()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"medellin.permissao")
end

function misc.permissaoMotoclub()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"motoclub.permissao")
end

function misc.permissaoBratva()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"bratva.permissao")
end

function misc.permissaoNdrangheta()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"ndrangheta.permissao")
end

function misc.permissaoNynax()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"nynax.permissao")
end

function misc.permissaoSemantic()
	local source = source
	local user_id = vRP.getUserId(source)
	
	return vRP.hasPermission(user_id,"semantic.permissao")
end

-- RegisterCommand('radio',function(source,args,rawCommand)
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
	
-- 	if vRP.getInventoryItemAmount(user_id,"radio") >= 1 then
-- 		if args[1] == "f" then
-- 			TriggerClientEvent("vrp_misc:onRadio",source,args[2])
-- 		else
-- 			TriggerClientEvent("vrp_misc:onGroupRadio",source)
-- 		end
-- 	else
-- 		TriggerClientEvent("Notify",source,"aviso","Você <b>não possui</b> um <b>rádio</b> na mochila.") 
-- 	end
-- end)

--Função: Ao cair no limbo, deletar o carro e teletransportar para a garagem mais próxima
--Bom para aqueles que vivem caindo no limbo

--Codigo:
local garagens = {
    { 213.90,-809.08,31.01},
    { 596.69,91.42,93.12},
    { 275.41,-345.24,45.17},
    { 56.08,-876.53,30.65},
    { -348.95,-874.39,31.31},
    { -340.64,266.31,85.67},
    { -773.59,5597.57,33.60},
    { 317.17,2622.99,44.45},
    { 459.6,-986.55,25.7},
    { -1184.93,-1509.98,4.64},
    { -73.32,-2004.20,18.27}
}

Citizen.CreateThread(function()
    while true do
        local ped = vRP.PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))

        if z < -110 then
            if IsPedInAnyVehicle(ped) then
                -- vSERVER.deleteVeh(GetVehiclePedIsIn(ped))
                -- COLOCAR SUA FUNÇÃO DE DELETAR O VEICULO E PASSAR O VALOR: GetVehiclePedIsIn(ped)
                teleportPlayerProxmityCoords(x,y,z)
                TriggerEvent('Notify', 'negado', 'Você caiu no limbo com seu veiculo e foi teleportado para a garagem mais proxima.', 5)
            end
        end

        Citizen.Wait(1000)
    end
end)

function teleportPlayerProxmityCoords(x,y,z)
    local array = {}
    local coordenadas = {}

    for k,v in pairs(garagens) do
        local distanceAtual = parseInt(Vdist2(v[1],v[2],v[3], td(x),td(y),td(z)))
        table.insert(array, distanceAtual)
        coordenadas[distanceAtual] = { x = v[1], y = v[2], z = v[3] }
    end

    if coordenadas[math.min(table.unpack(array))] then
        SetEntityCoords(PlayerPedId(),coordenadas[math.min(table.unpack(array))].x,coordenadas[math.min(table.unpack(array))].y,coordenadas[math.min(table.unpack(array))].z)
    end

end

function td(n)
    n = math.ceil(n * 100) / 100
    return n
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k,v in pairs(cooldown) do
			if v > 0 then
				cooldown[k] = v - 1
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SETPRESET -- SETAR A ROUPA EM UM PLAYER.
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('setpreset',function(source,args,rawCommand) 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then
        if args[1] then
            local nuser_id = parseInt(args[1])
            local nsource = vRP.getUserSource(nuser_id)
            local custom = vRPclient.getCustomization(source)
            -- vRP.removeCloak(nsource)
            if custom then
                local old_custom = vRPclient.getCustomization(nsource)
                local idle_copy = {}

                idle_copy = vRP.save_idle_custom(nsource,old_custom)
                idle_copy.modelhash = nil
                for l,w in pairs(custom) do
                    idle_copy[l] = w
                end
                vRPclient._setCustomization(nsource,idle_copy)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COPYPRESET -- COPIAR ROUPA DO PLAYER
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('copypreset',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then
        if args[1] then
            local nuser_id = parseInt(args[1])
            local nsource = vRP.getUserSource(nuser_id)
            local custom = vRPclient.getCustomization(nsource)
            vRP.removeCloak(source)
            if custom then
                local old_custom = vRPclient.getCustomization(source)
                local idle_copy = {}

                idle_copy = vRP.save_idle_custom(source,old_custom)
                idle_copy.modelhash = nil
                for l,w in pairs(custom) do
                    idle_copy[l] = w
                end
                vRPclient._setCustomization(source,idle_copy)
            end
        end
    end
end)
 
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMPRESET -- REMOVER A ROUPA DO PLAYER, ELE VOLTA PRA ROUPA PADRÃO
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('rempreset',function(source,args,rawCommand) 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then
        if args[1] then
            local nuser_id = parseInt(args[1])
            local nsource = vRP.getUserSource(nuser_id)
            vRP.removeCloak(nsource)
            TriggerClientEvent('Notify', source, 'sucesso', 'SUCESSO', 'Preset zerado do ID ' .. nuser_id)
        end
    end
end)

function misc.damageItem()
	local source = source
	local user_id = vRP.getUserId(source)

	for k,v in pairs(config.itemList) do
		local item = v.item
		local damageItem = v.damageItem
		local percentage = 0

		if vRP.getInventoryItemAmount(user_id,item) > 0 then
			local itemAmmount = parseInt(vRP.getInventoryItemAmount(user_id,item))
			local itemName = vRP.itemNameList(item)

			if damageItem == nil then
				if cooldown[user_id] == 0 or not cooldown[user_id] then
					cooldown[user_id] = 5
					percentage = math.random(100)
					if percentage >= 60 then
						if vRP.tryGetInventoryItem(user_id,item,itemAmmount) then
							if percentage >= 70 then
								TriggerClientEvent("Notify",source,"negado","<b>Sua mochila está aberta!</b> Você perdeu <b>"..itemName.."</b>.",3000)
							else
								TriggerClientEvent("Notify",source,"negado","<b>Sua mochila está rasgada!</b> Você perdeu <b>"..itemName.."</b>.",3000)
							end
							percentage = 0
							return true
						end
					end
				else
					return false
				end
			else
				if vRP.tryGetInventoryItem(user_id,item,itemAmmount) then
					vRP.giveInventoryItem(user_id,damageItem,itemAmmount)
					TriggerClientEvent("Notify",source,"negado","Seu <b>"..itemName.." queimou</b> quando você entrou na água.",3000)
					return true
				end
			end
		end
	end
end