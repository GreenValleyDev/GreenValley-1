
Citizen.CreateThread(function()
	local timer = 2000
	while true do
		
		local Gracz = GetPlayerPed(-1)
		local PozycjaGracza = GetEntityCoords(Gracz)
		local Dystans = GetDistanceBetweenCoords(PozycjaGracza, Config.Chashier[1], Config.Chashier[2], Config.Chashier[3], true)
		-- local Dystans2 = GetDistanceBetweenCoords(PozycjaGracza, 1115.34, 209.07, -49.45, true)
		-- local Dystans3 = GetDistanceBetweenCoords(PozycjaGracza, 1108.34, 208.39, -49.45, true)
		if Dystans <= 10.0 then
			timer = 5
			local PozycjaTekstu = {
				["x"] = Config.Chashier[1],
				["y"] = Config.Chashier[2],
				["z"] = Config.Chashier[3]
			}
			if Dystans <= 1.5 then
				DrawText3D(PozycjaTekstu, "Pressione [~b~E~s~] para ~g~comprar ~w~5 fichas\nPressione [~b~F~s~] para ~r~vender ~w~5 fichas", 0.55)
				if IsControlJustReleased(0, 38) then
					ComprarChips()
				end
				if IsControlJustReleased(0, 23) then
					VenderChips()
				end
			else
				DrawText3D(PozycjaTekstu, "~y~CAIXA", 2.00)
			end
			
		end
		-- if Dystans2 <= 6.0 then
			-- local PozycjaTekstu2 = {
				-- ["x"] = 1115.34,
				-- ["y"] = 209.07,
				-- ["z"] = -49.45
			-- }
			-- DrawText3D(PozycjaTekstu2, "PRESS [~g~E~s~] TO OPEN BAR", 0.55)
			-- if IsControlJustReleased(0, 38) and Dystans2 <= 1.5 then
				-- OtworzMenuKasynaSklepu()
			-- end
		-- end
		-- if Dystans3 <= 6.0 then
			-- local PozycjaTekstu3 = {
				-- ["x"] = 1108.34,
				-- ["y"] = 208.39,
				-- ["z"] = -49.45
			-- }
			-- DrawText3D(PozycjaTekstu3, "PRESS [~g~E~s~] TO OPEN BAR", 0.55)
			-- if IsControlJustReleased(0, 38) and Dystans3 <= 1.5 then
				-- OtworzMenuKasynaSklepu()
			-- end
		-- end
		Citizen.Wait(timer)
	end
end)

function ComprarChips()
	TriggerServerEvent('route68_kasyno:KupZetony', 5)
end
function VenderChips()
	TriggerServerEvent('route68_kasyno:WymienZetony', 5)
end

local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNUICallback('wygrana', function(data)
	notify('Você ganhou '..data.win..' fichas!')
end)

RegisterNUICallback('updateBets', function(data)
	TriggerServerEvent('esx_slots:updateCoins555555555555555', data.bets)
end)

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

RegisterNetEvent("esx_slots:UpdateSlots555555555555555")
AddEventHandler("esx_slots:UpdateSlots555555555555555", function(lei)
	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	open = false
	TriggerServerEvent("esx_slots:PayOutRewards555555555555555", math.floor(data.coinAmount))
end)

Citizen.CreateThread(function ()
	local timer = 2000
	while true do
		if open then
			timer = 5
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end
		Citizen.Wait(timer)
	end
end)

