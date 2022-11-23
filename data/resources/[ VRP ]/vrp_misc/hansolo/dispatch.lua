local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local blips = {}
local tasertime = false
local oldSpeed = 0
local mouseRagdol = false
local ragdoll = false
local ragdol = false
local hurt = false
local bunnyhop = 0

--[ REMOVER STAMINA ]---------------------------------------------------------------------------------------------------------------------------
CreateThread( function()
    while true do
    Citizen.Wait(0)
        RestorePlayerStamina(PlayerId(), 1.0)
    end
end)

--[ DISPATCH ]---------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	for i = 1,120 do
		EnableDispatchService(i,false)
	end
end)

--[[ DESABILITAR X NA MOTO ]--------------------------------------------------------------------------------------------------------------]]

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local idle = 1000
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)
			if GetPedInVehicleSeat(vehicle,0) == ped and GetVehicleClass(vehicle) == 8 then
				local idle = 250
				DisableControlAction(0,73,true) 
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ DESABILITAR A CORONHADA ]------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
		local ped = PlayerPedId()
		local idle = 1000
		if IsPedArmed(ped,6) then
			idle = 10
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
		end
		Citizen.Wait(idle)
    end
end)

--[ REMOVER ARMA ABAIXO DE 40MPH DENTRO DO CARRO ]---------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				local speed = GetEntitySpeed(vehicle)*2.236936
				if speed >= 40 then
					SetPlayerCanDoDriveBy(PlayerId(),false)
				else
					SetPlayerCanDoDriveBy(PlayerId(),true)
				end
			end
		end
		Citizen.Wait(1000)
	end
end)

--[ ESTOURAR OS PNEUS ]------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
            if GetPedInVehicleSeat(vehicle,-1) == ped then
                local roll = GetEntityRoll(vehicle)
                if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
					for i = 0,7 do
						if not IsVehicleTyreBurst(vehicle,i,false) then
							SetVehicleTyreBurst(vehicle,i,1,1000.01)
						end
						Citizen.Wait(1000)
					end
                end
            end
        end
        Citizen.Wait(1000)
    end
end)

--[ animação /e3 ]---
---------------------------------

RegisterCommand('e2', function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"administrador.permissao") then
        if args[2] then
            local nplayer = vRP.getUserSource(parseInt(args[2]))
            if nplayer then
                TriggerClientEvent("emotes",nplayer,args[1])
            end
        end
    end
end, false)

--[ PERDER ADERENCIA ]------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local timeDistance = 500
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if IsPedInAnyVehicle(ped) then
            timeDistance = 5
            if GetPedInVehicleSeat(vehicle,-1) == ped then
                for i = 0, 5 do
                    if IsVehicleTyreBurst(vehicle, i, true) then
                        SetVehicleReduceGrip(vehicle,true)
                    end
                end
            end
        end
        Citizen.Wait(timeDistance)
    end
end)

--[ CARRO NAO DESCAPOTAR ]------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local roll = GetEntityRoll(veh)

        local wavestwt = 1000
        if GetPedInVehicleSeat(veh, -1) and (roll > 75.0 or roll < -75.0) then
            wavestwt = 5

            DisableControlAction(0, 59)
            DisableControlAction(0, 60)
            DisableControlAction(0, 71)
            DisableControlAction(0, 72)
        end
        Citizen.Wait(wavestwt)
    end
end)

--[ NÃO ATIRAR COM RÁDIO ]------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local idle = 1000
        local ped = PlayerPedId()
        local player = PlayerId() 
        if IsEntityPlayingAnim(ped, "random@arrests","generic_radio_chatter", 3) then
            idle = 5
            DisablePlayerFiring(player, true)
        end
        Citizen.Wait(idle)
    end
end)

--[ DESABILITAR AUTO CAPACETE ]------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread( function()
    while true do
        Citizen.Wait(1000)  
        local veh = GetVehiclePedIsUsing(PlayerPedId())
        if veh ~= 0 then 
            SetPedConfigFlag(PlayerPedId(),35,false) 
        end
    end
end)

