local Proxy = module("lib/Proxy")
local Tunnel = module("lib/Tunnel")

local config = module("zirix/others")
local base = module("zirix/base")

vRP = {}
Proxy.addInterface("vRP",vRP)

tvRP = {}
Tunnel.bindInterface("vRP",tvRP)
vRPclient = Tunnel.getInterface("vRP")

vRP.users = {}
vRP.rusers = {}
vRP.user_tables = {}
vRP.user_tmp_tables = {}
vRP.user_sources = {}

local db_drivers = {}
local db_driver
local cached_prepares = {}
local cached_queries = {}
local prepared_queries = {}
local db_initialized = false

function vRP.registerDBDriver(name,on_init,on_prepare,on_query)
	if not db_drivers[name] then
		db_drivers[name] = { on_init,on_prepare,on_query }

		if name == config.db.driver then
			db_driver = db_drivers[name]

			local ok = on_init(config.db)
			if ok then
				db_initialized = true
				for _,prepare in pairs(cached_prepares) do
					on_prepare(table.unpack(prepare,1,table.maxn(prepare)))
				end

				for _,query in pairs(cached_queries) do
					query[2](on_query(table.unpack(query[1],1,table.maxn(query[1]))))
				end

				cached_prepares = nil
				cached_queries = nil
			end
		end
	end
end

