-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterServerEvent('esx_roulette:removemoney555555555555555')
AddEventHandler('esx_roulette:removemoney555555555555555', function(amount)
	local amount = amount
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.tryGetInventoryItem(user_id, "fichas" , amount, false) then
		-- ...
	else
		vRPclient._notify(source, "~r~Dinheiro insuficiente.")
	end
end)

RegisterServerEvent('esx_roulette:givemoney555555555555555')
AddEventHandler('esx_roulette:givemoney555555555555555', function(action, amount)
	local action = action
	local amount = amount
	local source = source
	local user_id = vRP.getUserId(source)
	if action == 'black' or action == 'red' then
		local win = amount*2
		vRP.giveInventoryItem(user_id,"fichas",win,false)
	elseif action == 'green' then
		local win = amount*14
		vRP.giveInventoryItem(user_id,"fichas",win,false)
	end
end)

RegisterServerEvent('esx_roulette:check_money555555555555555')
AddEventHandler('esx_roulette:check_money555555555555555', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local quantity = vRP.getInventoryItemAmount(user_id, "fichas")
	
	TriggerClientEvent("esx_roulette:check_money555555555555555",source,quantity)
end)