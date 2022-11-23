-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local radar = {
	shown = false,
	freeze = false,
	info = "INICIANDO O SISTEMA DO <b>RADAR</b> 1",
	info2 = "INICIANDO O SISTEMA DO <b>RADAR</b> 2"
}

Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local veh = GetVehiclePedIsIn(PlayerPedId())
		if IsPedInAnyPoliceVehicle(PlayerPedId()) then 
			timeDistance = 4
			if IsControlJustPressed(1,306) and IsInputDisabled(0)  then
				if radar.shown then
					radar.shown = false
					SendNUIMessage({ radar = radar.shown })
				else
					radar.shown = true
				end
			end

			if IsControlJustPressed(1,301) and IsInputDisabled(0) then
				if radar.freeze then
					radar.freeze = false
				else
					radar.freeze = true
				end
			end

			if radar.shown and IsPedInAnyVehicle(PlayerPedId()) then			
				if radar.freeze == false then
					local coordA = GetOffsetFromEntityInWorldCoords(veh,0.0,1.0,1.0)
					local coordB = GetOffsetFromEntityInWorldCoords(veh,0.0,105.0,0.0)
					local frontcar = StartShapeTestCapsule(coordA,coordB,3.0,10,veh,7)
					local a,b,c,d,e = GetShapeTestResult(frontcar)

					if IsEntityAVehicle(e) then
						local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))
						local fvspeed = GetEntitySpeed(e)*3.6
						local fplate = GetVehicleNumberPlateText(e)
						radar.info = "<b>PLACA:</b> "..fplate.." <b>MODELO:</b> "..fmodel.." <b>VELOCIDADE:</b> MPH "..math.ceil(fvspeed)
					end

					local bcoordB = GetOffsetFromEntityInWorldCoords(veh,0.0,-105.0,0.0)
					local rearcar = StartShapeTestCapsule(coordA,bcoordB,3.0,10,veh,7)
					local f,g,h,i,j = GetShapeTestResult(rearcar)

					if IsEntityAVehicle(j) then
						local bmodel = GetDisplayNameFromVehicleModel(GetEntityModel(j))
						local bvspeed = GetEntitySpeed(j)*3.6
						local bplate = GetVehicleNumberPlateText(j)
						radar.info2 = "<b>PLACA:</b> "..bplate.." <b>MODELO:</b> "..bmodel.." <b>VELOCIDADE:</b> MPH "..math.ceil(bvspeed)
					end
				end
				SendNUIMessage({ radar = radar.shown, info = radar.info })
				SendNUIMessage({ radar = radar.shown, info2 = radar.info2 })
			end
		end

		if not IsPedInAnyVehicle(PlayerPedId()) and radar.shown then
			radar.shown = false
			SendNUIMessage({ radar = radar.shown })
		end

		Citizen.Wait(timeDistance)
	end
end)