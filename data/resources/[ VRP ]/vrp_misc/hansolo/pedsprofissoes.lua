local pedlist = {
	{ ['x'] = 425.95, ['y'] = 6463.24, ['z'] = 28.78, ['h'] = 316.13, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },
	{ ['x'] = 431.44, ['y'] = 6459.07, ['z'] = 28.76, ['h'] = 316.13, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },
	{ ['x'] = 436.61, ['y'] = 6454.43, ['z'] = 28.75, ['h'] = 316.13, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },
	{ ['x'] = 428.62, ['y'] = 6477.39, ['z'] = 28.75, ['h'] = 140.66, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },
	{ ['x'] = 433.62, ['y'] = 6472.58, ['z'] = 28.78, ['h'] = 238.11, ['hash'] = 0xFCFA9E1E, ['hash2'] = "A_C_Cow" },

	-- Venda de Coca;
	{ ['x'] = 499.6, ['y'] = -523.81, ['z'] = 24.88, ['h'] = 83.23, ['hash'] = 0xE497BBEF, ['hash2'] = "s_m_y_dealer_01" },
	{ ['x'] = -1089.67, ['y'] = -2397.98, ['z'] = 13.95, ['h'] = 150.52, ['hash'] = 0x62018559, ['hash2'] = "s_m_y_airworker" },

	-- Venda de Meta;
	{ ['x'] = -326.38, ['y'] = -1300.5, ['z'] = 31.35, ['h'] = 95.37, ['hash'] = 0x69F46BF3, ['hash2'] = "s_f_y_factory_01" }, -- Venda Éter;


	-- PEDS INICIAR ROTA FARM
	--{ ['x'] = 1248.62, ['y'] = -228.1, ['z'] = 95.95, ['h'] = 183.89, ['hash'] = 0xCAE9E5D5, ['hash2'] = "csb_cletus" } -- INICIAR ROTA CANDLOVE MUNIÇÃO;

}

Citizen.CreateThread(function()
	for k,v in pairs(pedlist) do
		RequestModel(GetHashKey(v.hash2))
		while not HasModelLoaded(GetHashKey(v.hash2)) do
			Citizen.Wait(10)
		end
		local ped = CreatePed(4,v.hash,v.x,v.y,v.z-1,v.h,false,true)
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,true)
		SetBlockingOfNonTemporaryEvents(ped,true)
	end
end)