function vRP.format(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
end

function vRP.prepare(name,query)
	prepared_queries[name] = true

	if db_initialized then
		db_driver[2](name,query)
	else
		table.insert(cached_prepares,{ name,query })
	end
end

function vRP.query(name,params,mode)
	if not mode then mode = "query" end

	if db_initialized then
		return db_driver[3](name,params or {},mode)
	else
		local r = async()
		table.insert(cached_queries,{{ name,params or {},mode },r })
		return r:wait()
	end
end

function vRP.execute(name,params)
	return vRP.query(name,params,"execute")
end

vRP.prepare("vRP/create_user","INSERT INTO id_users(steam) VALUES(@steam)")
vRP.prepare("vRP/set_banned","UPDATE id_users SET banned = @banned WHERE steam = @steam")
vRP.prepare("vRP/set_whitelisted","UPDATE id_users SET whitelisted = @whitelist WHERE steam = @steam")
vRP.prepare("vRP/get_banned","SELECT banned FROM id_users WHERE steam = @steam")
vRP.prepare("vRP/get_whitelisted","SELECT whitelisted FROM id_users WHERE steam = @steam")
vRP.prepare("vRP/get_vrp_infos","SELECT * FROM id_users WHERE steam = @steam")
vRP.prepare("vRP/get_vrp_infos_id","SELECT * FROM id_users WHERE id = @id")
vRP.prepare("vRP/get_vrp_users","SELECT * FROM vrp_users WHERE id = @id")
vRP.prepare("vRP/get_vrp_registration","SELECT id FROM vrp_users WHERE registration = @registration")
vRP.prepare("vRP/get_vrp_phone","SELECT id FROM vrp_users WHERE phone = @phone")
vRP.prepare("vRP/get_characters","SELECT * FROM vrp_users WHERE steam = @steam and deleted = 0")
vRP.prepare("vRP/create_characters","INSERT INTO vrp_users(steam) VALUES(@steam)")
vRP.prepare("vRP/remove_characters","UPDATE vrp_users SET deleted = 1 WHERE id = @id")
vRP.prepare("vRP/update_characters","UPDATE vrp_user_identities SET registration = @registration, phone = @phone WHERE id = @id")
vRP.prepare("vRP/rename_characters","UPDATE vrp_user_identities SET name = @name, firstname = @name2 WHERE id = @id")
vRP.prepare("vRP/add_identifier","INSERT INTO vrp_user_ids(identifier,user_id) VALUES(@identifier,@user_id)")
vRP.prepare("vRP/userid_byidentifier","SELECT id FROM vrp_users WHERE steam = @identifier")
vRP.prepare("vRP/identifier_byuserid","SELECT steam FROM vrp_users WHERE id = @id")
vRP.prepare("vRP/set_userdata","REPLACE INTO vrp_user_data(user_id,dkey,dvalue) VALUES(@user_id,@key,@value)")
vRP.prepare("vRP/get_userdata","SELECT dvalue FROM vrp_user_data WHERE user_id = @user_id AND dkey = @key")
vRP.prepare("vRP/set_srvdata","REPLACE INTO vrp_srv_data(dkey,dvalue) VALUES(@key,@value)")
vRP.prepare("vRP/get_srvdata","SELECT dvalue FROM vrp_srv_data WHERE dkey = @key")
vRP.prepare("vRP/init_user_identity","INSERT IGNORE INTO vrp_user_identities(user_id,registration,phone,firstname,name,age) VALUES(@user_id,@registration,@phone,@firstname,@name,@age)")
vRP.prepare("nation_creator/createAgeColumn","ALTER TABLE vrp_user_identities ADD IF NOT EXISTS age INT(11) NOT NULL DEFAULT 20")
vRP.prepare("nation_creator/update_user_first_spawn","UPDATE vrp_user_identities SET firstname = @firstname, name = @name, age = @age WHERE user_id = @user_id")
vRP.prepare("nation_creator/create_characters","INSERT INTO vrp_users(steam) VALUES(@steam)")
vRP.prepare("nation_creator/remove_characters","UPDATE vrp_users SET deleted = 1 WHERE id = @id")
vRP.prepare("nation_creator/get_characters","SELECT * FROM vrp_users WHERE steam = @steam and deleted = 0")
vRP.prepare("nation_creator/get_character","SELECT * FROM vrp_users WHERE steam = @steam and deleted = 0 and id = @user_id")
vRP.prepare("nation_creator/get_charinfo","SELECT * FROM vrp_user_identities WHERE user_id = @user_id")


function vRP.getUserIdByIdentifier(ids)
	local rows = vRP.query("vRP/userid_byidentifier",{ identifier = ids})
	if #rows > 0 then
		return rows[1].user_id
	else
		return -1
	end
end


function vRP.getUserIdByIdentifiers(ids)
	if ids and #ids then
		for i=1,#ids do
			if (string.find(ids[i],"ip:") == nil) then
				local rows = vRP.query("vRP/userid_byidentifier",{ identifier = ids[i] })
				if #rows > 0 then
					return rows[1].id
				end
			end
		end
	end
end

function vRP.getPlayerEndpoint(player)
	return GetPlayerEP(player) or "0.0.0.0"
end

function vRP.isBanned(steam, cbr)
	local rows = vRP.query("vRP/get_banned",{ steam = steam })
	if #rows > 0 then
		return rows[1].banned
	else
		return false
	end
end

function vRP.isBanned(user_id, cbr)
	local rows = vRP.query("vRP/get_banned",{ user_id = user_id })
	if #rows > 0 then
		return rows[1].banned
	else
		return false
	end
end

function vRP.setBanned(data,banned)
	if tonumber(data) then 
		local steam = vRP.getIdentifierByUserId(parseInt(data))
		vRP.execute("vRP/set_banned",{ steam = steam, banned = banned })
		if banned then 
			print('[ INFO ] Banido '..data..' com steam '..steam..'.')
		else 
			print('[ INFO ] Desbanido '..data..' com steam '..steam..'.')
		end 
	elseif type(data) == 'string' then 
		vRP.execute("vRP/set_banned",{ steam = data, banned = banned })
		if banned then 
			print('[ INFO ] Banido steam '..steam..'.')
		else 
			print('[ INFO ] Desbanido steam '..steam..'.')
		end 
	end
end

function vRP.isWhitelisted(steam, cbr)
	local rows = vRP.query("vRP/get_whitelisted",{ steam = steam })
	if #rows > 0 then
		return rows[1].whitelisted
	else
		return false
	end
end

function vRP.setWhitelisted(data,whitelisted)
	if tonumber(data) then 
		local consult = vRP.query('vRP/get_vrp_infos_id', {id = parseInt(data)})[1]
		if consult then 
			vRP.execute("vRP/set_whitelisted",{ steam = consult.steam, whitelist = whitelisted })
		end
	elseif type(data) == 'string' then 
		vRP.execute("vRP/set_whitelisted",{ steam = steam, whitelist = whitelisted })
	end
end


function vRP.setUData(user_id,key,value)
	vRP.execute("vRP/set_userdata",{ user_id = user_id, key = key, value = value })
end

function vRP.getUData(user_id,key,cbr)
	local rows = vRP.query("vRP/get_userdata",{ user_id = user_id, key = key })
	if #rows > 0 then
		return rows[1].dvalue
	else
		return ""
	end
end

function vRP.setSData(key,value)
	vRP.execute("vRP/set_srvdata",{ key = key, value = value })
end

function vRP.getSData(key, cbr)
	local rows = vRP.query("vRP/get_srvdata",{ key = key })
	if #rows > 0 then
		return rows[1].dvalue
	else
		return ""
	end
end

function vRP.getUserDataTable(user_id)
	return vRP.user_tables[user_id]
end

function vRP.getUserTmpTable(user_id)
	return vRP.user_tmp_tables[user_id]
end

function vRP.getUserId(source)
	if source ~= nil then
		local ids = GetPlayerIdentifiers(source)
		if ids ~= nil and #ids > 0 then
			return vRP.users[vRP.getSteam(source)]
		end
	end
return nil
end

function vRP.getUsers()
	local users = {}
	for k,v in pairs(vRP.user_sources) do
		users[k] = v
	end
	return users
end

function vRP.getUserSource(user_id)
	return vRP.user_sources[user_id]
end

function vRP.kick(source,reason)
	DropPlayer(source,reason)
end

function vRP.dropPlayer(source)
	local source = source
	local user_id = vRP.getUserId(source)
	vRPclient._removePlayer(-1,source)
	if user_id then
		if user_id and source then
			local identity = vRP.getUserIdentity(user_id)
			PerformHttpRequest(base.exit, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = "REGISTRO DE SAIDA:\n⠀",thumbnail = {url = base.icon}, fields = {{name = "[ ID: **"..user_id.."** ][ IP: **"..vRP.getPlayerEndpoint(source).."** ]", value = "⠀\n⠀"}}, footer = {text = base.bottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = base.icon}, color = base.color}}}), { ['Content-Type'] = 'application/json' })
			
			for i = 1, #base.dropgroups do
				if vRP.hasGroup(user_id,base.dropgroups[i].inservice) then
					vRP.addUserGroup(user_id,base.dropgroups[i].offservice)
					PerformHttpRequest(base.dropgroups[i].webhook, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = identity.name.." saiu de serviço.", description = "Registro de Ponto. Registro de saída de serviço.\n⠀", thumbnail = {url = base.icon}, fields = {{name = "**IDENTIFICAÇÃO DO COLABORADOR:**", value = "**"..identity.name.." "..identity.firstname.."** [**"..user_id.."**]"}}, footer = {text = base.bottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = base.icon}, color = base.color}}}), { ['Content-Type'] = 'application/json' })
				end
			end

			if vRP.hasGroup(user_id,"coordenador") then
				vRP.addUserGroup(user_id,"off-coordenador")
				local office = "Coordenador"
				PerformHttpRequest(base.staffStats, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = "REGISTRO ADMINISTRATIVO:\n⠀", thumbnail = {url = base.icon }, fields = {{name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]", value = "⠀"}, {name = "**CARGO: **"..office, value = "⠀", inline = true }, {name = "**STATUS: **Saiu do modo administrativo.", value = "⠀", inline = true }}, footer = {text = base.bottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = base.icon}, color = base.color}}}), { ['Content-Type'] = 'application/json' })
			elseif vRP.hasGroup(user_id,"administrador") then
				vRP.addUserGroup(user_id,"off-administrador")
				local office = "Administrador"
				PerformHttpRequest(base.staffStats, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = "REGISTRO ADMINISTRATIVO:\n⠀", thumbnail = {url = base.icon}, fields = {{name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]", value = "⠀"}, {name = "**CARGO: **"..office, value = "⠀", inline = true}, {name = "**STATUS: **Saiu do modo administrativo.", value = "⠀", inline = true}}, footer = {text = base.bottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = base.icon}, color = base.color}}}), { ['Content-Type'] = 'application/json' })
			elseif vRP.hasGroup(user_id,"moderador") then
				vRP.addUserGroup(user_id,"off-moderador")
				local office = "Moderador"
				PerformHttpRequest(base.staffStats, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = "REGISTRO ADMINISTRATIVO:\n⠀", thumbnail = {url = base.icon}, fields = {{name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]", value = "⠀"}, {name = "**CARGO: **"..office, value = "⠀", inline = true}, {name = "**STATUS: **Saiu do modo administrativo.", value = "⠀", inline = true}}, footer = {text = base.bottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = base.icon}, color = base.color}}}), { ['Content-Type'] = 'application/json' })
			elseif vRP.hasGroup(user_id,"suporte") then
				vRP.addUserGroup(user_id,"off-suporte")
				local office = "Suporte"
				PerformHttpRequest(base.staffStats, function(err, text, headers) end, 'POST', json.encode({embeds = {{title = "REGISTRO ADMINISTRATIVO:\n⠀", thumbnail = {url = base.icon}, fields = {{name = "**IDENTIFICAÇÃO: "..identity.name.." "..identity.firstname.."** [**"..user_id.."**]", value = "⠀"}, {name = "**CARGO: **"..office, value = "⠀", inline = true}, {name = "**STATUS: **Saiu do modo administrativo.", value = "⠀", inline = true}}, footer = {text = base.bottomText..os.date("%d/%m/%Y | %H:%M:%S"), icon_url = base.icon}, color = base.color}}}), { ['Content-Type'] = 'application/json' })
			end
			TriggerEvent("vRP:playerLeave",user_id,source)
		end
		vRP.setUData(user_id,"vRP:datatable",json.encode(vRP.getUserDataTable(user_id)))
		vRP.users[vRP.rusers[user_id]] = nil
		vRP.rusers[user_id] = nil
		vRP.user_tables[user_id] = nil
		vRP.user_tmp_tables[user_id] = nil
		vRP.user_sources[user_id] = nil
	end
end

function task_save_datatables()
	SetTimeout(60000,task_save_datatables)
	TriggerEvent("vRP:save")
	for k,v in pairs(vRP.user_tables) do
		vRP.setUData(k,"vRP:datatable",json.encode(v))
	end
end

async(function()
	task_save_datatables()
end)

function vRP.getInfos(steam)
	return vRP.query("vRP/get_vrp_infos",{ steam = steam })
end

function vRP.getViceIdentifier(source)
	local identifiers = GetPlayerIdentifiers(source)
	achoudiscord = false
	achoulicense = false
	for k,v in ipairs(identifiers) do
		if string.sub(v,1,7) == "discord" then
			id = string.sub(v,9,string.len(v))
			if (string.len(id) % 2 == 0) then
				discordid = string.sub(id,1,string.len(id)/2)
			else
				discordid = string.sub(id,1,math.floor(string.len(id)/2))
			end
			achoudiscord = true
		end
		if string.sub(v,1,8) == "license:" then
			id = string.sub(v,9,string.len(v))
			if (string.len(id) % 2 == 0) then
				licenseid = string.sub(id,1,string.len(id)/2)
			else
				licenseid = string.sub(id,1,math.floor(string.len(id)/2))
			end
			achoulicense = true
		end
	end
	if achoudiscord and achoulicense then
		viceid = "base:"..discordid..licenseid
		return viceid
	end
end

function vRP.getSteam(source)
	local identifiers = GetPlayerIdentifiers(source)
	for k,v in ipairs(identifiers) do
		if string.sub(v,1,5) == "steam" then
			return v
		end
	end
end

RegisterServerEvent("baseModule:idLoaded")
AddEventHandler("baseModule:idLoaded",function(source,user_id,model,name,firstname,age)
	local source = source
	if vRP.rusers[user_id] == nil then

		local steam = vRP.getSteam(source)

		-- [TABELAS TEMPORARIAS BASE] --

		vRP.user_tables[user_id] = {}
		vRP.user_tmp_tables[user_id] = {}
		vRP.user_sources[user_id] = source
		vRP.initModuleGroup(user_id,source)
		vRP.initMoney(user_id)


		-- [PEGAR DO BANCO OS DADOS] --

		local sdata = vRP.getUData(user_id,"vRP:datatable")
		if sdata then
			local data = json.decode(sdata)
			if type(data) == "table" then vRP.user_tables[user_id] = data end

		end

		-- [CASO ESTEJA CRIANDO] --

		if model ~= nil then
			vRP.user_tables[user_id].position = { x = tonumber(-1033.67), y = tonumber(-2733.15), z = tonumber(13.76) }
			vRP.user_tables[user_id].weapons = {}
			vRP.user_tables[user_id].colete = 0
			vRP.user_tables[user_id].customization = {}
			vRP.user_tables[user_id].customization.modelhash = GetHashKey(model)
			vRP.user_tables[user_id].thirst = 100
			vRP.user_tables[user_id].hunger = 100
			vRP.user_tables[user_id].health = 400
			vRP.user_tables[user_id].inventory = {}
			vRP.user_tables[user_id].groups = {}
			vRP.user_tables[user_id].skin = GetHashKey(model)
			--vRP.user_tables[user_id].inventory["4"] = { item = "mochila", amount = 1 }
		end
		
		tvRP.initPlayerStatus(user_id,source,true)

		for k,v in pairs(vRP.user_sources) do
			vRPclient._addPlayer(source,v)
		end

		vRPclient._addPlayer(-1,source)

		if steam then
			vRP.users[steam] = user_id
			vRP.rusers[user_id] = steam
		end
		if name ~= nil and firstname ~= nil then
				vRP.execute("vRP/init_user_identity", { user_id = user_id, registration = vRP.generateRegistrationNumber(), phone = vRP.generatePhoneNumber(),firstname = firstname, name = name, age = age })
		end
		TriggerEvent("vRP:playerSpawn",user_id,source, true)
		print("[ BASE INFO ] { ID } "..user_id.." acabou de logar no servidor! { IP } "..GetPlayerEndpoint(source))
	end
end)

function vRP.updateSelectSkin(user_id,skin)
	vRP.user_tables[user_id].skin = skin
end


AddEventHandler("queue:playerConnecting",function(source,ids,name,setKickReason,deferrals)
	deferrals.defer()
	local source = source
	local steam = vRP.getSteam(source)
	-- local user_id = vRP.getUserId(source)
	if steam then
	
		local user_id = vRP.getUserIdByIdentifier(steam)
		local nsource = vRP.getUserSource(user_id)
		

		if not vRP.isBanned(steam) then
			if vRP.isWhitelisted(steam) then
				deferrals.done()
			else
				local newUser = vRP.getInfos(steam)
				local id = false
				if newUser[1] == nil then
					local consult = vRP.execute("vRP/create_user",{ steam = steam })
					if consult then 
						id = tonumber(consult)
					end 
				end
				deferrals.done("Você não possui visto na cidade! [ Envie sua STEAM em nosso discord: https://discord.gg/greenvalleyrp ][ STEAM: "..steam)
				TriggerEvent("queue:playerConnectingRemoveQueues",ids)
			end
		else
			deferrals.done("Você foi banido! [ Mais informações em: https://discord.gg/greenvalleyrp ] ")
			TriggerEvent("queue:playerConnectingRemoveQueues",ids)
		end
	else
		deferrals.done("Ocorreu um problema de identificação.")
		TriggerEvent("queue:playerConnectingRemoveQueues",ids)
	end
end)

function vRP.rejoinServer(source)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if identity then
			TriggerEvent("changeFirstspawn",user_id,true)
			vRP.dropPlayer(source)
		end
	end
end

function vRP.getImageURL()
	return base.imagesurl
end

AddEventHandler("playerDropped",function(reason)
	local source = source
	vRP.dropPlayer(source)
end)

RegisterServerEvent("vRPcli:playerSpawned")
AddEventHandler("vRPcli:playerSpawned",function()

	if first_spawn then
		for k,v in pairs(vRP.user_sources) do
			vRPclient._addPlayer(source,v)
		end
		vRPclient._addPlayer(-1,source)
		Tunnel.setDestDelay(source,0)
	end

	TriggerClientEvent("spawn:setupChars",source)
	-- TriggerClientEvent("hud:SetShow",true)
end)


function vRP.getDayHours(seconds)
    local days = math.floor(seconds/86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds/3600)

    if days > 0 then
        return string.format("<b>%d Dias</b> e <b>%d Horas</b>",days,hours)
    else
        return string.format("<b>%d Horas</b>",hours)
    end
end

function vRP.getMinSecs(seconds)
    local days = math.floor(seconds/86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds/3600)
    seconds = seconds - hours * 3600
    local minutes = math.floor(seconds/60)
    seconds = seconds - minutes * 60

    if minutes > 0 then
        return string.format("<b>%d Minutos</b> e <b>%d Segundos</b>",minutes,seconds)
    else
        return string.format("<b>%d Segundos</b>",seconds)
    end
end

AddEventHandler("playerDropped", function(reason) 
	print("[ BASE INFO ]  { IP } "..GetPlayerEndpoint(source).." Quitou!")
    print(GetPlayerName(source), "ESTA DEIXANDO A CIDADE!")
 end)
