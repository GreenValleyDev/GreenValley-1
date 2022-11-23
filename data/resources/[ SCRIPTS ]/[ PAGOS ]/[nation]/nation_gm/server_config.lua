Proxy = module("vrp", "lib/Proxy")
Tunnel = module("vrp", "lib/Tunnel")
vRP = Proxy.getInterface("vRP")
func = {}
Tunnel.bindInterface("nation_gm", func)
fclient = Tunnel.getInterface("nation_gm")
vRP_groups = module("vrp", "zirix/groups").groups
config = {}
groups = {}


-- vc deve configurar as organizações de acordo com os grupos da sua base, deixei 2 exemplos de como fazer
-- a ordem é hirarquica (do maior cargo para o menor dentro da organização)
-- por padrão, o painel só funciona com grupos do tipo job (vc consegue ver no seu vrp/cfg/groups.lua), portanto não funciona com grupos de staff

config.groups = {
    ["hospital"] = { -- nome da organização
        [1] = { onService = "diretor", outService = "off-diretor", access = true }, -- grupo com o cargo mais alto (em serviço e fora de serviço, caso não tenha um grupo fora de serviço, deixe o mesmo para ambos)
        [2] = { onService = "medico", outService = "off-medico", access = true }, -- coloque access true para fazer com que o cargo consiga abrir o painel tbm (tipo um sublider que vai conseguir gerenciar membros com cargos menores)
        [3] = { onService = "enfermeiro", outService = "off-enfermeiro", access = false },
        [4] = { onService = "psicologo", outService = "off-psicologo", access = false },
        [5] = { onService = "paramedico", outService = "off-paramedico", access = false },

    },
    ["policia"] = {
        [1] = { onService = "comandantegeral", outService = "paisana-comandantegeral", access = true },
        [2] = { onService = "policia", outService = "paisana-policia", access = true },

    },
    ["mafia"] = {
        [1] = { onService = "lmafia", outService = "lmafia", access = true },
        [2] = { onService = "mafia", outService = "mafia"},
    },
    ["milicia"] = {
        [1] = { onService = "lmilicia", outService = "lmilicia", access = true },
        [2] = { onService = "milicia", outService = "milicia"},
    },
    ["vermelhos"] = {
        [1] = { onService = "lvermelhos", outService = "lvermelhos", access = true },
        [2] = { onService = "vermelhos", outService = "vermelhos"},
    },
    ["azul"] = {
        [1] = { onService = "lazul", outService = "lazul", access = true },
        [2] = { onService = "azul", outService = "azul"},
    },
    ["verdes"] = {
        [1] = { onService = "lverdes", outService = "lverdes", access = true },
        [2] = { onService = "verdes", outService = "verdes"},
    },
    ["amarelos"] = {
        [1] = { onService = "lamarelos", outService = "lamarelos", access = true },
        [2] = { onService = "amarelos", outService = "amarelos"},
    },
    ["roxos"] = {
        [1] = { onService = "lroxos", outService = "lroxos", access = true },
        [2] = { onService = "roxos", outService = "roxos"},
    },
    ["motoclub"] = {
        [1] = { onService = "lmotoclub", outService = "lmotoclub", access = true },
        [2] = { onService = "motoclub", outService = "motoclub"},
    },
    ["driftking"] = {
        [1] = { onService = "ldk", outService = "ldk", access = true },
        [2] = { onService = "dk", outService = "dk"},
    },
    ["vanilla"] = {
        [1] = { onService = "lvanilla", outService = "lvanilla", access = true },
        [2] = { onService = "vanilla", outService = "vanilla"},
    },
    ["bahamas"] = {
        [1] = { onService = "lbahamas", outService = "lbahamas", access = true },
        [2] = { onService = "bahamas", outService = "bahamas"},
    },
    ["mecanica"] = {
        [1] = { onService = "chefe", outService = "off-chefe", access = true },
        [2] = { onService = "gerente", outService = "off-gerente"},
        [3] = { onService = "mecanico", outService = "off-mecanico"},
        [4] = { onService = "ajudante", outService = "off-ajudante"},
    },
}

