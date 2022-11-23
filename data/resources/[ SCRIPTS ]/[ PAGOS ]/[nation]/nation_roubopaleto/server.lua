local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP", "nation_roubopaleto")

func = {}
Tunnel.bindInterface("nation_roubopaleto", func)

---------CFG---------

local cooldowndefault = 1800
local tempoderoubo = 500
local dinheirodefault = 500000
local minimopolicia = 9
local C4 = 2

-----------------------


------Variáveis-----------

local dinheiro = 500000
local cops = {}

--------------------------



-----------Funções--------------

---------------------WEBHOOK------------------------------

local log_webhook = "https://discord.com/api/webhooks/917534492531490826/7LQxZQ_ZeGDNpf3YyOrd8wEe8Kd7maKWWikTCUCndJ4qF1B-CK813wF3ajFQ0kuw0Gs7"
local function SendWebhookMessage(webhook,message)
	if webhook == log_webhook then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

--------------------------------------------------------

------------Remover blip dos coxa-----------------------

function func.resetBlip()
    local policiais = {}
    policiais = vRP.getUsersByPermission("policia.permissao")
    for k,v in pairs(policiais) do
        TriggerClientEvent("roubopaleto:rblipcoxa",vRP.getUserSource(v))
    end
end

--------------------------------------------------------------

--------------Pegar dinheiro enquanto rouba-----------------------

function func.pegarDinheiro()
    local user_id = vRP.getUserId(source)
    if user_id then
        if dinheiro > 0 then
            local randommoney = math.random(10000,100000)
            dinheiro = dinheiro - randommoney
            if dinheiro >= 0 then
                vRP.giveInventoryItem(user_id,"dinheiro-sujo",randommoney,true)
                TriggerClientEvent("roubopaleto:dinheiro",-1,dinheiro,vRP.format(dinheiro))
            else
                vRP.giveInventoryItem(user_id,"dinheiro-sujo",randommoney+dinheiro,true)
                TriggerClientEvent("roubopaleto:dinheiro",-1,0,vRP.format(0))
            end
            Wait(1000)
        end                
    end
end

-----------------------------------------------------------------------------

----------------Remover dinheiro sujo do player quando o roubo é cancelado----------------------------------

function func.removeDinheiro()
    local source = source
    if source then
        local user_id = vRP.getUserId(source)
        local amount = vRP.getInventoryItemAmount(user_id,"dinheiro-sujo")
        if amount > 0 then
            vRP.tryGetInventoryItem(user_id,"dinheiro-sujo",amount)
            TriggerClientEvent("Notify",source,"aviso","Foram removidos $ "..vRP.format(amount).." sujos de seu inventário.")
        end   
    end
end

---------------------------------------------------------------------------------------------------------------------

-----------------Checar se o cara tem a bomba----------------------------------------------------------------------------

function func.checkBomba()
    local source = source
    if source then
        local user_id = vRP.getUserId(source)
        if  vRP.tryGetInventoryItem(user_id,"c4",C4) then
            TriggerClientEvent("roubopaleto:criarbomba",source)
        else
            TriggerClientEvent("Notify",source,"negado","Você não possui <b>duas C4</b>.")
        end   
    end
end

-------------------------------------------------------------------------------------------------------------------------------

--------------------------Timers-------------------------------------------

local tempo = -1
function timer(times)
    tempo = times
    while tempo > 0 do
        Wait(1000)
        tempo = tempo - 1
        TriggerClientEvent("roubopaleto:timer",-1,tempo)
    end
    func.resetBlip()
    TriggerClientEvent("roubopaleto:terminando",-1,false)
    TriggerClientEvent("roubopaleto:abrirporta",-1,false)
    TriggerClientEvent("syncarea",-1,x,y,z)
end

local timerbomba = -1
function timerbomb(timess)
    timerbomba = timess
    while timerbomba > 0 do
        Wait(1000)
        timerbomba = timerbomba - 1
        TriggerClientEvent("roubopaleto:timerbomba",-1,timerbomba)
    end
end

local cooldown = -1
function cooldownTime(timex)
    cooldown = timex
    while cooldown > 0 do
        Wait(1000)
        cooldown = cooldown - 1
    end
