-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
---------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
---------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("Ca_rotas", src)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
config = module("Ca_rotas", "cfg/config")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK RANDOM ROUTE
-----------------------------------------------------------------------------------------------------------------------------------------
function src.randomRoute()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.request(source, "Deseja sua rota?   [Y] Aleatória   [N] Sequencial", 15)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPermission(perm)
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id, perm)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkPayment(rewards)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k, v in pairs(rewards) do
			if vRP.getInventoryWeight(user_id) + vRP.getItemWeight(k) * v <= vRP.getInventoryMaxWeight(user_id) then
				vRP.giveInventoryItem(user_id, k, v)
			else
				TriggerClientEvent("Notify", source, "negado", "Atenção, seu inventário está cheio.")
				return false
			end
		end
		return true
	end
end
