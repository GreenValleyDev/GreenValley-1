local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
trig = Tunnel.getInterface("trig_polvora")
vRP = Proxy.getInterface("vRP")


local polvora = false
local analisado = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local ped = PlayerPedId()
        local tiro = IsPedShooting(ped)
        local armadocrime = GetSelectedPedWeapon(ped)
        if tiro then
            TriggerServerEvent("trig_polvora",armadocrime)
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        local sleep = 1000
        local x,y,z = -932.63, -2057.35, 9.41
        local distance = Vdist(GetEntityCoords(PlayerPedId()),x,y,z)
        if distance <= 2 then
            sleep = 4
            DrawMarker(21,x,y,z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
            if distance <= 1.5 then
                drawTxt("PRESSIONE  ~b~E~w~  PARA ANALISAR AS PROVAS",4,0.5,0.92,0.35,255,255,255,180)
                if IsControlJustPressed(0, 38) then
                    DisableControlAction(0,21,true)
                    if trig.analisarpolvora() then
                        analisado = true
                        DisableControlAction(0,21,false)
                    end
                end
            end
        end

        local x2,y2,z2 = -936.49, -2053.86, 9.41
        local distance = Vdist(GetEntityCoords(PlayerPedId()),x2,y2,z2)
        if distance <= 2 then
            sleep = 4
            DrawMarker(21,x2,y2,z2-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,255,0,0,50,0,0,0,1)
            if distance <= 1.5 then
                drawTxt("PRESSIONE  ~b~E~w~  PARA OBTER RESULTADOS",4,0.5,0.92,0.35,255,255,255,180)
                if IsControlJustPressed(0, 38) then
                    if analisado then
                        trig.resultado()
                    else
                        TriggerEvent("Notify","negado","Nenhum relatório disponivel")
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

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