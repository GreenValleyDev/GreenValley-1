cfg = {}

cfg.segundos = 600 -- tempo de roubo
cfg.cooldown = 1200 -- tempo de espera entre os roubos
cfg.minpolicia = 0 -- nro min de policias para roubar
cfg.permissao = "policia.permissao" -- permissao da policia

cfg.bancos = { 
	["banco2"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		hackearmarker = { ['x'] = -2956.56, ['y'] = 481.69, ['z'] = 15.69 },
		hackear = { ['x'] = -2956.16, ['y'] = 482.10, ['z'] = 15.69-0.3, ['h'] = 354.09 }, 
		dinheiro = { ['x'] = -2954.15, ['y'] = 484.47, ['z'] = 15.50 },  
		roubar = { ['x'] = -2954.88, ['y'] = 484.35, ['z'] = 15.17, ['h']  = 269.64}, 
		reward = 300000 + math.random(20000,50000), 
		nameofbank = "Banco Green Valley (Rodovia)",
		lastrobbed = 0,
		porta = { ['portax'] = -2958.38, ['portay'] = 482.2705, ['portaz'] = 15.83594, ['hash'] = 4231427725, ['rotacao'] = 260.88, ['hdefault'] = 355.61 },
	},
	["banco3"] = {
		position = { ['x'] = -1212.2568359375, ['y'] = -336.128295898438, ['z'] = 38.00 },
		hackearmarker = { ['x'] = -1210.72, ['y'] = -336.52, ['z'] = 37.78 },
		hackear = { ['x'] = -1209.90, ['y'] = -336.45, ['z'] = 37.78-0.3, ['h'] = 290.33 },  -- -1210.7264404297,-336.52587890625,37.781009674072
		dinheiro = { ['x'] = -1207.36, ['y'] = -337.52, ['z'] = 37.60 }, 
		roubar = { ['x'] = -1207.46, ['y'] = -336.71, ['z'] = 37.25, ['h']  = 202.17}, 
		reward = 300000 + math.random(20000,50000),
		nameofbank = "Banco Green Valley (Vinewood Hills)",
		lastrobbed = 0,
		porta = { ['portax'] = -1211.261, ['portay'] = -334.5596, ['portaz'] = 37.91989, ['hash'] = 2121050683, ['rotacao'] = 198.90, ['hdefault'] = 295.0 },  
	},
	["banco4"] = {
		position = { ['x'] = -354.452575683594, ['y'] = -53.8204879760742, ['z'] = 49.04 },
		hackearmarker = { ['x'] = -353.92, ['y'] = -55.11, ['z'] = 49.03 },
		hackear = { ['x'] = -354.13, ['y'] = -55.20, ['z'] = 49.03+1, ['h'] = 242.71 }, -- -354.33221435547,-54.9391746521,49.036544799805
		dinheiro = { ['x'] = -352.08, ['y'] = -58.35, ['z'] = 48.86 },  
		roubar = { ['x'] = -351.89, ['y'] = -57.67, ['z'] = 49.01, ['h']  = 167.88}, 
		reward = 300000 + math.random(20000,50000),
		nameofbank = "Banco Green Valley (Burton)",
		lastrobbed = 0,
		porta = { ['portax'] = -352.7365, ['portay'] = -53.57248, ['portaz'] = 49.17543, ['hash'] = 2121050683, ['rotacao'] = 160.88, ['hdefault'] = 250.61 }, 
	},
	["banco5"] = {
		position = { ['x'] = 309.967376708984, ['y'] = -283.033660888672, ['z'] = 54.1745223999023 }, 
		hackear = { ['x'] = 311.55, ['y'] = -283.98, ['z'] = 54.16, ['h'] = 252.82 }, -- 311.37533569336,-284.15902709961,54.164730072021
		dinheiro = { ['x'] = 313.02, ['y'] = -287.70, ['z'] = 53.98 }, 
		roubar = { ['x'] = 313.13, ['y'] = -286.84, ['z'] = 54.14, ['h']  = 170.45}, 
		reward = 300000 + math.random(20000,50000),
		nameofbank = "Banco Green Valley (Alta)",
		lastrobbed = 0,
		porta = { ['portax'] = 312.358, ['portay'] = -282.7301, ['portaz'] = 54.30365, ['hash'] = 2121050683, ['rotacao'] = 150.90, ['hdefault'] = 250.0 },
	},
	["banco6"] = {
		position = { ['x'] = 1176.86865234375, ['y'] = 2711.91357421875, ['z'] = 38.097785949707 },
		hackearmarker = { ['x'] = 1176.04, ['y'] = 2712.85, ['z'] = 38.08 },
		hackear = { ['x'] = 1175.20, ['y'] = 2713.00, ['z'] = 38.09+1.3, ['h'] = 88.70 }, 
		dinheiro = { ['x'] = 1173.45, ['y'] = 2715.14, ['z'] = 37.91 }, 
		roubar = { ['x'] = 1173.45, ['y'] = 2714.50, ['z'] = 38.06, ['h']  = 0.17},  
		reward = 300000 + math.random(20000,50000),
		nameofbank = "Banco Green Valley (Deserto)",
		lastrobbed = 0,
		porta = { ['portax'] = 1175.542, ['portay'] = 2710.861, ['portaz'] = 38.22689, ['hash'] = 2121050683, ['rotacao'] = 350.90, ['hdefault'] = 90.0 },
	},
	["banco7"] = {
		position = { ['x'] = 145.98, ['y'] = -1044.62, ['z'] = 29.37 }, 
		hackearmarker = { ['x'] = 146.86, ['y'] = -1046.06, ['z'] = 29.36 }, 
		hackear = { ['x'] = 147.95, ['y'] = -1046.80, ['z'] = 30.36-0.2, ['h'] = 242.37 }, -- 146.30239868164,-1045.2897949219,29.377859115601
		dinheiro = { ['x'] = 148.51, ['y'] = -1049.10, ['z'] = 29.19 },  
		roubar = { ['x'] = 148.84, ['y'] = -1048.44, ['z'] = 29.34, ['h']  = 157.83},  
		reward = 300000 + math.random(20000,50000),
		nameofbank = "Banco Green Valley (Praça)",
		lastrobbed = 0,
		porta = { ['portax'] = 148.0266, ['portay'] = -1044.364, ['portaz'] = 29.50693, ['hash'] = 2121050683, ['rotacao'] = 150.90, ['hdefault'] = 250.0 }, -- X:148.0266 Y:-1044.364 Z:29.50693
	},
	["banco8"] = {
		position = { ['x'] = 252.78, ['y'] = 226.71, ['z'] = 101.69 }, 
		hackearmarker = { ['x'] = 253.37, ['y'] = 228.43, ['z'] = 101.69 }, 
		hackear = { ['x'] = 253.33, ['y'] = 228.32, ['z'] = 101.69, ['h'] = 63.28}, -- 146.30239868164,-1045.2897949219,29.377859115601
		dinheiro = { ['x'] = 264.49, ['y'] = 213.95, ['z'] = 101.53 },  
		roubar = { ['x'] = 263.77, ['y'] = 214.48, ['z'] = 101.69, ['h'] = 254.89},  
		reward = 1500000,
		nameofbank = "Banco Green Valley (Central)",
		lastrobbed = 0,
		porta = { ['portax'] = 253.67, ['portay'] = 224.08, ['portaz'] = 101.91, ['hash'] = 961976194, ['rotacao'] = 70.0, ['hdefault'] = 160.0 }, -- X:148.0266 Y:-1044.364 Z:29.50693
	},
	["joalheria"] = {
		position = { ['x'] = -622.39, ['y'] = -229.93, ['z'] = 38.06 }, 
		hackearmarker = { ['x'] = -629.26, ['y'] = -230.71, ['z'] = 38.06 }, 
		hackear = { ['x'] = -629.40, ['y'] = -229.95, ['z'] = 38.06+1.5, ['h'] = 34.72}, -- 146.30239868164,-1045.2897949219,29.377859115601
		dinheiro = { ['x'] = -622.30, ['y'] = -229.20, ['z'] = 38.95-1.05 },  
		roubar = { ['x'] = -622.68, ['y'] = -229.59, ['z'] = 38.06, ['h'] = 297.86},  
		reward = 300000 + math.random(20000,50000),
		nameofbank = "Joalheria",
		lastrobbed = 0,
		porta = { ['portax'] = -628.3, ['portay'] = -230.13, ['portaz'] = 38.06, ['hash'] = 1335309163, ['rotacao'] = 35.0, ['hdefault'] = 35.0 }, -- X:148.0266 Y:-1044.364 Z:29.50693
	},
}