local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

--[ CONNECTION ]----------------------------------------------------------------------------------------------------------------

mW = Tunnel.getInterface("nav-money-wash")

--[ VARIABLES ]-----------------------------------------------------------------------------------------------------------------

local menuactive = false

local washBench = {
	{ ['x'] = 956.5, ['y'] = 20.29, ['z'] = 75.75 }
}

--[ MENU | FUNCTION ]--------------------------------956.5,20.29,75.75---------------------------------------------------------------------------

function ToggleActionMenu()
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		TransitionFromBlurred(1000)
		SendNUIMessage({ hidemenu = true })
	end
end

-------------------------------------------------------------------------------------------------
--[ BOTÕES ]-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

RegisterNUICallback("ButtonClick",function(data,cb)
	if data == "clean-money-25k" then
		TriggerServerEvent("dirty-money-clean","25k")

	elseif data == "clean-money-50k" then
		TriggerServerEvent("dirty-money-clean","50k")

	elseif data == "clean-money-100k" then
		TriggerServerEvent("dirty-money-clean","100k")

	elseif data == "clean-money-500k" then
		TriggerServerEvent("dirty-money-clean","500k")

	elseif data == "clean-money-1kk" then
		TriggerServerEvent("dirty-money-clean","1kk")

	elseif data == "fechar" then
		ToggleActionMenu()
		onmenu = false
	end
end)

RegisterNetEvent("bancada-cassino:posicao")
AddEventHandler("bancada-cassino:posicao", function()
	local ped = PlayerPedId()
	SetEntityHeading(ped,91.0)
	SetEntityCoords(ped,956.5,20.29,75.75-1,false,false,false,false)
end)

RegisterNetEvent("close-nui")
AddEventHandler("close-nui", function()
	ToggleActionMenu()
	onmenu = false
end)

--[ OPEN MONEY WASH MENU | THREAD ]-------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
	while true do
		local idle = 1000
		for k,v in pairs(washBench) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local washBench = washBench[k]
			
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), washBench.x, washBench.y, washBench.z, true ) <= 0.5 and not menuactive then
			end

			if distance < 2 then
			drawTxt("~p~ACESSAR O SISTEMA DE LAVAGEM~w~",4,0.5,0.93,0.50,255,255,255,180)
				--DrawMarker(23, washBench.x, washBench.y, washBench.z-0.97, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.5, 178, 34, 34, 180, 0, 0, 0, 0)
				idle = 5
				if distance <= 1.2 then
					if IsControlJustPressed(0,38) and mW.checkPermissao() then
						ToggleActionMenu()
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

--[ TEXT | FUNCTION ]--------------------------------------------------------------------------------------------------------------------

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end