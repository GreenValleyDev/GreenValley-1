-- local use_cfg_items = true
-- local use_cfg_inventory = true

-- local itemlist = {
	-- LISTA DE ITEM AQUI
-- }

-----------------------------------------------------------------------------------------------------------------------------------------
-- INVENTORY
-----------------------------------------------------------------------------------------------------------------------------------------

function vRP.itemBodyList(item)
	if items.list[item] then
		return items.list[item]
	end
end

function vRP.itemIndexList(item)
	if items.list[item] then
		return items.list[item].index
	end
end

function vRP.itemNameList(item)
	if items.list[item] then
		return items.list[item].name
	end
	return "Item Inexistente"
end

function vRP.itemTypeList(item)
	if items.list[item] then
		return items.list[item].type
	end
end

function vRP.itemAmmoList(item)
	if items.list[item] then
		return items.list[item].ammo
	end
end

-- if use_cfg_items then
-- 	vRP.items = {}
-- 	function vRP.defInventoryItem(idname,name,weight)
-- 		if weight == nil then
-- 			weight = 0
-- 		end
-- 		local item = { name = name, weight = weight }
-- 		vRP.items[idname] = item
-- 	end

-- 	function vRP.computeItemName(item,args)
-- 		if type(item.name) == "string" then
-- 			return item.name
-- 		else
-- 			return item.name(args)
-- 		end
-- 	end

-- 	function vRP.computeItemWeight(item,args)
-- 		if type(item.weight) == "number" then
-- 			return item.weight
-- 		else
-- 			return item.weight(args)
-- 		end
-- 	end

-- 	function vRP.parseItem(idname)
-- 		return splitString(idname,"|")
-- 	end

-- 	function vRP.getItemDefinition(idname)
-- 		local args = vRP.parseItem(idname)
-- 		local item = vRP.items[args[1]]
-- 		if item then
-- 			return vRP.computeItemName(item,args),vRP.computeItemWeight(item,args)
-- 		end
-- 		return nil,nil
-- 	end

-- 	function vRP.getItemName(idname)
-- 		local args = vRP.parseItem(idname)
-- 		local item = vRP.items[args[1]]
-- 		if item then
-- 			return vRP.computeItemName(item,args)
-- 		end
-- 		return args[1]
-- 	end

-- 	function vRP.getItemWeight(idname)
-- 		local args = vRP.parseItem(idname)
-- 		local item = vRP.items[args[1]]
-- 		if item then
-- 			return vRP.computeItemWeight(item,args)
-- 		end
-- 		return 0
-- 	end

-- 	function vRP.computeItemsWeight(items)
-- 		local weight = 0
-- 		for k,v in pairs(items) do
-- 			local iweight = vRP.getItemWeight(v.item)
-- 			weight = weight+iweight*v.amount
-- 		end
-- 		return weight
-- 	end
-- else
function vRP.getItemWeight(item)
		if items.list[item] then
			return items.list[item].weight
		end
	return 0
end

function vRP.getInventory(user_id)
	local data = vRP.user_tables[user_id]
	if data then
		return data.inventory
	end
	return false
end