local limits = { -- limite de membro por organização
    ["hospital"] = 1000,
    ["policia"] = 1000,
    ["mafia"] = 25,
    ["vermelhos"] = 25,
    ["azul"] = 25,
    ["amarelos"] = 25,
    ["brancos"] = 25,
    ["serpentes"] = 25,
    ["motoclub"] = 25,
    ["mercenarios"] = 25,
    ["vanilla"] = 25,
    ["bahamas"] = 25,
    ["galaxy"] = 25,
    ["verdes"] = 25,
    ["milicia"] = 25,
    ["italiana"] = 25,
    ["b13"] = 25,
    ["mecanica"] = 25,
}

config.admin_permission = "manager.permissao"

local webhook = "" -- link do webhook do discord


vRP._prepare("nation_gm/getAllDataTables","SELECT * FROM vrp_user_data WHERE dkey = 'vRP:datatable'")
vRP._prepare("nation_gm/getUserBlacklist", "SELECT * FROM gm_blacklist WHERE user_id = @user_id")
vRP._prepare("nation_gm/updateUserBlacklist", "UPDATE gm_blacklist SET data = @data WHERE user_id = @user_id")
vRP._prepare("nation_gm/setUserBlacklist", "INSERT INTO gm_blacklist(user_id, data) VALUES(@user_id, @data)")
vRP._prepare("nation_gm/removeBlackListUsers", "DELETE FROM gm_blacklist WHERE data + 0 * 24 * 60 * 60 <= @data") -- por padrão são 2 dias de blacklist
vRP._prepare("nation_gm/createDB", [[CREATE TABLE IF NOT EXISTS `gm_blacklist` (
	`user_id` INT(11) NOT NULL DEFAULT '0',
	`data` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`user_id`) USING BTREE)
    COLLATE='latin1_swedish_ci'
    ENGINE=InnoDB;]]
)


function removeBlackListUsers()
    vRP.execute("nation_gm/removeBlackListUsers", { data = parseInt(os.time())} )
end

function isUserInBlacklist(user_id)
    return user_id and #vRP.query("nation_gm/getUserBlacklist", { user_id = user_id }) > 0
end

--[[function setUserInBlacklist(user_id)
    if not user_id then return end
    if isUserInBlacklist(user_id) then
        vRP.execute("nation_gm/updateUserBlacklist", { user_id = user_id, data = parseInt(os.time()) })
    else
        vRP.execute("nation_gm/setUserBlacklist", { user_id = user_id, data = parseInt(os.time()) })
    end
end]]

function SendWebhookMessage(webhook,message)
    if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

Citizen.CreateThread(function()
    vRP._execute("nation_gm/createDB")
    for org in pairs(config.groups) do
        groups[org] = {}
    end
    local dataTables = vRP.query("nation_gm/getAllDataTables")
    for i, t in ipairs(dataTables) do
        local dataTable = json.decode(t.dvalue or {})
        if dataTable and dataTable.groups then
            local userOrg, userGroup = getUserInfo(dataTable.groups)
            if userOrg and userGroup then
                table.insert(groups[userOrg], { user_id = t.user_id,  group = userGroup or "none" })
            end
        end
    end
    removeBlackListUsers()
end)




function getUserInfo(userGroups)
    for org, t in pairs(config.groups) do 
        for i, v in ipairs(t) do
            if hasUserGroup(userGroups, v.onService) then
                return org, v.onService
            elseif hasUserGroup(userGroups, v.outService) then
                return org, v.outService
            end
        end
    end
end



function getServiceGroup(org,outService)
    if config.groups[org] then
        for i, t in ipairs(config.groups[org]) do
            if outService == t.outService or outService == t.onService then
                return t.onService
            end
        end
    end
    return false
