local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

fivewareItens = {}
Tunnel.bindInterface(GetCurrentResourceName().."-itens_config",fivewareItens)

vSERVER = Tunnel.getInterface(GetCurrentResourceName().."-itens_config")

function fivewareItens.closeInventory()
	SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
	SetCursorLocation(0.5,0.5)
	SendNUIMessage({ action = "hideMenu" })
end

local energetico = false
RegisterNetEvent('setEnergetic')
AddEventHandler('setEnergetic',function(status)
	energetico = status
	if energetico then
		SetRunSprintMultiplierForPlayer(PlayerId(),1.15)
	else
		SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local fwTS = 500
		if energetico then
			fwTS = 1
			RestorePlayerStamina(PlayerId(),1.0)
		end
		Wait(fwTS)
	end
end)

local cafe = false
RegisterNetEvent('setEnergetic')
AddEventHandler('setEnergetic',function(status)
	cafe = status
	if cafe then
		SetRunSprintMultiplierForPlayer(PlayerId(),1.15)
	else
		SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local fwTS = 500
		if cafe then
			fwTS = 1
			RestorePlayerStamina(PlayerId(),1.0)
		end
		Wait(fwTS)
	end
end)


local drugseffect = 0
RegisterNetEvent("setEffectDrugs")
AddEventHandler("setEffectDrugs",function()
	drugseffect = drugseffect + 60
	if not GetScreenEffectIsActive("DMT_flight") then
		StartScreenEffect("DMT_flight",0,true)
	end
end)

Citizen.CreateThread(function()
	while true do
		if drugseffect > 0 then
			drugseffect = drugseffect - 1
			if drugseffect <= 0 or GetEntityHealth(PlayerPedId()) <= 101 then
				drugseffect = 0
				if GetScreenEffectIsActive("DMT_flight") then
					StopScreenEffect("DMT_flight")
				end
			end
		end
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent("inventory:repairVehicle")
AddEventHandler("inventory:repairVehicle",function(index,status)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			local fuel = GetVehicleFuelLevel(v)
			if status then
				SetVehicleFixed(v)
				SetVehicleDeformationFixed(v)
			end
			SetVehicleBodyHealth(v,1000.0)
			SetVehicleEngineHealth(v,1000.0)
			SetVehiclePetrolTankHealth(v,1000.0)
			SetVehicleFuelLevel(v,fuel)
		end
	end
end)

RegisterNetEvent("inventory:repairEngineVehicle")
AddEventHandler("inventory:repairEngineVehicle",function(index,status)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			SetVehicleEngineHealth(v,1000.0)
		end
	end
end)

RegisterNetEvent("inventory:repairTires")
AddEventHandler("inventory:repairTires",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			for i = 0,8 do
				SetVehicleTyreFixed(v,i)
			end
		end
	end
end)

RegisterNetEvent("inventory:lockpickVehicle")
AddEventHandler("inventory:lockpickVehicle",function(vehid)
	if NetworkDoesNetworkIdExist(vehid) then
		local v = NetToVeh(vehid)
		if DoesEntityExist(v) and IsEntityAVehicle(v) then
			SetVehicleDoorsLocked(v,1)
			SetVehicleLights(v,2)
			Wait(200)
			SetVehicleLights(v,0)
			Wait(200)
			SetVehicleLights(v,2)
			Wait(200)
			SetVehicleLights(v,0)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		DisableControlAction(1, 157, false) -- 1
		DisableControlAction(1, 158, false) -- 2
		DisableControlAction(1, 160, false) -- 3
		DisableControlAction(1, 164, false) -- 4
		DisableControlAction(1, 165, false) -- 5
		DisableControlAction(1, 159, false) -- 6
		DisableControlAction(1, 161, false) -- 7
		DisableControlAction(1, 162, false) -- 8
		DisableControlAction(1, 163, false) -- 9
		Wait(5)
	end
end)