--[ DRIFT ]------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        local idle = 1000
        if IsPedInAnyVehicle(ped) then
            idle = 5
            local speed = GetEntitySpeed(vehicle)*2.236936
            if GetPedInVehicleSeat(vehicle,-1) == ped 
                and (GetEntityModel(vehicle) ~= GetHashKey("coach") 
                    and GetEntityModel(vehicle) ~= GetHashKey("bus") 
                    and GetEntityModel(vehicle) ~= GetHashKey("youga2") 
                    and GetEntityModel(vehicle) ~= GetHashKey("ratloader") 
                    and GetEntityModel(vehicle) ~= GetHashKey("taxi") 
                    and GetEntityModel(vehicle) ~= GetHashKey("boxville4") 
                    and GetEntityModel(vehicle) ~= GetHashKey("trash2") 
                    and GetEntityModel(vehicle) ~= GetHashKey("tiptruck") 
                    and GetEntityModel(vehicle) ~= GetHashKey("rebel") 
                    and GetEntityModel(vehicle) ~= GetHashKey("speedo") 
                    and GetEntityModel(vehicle) ~= GetHashKey("phantom") 
                    and GetEntityModel(vehicle) ~= GetHashKey("packer") 
                    and GetEntityModel(vehicle) ~= GetHashKey("paramedicoambu")) then
                    if speed <= 100.0 then
                    if IsControlPressed(1,21) then
                        SetVehicleReduceGrip(vehicle,true)
                    else
                        SetVehicleReduceGrip(vehicle,false)
                    end
                end    
            end
        end
        Citizen.Wait(idle)
    end
end)

--[ DESABILITAR P1 AUTO ]--------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()
        local idle = 1000
		if IsPedInAnyVehicle(ped) and not IsPedOnAnyBike(ped) then
            idle = 5
			local veh = GetVehiclePedIsUsing(ped)
			if GetPedInVehicleSeat(veh,0) == ped then
				if not GetIsTaskActive(ped,164) and GetIsTaskActive(ped,165) then
					SetPedIntoVehicle(ped,veh,0)
					SetPedConfigFlag(ped,184,true)
					SetVehicleCloseDoorDeferedAction(veh,0)
				end
			end
		end

		Citizen.Wait(idle)
	end
end)

--[ BLIPS ]------------------------------------------------------------------------------------------------------------------------------


Citizen.CreateThread(function()
	for _,v in pairs(blips) do
		local blip = AddBlipForCoord(v.x,v.y,v.z)
		SetBlipSprite(blip,v.sprite)
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v.color)
		SetBlipScale(blip,v.scale)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.nome)
		EndTextCommandSetBlipName(blip)
		Citizen.Wait(5)
	end
end)


--[ DAMAGE WALK MODE ]-------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		if not IsEntityInWater(ped) then
			if GetEntityHealth(ped) <= 199 then
				idle = 5
				setHurt()
			elseif hurt and GetEntityHealth(ped) > 200 then
				setNotHurt()
			end
		end
		Citizen.Wait(idle)
	end
end)

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(PlayerPedId(),"move_m@injured",true)
	SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
	DisableControlAction(0,21) 
	DisableControlAction(0,22)
end

function setNotHurt()
    hurt = false
	SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
    ResetPedMovementClipset(PlayerPedId())
    ResetPedWeaponMovementClipset(PlayerPedId())
    ResetPedStrafeClipset(PlayerPedId())
end

--[ COOLDOWN BUNNYHOP ]------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if bunnyhop > 0 then
            bunnyhop = bunnyhop - 5
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedJumping(ped) and bunnyhop <= 0 then
            bunnyhop = 5
        end
        if bunnyhop > 0 then
            DisableControlAction(0,22,true)
        end
        Citizen.Wait(1000)
    end
end)

function setRagdoll(flag)
  ragdoll = flag
end

Citizen.CreateThread(function()
	while true do
		idle = 1000
		if ragdoll then
			idle = 5
			SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
		end
		Citizen.Wait(idle)
	end
end)

RegisterNetEvent("vrp_misc:Ragdoll")
AddEventHandler("vrp_misc:Ragdoll", function()
	if ragdol then
		setRagdoll(true)
		ragdol = true
	else
		setRagdoll(false)
		ragdol = false
		ClearPedTasks(PlayerPedId())
	end
end)