end

function isUserInService(user_id)
    if not user_id or not vRP.getUserSource(user_id) then
        return false
    end
    local userOrg = getUserOrg(user_id)
    local group = getUserGroup(user_id)
    if userOrg and group then
        for i, t in ipairs(config.groups[userOrg]) do
            if group == t.onService then
                return true
            end
        end
    end
    return false
end




function getUserData(user_id, group)
    local identity = vRP.getUserIdentity(user_id)
    if identity then
        local name = identity.name.." "..identity.firstname
        local phone = identity.phone
        local org = getOrgByGroup(group)
        local group = getServiceGroup(org,group) or group
        local groupIndex = getGroupIndex(group)
        group = vRP.getGroupTitle(group) or group
        local inService = isUserInService(user_id)
        local rg = identity.registration 
        local age = identity.age
        return { user_id = user_id, name = name, phone = phone, group = group or "none", service = inService, age = age, rg = rg, groupIndex = groupIndex }
    end
end

function func.getUserInfo(user_id)
    local group = getUserGroup(user_id)
    local info = getUserData(user_id, group)
    return info
end


function getUserOrg(user_id)
    local userGroup = getUserGroup(user_id)
    for org, t in pairs(config.groups) do
        for i, v in ipairs(t) do
            if v.onService == userGroup or v.outService == userGroup then
                return org, user_id
            end
        end
    end
    return false
end

function func.getUserOrg(user_id)
    local source = source
    local user_id = user_id or vRP.getUserId(source)
    local userGroup = getUserGroup(user_id)
    for org, t in pairs(config.groups) do
        if config.groups[org][1].onService == userGroup or config.groups[org][1].outService == userGroup then
            return org, user_id
        else
            for k,v in ipairs(t) do
                if v.access and (userGroup == v.onService or userGroup == v.outService) then
                    return org, user_id
                end
            end
        end
    end
    return false
end


function getUserGroupByType(user_id,gtype)
	local user_groups = vRP.getUserGroups(user_id)
	for k,v in pairs(user_groups) do
		local kgroup = vRP_groups[k]
		if kgroup then
			if kgroup._config and kgroup._config.gtype and kgroup._config.gtype == gtype then
				return k
			end
		end
	end
	return ""
end


function func.getOrgInfo(orgName)
    local org = {}
    if groups[orgName] then
        for i,t in ipairs(groups[orgName]) do
            local user_id = t.user_id
            local group = t.group
            local info = getUserData(user_id, group)
            table.insert(org, info)
        end
        table.sort(org, function(a, b) return a.user_id < b.user_id end)
    end
    return org
end

function getUserGroup(user_id)
    local src = vRP.getUserSource(user_id)
    if src then
        local dataTable = vRP.getUserDataTable(user_id)
        local org, group = getUserInfo(dataTable.groups)
        if not group then
            group = getUserGroupByType(user_id,"job")
        end
        return group
    else
        local dataTable = json.decode(vRP.getUData(user_id,"vRP:datatable") or {})
        if dataTable and dataTable.groups then
            local org, group = getUserInfo(dataTable.groups)
            if not group then
                for k,v in pairs(dataTable.groups) do
                    local kgroup = vRP_groups[k]
                    if kgroup then
                        if kgroup._config and kgroup._config.gtype and kgroup._config.gtype == "job" then
                            group = k
                            break
                        end
                    end
                end
            end
            return group
        end
    end
    return false
end

function getOrgByGroup(group)
    for org, t in pairs(config.groups) do
        for i, v in ipairs(t) do
            if group == v.onService or group == v.outService then
                return org
            end
        end
    end
    return false
end


function hasUserGroup(userGroups,group)
    if userGroups[group] then return true end
    return false
end


function getUserTempOrg(user_id)
    for org, t in pairs(groups) do
        for i,v in ipairs(t) do
            if v.user_id == user_id then
                return org, i
            end
        end
    end
end


