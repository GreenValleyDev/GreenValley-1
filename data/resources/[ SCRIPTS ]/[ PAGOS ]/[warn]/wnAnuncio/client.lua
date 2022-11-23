-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY CSS,MENSAGEM,TEMPO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("Anuncio")
AddEventHandler("Anuncio",function(css,message,delay)
	if not delay then delay = 15000 end
	SendNUIMessage({ css = css, tipo = tipo, message = message, delay = delay })
end)
