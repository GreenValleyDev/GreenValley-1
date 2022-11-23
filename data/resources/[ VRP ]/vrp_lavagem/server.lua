local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
lav = {}
Tunnel.bindInterface("vrp_mafialavagem",lav)
local idgens = Tools.newIDGenerator()
local blips = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhooklavagemdedinheiro ="https://discord.com/api/webhooks/902779212002394142/IlMHF6MfJii0VW9IG0TH4Pii0TIEEcr9KVckJ2Bpg_BkwKVhV5ZP8UMAw6qfmqc1Ses3"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR DINHEIRO SUJO
-----------------------------------------------------------------------------------------------------------------------------------------
function lav.getAmount()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local answer = vRP.prompt(source, 'Insira a quantia de dinheiro sujo', '')
		if tonumber(answer) == '' or tonumber(answer) == " " or tonumber(answer) == ' ' or tonumber(answer) == nil then
			TriggerClientEvent("Notify",source,"negado","Informe um valor.") 
			return false
		end
		if tonumber(answer) <= vRP.getInventoryItemAmount(user_id,"dinheiro-sujo") then
			return tonumber(answer)
		end
	end
end

function lav.checkDinheiro(amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount <= vRP.getInventoryItemAmount(user_id,"dinheiro-sujo") then
			return true 
		end
	end
end

function lav.checkkeys()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"borrifador") >= 1 or vRP.getInventoryItemAmount(user_id,"alvejante") >= 1  then
			return true 
		else
			TriggerClientEvent("Notify",source,"negado","Você de <b>1x</b> <b>BORRIFADOR<b/> | <b>1x</b> <b>BORRIFADOR<b/>.") 
			return false
		end
	end
end

function lav.checkPayment(amount)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id,"dinheiro-sujo",amount) and vRP.tryGetInventoryItem(user_id,"borrifador",1) and vRP.tryGetInventoryItem(user_id,"alvejante",1) then
			local porc = (95*amount)/100
			vRP.giveInventoryItem(user_id,'dinheiro',parseInt(porc))
			TriggerClientEvent("Notify",source,"sucesso","Você lavou R$"..parseInt(porc)..".") 
      	end
   	end
end

function lav.inciarlavagemtk(id,x,y,z,head,amount)
	TriggerClientEvent('iniciandolavagem1',source,head,x,y,z,amount)
	vRPclient.setStandBY(source,parseInt(60))
end

function lav.checkpermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return (vRP.hasPermission(user_id,"galaxy.permissao") or vRP.hasPermission(user_id,"casino.permissao" ))
end

function lav.webhookmafia ()
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	return SendWebhookMessage(webhooklavagemdedinheiro,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n Quantidade de R$100,000 \r"..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
end