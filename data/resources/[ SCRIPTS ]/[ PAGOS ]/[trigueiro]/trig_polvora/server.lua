local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")


trig = {}
Tunnel.bindInterface("trig_polvora",trig)

tirostatus = {}
federal = {}

local weapon_types = {
    [-1834847097] = "WEAPON_DAGGER",[-1786099057] = "WEAPON_BAT",[-102323637] = "WEAPON_BOTTLE",[-2067956739] = "WEAPON_CROWBAR",[-1951375401] = "WEAPON_FLASHLIGHT",[1141786504] = "WEAPON_GOLFCLUB",[1317494643] = "WEAPON_HAMMER",[-102973651] = "WEAPON_HATCHET",[-656458692] = "WEAPON_KNUCKLE",[-1716189206] = "WEAPON_KNIFE",[-581044007] = "WEAPON_MACHETE",[-538741184] = "WEAPON_SWITCHBLADE",[1737195953] = "WEAPON_NIGHTSTICK",[419712736] = "WEAPON_WRENCH",[-853065399] = "WEAPON_BATTLEAXE",[-1810795771] = "WEAPON_POOLCUE",[940833800] = "WEAPON_STONE_HATCHET",[453432689] = "WEAPON_PISTOL",[-1075685676] = "WEAPON_PISTOL_MK2",[1593441988] = "WEAPON_COMBATPISTOL",[911657153] = "WEAPON_STUNGUN",[-1076751822] = "WEAPON_SNSPISTOL",[137902532] = "WEAPON_VINTAGEPISTOL",[-1045183535] = "WEAPON_REVOLVER",[-879347409] = "WEAPON_REVOLVER_MK2",[-1466123874] = "WEAPON_MUSKET",[1233104067] = "WEAPON_FLARE",[-72657034] = "GADGET_PARACHUTE",[101631238] = "WEAPON_FIREEXTINGUISHER",[324215364] = "WEAPON_MICROSMG",[736523883] = "WEAPON_SMG",[-270015777] = "WEAPON_ASSAULTSMG",[171789620] = "WEAPON_COMBATPDW",[1432025498] = "WEAPON_PUMPSHOTGUN_MK2",[-2084633992] = "WEAPON_CARBINERIFLE",[-1074790547] = "WEAPON_ASSAULTRIFLE",[1627465347] = "WEAPON_GUSENBERG",[883325847] = "WEAPON_PETROLCAN",[-619010992] = "WEAPON_MACHINEPISTOL",[-86904375] = "WEAPON_CARBINERIFLE_MK2",[1649403952] = "WEAPON_COMPACTRIFLE",
}


RegisterServerEvent("trig_polvora")
AddEventHandler("trig_polvora",function(armadocrime)
    local user_id = vRP.getUserId(source)
    tirostatus[user_id] = weapon_types[armadocrime] -- nplayer
end)



RegisterCommand("vmao",function(source,args,rawCommand) -- MILITAR
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,2)
    local nplayerid = vRP.getUserId(nplayer)
    if nplayer then
        if vRP.hasPermission(user_id,"policia.permissao") then
           local resultado = tirostatus[nplayerid] 
            if #resultado > 0 then 
                TriggerClientEvent("Notify",source,"sucesso","Mao contendo pólvora")
            else
                TriggerClientEvent("Notify",source,"negado","Mão sem vestigio")
            end 
        end
    end  
end)


function trig.analisarpolvora()
    local source = source
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,2)
    local nplayerid = vRP.getUserId(nplayer)
    local resultado = tirostatus[nplayerid]-- nplayerid
    if nplayer then
        if vRP.hasPermission(user_id,"policia.permissao") then
            vRPclient.playAnim(source,true,{{"amb@prop_human_parking_meter@female@idle_a","idle_a_female"}},true)		
            TriggerClientEvent("progress",source,8000,"Enviando material")
            SetTimeout(8000,function()
                vRPclient._stopAnim(source,false)
                TriggerClientEvent("Notify",source,"sucesso","Material a ser analisado inserido. Retire na central.")
                federal[user_id] = {user_id,resultado} -- nplayerid,resultado
            end)
            return true
        end
    end
end

function trig.resultado()
    local source = source
    local user_id = vRP.getUserId(source)
    local analise = federal[user_id]
    local request = vRP.request(source,"Deseja retirar o relatório ? ",15)
    if request then
        vRPclient._playAnim(user_id,true,{{"mp_common","givetake1_a"}},false)
        TriggerClientEvent("progress",source,2000,"Buscando relatório")
        SetTimeout(2000,function()
            if #analise > 1 then
                vRPclient._stopAnim(source,false)
                TriggerClientEvent("Notify",source,"sucesso"," Resultado: Pólvora encontrada <br> Possivel arma: "..analise[2])
            else
                TriggerClientEvent("Notify",source,"negado"," Resultado: Nao foi encontrado pólvora no material.")
            end
        end)
    end
end



-- Trigueiro gotoso
-- chups

RegisterCommand("lavarmao",function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id,"maconha",1) then
            vRPclient.playAnim(source,true,{{"switch@franklin@chopshop","wipehands"}},true)			
            TriggerClientEvent("progress",source,5000,"Limpando as mãos")
            SetTimeout(5000, function()
                vRPclient._stopAnim(source,false)
                tirostatus[user_id] = nil
            end)
        else
            TriggerClientEvent("Notify",source,"negado","Precisa de 1x Alcool")
        end
    end
end)