function getGroupIndex(group)
    for org, t in pairs(config.groups) do
        for i,v in ipairs(t) do
            if v.onService == group or v.outService == group then
                return i
            end
        end
    end
end



function func.getSelectedGroup(type, group, org)
    local source = source or 0
    local user_id = vRP.getUserId(source)
    if not group then
        group = getUserGroup(user_id)
        org = getOrgByGroup(group)
        group = getServiceGroup(org,group)
    end
    if groups[org] then
        local promoteGroup = group
        local groupIndex = #config.groups[org]
        for i, t in ipairs(config.groups[org]) do
            if group == t.onService then
                groupIndex = i 
                break
            end
        end
        if type == "promote" then
            if groupIndex == 1 then
                return false
            end
            groupIndex = groupIndex-1
        elseif type == "demote" then
            if groupIndex == #config.groups[org] then
                return false
            end
            groupIndex = groupIndex+1
        end
        promoteGroup = config.groups[org][groupIndex].onService
        return promoteGroup, vRP.getGroupTitle(promoteGroup)
    end
    return false
end





local manageTypes = {
    recruit = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            if userOrg then
                return {success = false, title = "Cidadão já está em uma organização", text = ""}
            elseif isUserInBlacklist(user_id) then
                return {success = false, title = "Cidadão na blacklist", text = ""}
            end
            local i = #config.groups[org]
            local group = config.groups[org][i].onService
          
            local src = vRP.getUserSource(user_id)
            if src then
                if not vRP.hasGroup(user_id,group) then
                    Citizen.CreateThread(function()
                        if vRP.request(src,"Você aceita fazer parte da organização <b>"..string.upper(org).."</b> ?", 30) then
                            vRP.addUserGroup(user_id, group)
                            TriggerClientEvent("Notify", source, "importante", "O passaporte <b>"..user_id.."</b> aceitou a solicitação para entrar na organização.")
                            TriggerClientEvent("Notify", src, "importante", "Você entrou para a organização <b>"..string.upper(org).."</b>.")
                            fclient.updateGM(source)
                            local nuser_id = vRP.getUserId(source)
                            local gtitle = vRP.getGroupTitle(group)
                            SendWebhookMessage(webhook,"```prolog\n[ID]: "..nuser_id.."\n[RECRUTOU ID]: "..user_id.."\n[ORGANIZAÇÃO]: "..string.upper(org).."\n[CARGO]: "..string.upper(gtitle).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                        else
                            TriggerClientEvent("Notify", source, "aviso", "O passaporte <b>"..user_id.."</b> recusou a solicitação para entrar na organização.")
                        end
                    end)
                    return {success = true, title = "Solicitação enviada com sucesso!", text = ""}
                end
            else
                return {success = false, title = "Cidadão fora da cidade!", text = ""}
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    promove = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local i = getGroupIndex(getUserGroup(user_id))
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local promoteGroup, groupTitle = func.getSelectedGroup("promote",userGroup, userOrg)
                if promoteGroup then
                    local title = "Sucesso!"
                    local text = name.." #"..user_id.." promovido para o cargo de "..string.upper(groupTitle or promoteGroup)
                    local src = vRP.getUserSource(user_id)
                    if src then
                        vRP.addUserGroup(user_id, promoteGroup)
                        TriggerClientEvent("Notify", src, "importante", "Você foi promovido para <b>"..string.upper(groupTitle or promoteGroup).."</b>.")
                        fclient.updateGM(source)
                        local nuser_id = vRP.getUserId(source)
                        local gtitle = vRP.getGroupTitle(promoteGroup)
                        SendWebhookMessage(webhook,"```prolog\n[ID]: "..nuser_id.."\n[PROMOVEU ID]: "..user_id.."\n[ORGANIZAÇÃO]: "..string.upper(org).."\n[CARGO]: "..string.upper(gtitle).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                        return {success = true, title = title, text = text}
                    else
                        local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                        if dataTable and dataTable.groups then
                            local group = getUserGroup(user_id)
                            if group and dataTable.groups[group] then
                                dataTable.groups[group] = nil
                                dataTable.groups[promoteGroup] = true
                                vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                                removePlayerFromOrg(user_id, org)
                                addPlayerToOrg(user_id, org)
                                fclient.updateGM(source)
                                local nuser_id = vRP.getUserId(source)
                                local gtitle = vRP.getGroupTitle(promoteGroup)
                                SendWebhookMessage(webhook,"```prolog\n[ID]: "..nuser_id.."\n[PROMOVEU ID]: "..user_id.."\n[ORGANIZAÇÃO]: "..string.upper(org).."\n[CARGO]: "..string.upper(gtitle).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                return {success = true, title = title, text = text}
                            end
                        end
                    end
                else
                    local title = "Erro!"
                    local text = "Cargo máximo já atingido!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    demote = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local group = getUserGroup(user_id)
            local i = getGroupIndex(group)
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local demoteGroup, groupTitle = func.getSelectedGroup("demote",userGroup, userOrg)
                if demoteGroup then
                    local title = "Sucesso!"
                    local text = name.." #"..user_id.." rebaixado para o cargo de "..string.upper(groupTitle or demoteGroup)
                    local src = vRP.getUserSource(user_id)
                    if src then
                        vRP.addUserGroup(user_id, demoteGroup)
                        TriggerClientEvent("Notify", src, "importante", "Você foi rebaixado para <b>"..string.upper(groupTitle or demoteGroup).."</b>.")
                        if user_id == vRP.getUserId(source) then
                            fclient.closeNui(source)
                        else
                            fclient.updateGM(source)
                        end
                        local nuser_id = vRP.getUserId(source)
                        local gtitle = vRP.getGroupTitle(demoteGroup)
                        SendWebhookMessage(webhook,"```prolog\n[ID]: "..nuser_id.."\n[REBAIXOU ID]: "..user_id.."\n[ORGANIZAÇÃO]: "..string.upper(org).."\n[CARGO]: "..string.upper(gtitle).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                        return {success = true, title = title, text = text, close = user_id == vRP.getUserId(source)}
                    else
                        local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                        if dataTable and dataTable.groups then
                            if group and dataTable.groups[group] then
                                dataTable.groups[group] = nil
                                dataTable.groups[demoteGroup] = true
                                vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                                removePlayerFromOrg(user_id, org)
                                addPlayerToOrg(user_id, org)
                                fclient.updateGM(source)
                                local nuser_id = vRP.getUserId(source)
                                local gtitle = vRP.getGroupTitle(demoteGroup)
                                SendWebhookMessage(webhook,"```prolog\n[ID]: "..nuser_id.."\n[REBAIXOU ID]: "..user_id.."\n[ORGANIZAÇÃO]: "..string.upper(org).."\n[CARGO]: "..string.upper(gtitle).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                                return {success = true, title = title, text = text}
                            end
                        end
                    end
                else
                    local title = "Erro!"
                    local text = "Cargo mínimo já identificado!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    dismiss = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            if not userOrg or userOrg ~= org then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            elseif user_id == vRP.getUserId(source) then
                return {success = false, title = "Você não pode se demitir!", text = ""}
            end
            local group = getUserGroup(user_id)
            local src = vRP.getUserSource(user_id)
            if src then
                if group then
                    vRP.removeUserGroup(user_id, group)
                end
                TriggerClientEvent("Notify", source, "importante", "O passaporte <b>"..user_id.."</b> não faz mais parte da organização.")
                TriggerClientEvent("Notify", src, "importante", "Você foi demitido da organização <b>"..string.upper(org).."</b>.")
                fclient.updateGM(source)
                local nuser_id = vRP.getUserId(source)
                local gtitle = vRP.getGroupTitle(group)
                setUserInBlacklist(user_id)
                SendWebhookMessage(webhook,"```prolog\n[ID]: "..nuser_id.."\n[DEMITIU ID]: "..user_id.."\n[ORGANIZAÇÃO]: "..string.upper(org).."\n[CARGO]: "..string.upper(gtitle).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                return {success = true, title = "Sucesso!", text = "Passaporte "..user_id.." demitido com sucesso!"}
            else
                local dataTable = json.decode(vRP.getUData(user_id, "vRP:datatable") or {})
                if dataTable and dataTable.groups then
                    if group and dataTable.groups[group] then
                        dataTable.groups[group] = nil
                        vRP._setUData(user_id, "vRP:datatable", json.encode(dataTable))
                        removePlayerFromOrg(user_id, org)
                        fclient.updateGM(source)
                        local nuser_id = vRP.getUserId(source)
                        local gtitle = vRP.getGroupTitle(group)
                        setUserInBlacklist(user_id)
                        SendWebhookMessage(webhook,"```prolog\n[ID]: "..nuser_id.."\n[DEMITIU ID]: "..user_id.."\n[ORGANIZAÇÃO]: "..string.upper(org).."\n[CARGO]: "..string.upper(gtitle).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                        return {success = true, title = "Sucesso!", text = "Passaporte #"..user_id.." demitido com sucesso!"}
                    else
                        return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
                    end
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,
}



function func.managePlayer(player_id, type, adminOrg)
    local source = source
    local user_id = vRP.getUserId(source)
    local org = adminOrg or func.getUserOrg(user_id)
    if vRP.hasPermission(user_id,config.admin_permission) or (org and player_id and type) then
        if manageTypes[type] then
            return manageTypes[type](player_id, org or func.getUserOrg(player_id), source)
        end
    end
    return {success = false, title = "Erro!", text = ""}
end





local serverResponses = {
    recruit = function(user_id, org, source)
        local userOrg = getUserTempOrg(user_id)
        if userOrg and userOrg == org then
            return {success = false, title = "Cidadão já está na organização", text = ""}
        elseif not vRP.getUserSource(user_id) then
            return {success = false, title = "Cidadão fora da cidade!", text = ""}
        elseif isUserInBlacklist(user_id) then
            return {success = false, title = "Cidadão na blacklist", text = ""}
        elseif #groups[org] >= (limits[org] or limits.default) then
            return {success = false, title = "Organização cheia!", text = ""}
        end
        local identity = vRP.getUserIdentity(user_id)
        if identity then
            local title = "Confirmação de Recrutamento"
            local name = string.upper(identity.name.." "..identity.firstname)
            local text = "Deseja admitir "..name.." #"..user_id.." ?"
            return {success = true, title = title, text = text}
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    promove = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local nuser_id = vRP.getUserId(source)
            local i,j = getGroupIndex(getUserGroup(user_id)), getGroupIndex(getUserGroup(nuser_id))
            local hasPermission = vRP.hasPermission(nuser_id,config.admin_permission) or (j < i)
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            elseif not hasPermission then
                return {success = false, title = "Sem permissão!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local promoteGroup, groupTitle = func.getSelectedGroup("promote",userGroup, userOrg)
                if promoteGroup then
                    local title = "Confirmação de Promoção"
                    local text = "Deseja promover "..name.." #"..user_id.." para o cargo de "..string.upper(groupTitle or promoteGroup).." ?"
                    return {success = true, title = title, text = text}
                else
                    local title = "Erro!"
                    local text = "Cargo máximo já atingido!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    demote = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local nuser_id = vRP.getUserId(source)
            local i,j = getGroupIndex(getUserGroup(user_id)), getGroupIndex(getUserGroup(nuser_id))
            local hasPermission = vRP.hasPermission(nuser_id,config.admin_permission) or (j < i or user_id == nuser_id)
            if not userOrg or userOrg ~= org or not i then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            elseif not hasPermission then
                return {success = false, title = "Sem permissão!", text = ""}
            end
            local userGroup = config.groups[userOrg][i].onService
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local name = string.upper(identity.name.." "..identity.firstname)
                local demoteGroup, groupTitle = func.getSelectedGroup("demote",userGroup, userOrg)
                if demoteGroup then
                    local title = "Confirmação de Rebaixamento"
                    local text = "Deseja rebaixar "..name.." #"..user_id.." para o cargo de "..string.upper(groupTitle or demoteGroup).." ?"
                    return {success = true, title = title, text = text}
                else
                    local title = "Erro!"
                    local text = "Cargo mínimo já identificado!"
                    return {success = false, title = title, text = text}
                end
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,

    dismiss = function(user_id, org, source)
        if groups[org] then
            local userOrg = getUserTempOrg(user_id)
            local nuser_id = vRP.getUserId(source)
            local i,j = getGroupIndex(getUserGroup(user_id)), getGroupIndex(getUserGroup(nuser_id))
            local hasPermission = vRP.hasPermission(nuser_id,config.admin_permission) or (j < i or user_id == nuser_id)
            if not userOrg or userOrg ~= org  then
                return {success = false, title = "Cidadão não faz parte da organização!", text = ""}
            elseif user_id == nuser_id then
                return {success = false, title = "Você não pode se demitir!", text = ""}
            elseif not hasPermission then
                return {success = false, title = "Sem permissão!", text = ""}
            end
            local identity = vRP.getUserIdentity(user_id)
            if identity then
                local title = "Confirmação de Demissão"
                local name = string.upper(identity.name.." "..identity.firstname)
                local text = "Deseja demitir "..name.." #"..user_id.." ?"
                return {success = true, title = title, text = text}
            end
        end
        return {success = false, title = "Erro!", text = ""}
    end,
}

function func.getServerResponse(player_id, type, adminOrg)
    local source = source
    local user_id = vRP.getUserId(source)
    local org = adminOrg or func.getUserOrg(user_id)
    if vRP.hasPermission(user_id,config.admin_permission) or (org and player_id and type) then
        if serverResponses[type] then
            return serverResponses[type](player_id, org or func.getUserOrg(player_id), source)
        end
    end
    return {success = false, title = "Erro!", text = ""}
end



function addPlayerToOrg(user_id, org)
    local userGroup = getUserGroup(user_id)
    local org = org or getOrgByGroup(userGroup)
    local tempOrg = getUserTempOrg(user_id)
    if userGroup and org and groups[org] and tempOrg ~= org then
        userGroup = getServiceGroup(org,userGroup) or userGroup
        table.insert(groups[org], { user_id = user_id, group = userGroup or "none" })
        -- print("ID "..user_id.." colocado na org "..org)
        return true
    end
    return false
end

function removePlayerFromOrg(user_id, org)
    local userGroup = getUserGroup(user_id)
    local org = org or getOrgByGroup(userGroup)
    local userTempOrg, i = getUserTempOrg(user_id)
    if groups[org] and userTempOrg and org == userTempOrg and i and groups[org][i] then
        table.remove(groups[org], i)
        -- print("ID "..user_id.." removido dar org "..org)
        return true
    end
    return false
end



function func.getAdminOrg()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,config.admin_permission) then
        local org = vRP.prompt(source,"Digite a organização: ","")
        if org and groups[org] then
            return org,user_id
        else
            TriggerClientEvent("Notify",source,"negado","Organização inexistente.")
        end
    end
    return false
end


 AddEventHandler('vRP:playerJoinGroup',function(user_id,group,gtype)
    if user_id and group and gtype and gtype == "job" then
        addPlayerToOrg(user_id, getOrgByGroup(group))
    end
 end)

 AddEventHandler('vRP:playerLeaveGroup',function(user_id,group,gtype)
    if user_id and group and gtype and gtype == "job" then
        removePlayerFromOrg(user_id, getOrgByGroup(group))
    end
 end)




