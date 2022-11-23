RegisterNetEvent('route68_blackjack:start')
AddEventHandler('route68_blackjack:start', function()
	TriggerServerEvent('route68_blackjack:check_money')
end)

RegisterNetEvent("route68_blackjack:check_money")
AddEventHandler("route68_blackjack:check_money", function(quantity)
	if quantity >= 100 then
		SendNUIMessage({
			type = "enableui",
			enable = true,
			coins = quantity
		})
		SetNuiFocus(true, true)
	else
		notify('Você precisa de ao menos 100 fichas para jogar!!')
	end
end)

RegisterNUICallback('escape', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	SendNUIMessage({
		type = "enableui",
		enable = false
	})
end)

RegisterNUICallback('card', function(data, cb)
	cb('ok')
	TriggerServerEvent('InteractSound_SV:PlayOnSource', 'PlayCard', 1.0)
end)

RegisterNUICallback('bet', function(data, cb)
	cb('ok')
	TriggerServerEvent('InteractSound_SV:PlayOnSource', 'betup', 1.0)
end)

RegisterNUICallback('escape2', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	SendNUIMessage({
		type = "enableui",
		enable = false
	})
	notify('Você não tem mais fichas!')
end)

RegisterNUICallback('WinBet', function(data, cb)
	cb('ok')
	local count = data.bets
	TriggerServerEvent('route68_blackjack:givemoney', count, 2)
end)

RegisterNUICallback('TieBet', function(data, cb)
	cb('ok')
	local count = data.bets
	TriggerServerEvent('route68_blackjack:givemoney', count, 1)
end)

RegisterNUICallback('LostBet', function(data, cb)
	cb('ok')
	local count = data.bets
	notify("Você perdeu "..count.." fichas!")
end)

RegisterNUICallback('Status', function(data, cb)
	cb('ok')
	notify(data.tekst)
end)

RegisterNUICallback('StartPartia', function(data, cb)
	cb('ok')
	local count = data.bets
	TriggerServerEvent('route68_blackjack:removemoney', count)
end)

function notify(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end