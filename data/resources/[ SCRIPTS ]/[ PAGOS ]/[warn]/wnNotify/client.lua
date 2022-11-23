-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY CSS,MENSAGEM,TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Notify")
AddEventHandler("Notify",function(css,message,delay)
	if not delay then delay = 9000 end
	SendNUIMessage({ css = css,  message = message, delay = delay })
end)