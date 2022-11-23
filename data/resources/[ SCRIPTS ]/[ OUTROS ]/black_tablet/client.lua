-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface("black_tablet")
vRPclient = Tunnel.getInterface("vRP")

local source = source
local user_id = vRP.getUserId(source)

local takePhoto  = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMMAND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tablet",function(source,args)
    local life = GetEntityHealth(PlayerPedId())

    if life > config2.CheckLife then
        OpenTablet()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local life = GetEntityHealth(PlayerPedId())
        if life > config2.CheckLife then
        else
            SetNuiFocus(false,false)
            SendNUIMessage({ action = "hideMenu" })
        end
    end
end)

RegisterCommand("tabletpoliciaclose",function(source,args)
    CloseTablet()
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TABLET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("tabletpolicia","Abrir o tablet","keyboard", config2.keybind)
-----------------------------------------------------------------------------------------------------------------------------------------
-- USER DATA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("userData",function(data,cb)
	local userId, userIdentidade = vSERVER.userData()
	if userId then
		cb({ userId = userId, userName = userName })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("blackClose",function(data,cb)
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "hideMenu" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INFO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("infoUser",function(data,cb)
	local tickets,name,lastname,telefone,identity,age,arrests,warnings,img = vSERVER.infoUser(data.user)
	cb({ tickets = tickets, name = name, telefone = telefone, lastname = lastname, identity = identity, age = age, arrests = arrests, warnings = warnings, img = img })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARREST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("arrestsUser",function(data,cb)
	local arrests = vSERVER.arrestsUser(data.user)
	if arrests then
		cb({ arrests = arrests })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TICKET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ticketsUser",function(data,cb)
	local tickets = vSERVER.ticketsUser(data.user)
	if tickets then
		cb({ tickets = tickets })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WARNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("warningsUser",function(data,cb)
	local warnings = vSERVER.warningsUser(data.user)
	if warnings then
		cb({ warnings = warnings })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WARNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("warningUser",function(data,cb)
	if data.user then
		vSERVER.warningUser(data.user,data.date,data.info)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TICKET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("ticketUser",function(data,cb)
	if data.user then
		vSERVER.ticketUser(data.user,data.value,data.date,data.info)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARREST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("arrestUser",function(data,cb)
	if data.user then
		vSERVER.arrestUser(data.user,data.value,data.date,data.info)
	end
end)

RegisterNUICallback("GetProfilePicture", function(data,cb)
    if data.user then
		vSERVER.GetProfilePicture(data.user,data.value,data.date,data.info)
    end
end)

function OpenTablet()
    if vSERVER.checkPermission() then
		SetNuiFocus(true,true)
		SendNUIMessage({ action = "showMenu"
    })
    end
end

function CloseTablet()
	SetNuiFocus(false,false)
    SendNUIMessage({ action = "hideMenu" })
end

phone = false
phoneId = 0
RegisterNetEvent('camera:open')
AddEventHandler('camera:open', function()
    CreateMobilePhone(1)
	CellCamActivate(true, true)
	phone = true
    PhonePlayOut()
end)

frontCam = false

function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end

RegisterNUICallback('PostNewImage', function(data, cb)
    SetNuiFocus(false, false)
    CreateMobilePhone(1)
    CellCamActivate(true, true)
    takePhoto = true
    Citizen.Wait(4)

    while takePhoto do
        Citizen.Wait(4)

        if IsControlJustPressed(1, 27) then -- Toogle Mode
            frontCam = not frontCam
            CellFrontCamActivate(frontCam)
        elseif IsControlJustPressed(1, 177) then -- CANCEL
            DestroyMobilePhone()
            CellCamActivate(false, false)
            cb(nil)     
            takePhoto = false
            break
        elseif IsControlJustPressed(1, 176) then -- TAKE.. PIC
            exports['screenshot-basic']:requestScreenshotUpload(config2.Webhook, config2.Field, function(data)
                local resp = json.decode(data)
                cb({resp.attachments[1].proxy_url})
                DestroyMobilePhone()
                CellCamActivate(false, false)
            end)
            takePhoto = false
        end

        

        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(19)
        HideHudAndRadarThisFrame()
    end
    Citizen.Wait(800)
    OpenTablet()
end)