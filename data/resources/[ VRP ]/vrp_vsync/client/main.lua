local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
yRP = Tunnel.getInterface("vrp_vsync")

local Weather = 'Limpo'
local Blackout = false
local Dynamic = false
local FreezeTime = false
local NUI_status = false
local PauseSync = false
local Hours = 8
local Mins = 0
local Seconds = 0
local SyncHours = nil
local SyncMins = nil

Citizen.CreateThread(function()
    SetNuiFocus(false, false)
    while true do
        Citizen.Wait(1000)
        if NetworkIsSessionStarted() then
            Wait(500)
            TriggerServerEvent('cd_easytime:SyncMe')
            break
        end
    end
end)

RegisterNetEvent('cd_easytime:PauseSync')
AddEventHandler('cd_easytime:PauseSync', function(boolean)
    if boolean then
        PauseSync = true
    else
        PauseSync = false
        TriggerServerEvent('cd_easytime:SyncMe')
    end
end)

RegisterNetEvent('cd_easytime:ForceUpdate')
AddEventHandler('cd_easytime:ForceUpdate', function(data)
    if not PauseSync then
        if data.weather ~= nil then
            CheckSnowSync(data.weather)
            Weather = data.weather
            Blackout = data.blackout
            FreezeTime = data.freeze
            ChangeWeather(Weather, Blackout)
        end
        
        if data.hours ~= nil and not FreezeTime then
            local newhours = GetClockHours()
            NetworkOverrideClockTime(newhours, data.mins, Seconds)
            for i=1, 24 do
                Wait(100)
                newhours = newhours+1
                if newhours == 24 then newhours = 0 end
                if newhours < 24 then
                    Hours = newhours
                    Mins = data.mins
                    NetworkOverrideClockTime(newhours, data.mins, Seconds)
                end
                if newhours == data.hours then break end
            end
        end
    end   
end)

RegisterNetEvent('cd_easytime:SyncAll')
AddEventHandler('cd_easytime:SyncAll', function(data)
    if not PauseSync then
        CheckSnowSync(data.weather)
        Weather = data.weather
        Blackout = data.blackout
        FreezeTime = data.freeze
        ChangeWeather(Weather, Blackout)
        SyncHours = data.hours
        SyncMins = data.mins
    end
end)

RegisterNetEvent('cd_easytime:SyncWeather')
AddEventHandler('cd_easytime:SyncWeather', function(data)
    if not PauseSync then
        CheckSnowSync(data.weather)
        Weather = data.weather
        Blackout = data.blackout
        ChangeWeather(Weather, Blackout)
    end
end)

RegisterNetEvent('cd_easytime:SyncTime')
AddEventHandler('cd_easytime:SyncTime', function(data)
    if not PauseSync then
        if data.hours == Hours then
            SyncHours = data.hours
            SyncMins = data.mins
        else
            Wait(2000)
            TriggerServerEvent('cd_easytime:SyncMe')
        end
    end
end)

-- Citizen.CreateThread(function()
--     while true do
--         if not FreezeTime then
--             if not PauseSync then
--                 NetworkOverrideClockTime(Hours, Mins, Seconds)
--                 Seconds = Seconds+30
--                 if SyncHours ~= nil and SyncMins ~= nil then
--                     Hours = SyncHours
--                     Mins = SyncMins
--                     SyncHours = nil
--                     SyncMins = nil
--                 end
--                 if Seconds >= 60 then Seconds = 0 Mins = Mins+1 end
--                 if Mins >= 60 then Mins = 0 Hours = Hours+1 end
--                 if Hours >= 24 then Hours = 0 end
--             else
--                 NetworkOverrideClockTime(23, 00, 00)
--             end
--         else
--             NetworkOverrideClockTime(Hours, Mins, Seconds)
--         end
--         Citizen.Wait(Config.TimeCycleSpeed/2)
--     end
-- end)

--[ SYNCTIMERS ]-------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('vrp_vsync:syncTimers')
AddEventHandler('vrp_vsync:syncTimers',function(sHour,sMinutes)
	Hours = sHour
	Mins = sMinutes
end)

--[ NETWORKCLOCK ]-----------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
        if not FreezeTime then
		    NetworkOverrideClockTime(Hours,Mins,00)
        end
	end
end)

RegisterNUICallback('close', function()
    NUI_status = false
end)

RegisterNUICallback('change', function(data)
    NUI_status = false
    TriggerServerEvent('cd_easytime:ForceUpdate', {weather = data.weather, hours = data.time, dynamic = data.dynamic, blackout = data.blackout, freeze = data.freeze})
end)

function CheckSnowSync(NewWeather)
    if Weather == 'XMAS' then
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
    elseif NewWeather == 'XMAS' then
        SetForceVehicleTrails(true)
        SetForcePedFootstepsTracks(true)
    end
end

function ChangeWeather(weather, blackout)
    SetBlackout(blackout)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(weather)
    SetWeatherTypeNow(weather)
    SetWeatherTypeNowPersist(weather)
end

RegisterNetEvent('cd_easytime:time')
AddEventHandler('cd_easytime:time', function(values)
    Open_UI(values)
end)

function Open_UI(values)
    TriggerEvent('cd_easytime:ToggleNUIFocus')
    SendNUIMessage({action = 'open', values = values})
end

function Close_UI()
    NUI_status = false
    SendNUIMessage({action = 'close'})
end

RegisterNetEvent('cd_easytime:ToggleNUIFocus')
AddEventHandler('cd_easytime:ToggleNUIFocus', function()
    NUI_status = true
    while NUI_status do
        Citizen.Wait(5)
        SetNuiFocus(NUI_status, NUI_status)
    end
    SetNuiFocus(false, false)
end)

local loaded_natal = false

Citizen.CreateThread(function()
	while true do
        if Config.Natal then
            SetWeatherTypePersist('XMAS')
            SetWeatherTypeNow('XMAS')
            SetWeatherTypeNowPersist('XMAS')
        else
            break
        end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent('cd_easytime:natal')
AddEventHandler('cd_easytime:natal', function()
    SetWeatherTypePersist('XMAS')
    SetWeatherTypeNow('XMAS')
    SetWeatherTypeNowPersist('XMAS')
    loaded_natal = true
end)

local loaded_clear = false

Citizen.CreateThread(function()
	while true do
        if Config.ForceTimeClear then
            SetWeatherTypePersist('CLEAR')
            SetWeatherTypeNow('CLEAR')
            SetWeatherTypeNowPersist('CLEAR')
        else
            break
        end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent('cd_easytime:clear')
AddEventHandler('cd_easytime:clear', function()
    SetWeatherTypePersist('CLEAR')
    SetWeatherTypeNow('CLEAR')
    SetWeatherTypeNowPersist('CLEAR')
    loaded_clear = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEGAR BOLA DE NEVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("snowball")
AddEventHandler("snowball",function()
	local ped = PlayerPedId()
	if IsNextWeatherType("XMAS") then
		if not IsPlayerFreeAiming(ped) and not IsPedSwimming(ped) and not IsPedSwimmingUnderWater(ped) and not IsPedRagdoll(ped) and not IsPedFalling(ped) and not IsPedRunning(ped) and not IsPedSprinting(ped) and GetInteriorFromEntity(ped) == 0 and not IsPedShooting(ped) and not IsPedUsingAnyScenario(ped) and not IsPedInCover(ped,0) then
			vRP._playAnim(false,{{"anim@mp_snowball","pickup_snowball"}},false)
			Citizen.Wait(1950)
		    vRP.giveWeapons({["WEAPON_SNOWBALL"] = { ammo = 2 }})
		end
	end
end)