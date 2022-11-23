-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterServerEvent("esx_slots:BetsAndMoney555555555555555")
AddEventHandler("esx_slots:BetsAndMoney555555555555555", function(bets)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
		local amount = vRP.getInventoryItemAmount(user_id, 'fichas')
		if amount < 10 then
			vRPclient._notify(source,"Você precisa ao menos 10 fichas para jogar!")
		else
			TriggerClientEvent("esx_slots:UpdateSlots555555555555555", source, amount)
		end
		
		--[[
        local xItem = user_id.getInventoryItem('fichas')
        if xItem.count < 10 then
            TriggerClientEvent('esx:showNotification555555555555555', source, "You need at least 10 chips to play!")
        else
            MySQL.Sync.execute("UPDATE users SET fichas=@fichas WHERE identifier=@identifier",{['@identifier'] = user_id.identifier, ['@fichas'] = xItem.count})
            TriggerClientEvent("esx_slots:UpdateSlots555555555555555", source, xItem.count)
            user_id.removeInventoryItem('fichas', xItem.count)
        end]]
    end
end)

RegisterServerEvent("esx_slots:updateCoins555555555555555")
AddEventHandler("esx_slots:updateCoins555555555555555", function(bets)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        -- MySQL.Sync.execute("UPDATE users SET fichas=@fichas WHERE identifier=@identifier",{['@identifier'] = user_id.identifier, ['@fichas'] = bets})
    end
end)

RegisterServerEvent("esx_slots:PayOutRewards555555555555555")
AddEventHandler("esx_slots:PayOutRewards555555555555555", function(amount)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        amount = math.floor(tonumber(amount))
        if amount >= 0 then
			local iamount = vRP.getInventoryItemAmount(user_id, 'fichas')
			vRP.tryGetInventoryItem(user_id,"fichas",iamount, false)
			vRP.giveInventoryItem(user_id, "fichas", amount, false)
        end
        -- MySQL.Sync.execute("UPDATE users SET fichas=0 WHERE identifier=@identifier",{['@identifier'] = user_id.identifier})
    end
end)

RegisterServerEvent("route68_kasyno:WymienZetony")
AddEventHandler("route68_kasyno:WymienZetony", function(count)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
		local amount = vRP.getInventoryItemAmount(user_id, 'fichas')
		if amount < count then
			vRPclient._notify(source,'Você não tem mais fichas!')
		elseif amount >= count then
			local kwota = math.floor(count * 5)
			if vRP.tryGetInventoryItem(user_id,"fichas",count,false) then
				vRP.giveMoney(user_id, kwota)
                TriggerClientEvent("Notify",source,"sucesso",'Você ~g~ganhou ~w~$'..kwota..' por '..count..' fichas.',10000,'success')
			end
		end
		
		--[[
        local xItem = user_id.getInventoryItem('fichas')
        if xItem.count < count then
            TriggerClientEvent('pNotify:SendNotification', source, {text = 'You don`t have that mush chips!'})
        elseif xItem.count >= count then
            local kwota = math.floor(count * 5)
            user_id.removeInventoryItem('fichas', count)
            user_id.addMoney(kwota)
            TriggerClientEvent('pNotify:SendNotification', source, {text = 'You got $'..kwota..' for '..count..' chips.'})
        end]]
    end
end)

RegisterServerEvent("route68_kasyno:KupZetony")
AddEventHandler("route68_kasyno:KupZetony", function(count)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
		local kwota = math.floor(count * 5)
		if vRP.tryFullPayment(user_id, kwota) then
			vRP.giveInventoryItem(user_id, "fichas", count, false)
            TriggerClientEvent("Notify",source,"sucesso",'Você ~g~comprou ~w~'..count..' fichas por $'..kwota..'.',10000,'success')
		else
            TriggerClientEvent("Notify",source,"negado",'Você não tem mais dinheiro!',10000,'error')
		end
		
		--[[
        local cash = user_id.getMoney()
        local kwota = math.floor(count * 5)
        if kwota > cash then
            TriggerClientEvent('pNotify:SendNotification', source, {text = 'You don`t have that much money!'})
        elseif kwota <= cash then
            user_id.addInventoryItem('fichas', count)
            user_id.removeMoney(kwota)
            TriggerClientEvent('pNotify:SendNotification', source, {text = 'You got '..count..' chips for $'..kwota..'.'})
        end]]
    end
end)