end

------------------------------------------------------------------------------


-----------------------------------Eventos---------------------------------------

-----------------------------INICIAR E PARAR O ROUBO------------------------------------

RegisterNetEvent("roubopaleto:iniciar")
AddEventHandler("roubopaleto:iniciar", function(x,y,z)
    local user_id = vRP.getUserId(source)
    cops = vRP.getUsersByPermission("policia.permissao")
    if cooldown > 0 then
        TriggerClientEvent("Notify",source,"negado","Você deve esperar "..cooldown.." segundo(s) para iniciar o roubo.")
    elseif vRP.hasPermission(user_id,"policia.permissao") then
        TriggerClientEvent("Notify",source,"negado","Policiais não podem roubar bancos.")
    elseif #cops < minimopolicia then
        TriggerClientEvent("Notify",source,"negado","Número insuficiente de policiais no momento.")
    else
        SendWebhookMessage(log_webhook,"```O ID ["..user_id.."] iniciou um roubo no Banco Green Valley (Paleto).```")
        TriggerClientEvent("roubopaleto:iniciando",-1,true)
        TriggerClientEvent("Notify",source,"sucesso","Iniciando roubo no Banco Green Valley (Paleto).")
        for k,v in pairs(cops) do
            TriggerClientEvent("roubopaleto:blipcoxa",vRP.getUserSource(v),x,y,z)
        end
        TriggerClientEvent("roubopaleto:iniciado",-1,true)
        TriggerClientEvent("roubopaleto:cpodeexplodir",-1,true)
        TriggerClientEvent("roubopaleto:criarobjeto",-1)
        TriggerClientEvent("roubopaleto:dinheiro",-1,dinheiro,vRP.format(dinheiro))
        timer(tempoderoubo)
        SendWebhookMessage(log_webhook,"```O roubo começado pelo ID ["..user_id.."] no Banco Green Valley (Paleto) terminou com sucesso.```")
        tempo = -1
        dinheiro = dinheirodefault
        TriggerClientEvent("roubopaleto:timer",-1,tempo)
        TriggerClientEvent("roubopaleto:iniciando",-1,false)
        TriggerClientEvent("roubopaleto:abrirporta",-1,false)
        TriggerClientEvent("syncarea",-1,x,y,z)
        cooldownTime(cooldowndefault)
    end
end)

---------------------------------------------------------------------------------------------------------

----------------------------CANCELAR O ROUBO-----------------------------------------------------------

RegisterNetEvent("roubopaleto:cancelando")
AddEventHandler("roubopaleto:cancelando", function(tipo,x,y,z)
    if tipo == 1 then
        SendWebhookMessage(log_webhook,"```O ID ["..vRP.getUserId(source).."] saiu do Banco Green Valley (Paleto) antes do roubo ser finalizado.```")
    elseif tipo == 2 then
        SendWebhookMessage(log_webhook,"```O ID ["..vRP.getUserId(source).."] morreu enquanto roubava o Banco Green Valley (Paleto).```")
    end
    tempo = -1
    dinheiro = dinheirodefault
    TriggerClientEvent("roubopaleto:timer",-1,tempo)
    TriggerClientEvent("roubopaleto:iniciando",-1,false)
    TriggerClientEvent("roubopaleto:cancelou",-1,tipo)
    TriggerClientEvent("roubopaleto:abrirporta",-1,false)
    TriggerClientEvent("roubopaleto:removerdinheiro",-1)
    TriggerClientEvent("syncarea",-1,x,y,z)
    func.resetBlip()
    cooldownTime(cooldowndefault)
end)

--------------------------------------------------------------------------------------------------------------

--------------------------PLANTAR A BOMBA------------------------------------------------------

RegisterNetEvent("roubopaleto:plantou")
AddEventHandler("roubopaleto:plantou", function()
    TriggerClientEvent("roubopaleto:cpodeexplodir",-1,false)
    timerbomb(10)
    timerbomba = -1
    TriggerClientEvent("roubopaleto:explosao",-1)
    TriggerClientEvent("roubopaleto:abrirporta",-1,true)
end)

-------------------------------------------------------------------------------------------


