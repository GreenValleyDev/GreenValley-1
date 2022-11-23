cfg = {}

--[[
    As coordenadas devem ser em vector3 {{
        Caso você não saiba pegar as coordenadas em vector3 adicione esse comando na sua base

        RegisterCommand('vec',function(source,args,rawCommand)
            local user_id = vRP.getUserId(source)
            if vRP.hasPermission(user_id,"suaperm.permissao")then
                local x,y,z = vRPclient.getPosition(source)
                vRP.prompt(source,"Cordenadas:",'vector3('..tD(x)..", "..tD(y)..", "..tD(z)..")")
            end
        end)
    }}
    Acess é para dizer se o blip vai aparecer ou não;
    A permissão é por andar, por exemplo na policia, recrutas só podem acessar o 1º andar, altas pantentes podem ir até o resto;
]]

cfg.elevadores = {
    ['cassino'] = { 
        {vector3(982.75,55.52,116.17), acess = true, perm = 'elevador.permissao' },
        {vector3(964.87,58.5,112.56), acess = true, perm = 'elevador.permissao'},
        {vector3(978.88,38.13,91.44), acess = true, perm = 'elevador.permissao'},
        {vector3(977.79,74.41,70.24), acess = true, perm = 'elevador.permissao'},
        {vector3(967.57,16.19,59.84), acess = true, perm = 'elevador.permissao'},
    },
    ['dp'] = {
        {vector3(2497.36,-349.2,105.7),acess = true,perm = 'elevador.permissao'},
        {vector3(2497.17,-349.45,101.9), acess = true,perm = 'elevador.permissao'},
        {vector3(2497.16,-349.39,94.1), acess = true,perm = 'elevador.permissao'},
    },
    ['hp_one'] = {
        {vector3(-436.02,-359.78,34.95),acess = true,perm = 'elevador.permissao'},
        {vector3(-418.87,-344.86,24.24), acess = true,perm = 'elevador.permissao'},
    },
    ['hp_two'] = {
        {vector3(-440.53,-332.07,78.17),acess = true,perm = 'elevador.permissao'},
        {vector3(-490.54,-327.89,42.31), acess = true,perm = 'elevador.permissao'},
        {vector3(-452.28,-288.38,34.95), acess = true,perm = 'elevador.permissao'},
    },
}