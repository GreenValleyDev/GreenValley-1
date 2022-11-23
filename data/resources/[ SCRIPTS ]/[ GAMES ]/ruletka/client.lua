local blipX = 930.05
local blipY = 47.66
local blipZ = 81.1
-------930.05, 47.66, 81.1
local pic = 'CHAR_SOCIAL_CLUB'
local game_during = false
local elements = {}

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('route68_ruletka:start')
AddEventHandler('route68_ruletka:start', function()
	TriggerServerEvent('esx_roulette:check_money555555555555555', function(quantity)
		
	end, '')
end)

RegisterNetEvent('esx_roulette:check_money555555555555555')
AddEventHandler('esx_roulette:check_money555555555555555', function(quantity)
	if quantity >= 10 then
		SendNUIMessage({
			type = "show_table",
			zetony = quantity
		})
		SetNuiFocus(true, true)
	else
		notify('Você precisa de ao menos 10 fichas para jogar!!')
		SendNUIMessage({
			type = "reset_bet"
		})
	end
end)

RegisterNUICallback('exit', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
end)

RegisterNUICallback('betup', function(data, cb)
	cb('ok')
	TriggerServerEvent('InteractSound_SV:PlayOnSource', 'betup', 1.0)
end)

RegisterNUICallback('roll', function(data, cb)
	cb('ok')
	TriggerEvent('esx_roulette:start_game555555555555555', data.kolor, data.kwota)
end)

RegisterNetEvent('esx_roulette:start_game555555555555555')
AddEventHandler('esx_roulette:start_game555555555555555', function(action, amount)
	local amount = amount
	if game_during == false then
		TriggerServerEvent('esx_roulette:removemoney555555555555555', amount)
		local kolorBetu = action
		
		if kolorBetu == 'red' then
			notify("Você apostou "..amount.." fichas no ~r~vermelho~w~...")
		elseif kolorBetu == 'black' then
			notify("Você apostou "..amount.." fichas no ~b~preto~w~...")
		elseif kolorBetu == 'green' then
			notify("Você apostou "..amount.." fichas no ~g~verde~w~...")
		end
		game_during = true
		local randomNumber = math.floor(math.random() * 36)
		--local randomNumber = 0
		SendNUIMessage({
			type = "show_roulette",
			hwButton = randomNumber
		})
		TriggerServerEvent('InteractSound_SV:PlayOnSource', 'ruletka', 1.0)
		Citizen.Wait(10000)
		local red = {32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3};
		local black = {15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26};
		local function has_value (tab, val)
			for index, value in ipairs(tab) do
				if value == val then
					return true
				end
			end
			return false
		end
		if action == 'black' then
			if has_value(black, randomNumber) then
				local win = amount * 2
				notify('Você ganhou '..win..' fichas!')
				TriggerServerEvent('esx_roulette:givemoney555555555555555', action, amount)
			else
				notify('Não foi dessa vez. Tente novamente!')
			end
		elseif action == 'red' then
			local win = amount * 2
			if has_value(red, randomNumber) then
				notify('Você ganhou '..win..' fichas!')
				TriggerServerEvent('esx_roulette:givemoney555555555555555', action, amount)
			else
				notify('Não foi dessa vez. Tente novamente!')
			end
		elseif action == 'green' then
			local win = amount * 14
			if randomNumber == 0 then
				notify('Você ganhou '..win..' fichas!')
				TriggerServerEvent('esx_roulette:givemoney555555555555555', action, amount)
			else
				notify('Não foi dessa vez. Tente novamente!')
			end
		end
		--TriggerServerEvent('roulette:givemoney', randomNumber)
		SendNUIMessage({type = 'hide_roulette'})
		SetNuiFocus(false, false)
		--notify('Gra end!')
		game_during = false
		TriggerEvent('route68_ruletka:start')
	else
		notify('A roleta está rodando...')
	end
end)

function notify(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end