-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
src = Tunnel.getInterface("Ca_rotas")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
blips = false
service = false
selected = 0
random = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
config = module("Ca_rotas","cfg/config")
-----------------------------------------------------------------------------------------------------------------------------------------
-- START JOB
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local cds = GetEntityCoords(ped)
        for k,v in pairs(config.rotas) do
            for l,w in pairs(v['perm']) do
                local distance = #(cds - w)
                if distance <= 5 then
                    sleep = 4
                   -- DrawMarker(23,w.x,w.y,w.z-0.5,0,0,0,0,0.5,0.5,0.5,0.5,0.5,255,165,0,30,1,0,0,1)
                    if distance <= 1.5 then
                        drawTxt("PRESSIONE  ~o~E~w~  PARA ~o~INICIAR A ROTA",4,0,100,0,0,100,0,180)
                        if IsControlJustPressed(0,38) and src.checkPermission(l) then
                            service = true
                            random = src.randomRoute()
                            if random then selected = math.random(#v['coords'])
                            else selected = 1 end
                            StartDelivery(v['coords'], v['items'], k)
                            BlipCreate(v['coords'], selected, k)
                            ExitJob()
                            TriggerEvent('Notify','sucesso','Você inicio o serviço de coleta.')
                        end
                    end
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELIVERY
-----------------------------------------------------------------------------------------------------------------------------------------
function StartDelivery(coords, items, name)
    local locs = coords
    local rewards = items 
    local name = name
    Citizen.CreateThread(function() 
        while service do
            local sleep = 1000
            local ped = PlayerPedId()
            local cds = GetEntityCoords(ped)
            local distance = #(cds - locs[selected])
            if distance <= 25 then
                sleep = 4
				DrawMarker(21,locs[selected].x,locs[selected].y,locs[selected].z-0.7,0,0,0,0,180.0,130.0,1.0,1.0,0.5,0,100,0,30,1,0,0,1)
                if distance <= 1.5 then
					drawTxt("PRESSIONE  ~o~E~w~  PARA ~o~COLETAR OS ITENS",4,0.5,0.93,0.50,255,255,255,180)
                    if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
                        if src.checkPayment(rewards) then
                            vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
                            RemoveBlip(blips)
                            if random then
                                if selected == #locs then
                                    selected = 7
                                 else
                                    selected = math.random(#locs)
                                 end
                            else
                                if selected == #locs then
                                    selected = 1
                                else
                                    selected = selected + 1
                                end
                            end
                            BlipCreate(locs, selected, name)
                         end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
function ExitJob()
    Citizen.CreateThread(function()
        while service do
            drawTxt("~w~PRESSIONE ~b~F7 ~w~SE DESEJA FINALIZAR O EXPEDIENTE",4,0.160,0.930,0.35,255,255,255,180)
            if IsControlJustPressed(0,168) then
                TriggerEvent('Notify','service','Você acabou de sair de serviço.')
                service = false
                if blips then RemoveBlip(blips) end
            end
            Citizen.Wait(4)
        end
    end)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT
-----------------------------------------------------------------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIP CREATE
-----------------------------------------------------------------------------------------------------------------------------------------
function BlipCreate(locs, selected, name)
	blips = AddBlipForCoord(locs[selected].x, locs[selected].y, locs[selected].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,1)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coleta de "..name)
	EndTextCommandSetBlipName(blips)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- NPC CREATE
-----------------------------------------------------------------------------------------------------------------------------------------
local pedlist = {
    { ['x'] = 1248.62, ['y'] = -228.1, ['z'] = 95.95, ['h'] = 183.89, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" }, -- PED CANDLOVE INICIAR ROTA MUNIÇÃO
    { ['x'] = 1327.74, ['y'] = -681.39, ['z'] = 73.1, ['h'] = 75.73, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" }, -- PED ELITECAR INICIAR ROTA DESMANCHE
    { ['x'] = -345.6, ['y'] = -123.14, ['z'] = 39.01, ['h'] = 253.57, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" }, -- PED NAPOLES INICIAR ROTA DESMANCHE
    { ['x'] = 1381.31, ['y'] = -1294.96, ['z'] = 72.69, ['h'] = 86.91, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" }, -- PED GRECIA INICIAR ROTA METANFETAMINA
    { ['x'] = 2041.54, ['y'] = 480.93, ['z'] = 168.04, ['h'] = 161.99, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" }, -- PED VILARICA INICIAR ROTA LSD
    { ['x'] = 348.79, ['y'] = 283.73, ['z'] = 91.2, ['h'] = 254.96, ['hash'] = 0xDA2C984E, ['hash2'] = "mp_m_securoguard_01" }, -- PED GALAXY INICIAR ROTA LAVAGEM
    { ['x'] = 973.82, ['y'] = 18.04, ['z'] = 71.84, ['h'] = 164.36, ['hash'] = 0xDA2C984E, ['hash2'] = "mp_m_securoguard_01" }, -- PED CASSINO INICIAR ROTA LAVAGEM
    { ['x'] = -2680.23, ['y'] = 1333.4, ['z'] = 144.26, ['h'] = 268.24, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" }, -- PED BRATVA INICIAR ROTA ARMAS
    { ['x'] = -1871.2, ['y'] = 2056.84, ['z'] = 135.47, ['h'] = 300.44, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" }, -- PED LAKERS INICIAR ROTA MUNIÇÃO
    { ['x'] = -872.66, ['y'] = -1827.83, ['z'] = 28.94, ['h'] = 247.10, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" },
    { ['x'] = 813.58, ['y'] = -286.66, ['z'] = 66.47, ['h'] = 67.84, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" },
    { ['x'] = 883.01, ['y'] = 1018.13, ['z'] = 280.67, ['h'] = 12.90, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" },
    { ['x'] = 1161.1, ['y'] = -143.92, ['z'] = 57.8, ['h'] = 151.00, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" },
    { ['x'] = 46.86, ['y'] = -1749.46, ['z'] = 29.64, ['h'] = 43.37, ['hash'] = 0x47E4EEA0, ['hash2'] = "ig_andreas" }, -- PED DO MARKTPLACE.
    { ['x'] = 366.01, ['y'] = -1200.01, ['z'] = 30.44, ['h'] = 186.27, ['hash'] = 0x9D0087A8, ['hash2'] = "ig_claypain" }, -- PED VENDA DE DROGAS.
}
   
CreateThread(function()
for k,v in pairs(pedlist) do
    RequestModel(GetHashKey(v.hash2))
    while not HasModelLoaded(GetHashKey(v.hash2)) do Wait(100) end
    ped = CreatePed(4,v.hash,v.x,v.y,v.z-1,v.h,false,true)
    peds = ped
    FreezeEntityPosition(ped,true)
    SetEntityInvincible(ped,true)
    SetBlockingOfNonTemporaryEvents(ped,true)
end
end)