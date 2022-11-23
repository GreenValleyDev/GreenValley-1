-- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!

vRP = {}
vRPexists = false

-- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!

local loadedC = false
local dataS = LoadResourceFile('vrp', 'lib/utils.lua')
if dataS ~= nil and type(dataS) == 'string' then		
    local e, r = load(dataS)
    print('^4[+] ^0Adicionando proxy a vRP ^3(1/3)')
    if e then
        e()
    end
end
if module ~= nil then
    print('^4[+] ^0Modules da ^3vRP ^0carregado ^3(2/3)') -- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!
    local Proxy = module('vrp','lib/Proxy') 
    vRP = Proxy.getInterface('vRP')
    if (vRP.getUserId and vRP.getSourceId and vRP.hasPermission and vRP.getUsers and vRP.setBanned) ~= nil then
        print('^4[+] ^0Funcoes encontradas, compatibilidade ativada. ^3(3/3)')
        vRPexists = true
    else 
        print('^1[-] ^0Funcoes inexistentes, incompatibildiade com a vRP.')
    end
else
    print('^1[-] ^0Module inexistente, incompatibilidade com a ^3vRP')
end

-- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!

getUser = function(source)
    return vRP.getUserId(source)
end

-- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!

getUsers = function()
    return vRP.getUsers()
end

-- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!

getSourceId = function(user_id) 
    return vRP.getUserSource(user_id)
end

-- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!

checkPermission = function(user_id,permission)
    return vRP.hasPermission(user_id,permission)
end

-- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!

function setBanned(user_id,status) 
    return vRP.setBanned(user_id, status)
end

-- NÃO MEXA!! SUA LICENÇA PODE SER DELETADA SE ALTERAR ALGO AQUI!


-- ARQUIVO SERÁ USADO EM BREVE!