local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
tkzin = {}
Tunnel.bindInterface("animacoes",tkzin)
vCLIENT = Tunnel.getInterface("animacoes")


RegisterCommand("e",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if args[2] == "friend" then
		local otherPlayer = vRPC.nearestPlayer(source,3)
		if otherPlayer then
			if vRP.getHealth(otherPlayer) > 101 and not vCLIENT.getHandcuff(otherPlayer) then
				local identity = vRP.userIdentity(user_id)
				local request = vRP.request(otherPlayer,"Aceitar o pedido de <b>"..identity["name"].." "..identity["name2"].."</b> da animação <b>"..args[1].."</b>?",30)
				if request then
					TriggerClientEvent("emotes",otherPlayer,args[1])
					TriggerClientEvent("emotes",source,args[1])
				end
			end
		end
	else
		TriggerClientEvent("emotes",source,args[1])
	end
end)

-- RegisterCommand('e', function(source,args,rawCommand)
-- 	if not vRPclient.checkAcao(source) then
-- 		TriggerClientEvent("emotes",source,args[1])
-- 	end
-- end)

RegisterCommand('e2', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "manager.permissao") or vRP.hasPermission(user_id, "administrador.permissao") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent("emotes",nplayer,args[1])
		end
	end
end)

RegisterCommand('e3', function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "manager.permissao") or vRP.hasPermission(user_id, "administrador.permissao") then
        if args[2] then
            local nplayer = vRP.getUserSource(parseInt(args[2]))
            if nplayer then
                TriggerClientEvent("emotes",nplayer,args[1])
            end
        end
    end
end, false)


RegisterServerEvent("tryclean")
AddEventHandler("tryclean",function(nveh)
	TriggerClientEvent("syncclean",-1,nveh)
end)

RegisterCommand('dancalouca', function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if nplayer then
		
		if vRP.request(nplayer,"Deseja dançar com <b>"..identity.name.." "..identity.firstname.."</b> ?", 1500) then
			TriggerClientEvent("syncanim",source, 1.3)
			TriggerClientEvent("dancalouca",source)
			TriggerClientEvent("dancalouca",nplayer)
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa negou a dança!",1)
		end
	else
		TriggerClientEvent("Notify",source,"aviso","Nenhum player próximo!",1)
	end
end)

RegisterCommand('yoga', function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if nplayer then
		
		if vRP.request(nplayer,"Deseja praticar yoga com <b>"..identity.name.." "..identity.firstname.."</b> ?", 1500) then
			TriggerClientEvent("syncanim",source, 1.3)
			TriggerClientEvent("yoga",source)
			TriggerClientEvent("yoga",nplayer)
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa negou o yoga!",1)
		end
	else
		TriggerClientEvent("Notify",source,"aviso","Nenhum player próximo!",1)
	end
end)

RegisterCommand('beijar', function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if nplayer then
		
		if vRP.request(nplayer,"Deseja beijar <b>"..identity.name.." "..identity.firstname.."</b> ?", 1500) then
			TriggerClientEvent("syncanim",source, 1.3)
			TriggerClientEvent("beijar",source)
			TriggerClientEvent("beijar",nplayer)
		else
			TriggerClientEvent("Notify",source,"aviso","A pessoa negou o beijo!",1)
		end
	else
		TriggerClientEvent("Notify",source,"aviso","Nenhum player próximo!",1)
	end
end)


RegisterCommand('abracar', function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.request(nplayer,"Deseja abraçar <b>"..identity.name.." "..identity.firstname.."</b> ?",15) then
		TriggerClientEvent("syncanim",source, 0.8)
		TriggerClientEvent("abracar",source)
		TriggerClientEvent("abracar",nplayer)
	else
		TriggerClientEvent("Notify",source,"aviso","A pessoa negou o abraço!",1)
	end
end)

RegisterCommand('abracar2', function(source,args,rawCommand)
	local nplayer = vRPclient.getNearestPlayer(source,2)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.request(nplayer,"Deseja abraçar <b>"..identity.name.." "..identity.firstname.."</b> ?",15) then
		TriggerClientEvent("syncanim",source, 1.0)
		TriggerClientEvent("abracar2",source)
		TriggerClientEvent("abracar2",nplayer)
	else
		TriggerClientEvent("Notify",source,"aviso","A pessoa negou o abraço!",1)
	end
end)


