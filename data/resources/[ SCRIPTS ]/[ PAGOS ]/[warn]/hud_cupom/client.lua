----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONEXAO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
src = {}
Tunnel.bindInterface("vrp_hud",src)
vSERVER = Tunnel.getInterface("vrp_hud")

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
---------------------------------------------------------------------------------------------------------------------------------------------------------
local hour = 0 
local minute = 0
local talking = false
local voice = 2
local channel = "Desligado"

local sBuffer = {}
local vBuffer = {}
local cinto_seguranca = false
local ExNoCarro = false
local lamp = false
local crime = false
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- MAIN THREAD
---------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do

        local city = GetLabelText(GetNameOfZone(x,y,z))
        local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(x, y, z))
        local rua = streetName..', '..city

        CalculateTimeToDisplay()
        local inCar = IsPedInAnyVehicle(ped, false)
		if inCar then 
            time = 100

            local vehicle = GetVehiclePedIsIn(ped, false)
            local speed = math.ceil(GetEntitySpeed(vehicle) * 3.605936)
            local fuel = GetVehicleFuelLevel(vehicle)
			local _,lights,highlights = GetVehicleLightsState(vehicle)
            local motor = GetVehicleEngineHealth(vehicle)/10
			local marcha = GetVehicleCurrentGear(vehicle)
			if marcha == 0 and speed > 0 then marcha = "R" end

            SendNUIMessage({ vehicle = true, crime = crime, cinto = cinto_seguranca, speed = speed, motor = parseInt(motor), march = marcha, lamp = lights > 0, fuel = parseInt(fuel), health = vida, armour = armour,  talking = talking, voice = voice, channel = channel, localizacao = rua })

		else
            SendNUIMessage({ vehicle = false, crime = crime, health = vida, armour = armour, talking = talking, voice = voice, channel = channel, localizacao = rua })	

		end

        Citizen.Wait(time)
    end
end)

RegisterCommand('lamp', function()
	if lamp then
		lamp = false
	else
		lamp = true
	end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
---------------------------------------------------------------------------------------------------------------------------------------------------------
function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()
	if hour <= 9 then
		hour = '0' .. hour
	end
	if minute <= 9 then
		minute = '0' .. minute
	end

	if parseInt(hour) >= 00 and parseInt(hour) <= 05 then
		if not crime then
			crime = true
			TriggerEvent('chatMessage',"[00:00]",{255,0,0}," Inicio de Assaltos... cuidado.")
		end
	else
		if crime then
			crime = false
			TriggerEvent('chatMessage',"[06:00]",{255,0,0}," Fim de assaltos... Ruas pacificadas!")
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA CLIMATICO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