Citizen.CreateThread(function()
	local timer = 2000
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Sloty do
			local dis = GetDistanceBetweenCoords(coords, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z, true)
			if dis <= 2.0 then
				timer = 5
				ShowHelpNotification('Pressione ~INPUT_PICKUP~ para jogar Caça-níquel.')
				-- DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 4.0, 70, 163, 76, 50, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerServerEvent('esx_slots:BetsAndMoney555555555555555')
				end
			-- elseif dis <= 20.0 then
				-- DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 4.0, 158, 52, 235, 50, false, true, 2, nil, nil, false)
			end
		end
		for i=1, #Config.Ruletka do
			local dis = GetDistanceBetweenCoords(coords, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z, true)
			if dis <= 2.0 then
				timer = 5
				ShowHelpNotification('Pressione ~INPUT_PICKUP~ para jogar Roleta.')
				-- DrawMarker(1, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 70, 163, 76, 50, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerEvent('route68_ruletka:start')
				end
			-- elseif dis <= 20.0 then
				-- DrawMarker(1, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 158, 52, 235, 50, false, true, 2, nil, nil, false)
			end
		end
		for i=1, #Config.Blackjack do
			local dis = GetDistanceBetweenCoords(coords, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z, true)
			if dis <= 2.0 then
				timer = 5
				ShowHelpNotification('Pressione ~INPUT_PICKUP~ para jogar blackjack.')
				-- DrawMarker(1, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 70, 163, 76, 50, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerEvent('route68_blackjack:start')
				end
			-- elseif dis <= 20.0 then
				-- DrawMarker(1, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 158, 52, 235, 50, false, true, 2, nil, nil, false)
			end
		end
		Citizen.Wait(timer)
	end
end)

local coordonate = {
    {951.86, 24.45, 77.0, nil, 17.51, nil, 1535236204},
    {948.78, 37.54, 77.0, nil, 193.49, nil, -1371020112},
    {962.95, 52.67, 75.0, nil, 148.9, nil, -1371020112},
	
    {927.67205810547,50.554290771484,81.106430053711, nil, 135.0, nil, -245247470},
	{922.60205078125,42.488948822021,81.1064453125, nil, 321.0, nil, 691061163},

	{984.16, 34.67, 76.0, nil, 65.28, nil, -886023758},
	
	{984.43, 67.58, 76.0, nil, 150.42, nil, -886023758},
	{958.36, 25.74, 81.27, nil, 54.96, nil, 469792763},
	
	{963.45, 38.66, 75.75, nil, 339.44, nil, 999748158},
	{951.63, 45.7, 75.75, nil, 337.43, nil, -254493138},
}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(v[7])
      while not HasModelLoaded(v[7]) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end

end)

local heading = 254.5
local vehicle = nil

Citizen.CreateThread(function()
	local timer = 2000
	while true do
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 953.67, 69.86, 75.7, true) < 40 then
			timer = 5
			if DoesEntityExist(vehicle) == false then
				RequestModel(GetHashKey('vantage'))
				while not HasModelLoaded(GetHashKey('vantage')) do
					Wait(1)
				end
				vehicle = CreateVehicle(GetHashKey('vantage'), 953.67, 69.86, 75.7, heading, false, false)
				FreezeEntityPosition(vehicle, true)
				SetEntityInvincible(vehicle, true)
				SetEntityCoords(vehicle, 953.67, 69.86, 75.7, false, false, false, true)
				-- local props = ESX.Game.GetVehicleProperties(vehicle)
				-- props['wheelColor'] = 147
				-- props['plate'] = "DIAMONDS"
				-- ESX.Game.SetVehicleProperties(vehicle, props)
			else
				SetEntityHeading(vehicle, heading)
				heading = heading+0.1
			end
		end
		Citizen.Wait(timer)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if vehicle ~= nil and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 953.67, 69.86, 75.7, true) < 40 then
			SetEntityCoords(vehicle, 953.67, 69.86, 75.7, false, false, false, true)
		end
	end
end)

function notify(msg)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(msg)
  DrawNotification(true, false)
end

function ShowHelpNotification(msg)
	if not IsHelpMessageOnScreen() then
		BeginTextCommandDisplayHelp('STRING')
		AddTextComponentSubstringWebsite(msg)
		EndTextCommandDisplayHelp(0, false, true, -1)
	end
end

function DrawText3D(coords, text, size)
	local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
	local camCoords      = GetGameplayCamCoords()
	local dist           = GetDistanceBetweenCoords(camCoords, coords.x, coords.y, coords.z, true)
	local size           = size

	if size == nil then
		size = 1
	end

	local scale = (size / dist) * 2
	local fov   = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov

	if onScreen then
		SetTextScale(0.0 * scale, 0.55 * scale)
		SetTextFont(0)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(2, 0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry('STRING')
		SetTextCentre(1)

		AddTextComponentString(text)
		DrawText(x, y)
	end
end