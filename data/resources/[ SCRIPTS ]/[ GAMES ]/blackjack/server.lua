-- vRP TUNNEL/PROXY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


RegisterServerEvent('route68_blackjack:removemoney')
AddEventHandler('route68_blackjack:removemoney', function(amount)
	local amount = amount
	local source = source
	local user_id = vRP.getUserId(source)
	if vRP.tryGetInventoryItem(user_id, "fichas" , amount, false) then
		vRPclient._notify(source, "Você apostou "..amount.." fichas no BlackJack.")
	else
		vRPclient._notify(source, "~r~Dinheiro insuficiente.")
	end
end)

RegisterServerEvent('route68_blackjack:givemoney')
AddEventHandler('route68_blackjack:givemoney', function(amount, multi)
	local aciton = aciton
	local win = math.floor(amount * multi)
	local source = source
	local user_id = vRP.getUserId(source)
	vRP.giveInventoryItem(user_id,"fichas",win,false)
	if multi == 2 then
		vRPclient._notify(source, "Você ganhou "..win.." fichas! Bom trabalho!")
	elseif multi == 1 then
		vRPclient._notify(source, "Você defendeu "..win.." fichas! Boa sorte!")
	end
end)

RegisterServerEvent('route68_blackjack:check_money')
AddEventHandler('route68_blackjack:check_money', function()
	local source = source
	local user_id = vRP.getUserId(source)
	local quantity = vRP.getInventoryItemAmount(user_id, "fichas")
	
	TriggerClientEvent("route68_blackjack:check_money",source,quantity)
end)