RegisterNetEvent("vrp_misc:RagdollTime")
AddEventHandler("vrp_misc:RagdollTime", function(time)
	mouseRagdol = true
	setRagdoll(true)
	Wait(time)
	mouseRagdol = false
	setRagdoll(false)
	ClearPedTasks(PlayerPedId())
end)

Citizen.CreateThread(function()
 	while true do
 		Citizen.Wait(1000)
 		if IsControlPressed(0, 303) then  --change key here
 			TriggerEvent("vrp_misc:Ragdoll", source)
 		end
 	end
end)

--[ WATHER ITEM DAMAGE | THREAD ]-------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = PlayerPedId()
		
		if IsEntityInWater(ped) then
			idle = 100
			if IsPedSwimming(ped) and not IsPedSwimmingUnderWater(ped) then
				misc.damageItem()
			end
			if IsPedSwimming(ped) and IsPedSwimmingUnderWater(ped) then
				misc.damageItem()
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ COMMAND FPS ]-----------------------------------------------------------------------------
RegisterCommand("fps",function(source,args)
    if args[1] == nil then
        TriggerEvent("Notify","sucesso","Escolha qual o nivel de Boost voce deseja:") 
        TriggerEvent("Notify","sucesso","1 - /fps ultra = FPS mais alto que seu PC pode chegar;")
        TriggerEvent("Notify","sucesso","2 - /fps medio = Configuração mediana para não perder tanta qualidade;")
        TriggerEvent("Notify","sucesso","3 - /fps baixo = Desativa só alguns efeitos visuais;")
        TriggerEvent("Notify","sucesso","4- /fps off para desativar todos os efeitos e tornar padrão.")
    elseif args[1] == "on" then
        TriggerEvent("Notify","sucesso","Escolha qual o nivel de Boost voce deseja:") 
        TriggerEvent("Notify","sucesso","1 - /fps ultra = FPS mais alto que seu PC pode chegar;")
        TriggerEvent("Notify","sucesso","2 - /fps medio = Configuração mediana para não perder tanta qualidade;")
        TriggerEvent("Notify","sucesso","3 - /fps baixo = Desativa só alguns efeitos visuais;")
        TriggerEvent("Notify","sucesso","4- /fps off para desativar todos os efeitos e tornar padrão.")
   elseif args[1] == "ultra" then
        SetTimecycleModifier("cinema")
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetCascadeBoundsScale(0.0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
        DistantCopCarSirens(false)
        TriggerEvent("Notify","sucesso","Boost de fps ultra ligado!")
    elseif args[1] == "medio" then
        SetTimecycleModifier("cinema")
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetCascadeBoundsScale(0.0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
        DistantCopCarSirens(false)
        TriggerEvent("Notify","sucesso","Boost de fps mediano ligado!")
    elseif args[1] == "baixo" then
        RopeDrawShadowEnabled(true)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(3.0)
        CascadeShadowsSetCascadeBoundsScale(3.0)
        SetFlashLightFadeDistance(3.0)
        SetLightsCutoffDistanceTweak(3.0)
        DistantCopCarSirens(false)
        SetArtificialLightsState(false)
        TriggerEvent("Notify","sucesso","Boost de fps baixo ligado!")
    elseif args[1] == "off" then
        SetTimecycleModifier("default")
        RopeDrawShadowEnabled(true)
        CascadeShadowsSetAircraftMode(true)
        CascadeShadowsEnableEntityTracker(false)
        CascadeShadowsSetDynamicDepthMode(true)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(5.0)
        CascadeShadowsSetCascadeBoundsScale(5.0)
        SetFlashLightFadeDistance(10.0)
        SetLightsCutoffDistanceTweak(10.0)
        DistantCopCarSirens(true)
        SetArtificialLightsState(false)
        TriggerEvent("Notify","sucesso","Boost de fps desligado!")
    end
end)


CreateThread(function()
    while true do
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
        SetAudioFlag("PoliceScannerDisabled",true);
        Wait(0)
    end
  end)