function vRP.getInventoryMaxWeight(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data.backpack == nil then
		data.backpack = 5
	end
	return data.backpack
end

function vRP.setBackpack(user_id,amount)
	local data = vRP.getUserDataTable(user_id)
	if data then
		data.backpack = amount
	end
end

function vRP.getInventoryWeight(user_id)
	local weight = 0
	local inventory = vRP.getInventory(user_id)
	if inventory then
		for k,v in pairs(inventory) do
			if vRP.itemBodyList(v.item) then
				weight = weight + vRP.getItemWeight(v.item) * parseInt(v.amount)
			end
		end
		return weight
	end
	return 0
end

function vRP.computeChestWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		if vRP.itemBodyList(k) then
			weight = weight + vRP.getItemWeight(k) * parseInt(v.amount)
		end
	end
	return weight
end

function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname then
				return parseInt(v.amount)
			end
		end
	end
	return 0
end

function vRP.swapSlot(user_id,slot,target)
	local data = vRP.getInventory(user_id)
	if data then
		local temp = data[tostring(slot)]
		data[tostring(slot)] = data[tostring(target)]
		data[tostring(target)] = temp
	end
end

function vRP.giveInventoryItem(user_id,idname,amount,notify,slot)
	local data = vRP.getInventory(user_id)
	if data and parseInt(amount) > 0 then
		if not slot then
			local initial = 0
			repeat
				initial = initial + 1
			until data[tostring(initial)] == nil or (data[tostring(initial)] and data[tostring(initial)].item == idname)
			initial = tostring(initial)
			
			if data[initial] == nil then
				data[initial] = { item = idname, amount = parseInt(amount) }
			elseif data[initial] and data[initial].item == idname then
				data[initial].amount = parseInt(data[initial].amount) + parseInt(amount)
			end

			if vRP.itemBodyList(idname) then
				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
			end
		else
			slot = tostring(slot)

			if data[slot] then
				if data[slot].item == idname then
					local oldAmount = parseInt(data[slot].amount)
					data[slot] = { item = idname, amount = parseInt(oldAmount) + parseInt(amount) }
				end
			else
				data[slot] = { item = idname, amount = parseInt(amount) }
			end

			if notify and vRP.itemBodyList(idname) then
				TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
			end
		end
	end
end

function vRP.tryGetInventoryItem(user_id,idname,amount,notify,slot)
	local data = vRP.getInventory(user_id)
	if data then
		if not slot then
			for k,v in pairs(data) do
				if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
					v.amount = parseInt(v.amount) - parseInt(amount)

					if parseInt(v.amount) <= 0 then
						data[k] = nil
					end

					if vRP.itemBodyList(idname) then
						TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVIDO",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
					end
					return true
				end
			end
		else
			local slot = tostring(slot)

			if data[slot] and data[slot].item == idname and parseInt(data[slot].amount) >= parseInt(amount) then
				data[slot].amount = parseInt(data[slot].amount) - parseInt(amount)

				if parseInt(data[slot].amount) <= 0 then
					data[slot] = nil
				end

				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVIDO",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end
				return true
			end
		end
	end

	return false
end

function vRP.removeInventoryItem(user_id,idname,amount,notify)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
				v.amount = parseInt(v.amount) - parseInt(amount)

				if parseInt(v.amount) <= 0 then
					data[k] = nil
				end

				if vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVIDO",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end

				break
			end
		end
	end
end

local actived = {}
local activedAmount = {}
Citizen.CreateThread(function()
	while true do
		local fwTS = 500
		if actived then
			fwTS = 100 
			for k,v in pairs(actived) do
				if actived[k] > 0 then
					actived[k] = v - 1
					if actived[k] <= 0 then
						actived[k] = nil
					end
				end
			end
		end
		Citizen.Wait(fwTS)
	end
end)

function vRP.tryChestItem(user_id,chestData,itemName,amount,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		if data and items ~= nil then
			if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then

				if parseInt(amount) > 0 then
					activedAmount[user_id] = parseInt(amount)
				else
					activedAmount[user_id] = parseInt(items[itemName].amount)
				end

				local new_weight = vRP.getInventoryWeight(user_id) + vRP.getItemWeight(itemName) * parseInt(activedAmount[user_id])
				if new_weight <= vRP.getInventoryMaxWeight(user_id) then
					vRP.giveInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot)

					items[itemName].amount = parseInt(items[itemName].amount) - parseInt(activedAmount[user_id])

					if parseInt(items[itemName].amount) <= 0 then
						items[itemName] = nil
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end

function vRP.storeChestItem(user_id,chestData,itemName,amount,chestWeight,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local slot = tostring(slot)
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		if data and items ~= nil then

			if parseInt(amount) > 0 then
				activedAmount[user_id] = parseInt(amount)
			else
				local inv = vRP.getInventory(user_id)
				if inv[slot] then
					activedAmount[user_id] = parseInt(inv[slot].amount)
				end
			end

			local new_weight = vRP.computeChestWeight(items) + vRP.getItemWeight(itemName) * parseInt(activedAmount[user_id])
			if new_weight <= chestWeight then
				if vRP.tryGetInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot) then
					if items[itemName] ~= nil then
						items[itemName].amount = parseInt(items[itemName].amount) + parseInt(activedAmount[user_id])
					else
						items[itemName] = { amount = parseInt(activedAmount[user_id]) }
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end



RegisterServerEvent("clearInventoryTwo")
AddEventHandler("clearInventoryTwo",function(id)
    if id then
		local data = vRP.getUserDataTable(id)
		if data then
			data.inventory = {}
		end

		vRPclient._clearWeapons(id)
	end
end)

RegisterServerEvent("clearInventory")
AddEventHandler("clearInventory",function()
    local source = source
	local user_id = vRP.getUserId(source)
	
    if user_id then
        local data = vRP.getUserDataTable(user_id)
        if data then
            data.inventory = {}
        end

		TriggerEvent("statusobito",user_id, false)
        vRP.varyThirst(user_id,-50)
		vRP.varyHunger(user_id,-50)
        vRPclient._clearWeapons(source)
        vRPclient._setHandcuffed(source,false)

		if not vRP.hasPermission(user_id,"mochila.permissao") then
			vRP.execute('vRP/set_user_slots',{ user_id = user_id, slots = 15})
        	vRP.setExp(user_id,"physical","strength",20)
		end
    end
end)


AddEventHandler("vRP:playerJoin", function(user_id,source,name)
	local data = vRP.getUserDataTable(user_id)
	if not data.inventory then
		data.inventory = {}
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLES
-----------------------------------------------------------------------------------------------------------------------------------------



vRP.prepare("vRP/get_vehicle","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP.prepare("vRP/rem_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vRP/get_vehicles","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vRP/set_update_vehicles","UPDATE vrp_user_vehicles SET engine = @engine, body = @body, fuel = @fuel WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vRP/set_detido","UPDATE vrp_user_vehicles SET detido = @detido, time = @time WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vRP/set_ipva","UPDATE vrp_user_vehicles SET ipva = @ipva WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vRP/move_vehicle","UPDATE vrp_user_vehicles SET user_id = @nuser_id WHERE user_id = @user_id AND vehicle = @vehicle")
vRP.prepare("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,ipva) VALUES(@user_id,@vehicle,@ipva)")
vRP.prepare("vRP/con_maxvehs","SELECT COUNT(vehicle) as qtd FROM vrp_user_vehicles WHERE user_id = @user_id")
vRP.prepare("vRP/rem_srv_data","DELETE FROM vrp_srv_data WHERE dkey = @dkey")
vRP.prepare("vRP/get_estoque","SELECT * FROM vrp_estoque WHERE vehicle = @vehicle")
vRP.prepare("vRP/set_estoque","UPDATE vrp_estoque SET quantidade = @quantidade WHERE vehicle = @vehicle")
vRP.prepare("vRP/get_users","SELECT * FROM vrp_users WHERE id = @user_id")

--[ VEHICLEGLOBAL ]-------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleGlobal()
	return vehs.vehglobal
end

--[ VEHICLENAME ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleName(vname)
	if vehs.vehglobal[vname] ~= nil then
		return vehs.vehglobal[vname].name
	else
		return nil
	end
end

--[ VEHICLERENTALPRICE ]--------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleRentalPrice(vname)
	return vehs.vehglobal[vname].rentalPrice
end

--[ VEHICLECHEST ]--------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleChest(vname)
	return vehs.vehglobal[vname].mala
end

--[ VEHICLESLOT ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleSlot(vname)
	if vehs.vehglobal[vname].slots == nil then
		return 5
	end
	return vehs.vehglobal[vname].slots
end

--[ VEHICLEPRICE ]--------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehiclePrice(vname)
	if vehs.vehglobal[vname] ~= nil then
		return vehs.vehglobal[vname].price
	else
		return 0
	end
end

--[ VEHICLETYPE ]---------------------------------------------------------------------------------------------------------------------------------------

function vRP.vehicleType(vname)
	return vehs.vehglobal[vname].tipo or ""
end