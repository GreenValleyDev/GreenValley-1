local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

config = {}
Proxy.addInterface("nation_garages", config)

----------------------------------------------
----------------- CONFIG ---------------------
----------------------------------------------

config.detido = 10 -- taxa para ser paga quando o veiculo for detido (porcentagem do valor do veiculo)
config.seguradora = 5 -- taxa para ser paga quando o veiculo estiver apreendido (porcentagem do valor do veiculo)
config.use_tryFullPayment = true -- quando true, aceita pagamentos de taxas com o dinheiro do banco

config.dv_permission = "dv.permissao" -- permissao para dv
config.car_permission = "car.permissao" -- permissao para car

config.guardar_veiculo_proximo = false -- mostrar botão de guardar veículo próximo
config.server_side_check = true -- checa se o veículo já foi retirado da garagem pelo player via server-side (o player não conseguirá retirar o veículo até guardá-lo novamente / DV)


config.multas = 10000 -------- Maximo de multas que o player pode ter, se tiver mais que isso nao consegue puxar o veiculo

----------------------------------------------
----------------- MARKERS --------------------
----------------------------------------------


--- TIPOS DE MARKERS (DEFINIDO NO ATRIBUTO MARKER DE CADA GARAGEM) ---
config.markers = {
	["avião"] = 33,
	["helicóptero"] = 34,
	["barco"] = 35,
	["carro"] = 36,
	["moto"] = 37,
	["bicicleta"] = 38,
	["truck"] = 39,
}

config.drawMarker = function(coords,marker) -- funcao para desenhar os markers das garagens no chão
	local idTop = config.markers[marker] or config.markers["carro"] 
	local idBase = 27
	DrawMarker(idTop,coords,0,0,0,0,0,0,1.0,1.0,1.0,0, 119, 255,155,1,1,1,1)
	DrawMarker(idBase,coords.x,coords.y,coords.z-0.97,0,0,0,0,0,0,1.0,1.0,0.5,0, 119, 255,155,0,0,0,1)
end

----------------------------------------------
----------------- BLIPS ----------------------34 139 34
----------------------------------------------

config.showBlips = false -- quando true, mostra os blips das garagens públicas no mapa
config.blipId = 357 -- id do blip
config.blipColor = 7 -- cor do blip
config.blipSize = 0.4 -- tamanho do blip

----------------------------------------------
----------------------------------------------
----------------------------------------------


----------------------------------------------
-------- DELETAR VEICULOS INATIVOS -----------
----------------------------------------------

config.reset = true -- quando true, deleta os veículos que estão parados durante um determinado tempo
config.tempoReset = 120 -- tempo para deletar um veículo inativo (em minutos)

----------------------------------------------
----------------------------------------------
----------------------------------------------

----------------------------------------------
----------------- IMAGENS --------------------
----------------------------------------------

config.defaultImg = "https://svgsilh.com/svg/160895.svg" -- imagem default
config.imgDir = "http://localhost/vrp_images/" -- DIRETORIO DAS IMAGENS DOS VEÍCULOS

----------------------------------------------
----------------------------------------------
----------------------------------------------



----------------------------------------------
----------- LISTA DE VEÍCULOS ----------------
----------------------------------------------



config.vehList = {
	{ hash = 980885719, name = 'rmodgt63', price = 3000000, banido = false, modelo = 'Mercedes GT 63', capacidade = 50, tipo = 'exclusive' },
	{ hash = 410882957, name = 'kuruma2', price = 3000000, banido = false, modelo = 'Kuruma 2', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1528734685, name = '718b', price = 3000000, banido = false, modelo = 'Porsche 718b', capacidade = 50, tipo = 'exclusive' },	
	{ hash = -410205223, name = 'revolter', price = 250000, banido = false, modelo = 'Revolter', capacidade = 50, tipo = 'carros' },
	{ hash = -391595372, name = 'viseris', price = 150000, banido = false, modelo = 'Viseris', capacidade = 30, tipo = 'carros' },
	{ hash = -344943009, name = 'blista', price = 30000, banido = false, modelo = 'Blista', capacidade = 40, tipo = 'carros' },
	{ hash = 1549126457, name = 'brioso', price = 35000, banido = false, modelo = 'Brioso', capacidade = 30, tipo = 'carros' },
	{ hash = -1130810103, name = 'dilettante', price = 60000, banido = false, modelo = 'Dilettante', capacidade = 30, tipo = 'carros' },
	{ hash = -1177863319, name = 'issi2', price = 15000, banido = false, modelo = 'Issi2', capacidade = 20, tipo = 'carros' },
	{ hash = -431692672, name = 'panto', price = 7000, banido = false, modelo = 'Panto', capacidade = 20, tipo = 'carros' },
	{ hash = -1661854193, name = 'dune', price = 50000, banido = false, modelo = 'Dune', capacidade = 10, tipo = 'carros' },
	{ hash = -1450650718, name = 'prairie', price = 1000, banido = false, modelo = 'Prairie', capacidade = 25, tipo = 'carros' },
	{ hash = 92612664, name = 'kalahari', price = 4000, banido = false, modelo = 'Kalahari', capacidade = 40, tipo = 'carros' },
	{ hash = 841808271, name = 'rhapsody', price = 7000, banido = false, modelo = 'Rhapsody', capacidade = 30, tipo = 'carros' },
	{ hash = 330661258, name = 'cogcabrio', price = 150000, banido = false, modelo = 'Cogcabrio', capacidade = 60, tipo = 'carros' },
	{ hash = -685276541, name = 'emperor', price = 50000, banido = false, modelo = 'Emperor', capacidade = 60, tipo = 'carros' },
	{ hash = -1883002148, name = 'emperor2', price = 50000, banido = false, modelo = 'Emperor 2', capacidade = 60, tipo = 'carros' },
	{ hash = -2095439403, name = 'phoenix', price = 250000, banido = false, modelo = 'Phoenix', capacidade = 40, tipo = 'carros' },
	{ hash = -1883869285, name = 'premier', price = 35000, banido = false, modelo = 'Premier', capacidade = 50, tipo = 'carros' },
	{ hash = 75131841, name = 'glendale', price = 70000, banido = false, modelo = 'Glendale', capacidade = 50, tipo = 'carros' },
	{ hash = 886934177, name = 'intruder', price = 60000, banido = false, modelo = 'Intruder', capacidade = 50, tipo = 'carros' },
	{ hash = -5153954, name = 'exemplar', price = 50000, banido = false, modelo = 'Exemplar', capacidade = 20, tipo = 'carros' },
	{ hash = -591610296, name = 'f620', price = 55000, banido = false, modelo = 'F620', capacidade = 30, tipo = 'carros' },
	{ hash = -391594584, name = 'felon', price = 70000, banido = false, modelo = 'Felon', capacidade = 50, tipo = 'carros' },
	{ hash = -1289722222, name = 'ingot', price = 160000, banido = false, modelo = 'Ingot', capacidade = 60, tipo = 'carros' },
	{ hash = -1705304628, name = 'rubble', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 90, tipo = 'work' },
	{ hash = -89291282, name = 'felon2', price = 1000, banido = false, modelo = 'Felon2', capacidade = 40, tipo = 'work' },
	{ hash = -624529134, name = 'jackal', price = 60000, banido = false, modelo = 'Jackal', capacidade = 50, tipo = 'carros' },
	{ hash = 1348744438, name = 'oracle', price = 60000, banido = false, modelo = 'Oracle', capacidade = 50, tipo = 'carros' },
	{ hash = -511601230, name = 'oracle2', price = 80000, banido = false, modelo = 'Oracle2', capacidade = 60, tipo = 'carros' },
	{ hash = 1349725314, name = 'sentinel', price = 150000, banido = false, modelo = 'Sentinel', capacidade = 50, tipo = 'carros' },
	{ hash = 873639469, name = 'sentinel2', price = 150000, banido = false, modelo = 'Sentinel2', capacidade = 40, tipo = 'carros' },
	{ hash = 1581459400, name = 'windsor', price = 150000, banido = false, modelo = 'Windsor', capacidade = 20, tipo = 'carros' },
	{ hash = -1930048799, name = 'windsor2', price = 170000, banido = false, modelo = 'Windsor2', capacidade = 40, tipo = 'carros' },
	{ hash = -1122289213, name = 'zion', price = 50000, banido = false, modelo = 'Zion', capacidade = 50, tipo = 'carros' },
	{ hash = -1193103848, name = 'zion2', price = 60000, banido = false, modelo = 'Zion2', capacidade = 40, tipo = 'carros' },
	{ hash = -1205801634, name = 'blade', price = 110000, banido = false, modelo = 'Blade', capacidade = 40, tipo = 'carros' },
	{ hash = -682211828, name = 'buccaneer', price = 130000, banido = false, modelo = 'Buccaneer', capacidade = 50, tipo = 'carros' },
	{ hash = -1013450936, name = 'buccaneer2', price = 260000, banido = false, modelo = 'Buccaneer2', capacidade = 60, tipo = 'carros' },
	{ hash = -1150599089, name = 'primo', price = 130000, banido = false, modelo = 'Primo', capacidade = 50, tipo = 'carros' },
	{ hash = -2040426790, name = 'primo2', price = 200000, banido = false, modelo = 'Primo2', capacidade = 60, tipo = 'work' },
	{ hash = 349605904, name = 'chino', price = 200000, banido = false, modelo = 'Chino', capacidade = 50, tipo = 'carros' },
	{ hash = -1361687965, name = 'chino2', price = 200000, banido = false, modelo = 'Chino2', capacidade = 60, tipo = 'work' },
	{ hash = 784565758, name = 'coquette3', price = 195000, banido = false, modelo = 'Coquette3', capacidade = 40, tipo = 'carros' },
	{ hash = 80636076, name = 'dominator', price = 230000, banido = false, modelo = 'Dominator', capacidade = 50, tipo = 'carros' },
	{ hash = 915704871, name = 'dominator2', price = 230000, banido = false, modelo = 'Dominator2', capacidade = 50, tipo = 'carros' },
	{ hash = 723973206, name = 'dukes', price = 150000, banido = false, modelo = 'Dukes', capacidade = 40, tipo = 'carros' },
	{ hash = -2119578145, name = 'faction', price = 150000, banido = false, modelo = 'Faction', capacidade = 50, tipo = 'carros' },
	{ hash = -1790546981, name = 'faction2', price = 200000, banido = false, modelo = 'Faction2', capacidade = 40, tipo = 'work' },
	{ hash = -2039755226, name = 'faction3', price = 350000, banido = false, modelo = 'Faction3', capacidade = 60, tipo = 'carros' },
	{ hash = -1800170043, name = 'gauntlet', price = 165000, banido = false, modelo = 'Gauntlet', capacidade = 40, tipo = 'carros' },
	{ hash = 349315417, name = 'gauntlet2', price = 165000, banido = false, modelo = 'Gauntlet2', capacidade = 40, tipo = 'carros' },
	{ hash = -339587598, name = 'swift', price = 1000, banido = false, modelo = 'Swift', capacidade = 0, tipo = 'work' },
	{ hash = 1075432268, name = 'swift2', price = 1000, banido = false, modelo = 'Swift#2', capacidade = 0, tipo = 'work' },
	{ hash = 15219735, name = 'hermes', price = 280000, banido = false, modelo = 'Hermes', capacidade = 50, tipo = 'carros' },
	{ hash = 37348240, name = 'hotknife', price = 180000, banido = false, modelo = 'Hotknife', capacidade = 30, tipo = 'carros' },
	{ hash = 525509695, name = 'moonbeam', price = 220000, banido = false, modelo = 'Moonbeam', capacidade = 80, tipo = 'carros' },
	{ hash = 1896491931, name = 'moonbeam2', price = 250000, banido = false, modelo = 'Moonbeam2', capacidade = 70, tipo = 'carros' },
	{ hash = -1943285540, name = 'nightshade', price = 270000, banido = false, modelo = 'Nightshade', capacidade = 30, tipo = 'carros' },
	{ hash = 1507916787, name = 'picador', price = 150000, banido = false, modelo = 'Picador', capacidade = 90, tipo = 'carros' },
	{ hash = -227741703, name = 'ruiner', price = 100000, banido = false, modelo = 'Ruiner', capacidade = 50, tipo = 'carros' },
	{ hash = -1685021548, name = 'sabregt', price = 100000, banido = false, modelo = 'Sabregt', capacidade = 60, tipo = 'carros' },
	{ hash = 223258115, name = 'sabregt2', price = 150000, banido = false, modelo = 'Sabregt2', capacidade = 60, tipo = 'carros' },
	{ hash = -14495224, name = 'regina', price = 100000, banido = false, modelo = 'Regina', capacidade = 100, tipo = 'carros' },
	{ hash = -1745203402, name = 'gburrito', price = 260000, banido = false, modelo = 'GBurrito', capacidade = 80, tipo = 'work' },
	{ hash = 729783779, name = 'slamvan', price = 180000, banido = false, modelo = 'Slamvan', capacidade = 80, tipo = 'carros' },
	{ hash = 833469436, name = 'slamvan2', price = 200000, banido = false, modelo = 'Slamvan2', capacidade = 50, tipo = 'work' },
	{ hash = 1119641113, name = 'slamvan3', price = 230000, banido = false, modelo = 'Slamvan3', capacidade = 80, tipo = 'carros' },
	{ hash = 1923400478, name = 'stalion', price = 150000, banido = false, modelo = 'Stalion', capacidade = 30, tipo = 'carros' },
	{ hash = -401643538, name = 'stalion2', price = 150000, banido = false, modelo = 'Stalion2', capacidade = 20, tipo = 'carros' },
	{ hash = 972671128, name = 'tampa', price = 170000, banido = false, modelo = 'Tampa', capacidade = 40, tipo = 'carros' },
	{ hash = -825837129, name = 'vigero', price = 170000, banido = false, modelo = 'Vigero', capacidade = 30, tipo = 'carros' },
	{ hash = -498054846, name = 'virgo', price = 150000, banido = false, modelo = 'Virgo', capacidade = 60, tipo = 'carros' },
	{ hash = 300680485, name = 'mk7pandem', price = 1000000, banido = false, modelo = 'Gol Mk7 Pandem', capacidade = 40, tipo = 'exclusive' },
	{ hash = 436874758, name = 's1000rr', price = 1000000, banido = false, modelo = 'BMW S1000RR', capacidade = 15, tipo = 'exclusive' },
	{ hash = -899509638, name = 'virgo2', price = 250000, banido = false, modelo = 'Virgo2', capacidade = 50, tipo = 'carros' },
	{ hash = 16646064, name = 'virgo3', price = 180000, banido = false, modelo = 'Virgo3', capacidade = 60, tipo = 'carros' },
	{ hash = 2006667053, name = 'voodoo', price = 220000, banido = false, modelo = 'Voodoo', capacidade = 60, tipo = 'carros' },
	{ hash = 523724515, name = 'voodoo2', price = 220000, banido = false, modelo = 'Voodoo2', capacidade = 60, tipo = 'carros' },
	{ hash = 1871995513, name = 'yosemite', price = 350000, banido = false, modelo = 'Yosemite', capacidade = 130, tipo = 'carros' },
	{ hash = 1126868326, name = 'bfinjection', price = 80000, banido = false, modelo = 'Bfinjection', capacidade = 20, tipo = 'carros' },
	{ hash = -349601129, name = 'bifta', price = 190000, banido = false, modelo = 'Bifta', capacidade = 20, tipo = 'carros' },
	{ hash = -1435919434, name = 'bodhi2', price = 170000, banido = false, modelo = 'Bodhi2', capacidade = 90, tipo = 'carros' },
	{ hash = -1479664699, name = 'brawler', price = 250000, banido = false, modelo = 'Brawler', capacidade = 50, tipo = 'carros' },
	{ hash = 101905590, name = 'trophytruck', price = 400000, banido = false, modelo = 'Trophytruck', capacidade = 15, tipo = 'carros' },
	{ hash = -663299102, name = 'trophytruck2', price = 400000, banido = false, modelo = 'Trophytruck2', capacidade = 15, tipo = 'carros' },
	{ hash = -1237253773, name = 'dubsta3', price = 300000, banido = false, modelo = 'Dubsta3', capacidade = 90, tipo = 'carros' },
	{ hash = -2064372143, name = 'mesa3', price = 200000, banido = false, modelo = 'Mesa3', capacidade = 60, tipo = 'carros' },
	{ hash = 1645267888, name = 'rancherxl', price = 220000, banido = false, modelo = 'Rancherxl', capacidade = 70, tipo = 'carros' },
	{ hash = -1207771834, name = 'rebel', price = 1000, banido = false, modelo = 'Rebel', capacidade = 80, tipo = 'work' },
	{ hash = -2045594037, name = 'rebel2', price = 250000, banido = false, modelo = 'Rebel2', capacidade = 100, tipo = 'carros' },
	{ hash = -1532697517, name = 'riata', price = 250000, banido = false, modelo = 'Riata', capacidade = 80, tipo = 'carros' },
	{ hash = 1770332643, name = 'dloader', price = 150000, banido = false, modelo = 'Dloader', capacidade = 80, tipo = 'carros' },
	{ hash = -667151410, name = 'ratloader', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 80, tipo = 'work' },
	{ hash = -1189015600, name = 'sandking', price = 400000, banido = false, modelo = 'Sandking', capacidade = 120, tipo = 'carros' },
	{ hash = 989381445, name = 'sandking2', price = 370000, banido = false, modelo = 'Sandking2', capacidade = 120, tipo = 'carros' },
	{ hash = -808831384, name = 'baller', price = 150000, banido = false, modelo = 'Baller', capacidade = 50, tipo = 'carros' },
	{ hash = 142944341, name = 'baller2', price = 160000, banido = false, modelo = 'Baller2', capacidade = 60, tipo = 'carros' },
	{ hash = -1761239425, name = 'hornet', price = 1000000, banido = false, modelo = 'Hornet', capacidade = 30, tipo = 'motos' },
	{ hash = 1878062887, name = 'baller3', price = 175000, banido = false, modelo = 'Baller3', capacidade = 70, tipo = 'carros' },
	{ hash = 634118882, name = 'baller4', price = 185000, banido = false, modelo = 'Baller4', capacidade = 80, tipo = 'carros' },
	{ hash = 470404958, name = 'baller5', price = 270000, banido = false, modelo = 'Baller5', capacidade = 80, tipo = 'carros' },
	{ hash = 666166960, name = 'baller6', price = 280000, banido = false, modelo = 'Baller6', capacidade = 80, tipo = 'carros' },
	{ hash = 850565707, name = 'bjxl', price = 110000, banido = false, modelo = 'Bjxl', capacidade = 50, tipo = 'carros' },
	{ hash = 2006918058, name = 'cavalcade', price = 110000, banido = false, modelo = 'Cavalcade', capacidade = 60, tipo = 'carros' },
	{ hash = -789894171, name = 'cavalcade2', price = 130000, banido = false, modelo = 'Cavalcade2', capacidade = 60, tipo = 'carros' },
	{ hash = 683047626, name = 'contender', price = 300000, banido = false, modelo = 'Contender', capacidade = 80, tipo = 'carros' },
	{ hash = 1177543287, name = 'dubsta', price = 210000, banido = false, modelo = 'Dubsta', capacidade = 70, tipo = 'carros' },
	{ hash = -394074634, name = 'dubsta2', price = 240000, banido = false, modelo = 'Dubsta2', capacidade = 70, tipo = 'carros' },
	{ hash = -1137532101, name = 'fq2', price = 1000000, banido = false, modelo = 'Porsche Cayenne', capacidade = 30, tipo = 'exclusive' },
	{ hash = -1775728740, name = 'granger', price = 345000, banido = false, modelo = 'Granger', capacidade = 100, tipo = 'carros' },
	{ hash = -1543762099, name = 'gresley', price = 150000, banido = false, modelo = 'Gresley', capacidade = 50, tipo = 'carros' },
	{ hash = 884422927, name = 'habanero', price = 110000, banido = false, modelo = 'Habanero', capacidade = 50, tipo = 'carros' },
	{ hash = 1221512915, name = 'seminole', price = 110000, banido = false, modelo = 'Seminole', capacidade = 60, tipo = 'carros' },
	{ hash = 1337041428, name = 'serrano', price = 50000, banido = false, modelo = 'Serrano', capacidade = 50, tipo = 'carros' },
	{ hash = 1203490606, name = 'xls', price = 150000, banido = false, modelo = 'Xls', capacidade = 50, tipo = 'carros' },
	{ hash = -432008408, name = 'xls2', price = 350000, banido = false, modelo = 'Xls2', capacidade = 50, tipo = 'carros' },
	{ hash = -1809822327, name = 'asea', price = 20000, banido = false, modelo = 'Asea', capacidade = 30, tipo = 'carros' },
	{ hash = -1903012613, name = 'asterope', price = 65000, banido = false, modelo = 'Asterope', capacidade = 30, tipo = 'carros' },
	{ hash = 906642318, name = 'cog55', price = 150000, banido = false, modelo = 'Cog55', capacidade = 50, tipo = 'work' },
	{ hash = 704435172, name = 'cog552', price = 150000, banido = false, modelo = 'Cog552', capacidade = 50, tipo = 'carros' },
	{ hash = -2030171296, name = 'cognoscenti', price = 280000, banido = false, modelo = 'Cognoscenti', capacidade = 50, tipo = 'carros' },
	{ hash = -604842630, name = 'cognoscenti2', price = 400000, banido = false, modelo = 'Cognoscenti2', capacidade = 50, tipo = 'carros' },
	{ hash = -1477580979, name = 'stanier', price = 60000, banido = false, modelo = 'Stanier', capacidade = 60, tipo = 'carros' },
	{ hash = 1723137093, name = 'stratum', price = 90000, banido = false, modelo = 'Stratum', capacidade = 70, tipo = 'carros' },
	{ hash = 1123216662, name = 'superd', price = 200000, banido = false, modelo = 'Superd', capacidade = 50, tipo = 'work' },
	{ hash = -1894894188, name = 'surge', price = 110000, banido = false, modelo = 'Surge', capacidade = 60, tipo = 'carros' },
	{ hash = -1008861746, name = 'tailgater', price = 110000, banido = false, modelo = 'Tailgater', capacidade = 50, tipo = 'carros' },
	{ hash = 1373123368, name = 'warrener', price = 90000, banido = false, modelo = 'Warrener', capacidade = 40, tipo = 'carros' },
	{ hash = 1777363799, name = 'washington', price = 130000, banido = false, modelo = 'Washington', capacidade = 60, tipo = 'carros' },
	{ hash = 767087018, name = 'alpha', price = 230000, banido = false, modelo = 'Alpha', capacidade = 40, tipo = 'carros' },
	{ hash = -1041692462, name = 'banshee', price = 300000, banido = false, modelo = 'Banshee', capacidade = 30, tipo = 'carros' },
	{ hash = 1274868363, name = 'bestiagts', price = 800000, banido = false, modelo = 'Bestiagts', capacidade = 60, tipo = 'carros' },
	{ hash = 1039032026, name = 'blista2', price = 55000, banido = false, modelo = 'Blista2', capacidade = 40, tipo = 'carros' },
	{ hash = -591651781, name = 'blista3', price = 80000, banido = false, modelo = 'Blista3', capacidade = 40, tipo = 'carros' },
	{ hash = -304802106, name = 'buffalo', price = 100000, banido = false, modelo = 'Buffalo', capacidade = 50, tipo = 'carros' },
	{ hash = 736902334, name = 'buffalo2', price = 300000, banido = false, modelo = 'Buffalo2', capacidade = 50, tipo = 'carros' },
	{ hash = 237764926, name = 'buffalo3', price = 300000, banido = false, modelo = 'Buffalo3', capacidade = 50, tipo = 'carros' },
	{ hash = 2072687711, name = 'carbonizzare', price = 450000, banido = false, modelo = 'Carbonizzare', capacidade = 30, tipo = 'carros' },
	{ hash = -1045541610, name = 'comet2', price = 250000, banido = false, modelo = 'Comet2', capacidade = 40, tipo = 'carros' },
	{ hash = -2022483795, name = 'comet3', price = 290000, banido = false, modelo = 'Comet3', capacidade = 40, tipo = 'carros' },
	{ hash = 661493923, name = 'comet5', price = 300000, banido = false, modelo = 'Comet5', capacidade = 40, tipo = 'carros' },
	{ hash = 108773431, name = 'coquette', price = 250000, banido = false, modelo = 'Coquette', capacidade = 30, tipo = 'carros' },
	{ hash = 196747873, name = 'elegy', price = 350000, banido = false, modelo = 'Elegy', capacidade = 30, tipo = 'carros' },
	{ hash = -566387422, name = 'elegy2', price = 370000, banido = false, modelo = 'Elegy2', capacidade = 30, tipo = 'carros' },
	{ hash = -1995326987, name = 'feltzer2', price = 255000, banido = false, modelo = 'Feltzer2', capacidade = 40, tipo = 'carros' },
	{ hash = -1089039904, name = 'furoregt', price = 290000, banido = false, modelo = 'Furoregt', capacidade = 30, tipo = 'carros' },
	{ hash = 499169875, name = 'fusilade', price = 210000, banido = false, modelo = 'Fusilade', capacidade = 40, tipo = 'carros' },
	{ hash = 2016857647, name = 'futo', price = 100000, banido = false, modelo = 'Futo', capacidade = 40, tipo = 'carros' },
	{ hash = -1297672541, name = 'jester', price = 150000, banido = false, modelo = 'Jester', capacidade = 30, tipo = 'carros' },
	{ hash = 544021352, name = 'khamelion', price = 210000, banido = false, modelo = 'Khamelion', capacidade = 50, tipo = 'carros' },
	{ hash = -1372848492, name = 'kuruma', price = 400000, banido = false, modelo = 'Kuruma', capacidade = 50, tipo = 'carros' },
	{ hash = -142942670, name = 'massacro', price = 330000, banido = false, modelo = 'Massacro', capacidade = 40, tipo = 'carros' },
	{ hash = -631760477, name = 'massacro2', price = 330000, banido = false, modelo = 'Massacro2', capacidade = 40, tipo = 'carros' },
	{ hash = 1032823388, name = 'ninef', price = 400000, banido = false, modelo = 'Ninef', capacidade = 40, tipo = 'carros' },
	{ hash = -1461482751, name = 'ninef2', price = 290000, banido = false, modelo = 'Ninef2', capacidade = 40, tipo = 'carros' },
	{ hash = -777172681, name = 'omnis', price = 240000, banido = false, modelo = 'Omnis', capacidade = 20, tipo = 'carros' },
	{ hash = 867799010, name = 'pariah', price = 500000, banido = false, modelo = 'Pariah', capacidade = 30, tipo = 'carros' },
	{ hash = 1783355638, name = 'mower', price = 0, banido = false, modelo = 'Cortador de grama', capacidade = 2, tipo = 'work' },
	{ hash = -377465520, name = 'penumbra', price = 150000, banido = false, modelo = 'Penumbra', capacidade = 40, tipo = 'carros' },
	{ hash = -1529242755, name = 'raiden', price = 240000, banido = false, modelo = 'Raiden', capacidade = 50, tipo = 'carros' },
	{ hash = -1934452204, name = 'rapidgt', price = 250000, banido = false, modelo = 'Rapidgt', capacidade = 20, tipo = 'carros' },
	{ hash = 1737773231, name = 'rapidgt2', price = 300000, banido = false, modelo = 'Rapidgt2', capacidade = 20, tipo = 'carros' },
	{ hash = 719660200, name = 'ruston', price = 370000, banido = false, modelo = 'Ruston', capacidade = 20, tipo = 'carros' },
	{ hash = -1485523546, name = 'schafter3', price = 275000, banido = false, modelo = 'Schafter3', capacidade = 50, tipo = 'carros' },
	{ hash = 1489967196, name = 'schafter4', price = 275000, banido = false, modelo = 'Schafter4', capacidade = 50, tipo = 'carros' },
	{ hash = -888242983, name = 'schafter5', price = 275000, banido = false, modelo = 'Schafter5', capacidade = 50, tipo = 'carros' },
	{ hash = -746882698, name = 'schwarzer', price = 170000, banido = false, modelo = 'Schwarzer', capacidade = 50, tipo = 'carros' },
	{ hash = 1104234922, name = 'sentinel3', price = 100000, banido = false, modelo = 'Sentinel3', capacidade = 30, tipo = 'carros' },
	{ hash = -1757836725, name = 'seven70', price = 370000, banido = false, modelo = 'Seven70', capacidade = 20, tipo = 'carros' },
	{ hash = 1886268224, name = 'specter', price = 320000, banido = false, modelo = 'Specter', capacidade = 20, tipo = 'carros' },
	{ hash = 1074745671, name = 'specter2', price = 355000, banido = false, modelo = 'Specter2', capacidade = 20, tipo = 'carros' },
	{ hash = 1741861769, name = 'streiter', price = 250000, banido = false, modelo = 'Streiter', capacidade = 70, tipo = 'carros' },
	{ hash = 970598228, name = 'sultan', price = 210000, banido = false, modelo = 'Sultan', capacidade = 50, tipo = 'carros' },
	{ hash = 384071873, name = 'surano', price = 310000, banido = false, modelo = 'Surano', capacidade = 30, tipo = 'carros' },
	{ hash = -1071380347, name = 'tampa2', price = 200000, banido = false, modelo = 'Tampa2', capacidade = 20, tipo = 'carros' },
	{ hash = 1887331236, name = 'tropos', price = 170000, banido = false, modelo = 'Tropos', capacidade = 20, tipo = 'carros' },
	{ hash = 1102544804, name = 'verlierer2', price = 380000, banido = false, modelo = 'Verlierer2', capacidade = 20, tipo = 'carros' },
	{ hash = 117401876, name = 'btype', price = 200000, banido = false, modelo = 'Btype', capacidade = 40, tipo = 'work' },
	{ hash = -831834716, name = 'btype2', price = 460000, banido = false, modelo = 'Btype2', capacidade = 20, tipo = 'carros' },
	{ hash = -602287871, name = 'btype3', price = 390000, banido = false, modelo = 'Btype3', capacidade = 40, tipo = 'carros' },
	{ hash = 941800958, name = 'casco', price = 355000, banido = false, modelo = 'Casco', capacidade = 50, tipo = 'carros' },
	{ hash = -1311154784, name = 'cheetah', price = 425000, banido = false, modelo = 'Cheetah', capacidade = 20, tipo = 'carros' },
	{ hash = 1011753235, name = 'coquette2', price = 285000, banido = false, modelo = 'Coquette2', capacidade = 40, tipo = 'carros' },
	{ hash = -1566741232, name = 'feltzer3', price = 220000, banido = false, modelo = 'Feltzer3', capacidade = 40, tipo = 'carros' },
	{ hash = -2079788230, name = 'gt500', price = 250000, banido = false, modelo = 'Gt500', capacidade = 40, tipo = 'carros' },
	{ hash = -1405937764, name = 'infernus2', price = 250000, banido = false, modelo = 'Infernus2', capacidade = 20, tipo = 'carros' },
	{ hash = 1051415893, name = 'jb700', price = 220000, banido = false, modelo = 'Jb700', capacidade = 30, tipo = 'carros' },
	{ hash = -1660945322, name = 'mamba', price = 300000, banido = false, modelo = 'Mamba', capacidade = 50, tipo = 'carros' },
	{ hash = -2124201592, name = 'manana', price = 130000, banido = false, modelo = 'Manana', capacidade = 60, tipo = 'carros' },
	{ hash = -433375717, name = 'monroe', price = 260000, banido = false, modelo = 'Monroe', capacidade = 20, tipo = 'carros' },
	{ hash = 1830407356, name = 'peyote', price = 150000, banido = false, modelo = 'Peyote', capacidade = 50, tipo = 'carros' },
	{ hash = 1078682497, name = 'pigalle', price = 15000, banido = false, modelo = 'Pigalle', capacidade = 60, tipo = 'carros' },
	{ hash = 2049897956, name = 'rapidgt3', price = 220000, banido = false, modelo = 'Rapidgt3', capacidade = 40, tipo = 'carros' },
	{ hash = 1841130506, name = 'retinue', price = 150000, banido = false, modelo = 'Retinue', capacidade = 40, tipo = 'carros' },
	{ hash = 1545842587, name = 'stinger', price = 220000, banido = false, modelo = 'Stinger', capacidade = 20, tipo = 'carros' },
	{ hash = -2098947590, name = 'stingergt', price = 230000, banido = false, modelo = 'Stingergt', capacidade = 20, tipo = 'carros' },
	{ hash = 1504306544, name = 'torero', price = 160000, banido = false, modelo = 'Torero', capacidade = 30, tipo = 'carros' },
	{ hash = 464687292, name = 'tornado', price = 150000, banido = false, modelo = 'Tornado', capacidade = 70, tipo = 'carros' },
	{ hash = 1531094468, name = 'tornado2', price = 160000, banido = false, modelo = 'Tornado2', capacidade = 60, tipo = 'carros' },
	{ hash = -1797613329, name = 'tornado5', price = 200000, banido = false, modelo = 'Tornado5', capacidade = 60, tipo = 'work' },
	{ hash = -1558399629, name = 'tornado6', price = 250000, banido = false, modelo = 'Tornado6', capacidade = 50, tipo = 'carros' },
	{ hash = -982130927, name = 'turismo2', price = 250000, banido = false, modelo = 'Turismo2', capacidade = 30, tipo = 'carros' },
	{ hash = 758895617, name = 'ztype', price = 400000, banido = false, modelo = 'Ztype', capacidade = 20, tipo = 'carros' },
	{ hash = -1216765807, name = 'adder', price = 620000, banido = false, modelo = 'Adder', capacidade = 20, tipo = 'carros' },
	{ hash = -313185164, name = 'autarch', price = 760000, banido = false, modelo = 'Autarch', capacidade = 20, tipo = 'carros' },
	{ hash = 633712403, name = 'banshee2', price = 370000, banido = false, modelo = 'Banshee2', capacidade = 20, tipo = 'carros' },
	{ hash = -1696146015, name = 'bullet', price = 400000, banido = false, modelo = 'Bullet', capacidade = 20, tipo = 'carros' },
	{ hash = 223240013, name = 'cheetah2', price = 240000, banido = false, modelo = 'Cheetah2', capacidade = 20, tipo = 'carros' },
	{ hash = -1291952903, name = 'entityxf', price = 460000, banido = false, modelo = 'Entityxf', capacidade = 20, tipo = 'carros' },
	{ hash = 1426219628, name = 'fmj', price = 520000, banido = false, modelo = 'Fmj', capacidade = 20, tipo = 'carros' },
	{ hash = 1234311532, name = 'gp1', price = 600000, banido = false, modelo = 'Gp1', capacidade = 20, tipo = 'carros' },
	{ hash = 418536135, name = 'infernus', price = 470000, banido = false, modelo = 'Infernus', capacidade = 20, tipo = 'carros' },
	{ hash = 1034187331, name = 'nero', price = 1600000, banido = false, modelo = 'Nero', capacidade = 20, tipo = 'carros' },
	{ hash = 1093792632, name = 'nero2', price = 480000, banido = false, modelo = 'Nero2', capacidade = 20, tipo = 'carros' },
	{ hash = 1987142870, name = 'osiris', price = 1400000, banido = true, modelo = 'Osiris', capacidade = 20, tipo = 'carros' },
	{ hash = -1758137366, name = 'penetrator', price = 480000, banido = false, modelo = 'Penetrator', capacidade = 20, tipo = 'carros' },
	{ hash = -1829802492, name = 'pfister811', price = 530000, banido = false, modelo = 'Pfister811', capacidade = 20, tipo = 'carros' },
	{ hash = 234062309, name = 'reaper', price = 620000, banido = false, modelo = 'Reaper', capacidade = 20, tipo = 'carros' },
	{ hash = 1352136073, name = 'sc1', price = 495000, banido = false, modelo = 'Sc1', capacidade = 20, tipo = 'carros' },
	{ hash = -295689028, name = 'sultanrs', price = 450000, banido = false, modelo = 'Sultan RS', capacidade = 30, tipo = 'carros' },
	{ hash = 1663218586, name = 't20', price = 1200000, banido = false, modelo = 'T20', capacidade = 20, tipo = 'carros' },
	{ hash = 272929391, name = 'tempesta', price = 800000, banido = false, modelo = 'Tempesta', capacidade = 20, tipo = 'carros' },
	{ hash = 408192225, name = 'turismor', price = 620000, banido = false, modelo = 'Turismor', capacidade = 20, tipo = 'carros' },
	{ hash = 2067820283, name = 'tyrus', price = 620000, banido = false, modelo = 'Tyrus', capacidade = 20, tipo = 'carros' },
	{ hash = 338562499, name = 'vacca', price = 620000, banido = false, modelo = 'Vacca', capacidade = 30, tipo = 'carros' },
	{ hash = -998177792, name = 'visione', price = 690000, banido = false, modelo = 'Visione', capacidade = 20, tipo = 'carros' },
	{ hash = -1622444098, name = 'voltic', price = 440000, banido = false, modelo = 'Voltic', capacidade = 20, tipo = 'carros' },
	{ hash = -1403128555, name = 'zentorno', price = 1000000, banido = false, modelo = 'Zentorno', capacidade = 20, tipo = 'carros' },
	{ hash = -599568815, name = 'sadler', price = 180000, banido = false, modelo = 'Sadler', capacidade = 70, tipo = 'carros' },

	{ hash = -2072933068, name = 'coach', price = 25000, banido = false, modelo = 'Ônibus', capacidade = 0, tipo = 'work' },

	{ hash = -746882698, name = 'schwarzer', price = 170000, banido = false, modelo = 'Schwarzer', capacidade = 50, tipo = 'carros' },
	{ hash = -16948145, name = 'bison', price = 220000, banido = false, modelo = 'Bison', capacidade = 70, tipo = 'carros' },
	{ hash = 2072156101, name = 'bison2', price = 180000, banido = false, modelo = 'Bison2', capacidade = 70, tipo = 'carros' },
	{ hash = 1069929536, name = 'bobcatxl', price = 260000, banido = false, modelo = 'Bobcatxl', capacidade = 100, tipo = 'carros' },
	{ hash = -1346687836, name = 'burrito', price = 260000, banido = false, modelo = 'Burrito', capacidade = 80, tipo = 'carros' },
	{ hash = -907477130, name = 'burrito2', price = 260000, banido = false, modelo = 'Burrito2', capacidade = 120, tipo = 'carros' },
	{ hash = -1743316013, name = 'burrito3', price = 260000, banido = false, modelo = 'Burrito3', capacidade = 120, tipo = 'carros' },
	{ hash = 893081117, name = 'burrito4', price = 260000, banido = false, modelo = 'Burrito4', capacidade = 120, tipo = 'carros' },
	{ hash = -310465116, name = 'minivan', price = 110000, banido = false, modelo = 'Minivan', capacidade = 70, tipo = 'carros' },
	{ hash = -1126264336, name = 'minivan2', price = 220000, banido = false, modelo = 'Minivan2', capacidade = 60, tipo = 'carros' },
	{ hash = 1488164764, name = 'paradise', price = 260000, banido = false, modelo = 'Paradise', capacidade = 120, tipo = 'carros' },
	{ hash = -119658072, name = 'pony', price = 260000, banido = false, modelo = 'Pony', capacidade = 120, tipo = 'carros' },
	{ hash = 943752001, name = 'pony2', price = 260000, banido = false, modelo = 'Pony2', capacidade = 120, tipo = 'carros' },
	{ hash = 1162065741, name = 'rumpo', price = 260000, banido = false, modelo = 'Rumpo', capacidade = 120, tipo = 'carros' },
	{ hash = -1776615689, name = 'rumpo2', price = 260000, banido = false, modelo = 'Rumpo2', capacidade = 120, tipo = 'carros' },
	{ hash = 1475773103, name = 'rumpo3', price = 350000, banido = false, modelo = 'Rumpo3', capacidade = 120, tipo = 'carros' },
	{ hash = -810318068, name = 'speedo', price = 200000, banido = false, modelo = 'Speedo', capacidade = 120, tipo = 'work' },
	{ hash = 699456151, name = 'surfer', price = 55000, banido = false, modelo = 'Surfer', capacidade = 80, tipo = 'carros' },
	{ hash = 65402552, name = 'youga', price = 260000, banido = false, modelo = 'Youga', capacidade = 120, tipo = 'carros' },
	{ hash = 1026149675, name = 'youga2', price = 1000, banido = false, modelo = 'Youga2', capacidade = 80, tipo = 'work' },
	{ hash = -1207771834, name = 'rebel', price = 1000, banido = false, modelo = 'Rebel', capacidade = 80, tipo = 'work' },
	{ hash = -2076478498, name = 'tractor2', price = 1000, banido = false, modelo = 'Tractor2', capacidade = 80, tipo = 'work' },
	{ hash = 486987393, name = 'huntley', price = 110000, banido = false, modelo = 'Huntley', capacidade = 60, tipo = 'carros' },
	{ hash = 1269098716, name = 'landstalker', price = 130000, banido = false, modelo = 'Landstalker', capacidade = 70, tipo = 'carros' },
	{ hash = 914654722, name = 'mesa', price = 90000, banido = false, modelo = 'Mesa', capacidade = 50, tipo = 'carros' },
	{ hash = -808457413, name = 'patriot', price = 250000, banido = false, modelo = 'Patriot', capacidade = 70, tipo = 'carros' },
	{ hash = -1651067813, name = 'radi', price = 110000, banido = false, modelo = 'Radi', capacidade = 50, tipo = 'carros' },
	{ hash = 2136773105, name = 'rocoto', price = 110000, banido = false, modelo = 'Rocoto', capacidade = 60, tipo = 'carros' },
	{ hash = -376434238, name = 'tyrant', price = 1800000, banido = false, modelo = 'Tyrant', capacidade = 30, tipo = 'carros' },
	{ hash = -2120700196, name = 'entity2', price = 2000000, banido = false, modelo = 'Entity2', capacidade = 20, tipo = 'carros' },
	{ hash = -988501280, name = 'cheburek', price = 170000, banido = false, modelo = 'Cheburek', capacidade = 50, tipo = 'carros' },
	{ hash = 1115909093, name = 'hotring', price = 300000, banido = false, modelo = 'Hotring', capacidade = 60, tipo = 'carros' },
	{ hash = -214906006, name = 'jester3', price = 345000, banido = false, modelo = 'Jester3', capacidade = 30, tipo = 'carros' },
	{ hash = -1259134696, name = 'flashgt', price = 370000, banido = false, modelo = 'Flashgt', capacidade = 30, tipo = 'carros' },
	{ hash = -1267543371, name = 'ellie', price = 320000, banido = false, modelo = 'Ellie', capacidade = 50, tipo = 'carros' },
	{ hash = 1046206681, name = 'michelli', price = 160000, banido = false, modelo = 'Michelli', capacidade = 40, tipo = 'carros' },
	{ hash = 1617472902, name = 'fagaloa', price = 80000, banido = false, modelo = 'Fagaloa', capacidade = 80, tipo = 'carros' },
	{ hash = -915704871, name = 'dominator2', price = 230000, banido = false, modelo = 'Dominator2', capacidade = 50, tipo = 'carros' },
	{ hash = -986944621, name = 'dominator3', price = 350000, banido = false, modelo = 'Dominator3', capacidade = 50, tipo = 'carros' },
	{ hash = 931280609, name = 'issi3', price = 190000, banido = false, modelo = 'Issi3', capacidade = 20, tipo = 'carros' },
	{ hash = -1134706562, name = 'taipan', price = 620000, banido = false, modelo = 'Taipan', capacidade = 20, tipo = 'carros' },
	{ hash = 1909189272, name = 'gb200', price = 195000, banido = false, modelo = 'Gb200', capacidade = 20, tipo = 'carros' },
	{ hash = -1961627517, name = 'stretch', price = 520000, banido = false, modelo = 'Stretch', capacidade = 60, tipo = 'carros' },
	{ hash = -2107990196, name = 'guardian', price = 540000, banido = false, modelo = 'Guardian', capacidade = 150, tipo = 'carros' },
	{ hash = -121446169, name = 'kamacho', price = 460000, banido = false, modelo = 'Kamacho', capacidade = 90, tipo = 'carros' },
	{ hash = -1848994066, name = 'neon', price = 900000, banido = false, modelo = 'Neon', capacidade = 30, tipo = 'carros' },
	{ hash = 1392481335, name = 'cyclone', price = 920000, banido = false, modelo = 'Cyclone', capacidade = 20, tipo = 'carros' },
	{ hash = -2048333973, name = 'italigtb', price = 600000, banido = false, modelo = 'Italigtb', capacidade = 20, tipo = 'carros' },
	{ hash = -482719877, name = 'italigtb2', price = 610000, banido = false, modelo = 'Italigtb2', capacidade = 20, tipo = 'carros' },
	{ hash = 1939284556, name = 'vagner', price = 680000, banido = false, modelo = 'Vagner', capacidade = 20, tipo = 'carros' },
	{ hash = 917809321, name = 'xa21', price = 700000, banido = false, modelo = 'Xa21', capacidade = 20, tipo = 'carros' },
	{ hash = 1031562256, name = 'tezeract', price = 920000, banido = false, modelo = 'Tezeract', capacidade = 20, tipo = 'carros' },
	{ hash = 2123327359, name = 'prototipo', price = 1400000, banido = false, modelo = 'Prototipo', capacidade = 20, tipo = 'carros' },
	{ hash = -420911112, name = 'patriot2', price = 550000, banido = false, modelo = 'Patriot2', capacidade = 60, tipo = 'carros' },
	{ hash = 321186144, name = 'stafford', price = 200000, banido = false, modelo = 'Stafford', capacidade = 40, tipo = 'work' },
	{ hash = 500482303, name = 'swinger', price = 250000, banido = false, modelo = 'Swinger', capacidade = 20, tipo = 'carros' },
	{ hash = -1566607184, name = 'clique', price = 360000, banido = false, modelo = 'Clique', capacidade = 40, tipo = 'carros' },
	{ hash = 1591739866, name = 'deveste', price = 920000, banido = false, modelo = 'Deveste', capacidade = 20, tipo = 'carros' },
	{ hash = 1279262537, name = 'deviant', price = 370000, banido = false, modelo = 'Deviant', capacidade = 50, tipo = 'carros' },
	{ hash = -2096690334, name = 'impaler', price = 250000, banido = false, modelo = 'Impaler', capacidade = 60, tipo = 'carros' },
	{ hash = -331467772, name = 'italigto', price = 800000, banido = false, modelo = 'Italigto', capacidade = 30, tipo = 'carros' },
	{ hash = -507495760, name = 'schlagen', price = 690000, banido = false, modelo = 'Schlagen', capacidade = 30, tipo = 'carros' },
	{ hash = -1168952148, name = 'toros', price = 1000000, banido = false, modelo = 'Toros', capacidade = 80, tipo = 'carros' },
	{ hash = 1456744817, name = 'tulip', price = 320000, banido = false, modelo = 'Tulip', capacidade = 60, tipo = 'carros' },
	{ hash = -49115651, name = 'vamos', price = 320000, banido = false, modelo = 'Vamos', capacidade = 60, tipo = 'carros' },
	{ hash = -54332285, name = 'freecrawler', price = 350000, banido = false, modelo = 'Freecrawler', capacidade = 50, tipo = 'carros' },
	{ hash = 1909141499, name = 'fugitive', price = 50000, banido = false, modelo = 'Fugitive', capacidade = 50, tipo = 'carros' },
	{ hash = -1232836011, name = 'le7b', price = 700000, banido = false, modelo = 'Le7b', capacidade = 20, tipo = 'carros' },
	{ hash = 2068293287, name = 'lurcher', price = 150000, banido = false, modelo = 'Lurcher', capacidade = 60, tipo = 'carros' },
	{ hash = 482197771, name = 'lynx', price = 370000, banido = false, modelo = 'Lynx', capacidade = 30, tipo = 'carros' },
	{ hash = -674927303, name = 'raptor', price = 300000, banido = false, modelo = 'Raptor', capacidade = 20, tipo = 'carros' },
	{ hash = 819197656, name = 'sheava', price = 700000, banido = false, modelo = 'Sheava', capacidade = 20, tipo = 'carros' },
	{ hash = 838982985, name = 'z190', price = 350000, banido = false, modelo = 'Z190', capacidade = 40, tipo = 'carros' },
	{ hash = 1672195559, name = 'akuma', price = 500000, banido = false, modelo = 'Akuma', capacidade = 15, tipo = 'motos' },
	{ hash = -2115793025, name = 'avarus', price = 440000, banido = false, modelo = 'Avarus', capacidade = 15, tipo = 'motos' },
	{ hash = -2140431165, name = 'bagger', price = 300000, banido = false, modelo = 'Bagger', capacidade = 40, tipo = 'motos' },
	{ hash = -114291515, name = 'bati', price = 500000, banido = false, modelo = 'Bati', capacidade = 15, tipo = 'motos' },
	{ hash = -891462355, name = 'bati2', price = 300000, banido = false, modelo = 'Bati2', capacidade = 15, tipo = 'motos' },
	{ hash = 86520421, name = 'bf400', price = 250000, banido = false, modelo = 'Bf400', capacidade = 15, tipo = 'motos' },
	{ hash = 11251904, name = 'carbonrs', price = 300000, banido = false, modelo = 'Carbonrs', capacidade = 15, tipo = 'motos' },
	{ hash = 6774487, name = 'chimera', price = 345000, banido = false, modelo = 'Chimera', capacidade = 15, tipo = 'motos' },
	{ hash = 390201602, name = 'cliffhanger', price = 310000, banido = false, modelo = 'Cliffhanger', capacidade = 15, tipo = 'motos' },
	{ hash = 2006142190, name = 'daemon', price = 200000, banido = false, modelo = 'Daemon', capacidade = 15, tipo = 'work' },
	{ hash = -1404136503, name = 'daemon2', price = 240000, banido = false, modelo = 'Daemon2', capacidade = 15, tipo = 'motos' },
	{ hash = 822018448, name = 'defiler', price = 460000, banido = false, modelo = 'Defiler', capacidade = 15, tipo = 'motos' },
	{ hash = -239841468, name = 'diablous', price = 430000, banido = false, modelo = 'Diablous', capacidade = 15, tipo = 'motos' },
	{ hash = 1790834270, name = 'diablous2', price = 460000, banido = false, modelo = 'Diablous2', capacidade = 15, tipo = 'motos' },
	{ hash = -1670998136, name = 'double', price = 400000, banido = false, modelo = 'Double', capacidade = 15, tipo = 'motos' },
	{ hash = 1753414259, name = 'enduro', price = 195000, banido = false, modelo = 'Enduro', capacidade = 15, tipo = 'motos' },
	{ hash = 2035069708, name = 'esskey', price = 320000, banido = false, modelo = 'Esskey', capacidade = 15, tipo = 'motos' },
	{ hash = -1842748181, name = 'faggio', price = 10000, banido = false, modelo = 'Faggio', capacidade = 30, tipo = 'motos' },
	{ hash = 55628203, name = 'faggio2', price = 5000, banido = false, modelo = 'Faggio2', capacidade = 30, tipo = 'motos' },
	{ hash = -1289178744, name = 'faggio3', price = 5000, banido = false, modelo = 'Faggio3', capacidade = 30, tipo = 'motos' },
	{ hash = 627535535, name = 'fcr', price = 50000, banido = false, modelo = 'Fcr', capacidade = 15, tipo = 'motos' },
	{ hash = -757735410, name = 'fcr2', price = 390000, banido = false, modelo = 'Fcr2', capacidade = 15, tipo = 'motos' },
	{ hash = 741090084, name = 'gargoyle', price = 200000, banido = false, modelo = 'Gargoyle', capacidade = 15, tipo = 'motos' },
	{ hash = 1265391242, name = 'hakuchou', price = 400000, banido = false, modelo = 'Hakuchou', capacidade = 15, tipo = 'motos' },
	{ hash = -255678177, name = 'hakuchou2', price = 550000, banido = false, modelo = 'Hakuchou2', capacidade = 15, tipo = 'motos' },
	{ hash = 301427732, name = 'hexer', price = 250000, banido = false, modelo = 'Hexer', capacidade = 15, tipo = 'motos' },
	{ hash = -159126838, name = 'innovation', price = 250000, banido = false, modelo = 'Innovation', capacidade = 15, tipo = 'motos' },
	{ hash = 640818791, name = 'lectro', price = 380000, banido = false, modelo = 'Lectro', capacidade = 15, tipo = 'motos' },
	{ hash = -1523428744, name = 'manchez', price = 150000, banido = false, modelo = 'Manchez', capacidade = 15, tipo = 'motos' },
	{ hash = -634879114, name = 'nemesis', price = 60000, banido = false, modelo = 'Nemesis', capacidade = 15, tipo = 'motos' },
	{ hash = -1606187161, name = 'nightblade', price = 350000, banido = false, modelo = 'Nightblade', capacidade = 15, tipo = 'motos' },
	{ hash = -909201658, name = 'pcj', price = 30000, banido = false, modelo = 'Pcj', capacidade = 15, tipo = 'motos' },
	{ hash = -893578776, name = 'ruffian', price = 345000, banido = false, modelo = 'Ruffian', capacidade = 15, tipo = 'motos' },
	{ hash = 788045382, name = 'sanchez', price = 120000, banido = false, modelo = 'Sanchez', capacidade = 15, tipo = 'motos' },
	{ hash = -1453280962, name = 'sanchez2', price = 185000, banido = false, modelo = 'Sanchez2', capacidade = 15, tipo = 'motos' },
	{ hash = 1491277511, name = 'sanctus', price = 200000, banido = false, modelo = 'Sanctus', capacidade = 15, tipo = 'work' },
	{ hash = 743478836, name = 'sovereign', price = 285000, banido = false, modelo = 'Sovereign', capacidade = 50, tipo = 'motos' },
	{ hash = 1836027715, name = 'thrust', price = 375000, banido = false, modelo = 'Thrust', capacidade = 15, tipo = 'motos' },
	{ hash = -140902153, name = 'vader', price = 345000, banido = false, modelo = 'Vader', capacidade = 15, tipo = 'motos' },
	{ hash = -1353081087, name = 'vindicator', price = 340000, banido = false, modelo = 'Vindicator', capacidade = 15, tipo = 'motos' },
	{ hash = -609625092, name = 'vortex', price = 375000, banido = false, modelo = 'Vortex', capacidade = 15, tipo = 'motos' },
	{ hash = -618617997, name = 'wolfsbane', price = 290000, banido = false, modelo = 'Wolfsbane', capacidade = 15, tipo = 'motos' },
	{ hash = -1009268949, name = 'zombiea', price = 290000, banido = false, modelo = 'Zombiea', capacidade = 15, tipo = 'motos' },
	{ hash = -570033273, name = 'zombieb', price = 300000, banido = false, modelo = 'Zombieb', capacidade = 15, tipo = 'motos' },
	{ hash = -2128233223, name = 'blazer', price = 230000, banido = true, modelo = 'Blazer', capacidade = 15, tipo = 'motos' },
	{ hash = -440768424, name = 'blazer4', price = 370000, banido = true, modelo = 'Blazer4', capacidade = 15, tipo = 'motos' },
	{ hash = -405626514, name = 'shotaro', price = 1000000, banido = false, modelo = 'Shotaro', capacidade = 15, tipo = 'motos' },
	{ hash = 1873600305, name = 'ratbike', price = 230000, banido = false, modelo = 'Ratbike', capacidade = 15, tipo = 'motos' },
	{ hash = 159863515, name = 'ambo', price = 1000, banido = true, modelo = 'Ambulância Ford', capacidade = 0, tipo = 'work' },
	{ hash = 1171614426, name = 'ambulance', price = 1000, banido = true, modelo = 'Ambulância SAMU', capacidade = 0, tipo = 'work' },
	{ hash = 296357396, name = 'gburrito2', price = 260000, banido = false, modelo = 'GBurrito #2', capacidade = 80, tipo = 'carros' },
	{ hash = 904750859, name = 'mule', price = 1600000, banido = false, modelo = 'Mule', capacidade = 600, tipo = 'carros' },
	{ hash = -1050465301, name = 'mule2', price = 800000, banido = false, modelo = 'Mule#2', capacidade = 300, tipo = 'carros' },
	{ hash = -2052737935, name = 'mule3', price = 3800000, banido = false, modelo = 'Mule#3', capacidade = 1200, tipo = 'carros' },
	{ hash = 1945374990, name = 'mule4', price = 1500000, banido = false, modelo = 'Mule4', capacidade = 500, tipo = 'carros' },
	{ hash = 2053223216, name = 'benson', price = 7600000, banido = false, modelo = 'Benson', capacidade = 2400, tipo = 'carros' },
	{ hash = 2112052861, name = 'pounder', price = 15200000, banido = false, modelo = 'Pounder', capacidade = 4800, tipo = 'carros' },
	{ hash = 945374990, name = 'pounder2', price = 4000000, banido = false, modelo = 'Pounder2', capacidade = 1250, tipo = 'carros' },
	{ hash = -2103821244, name = 'rallytruck', price = 260000, banido = false, modelo = 'Burrito4', capacidade = 400, tipo = 'carros' },
	{ hash = 1353720154, name = 'flatbed', price = 1000, banido = true, modelo = 'Reboque', capacidade = 0, tipo = 'work' },
	{ hash = -667151410, name = 'ratloader', price = 1000, banido = true, modelo = 'Caminhão', capacidade = 80, tipo = 'work' },
	{ hash = -589178377, name = 'ratloader2', price = 1000, banido = false, modelo = 'Ratloader2', capacidade = 70, tipo = 'work' },
	{ hash = -1705304628, name = 'rubble', price = 1000, banido = true, modelo = 'Caminhão', capacidade = 90, tipo = 'work' },
	{ hash = -956048545, name = 'taxi', price = 1000, banido = true, modelo = 'Taxi', capacidade = 0, tipo = 'work' },
	{ hash = 444171386, name = 'boxville4', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 70, tipo = 'work' },
	{ hash = -1987130134, name = 'boxville', price = 1000, banido = false, modelo = 'Veículo de obras', capacidade = 10, tipo = 'work' },
	{ hash = -1255698084, name = 'trash2', price = 1000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'work' },
	{ hash = 48339065, name = 'tiptruck', price = 1000, banido = false, modelo = 'Tiptruck', capacidade = 70, tipo = 'work' },
	{ hash = -186537451, name = 'scorcher', price = 1000, banido = true, modelo = 'Scorcher', capacidade = 0, tipo = 'work' },
	{ hash = 1127861609, name = 'tribike', price = 1000, banido = true, modelo = 'Tribike', capacidade = 0, tipo = 'work' },
	{ hash = -1233807380, name = 'tribike2', price = 1000, banido = true, modelo = 'Tribike2', capacidade = 0, tipo = 'work' },
	{ hash = -400295096, name = 'tribike3', price = 1000, banido = true, modelo = 'Tribike3', capacidade = 0, tipo = 'work' },
	{ hash = -836512833, name = 'fixter', price = 1000, banido = true, modelo = 'Fixter', capacidade = 0, tipo = 'work' },
	{ hash = 448402357, name = 'cruiser', price = 1000, banido = true, modelo = 'Cruiser', capacidade = 0, tipo = 'work' },
	{ hash = 1131912276, name = 'bmx', price = 1000, banido = true, modelo = 'Bmx', capacidade = 0, tipo = 'work' },
	{ hash = 1033245328, name = 'dinghy', price = 1000, banido = true, modelo = 'Dinghy', capacidade = 0, tipo = 'work' },
	{ hash = 231083307, name = 'speeder', price = 1000, banido = true, modelo = 'Speeder', capacidade = 0, tipo = 'work' },
	{ hash = -282946103, name = 'suntrap', price = 1000, banido = true, modelo = 'Suntrap', capacidade = 0, tipo = 'work' },
	{ hash = 290013743, name = 'tropic', price = 1000, banido = true, modelo = 'Tropic', capacidade = 0, tipo = 'work' },
	{ hash = 1518533038, name = 'hauler', price = 1000, banido = true, modelo = 'Hauler', capacidade = 0, tipo = 'work' },
	{ hash = -1579533167, name = 'trailers2', price = 500000, banido = false, modelo = 'Trailer Truck', capacidade = 100, tipo = 'carros' },
	{ hash = -60313827, name = 'nissangtr', price = 3000000, banido = false, modelo = 'Nissan GTR', capacidade = 40, tipo = 'import' },
	{ hash = -2015218779, name = 'nissan370z', price = 1000000, banido = false, modelo = 'Nissan 370Z', capacidade = 40, tipo = 'exclusive' },
	{ hash = 1601422646, name = 'dodgechargersrt', price = 2000000, banido = false, modelo = 'Dodge Charger SRT', capacidade = 50, tipo = 'import' },
	{ hash = -1173768715, name = 'ferrariitalia', price = 4500000, banido = false, modelo = 'Ferrari Italia 478', capacidade = 30, tipo = 'exclusive' },
	{ hash = 1676738519, name = 'audirs6', price = 1000000, banido = false, modelo = 'Audi RS6', capacidade = 60, tipo = 'import' },
	{ hash = -157095615, name = 'bmwm3f80', price = 1350000, banido = false, modelo = 'BMW M3 F80', capacidade = 50, tipo = 'import' },
	{ hash = -13524981, name = 'bmwm4gts', price = 1000000, banido = false, modelo = 'BMW M4 GTS', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1573350092, name = 'fordmustang', price = 1900000, banido = false, modelo = 'Ford Mustang', capacidade = 40, tipo = 'import' },
	{ hash = 1114244595, name = 'lamborghinihuracan', price = 1000000, banido = false, modelo = 'Lamborghini Huracan', capacidade = 30, tipo = 'exclusive' },
	{ hash = 1978088379, name = 'lancerevolutionx', price = 1700000, banido = false, modelo = 'Lancer Evolution X', capacidade = 50, tipo = 'import' },
	{ hash = 2034235290, name = 'mazdarx7', price = 1000000, banido = false, modelo = 'Mazda RX7', capacidade = 40, tipo = 'exclusive' },
	{ hash = 670022011, name = 'nissangtrnismo', price = 1000000, banido = false, modelo = 'Nissan GTR Nismo', capacidade = 40, tipo = 'exclusive' },
	{ hash = -4816535, name = 'nissanskyliner34', price = 2500000, banido = false, modelo = 'Nissan Skyliner', capacidade = 50, tipo = 'import' },
	{ hash = 351980252, name = 'teslaprior', price = 1750000, banido = false, modelo = 'Tesla Prior', capacidade = 50, tipo = 'import' },
	{ hash = 723779872, name = 'toyotasupra', price = 1000000, banido = false, modelo = 'Toyota Supra', capacidade = 35, tipo = 'exclusive' },
	{ hash = -740742391, name = 'mercedesa45', price = 1200000, banido = false, modelo = 'Mercedes A45', capacidade = 40, tipo = 'import' },
	{ hash = 819937652, name = 'focusrs', price = 1000000, banido = false, modelo = 'Focus RS', capacidade = 40, tipo = 'import' },
	{ hash = -133349447, name = 'lancerevolution9', price = 1400000, banido = false, modelo = 'Lancer Evolution 9', capacidade = 50, tipo = 'import' },
	{ hash = 1911052153, name = 'ninjah2', price = 1000000, banido = false, modelo = 'Ninja H2', capacidade = 15, tipo = 'exclusive' },
	{ hash = -333868117, name = 'trr', price = 1000000, banido = false, modelo = 'KTM TRR', capacidade = 15, tipo = 'exclusive' },
	{ hash = -189438188, name = 'p1', price = 1000000, banido = false, modelo = 'Mclaren P1', capacidade = 20, tipo = 'exclusive' },
	{ hash = 1718441594, name = 'i8', price = 1000000, banido = false, modelo = 'BMW i8', capacidade = 35, tipo = 'exclusive' },
	{ hash = -380714779, name = 'bme6tun', price = 1000000, banido = false, modelo = 'BMW M5', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1481236684, name = 'aperta', price = 1000000, banido = false, modelo = 'La Ferrari', capacidade = 20, tipo = 'exclusive' },
	{ hash = -498891507, name = 'bettle', price = 1000000, banido = false, modelo = 'New Bettle', capacidade = 35, tipo = 'exclusive' },
	{ hash = -433961724, name = 'senna', price = 1000000, banido = false, modelo = 'Mclaren Senna', capacidade = 20, tipo = 'exclusive' },
	{ hash = 2045784380, name = 'rmodx6', price = 1000000, banido = false, modelo = 'BMW X6', capacidade = 40, tipo = 'exclusive' },
	{ hash = 113372153, name = 'bnteam', price = 1000000, banido = false, modelo = 'Bentley', capacidade = 20, tipo = 'exclusive' },
	{ hash = 949614817, name = 'lp700r', price = 1000000, banido = false, modelo = 'Lamborghini Centenario', capacidade = 30, tipo = 'exclusive' },
	{ hash = 1503141430, name = 'divo', price = 1000000, banido = false, modelo = 'Buggati Divo', capacidade = 20, tipo = 'exclusive' },
	{ hash = 1966489524, name = 's15', price = 1000000, banido = false, modelo = 'Nissan Silvia S15', capacidade = 20, tipo = 'exclusive' },
	{ hash = -915188472, name = 'amggtr', price = 1000000, banido = false, modelo = 'Mercedes AMG', capacidade = 20, tipo = 'exclusive' },
	{ hash = -264618235, name = 'lamtmc', price = 1000000, banido = false, modelo = 'Lamborghini Terzo', capacidade = 20, tipo = 'exclusive' },
	{ hash = -1067176722, name = 'vantage', price = 1000000, banido = false, modelo = 'Aston Martin Vantage', capacidade = 20, tipo = 'exclusive' },
	{ hash = -520214134, name = 'urus', price = 1000000, banido = false, modelo = 'Lamborghini Urus', capacidade = 50, tipo = 'exclusive' },
	{ hash = 493030188, name = 'amarok', price = 1000000, banido = false, modelo = 'VW Amarok', capacidade = 150, tipo = 'exclusive' },
	{ hash = 2093958905, name = 'slsamg', price = 1000000, banido = false, modelo = 'Mercedes SLS', capacidade = 20, tipo = 'exclusive' },
	{ hash = 104532066, name = 'g65amg', price = 1000000, banido = false, modelo = 'Mercedes G65', capacidade = 0, tipo = 'exclusive' },
	{ hash = 1995020435, name = 'celta', price = 1000000, banido = false, modelo = 'Celta Paredão', capacidade = 0, tipo = 'exclusive' },
	{ hash = 137494285, name = 'eleanor', price = 1000000, banido = false, modelo = 'Mustang Eleanor', capacidade = 30, tipo = 'exclusive' },
	{ hash = -863499820, name = 'rmodamgc63', price = 1000000, banido = false, modelo = 'Mercedes AMG C63', capacidade = 40, tipo = 'exclusive' },
	{ hash = -1315334327, name = 'palameila', price = 1000000, banido = false, modelo = 'Porsche Panamera', capacidade = 50, tipo = 'exclusive' },
	{ hash = 2047166283, name = 'bmws', price = 1000000, banido = false, modelo = 'BMW S1000', capacidade = 15, tipo = 'exclusive' },
	{ hash = 494265960, name = 'cb500x', price = 750000, banido = false, modelo = 'Honda CB500', capacidade = 15, tipo = 'motos' },
	{ hash = -1031680535, name = 'rsvr16', price = 1000000, banido = false, modelo = 'Ranger Rover', capacidade = 50, tipo = 'exclusive' },
	{ hash = -42051018, name = 'veneno', price = 1000000, banido = false, modelo = 'Lamborghini Veneno', capacidade = 20, tipo = 'exclusive' },
	{ hash = -1824291874, name = '19ramdonk', price = 1000000, banido = false, modelo = 'Dodge Ram Donk', capacidade = 80, tipo = 'exclusive' },
	{ hash = -304124483, name = 'silv86', price = 1000000, banido = false, modelo = 'Silverado Donk', capacidade = 80, tipo = 'exclusive' },
	{ hash = -402398867, name = 'bc', price = 1000000, banido = false, modelo = 'Pagani Huayra', capacidade = 20, tipo = 'exclusive' },
	{ hash = 2113322010, name = '70camarofn', price = 1000000, banido = false, modelo = 'camaro Z28 1970', capacidade = 20, tipo = 'exclusive' },
	{ hash = -654239719, name = 'agerars', price = 1000000, banido = false, modelo = 'Koenigsegg Agera RS', capacidade = 20, tipo = 'exclusive' },
	{ hash = 580861919, name = 'fc15', price = 1000000, banido = false, modelo = 'Ferrari California', capacidade = 20, tipo = 'exclusive' },
	{ hash = 1402024844, name = 'bbentayga', price = 1000000, banido = false, modelo = 'Bentley Bentayga', capacidade = 50, tipo = 'exclusive' },
	{ hash = 1221510024, name = 'nissantitan17', price = 1000000, banido = false, modelo = 'Nissan Titan 2017', capacidade = 120, tipo = 'exclusive' },
	{ hash = 1085789913, name = 'regera', price = 1000000, banido = false, modelo = 'Koenigsegg Regera', capacidade = 20, tipo = 'exclusive' },
	{ hash = 144259586, name = '911r', price = 1000000, banido = false, modelo = 'Porsche 911R', capacidade = 30, tipo = 'exclusive' },
	{ hash = 1047274985, name = 'africat', price = 1000000, banido = false, modelo = 'Honda CRF 1000', capacidade = 15, tipo = 'exclusive' },
	{ hash = -653358508, name = 'msohs', price = 1000000, banido = false, modelo = 'Mclaren 688 HS', capacidade = 20, tipo = 'exclusive' },
	{ hash = -2011325074, name = 'gt17', price = 1000000, banido = false, modelo = 'Ford GT 17', capacidade = 20, tipo = 'exclusive' },
	{ hash = 1224601968, name = '19ftype', price = 1000000, banido = false, modelo = 'Jaguar F-Type', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1593808613, name = '488gtb', price = 1000000, banido = false, modelo = 'Ferrari 488 GTB', capacidade = 30, tipo = 'exclusive' },
	{ hash = 235772231, name = 'fxxkevo', price = 1000000, banido = false, modelo = 'Ferrari FXXK Evo', capacidade = 30, tipo = 'exclusive' },
	{ hash = -1313740730, name = 'm2', price = 1000000, banido = false, modelo = 'BMW M2', capacidade = 50, tipo = 'exclusive' },
	{ hash = 233681897, name = 'defiant', price = 1000000, banido = false, modelo = 'AMC Javelin 72', capacidade = 40, tipo = 'exclusive' },
	{ hash = -1507259850, name = 'f12tdf', price = 1000000, banido = false, modelo = 'Ferrari F12 TDF', capacidade = 20, tipo = 'exclusive' },
	{ hash = -1863430482, name = '71gtx', price = 1000000, banido = false, modelo = 'Plymouth 71 GTX', capacidade = 50, tipo = 'exclusive' },
	{ hash = 859592619, name = 'porsche992', price = 1000000, banido = false, modelo = 'Porsche 992', capacidade = 20, tipo = 'exclusive' },
	{ hash = -187294055, name = '18macan', price = 1000000, banido = false, modelo = 'Porsche Macan', capacidade = 60, tipo = 'exclusive' },
	{ hash = 1270688730, name = 'm6e63', price = 1000000, banido = false, modelo = 'BMW M6 E63', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1467569396, name = '180sx', price = 1000000, banido = false, modelo = 'Nissan 180SX', capacidade = 10, tipo = 'exclusive' },
	{ hash = -192929549, name = 'audirs7', price = 1800000, banido = false, modelo = 'Audi RS7', capacidade = 60, tipo = 'import' },
	{ hash = 653510754, name = 'hondafk8', price = 1700000, banido = false, modelo = 'Honda FK8', capacidade = 40, tipo = 'import' },
	{ hash = -148915999, name = 'mustangmach1', price = 1100000, banido = false, modelo = 'Mustang Mach 1', capacidade = 40, tipo = 'import' },
	{ hash = 2009693397, name = 'porsche930', price = 1300000, banido = false, modelo = 'Porsche 930', capacidade = 20, tipo = 'import' },
	{ hash = 624514487, name = 'raptor2017', price = 1000000, banido = false, modelo = 'Ford Raptor 2017', capacidade = 150, tipo = 'exclusive' },
	{ hash = -2096912321, name = 'filthynsx', price = 1000000, banido = false, modelo = 'Honda NSX', capacidade = 20, tipo = 'exclusive' },
	{ hash = -1671973728, name = '2018zl1', price = 1000000, banido = false, modelo = 'Camaro ZL1', capacidade = 40, tipo = 'exclusive' },
	{ hash = 1603211447, name = 'eclipse', price = 1000000, banido = false, modelo = 'Mitsubishi Eclipse', capacidade = 30, tipo = 'exclusive' },
	{ hash = 1069692054, name = 'beetle74', price = 500000, banido = false, modelo = 'Fusca 74', capacidade = 40, tipo = 'import' },
	{ hash = 1649254367, name = 'fe86', price = 500000, banido = false, modelo = 'Escorte', capacidade = 40, tipo = 'import' },
	{ hash = -251450019, name = 'type263', price = 500000, banido = false, modelo = 'Kombi 63', capacidade = 60, tipo = 'import' },
	{ hash = 1128102088, name = 'pistas', price = 1000000, banido = false, modelo = 'Ferrari Pista', capacidade = 30, tipo = 'exclusive' },
	{ hash = -1152345593, name = 'yzfr125', price = 1000000, banido = false, modelo = 'Yamaha YZF R125', capacidade = 10, tipo = 'exclusive' },
	{ hash = 1301770299, name = 'mt03', price = 1000000, banido = false, modelo = 'Yamaha MT 03', capacidade = 10, tipo = 'exclusive' },
	{ hash = 2037834373, name = 'flatbed3', price = 1000, banido = false, modelo = 'flatbed3', capacidade = 0, tipo = 'work' },
	{ hash = 194235445, name = '20r1', price = 1000000, banido = false, modelo = 'Yamaha YZF R1', capacidade = 10, tipo = 'exclusive' },
	{ hash = -1820486602, name = 'SVR14', price = 1000000, banido = false, modelo = 'Ranger Rover', capacidade = 50, tipo = 'exclusive' },
	{ hash = 1663453404, name = 'evoque', price = 1000000, banido = false, modelo = 'Ranger Rover Evoque', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1343964931, name = 'Bimota', price = 1000000, banido = false, modelo = 'Ducati Bimota', capacidade = 10, tipo = 'exclusive' },
	{ hash = -1385753106, name = 'r8ppi', price = 1000000, banido = false, modelo = 'Audi R8', capacidade = 30, tipo = 'exclusive' },
	{ hash = -1221749859, name = 'bobbes2', price = 1000000, banido = false, modelo = 'Harley D. Bobber S', capacidade = 15, tipo = 'exclusive' },
	{ hash = -1830458836, name = 'bobber', price = 1000000, banido = false, modelo = 'Harley D. Bobber ', capacidade = 15, tipo = 'exclusive' },
	{ hash = -716699448, name = '911tbs', price = 1000000, banido = false, modelo = 'Porsche 911S', capacidade = 25, tipo = 'exclusive' },
	{ hash = -1845487887, name = 'volatus', price = 1000000, banido = false, modelo = 'Volatus', capacidade = 45, tipo = 'work' },
	{ hash = -2049243343, name = 'rc', price = 300000, banido = false, modelo = 'KTM RC', capacidade = 15, tipo = 'motos' },
	{ hash = 16211617168, name = 'cargobob2', price = 1000000, banido = false, modelo = 'Cargo Bob', capacidade = 0, tipo = 'work' },
	{ hash = -714386060, name = 'zx10r', price = 2000000, banido = false, modelo = 'Kawasaki ZX10R', capacidade = 15, tipo = 'exclusive' },
	{ hash = 1257756827, name = 'fox600lt', price = 1000000, banido = false, modelo = 'McLaren 600LT', capacidade = 40, tipo = 'exclusive' },
	{ hash = -791711053, name = 'foxbent1', price = 1000000, banido = false, modelo = 'Bentley Liter 1931', capacidade = 40, tipo = 'exclusive' },
	{ hash = -1421258057, name = 'foxevo', price = 1000000, banido = false, modelo = 'Lamborghini EVO', capacidade = 40, tipo = 'exclusive' },
	{ hash = -245054982, name = 'jeepg', price = 1000000, banido = false, modelo = 'Jeep Gladiator', capacidade = 90, tipo = 'exclusive' },
	{ hash = 545993358, name = 'foxharley1', price = 150000, banido = false, modelo = 'Harley-Davidson Softail F.B.', capacidade = 20, tipo = 'exclusive' },
	{ hash = 305501667, name = 'foxharley2', price = 150000, banido = false, modelo = '2016 Harley-Davidson Road Glide', capacidade = 20, tipo = 'exclusive' },
	{ hash = 1720228960, name = 'foxleggera', price = 1000000, banido = false, modelo = 'Aston Martin Leggera', capacidade = 50, tipo = 'exclusive' },
	{ hash = -470882965, name = 'foxrossa', price = 1000000, banido = false, modelo = 'Ferrari Rossa', capacidade = 40, tipo = 'exclusive' },
	{ hash = 69730216, name = 'foxshelby', price = 1000000, banido = false, modelo = 'Ford Shelby GT500', capacidade = 40, tipo = 'exclusive' },
	{ hash = 182795887, name = 'foxsian', price = 1000000, banido = false, modelo = 'Lamborghini Sian', capacidade = 40, tipo = 'exclusive' },
	{ hash = 1065452892, name = 'foxsterrato', price = 1000000, banido = false, modelo = 'Lamborghini Sterrato', capacidade = 40, tipo = 'exclusive' },
	{ hash = 16473409, name = 'foxsupra', price = 1000000, banido = false, modelo = 'Toyota Supra', capacidade = 50, tipo = 'exclusive' },
	{ hash = 532999675, name = 'm6x6', price = 1000000, banido = false, modelo = 'Mercedes Benz 6x6', capacidade = 90, tipo = 'exclusive' },
	{ hash = -1677172839, name = 'm6gt3', price = 1000000, banido = false, modelo = 'BMW M6 GT3', capacidade = 40, tipo = 'exclusive' },
	{ hash = 730959932, name = 'w900', price = 1000000, banido = false, modelo = 'Kenworth W900', capacidade = 130, tipo = 'exclusive' },
	{ hash = 735175855, name = 'cbrr', price = 1750000, banido = false, modelo = 'CB 1000RR', capacidade = 15, tipo = 'motos' },
	{ hash = -188978926, name = 'r6', price = 600000, banido = false, modelo = 'Yamaha R6', capacidade = 15, tipo = 'motos' },
	{ hash = 991407206, name = 'r1250', price = 1200000, banido = false, modelo = 'BMW R 1250GS', capacidade = 15, tipo = 'motos' },
	{ hash = -2091594350, name = '918', price = 350000, banido = false, modelo = 'Porsche 918', capacidade = 30, tipo = 'carros' },
	{ hash = 2059290738, name = 'alfieri', price = 350000, banido = false, modelo = 'Maserati Alfieri', capacidade = 30, tipo = 'carros' },
	{ hash = -1331336397, name = 'bdivo', price = 350000, banido = false, modelo = 'Bugatti Divo', capacidade = 30, tipo = 'carros' },
	{ hash = 1440816183, name = 'boxterlb', price = 350000, banido = false, modelo = 'Porsche Boxter LB', capacidade = 30, tipo = 'carros' },
	{ hash = 1458362510, name = 'brz', price = 350000, banido = false, modelo = 'Subaru BRZ', capacidade = 30, tipo = 'carros' },
	{ hash = 1828026872, name = 'btsupra94', price = 350000, banido = false, modelo = 'Toyota Supra', capacidade = 30, tipo = 'carros' },
	{ hash = 10019767, name = 'chiron17', price = 350000, banido = false, modelo = 'Bugatti Chiron', capacidade = 30, tipo = 'carros' },
	{ hash = -1203725842, name = 'ctsv16', price = 350000, banido = false, modelo = 'Cadilac SV', capacidade = 30, tipo = 'carros' },
	{ hash = 1924372706, name = 'fusca', price = 50000, banido = false, modelo = 'Volkswagen Fusca', capacidade = 20, tipo = 'carros' },
	{ hash = -1907071539, name = 'granlb', price = 350000, banido = false, modelo = 'Maserati LB', capacidade = 15, tipo = 'carros' },
	{ hash = 356442851, name = 'gsxr', price = 1250000, banido = false, modelo = 'Suzuki GSX-R', capacidade = 30, tipo = 'motos' },
	{ hash = -565536581, name = 'gt86', price = 350000, banido = false, modelo = 'Subaru GT', capacidade = 30, tipo = 'carros' },
	{ hash = -1265899455, name = 'hcbr17', price = 1000000, banido = false, modelo = 'Honda CBR17', capacidade = 15, tipo = 'exclusive' },
	{ hash = -1862600099, name = 'mt10', price = 370000, banido = false, modelo = 'MT-10', capacidade = 15, tipo = 'motos' },
	{ hash = -1667727259, name = 'nh2r', price = 1000000, banido = false, modelo = 'Kawasaki NH2-R', capacidade = 15, tipo = 'motos' },
	{ hash = 1474015055, name = 'r1', price = 1500000, banido = false, modelo = 'Yamaha R1', capacidade = 15, tipo = 'motos' },
	{ hash = 1025737310, name = 'rt70', price = 350000, banido = false, modelo = 'Dodge Charger R/T', capacidade = 15, tipo = 'carros' },
	{ hash = 1385792025, name = 'silvia3', price = 350000, banido = false, modelo = 'Nissan Silvia', capacidade = 30, tipo = 'carros' },
	{ hash = -14519558, name = 'xj', price = 900000, banido = false, modelo = 'Yamaha XJ6', capacidade = 15, tipo = 'exclusive' },
	{ hash = 1744543800, name = 'z1000', price = 600000, banido = false, modelo = 'Kawasaki Z1000', capacidade = 15, tipo = 'motos' },
	{ hash = -1596508877, name = 'z15326power', price = 350000, banido = false, modelo = 'Nissan Silvia Power', capacidade = 30, tipo = 'carros' },
	{ hash = -530596092, name = '2f2fgtr34', price = 500000, banido = false, modelo = 'Nissan GT-R 34', capacidade = 30, tipo = 'carros' },
	{ hash = 92242942, name = '2f2fgts', price = 500000, banido = false, modelo = 'Mitsubishi Spyder', capacidade = 30, tipo = 'carros' },
	{ hash = -2026492941, name = '2f2fmk4', price = 500000, banido = false, modelo = 'Toyota Supra', capacidade = 30, tipo = 'carros' },
	{ hash = -2143339605, name = '2f2fmle7', price = 500000, banido = false, modelo = 'Lancer Evo X', capacidade = 30, tipo = 'carros' },
	{ hash = -1584460854, name = 'ff4wrx', price = 500000, banido = false, modelo = 'Subaru', capacidade = 30, tipo = 'carros' },
	{ hash = -647166545, name = 'fnf4r34', price = 500000, banido = false, modelo = 'Nissan GT-R 34 Unmarked', capacidade = 30, tipo = 'carros' },
	{ hash = -410866473, name = 'fnflan', price = 500000, banido = false, modelo = 'Lancer Evolution', capacidade = 30, tipo = 'carros' },
	{ hash = 1299243986, name = 'fnfmits', price = 500000, banido = false, modelo = 'Mitsubishi Eclipse', capacidade = 30, tipo = 'carros' },
	{ hash = 1324588753, name = 'fnfmk4', price = 500000, banido = false, modelo = 'Toyota Supra', capacidade = 30, tipo = 'carros' },
	{ hash = 1878807939, name = 'fnfrx7', price = 500000, banido = false, modelo = 'RX70', capacidade = 30, tipo = 'carros' },
	{ hash = -984938540, name = '18velar', price = 1000000, banido = false, modelo = 'Range Rover Velar', capacidade = 55, tipo = 'exclusive' },
	{ hash = -32010512, name = 'acr', price = 1000000, banido = false, modelo = 'Viper', capacidade = 30, tipo = 'exclusive' },
	{ hash = 1891834095, name = 'audiq7', price = 1000000, banido = false, modelo = 'Audi Q7', capacidade = 55, tipo = 'exclusive' },
	{ hash = -1385753106, name = 'r8ppi', price = 1000000, banido = false, modelo = 'Audi R8', capacidade = 30, tipo = 'exclusive' },
	{ hash = -2015862033, name = 'ar8lb', price = 1000000, banido = false, modelo = 'Audi R8 V', capacidade = 30, tipo = 'exclusive' },
	{ hash = 119794591, name = 'sq72016', price = 1000000, banido = false, modelo = 'Audi Q7 V', capacidade = 55, tipo = 'exclusive' },
	{ hash = -1980604310, name = 'bentaygast', price = 1000000, banido = false, modelo = 'Bentley Bentayga', capacidade = 55, tipo = 'exclusive' },
	{ hash = -506359117, name = 'x6m', price = 1000000, banido = false, modelo = 'BMW x6', capacidade = 55, tipo = 'exclusive' },
	{ hash = 874739883, name = 'c7', price = 1000000, banido = false, modelo = 'Corvette', capacidade = 30, tipo = 'exclusive' },
	{ hash = -661719484, name = 'c7r', price = 1000000, banido = false, modelo = 'Corvette Race', capacidade = 10, tipo = 'exclusive' },
	{ hash = -992812151, name = 'dk350z', price = 1000000, banido = false, modelo = 'Nissan 350z', capacidade = 30, tipo = 'exclusive' },
	{ hash = -1942465847, name = 'diavel', price = 1000000, banido = false, modelo = 'Ducatti Diavel', capacidade = 15, tipo = 'exclusive' },
	{ hash = -145702349, name = 'fm488', price = 1000000, banido = false, modelo = 'Ferrari 488', capacidade = 30, tipo = 'exclusive' },
	{ hash = -1121482454, name = 'f12m', price = 1000000, banido = false, modelo = 'Ferrari', capacidade = 30, tipo = 'exclusive' },
	{ hash = -182003596, name = 'fiattoro', price = 1000000, banido = false, modelo = 'Fiat Toro', capacidade = 20, tipo = 'exclusive' },
	{ hash = -32005528, name = 'boss302', price = 1000000, banido = false, modelo = 'Mustang 302', capacidade = 30, tipo = 'exclusive' },
	{ hash = 729333126, name = 'mk7', price = 1000000, banido = false, modelo = 'Golf GTI', capacidade = 40, tipo = 'exclusive' },
	{ hash = -493679946, name = 'civic', price = 1000000, banido = false, modelo = 'Honda Civic', capacidade = 30, tipo = 'exclusive' },
	{ hash = -36436459, name = 'inf', price = 1000000, banido = false, modelo = 'Infiniti', capacidade = 30, tipo = 'exclusive' },
	{ hash = -1003581048, name = 'srt8', price = 1000000, banido = false, modelo = 'Jeep SRT8', capacidade = 55, tipo = 'exclusive' },
	{ hash = 865989668, name = 'avj', price = 1000000, banido = false, modelo = 'Lamborghini Aventador', capacidade = 30, tipo = 'exclusive' },
	{ hash = 278896688, name = 'sv', price = 1000000, banido = false, modelo = 'Lamborghini Diablo', capacidade = 30, tipo = 'exclusive' },
	{ hash = 1094481404, name = 'urus2018', price = 1000000, banido = false, modelo = 'Lamborghini Urus', capacidade = 55, tipo = 'exclusive' },
	{ hash = -74953340, name = 'xxxxx', price = 1000000, banido = false, modelo = 'Mercedes Benz X', capacidade = 100, tipo = 'exclusive' },
	{ hash = -1137532101, name = 'fq2', price = 1000000, banido = false, modelo = 'Porsche Cayenne', capacidade = 30, tipo = 'exclusive' },
	{ hash = -1095688294, name = 'wraith', price = 1000000, banido = false, modelo = 'Rolls Royce Wraith', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1404319008, name = 'bmwm8', price = 2750000, banido = false, modelo = 'BMW M8', capacidade = 30, tipo = 'import' },
	{ hash = -1476696782, name = 'rmodmi8lb', price = 2750000, banido = false, modelo = 'BMW i8 do Bruxo', capacidade = 100, tipo = 'import' },
	{ hash = -713569950, name = 'bus', price = 2750000, banido = false, modelo = 'Ônibus', capacidade = 0, tipo = 'work' },
	{ hash = -1878793377, name = 'chevypolicia', price = 2750000, banido = false, modelo = 'Viatura PM', capacidade = 0, tipo = 'work' },
	{ hash = 1598710733, name = 'jeeppolicia', price = 2750000, banido = false, modelo = 'Viatura Jeep PM', capacidade = 0, tipo = 'work' },
	{ hash = 837100403, name = 'mercedespolicia', price = 2750000, banido = false, modelo = 'Mercedes Viatura', capacidade = 0, tipo = 'work' },
	{ hash = 1912215274, name = 'police3', price = 2750000, banido = false, modelo = 'Viatura Policia', capacidade = 0, tipo = 'work' },
	{ hash = -1627000575, name = 'police2', price = 2750000, banido = false, modelo = 'Viatura G Policia', capacidade = 0, tipo = 'work' },
	{ hash = -34623805, name = 'policeb', price = 2750000, banido = false, modelo = 'Moto gs1200 Policia', capacidade = 0, tipo = 'work' },
	{ hash = 569305213, name = 'packer', price = 2750000, banido = false, modelo = 'Caminhão 2', capacidade = 0, tipo = 'work' },
	{ hash = -1905367117, name = 'pampagas', price = 2750000, banido = false, modelo = 'Carro Ultragas', capacidade = 0, tipo = 'work' },
	{ hash = -1222347999, name = 'rmodmk7', price = 2750000, banido = false, modelo = 'Golf gti ', capacidade = 100, tipo = 'import' },
	{ hash = -134949878, name = 'RS62', price = 2750000, banido = false, modelo = 'Carro do Vitor RS62', capacidade = 100, tipo = 'import' },
	{ hash = 2046537925, name = 'police', price = 2750000, banido = false, modelo = 'Amarok PMERJ', capacidade = 0, tipo = 'job' },	
	{ hash = 1917016601, name = 'trash', price = 2750000, banido = false, modelo = 'Caminhão de Lixo', capacidade = 0, tipo = 'job' },
	{ hash = -2137348917, name = 'phantom', price = 2750000, banido = false, modelo = 'Caminhão', capacidade = 0, tipo = 'job' },
	{ hash = -2006731729, name = 'q820', price = 2750000, banido = false, modelo = 'AUDI Q8', capacidade = 100, tipo = 'import' },
	{ hash = -863499820, name = 'rmodamgc63', price = 2750000, banido = false, modelo = 'Carro do Teles', capacidade = 100, tipo = 'import' },
	{ hash = 495771578, name = 'dodgecnp', price = 2750000, banido = false, modelo = 'Viatura 1', capacidade = 100, tipo = 'import' },
	{ hash = 835942048, name = 'dustgn', price = 2750000, banido = false, modelo = 'Viatura 2', capacidade = 100, tipo = 'import' },
	{ hash = -405643607, name = 'nc750x', price = 2750000, banido = false, modelo = 'Moto Policia', capacidade = 100, tipo = 'import' },
	{ hash = 1088829493, name = 'cg160', price = 2750000, banido = false, modelo = 'Moto KiFome', capacidade = 100, tipo = 'work' },
	{ hash = 351980252, name = 'teslaprior', price = 2750000, banido = false, modelo = 'TeslaPrior', capacidade = 50, tipo = 'import' },
	{ hash = -984938540, name = '18velar', price = 2750000, banido = false, modelo = '18velar', capacidade = 50, tipo = 'import' },
	{ hash = -1451113485, name = '599xxevo', price = 2750000, banido = false, modelo = '599xxevo', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1956311049, name = 'amaroktdi', price = 2750000, banido = false, modelo = 'amaroktdi', capacidade = 50, tipo = 'exclusive' },
	{ hash = -1555105668, name = 'fox', price = 500000, banido = false, modelo = 'fox', capacidade = 80, tipo = 'carros' },
	{ hash = -1737994370, name = 'rencaptur', price = 500000, banido = false, modelo = 'rencaptur', capacidade = 80, tipo = 'carros' },
	{ hash = -1246383966, name = 'jeepreneg', price = 500000, banido = false, modelo = 'jeepreneg', capacidade = 80, tipo = 'motos' },
	{ hash = -1586763167, name = 'sont18', price = 500000, banido = false, modelo = 'sont18', capacidade = 100, tipo = 'carros' },
	{ hash = -301519603, name = 'ram2500', price = 500000, banido = false, modelo = 'ram2500', capacidade = 200, tipo = 'exclusive' },
	{ hash = 436874758, name = 's1000rr', price = 500000, banido = false, modelo = 's1000rr', capacidade = 50, tipo = 'motos' },
	{ hash = -1823053791, name = 'bmw320i', price = 500000, banido = false, modelo = 'bmw320i', capacidade = 90, tipo = 'exclusive' },
	{ hash = 1642089321, name = 'cayenneturbo', price = 500000, banido = false, modelo = 'cayenneturbo', capacidade = 120, tipo = 'exclusive' },
	{ hash = -1560751994, name = 'pm19', price = 500000, banido = false, modelo = 'pm19', capacidade = 100, tipo = 'exclusive' },
	{ hash = -1296077726, name = 'pturismo', price = 500000, banido = false, modelo = 'pturismo', capacidade = 180, tipo = 'exclusive' },
	{ hash = 1268855214, name = 'bate', price = 100000000, banido = false, modelo = 'bate', capacidade = 0, tipo = 'exclusive' },
	{ hash = 1642089321, name = 'cayenneturbo', price = 100000000, banido = false, modelo = 'cayenneturbo', capacidade = 0, tipo = 'exclusive' },
	{ hash = 216350205, name = 'rs318', price = 100000000, banido = false, modelo = 'rs318', capacidade = 0, tipo = 'exclusive' },
	{ hash = -189485405, name = 'mers63c', price = 100000000, banido = false, modelo = 'mers63c', capacidade = 0, tipo = 'exclusive' },
	{ hash = 231217483, name = 'trhawk', price = 100000000, banido = false, modelo = 'trhawk', capacidade = 0, tipo = 'exclusive' },
	{ hash = 1418132356, name = 'prius', price = 100000000, banido = false, modelo = 'prius', capacidade = 0, tipo = 'exclusive' },
	{ hash = -247320603, name = 'hevo', price = 100000000, banido = false, modelo = 'hevo', capacidade = 0, tipo = 'exclusive' },
	{ hash =  -1321332185, name = 'lspdunm', price = 100000000, banido = false, modelo = 'lspdunm', capacidade = 0, tipo = 'exclusive' },
	{ hash =  987469656, name = 'lspdunm', price = 100000000, banido = false, modelo = 'lspdunm', capacidade = 0, tipo = 'exclusive' },
	{ hash = 216350205, name = 'rs18', price = 100000000, banido = false, modelo = 'AUDI RS3', capacidade = 90, tipo = 'exclusive' },
	
	{ hash = GetHashKey('19ftype'), name = '19ftype', price = 25000, banido = false, modelo = 'Ftype', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('19ramdonk'), name = '19ramdonk', price = 25000, banido = false, modelo = '19Ramdonk', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('70camarofn'), name = '70camarofn', price = 25000, banido = false, modelo = '70 Camaro', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('71gtx'), name = '71gtx', price = 25000, banido = false, modelo = 'GTX 71', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('180sx'), name = '180sx', price = 25000, banido = false, modelo = 'SX 180', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('240sx'), name = '240sx', price = 25000, banido = false, modelo = '240sx', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('350z'), name = '350z', price = 25000, banido = false, modelo = '350z', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('488'), name = '488', price = 25000, banido = false, modelo = '488', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('570s'), name = '570s', price = 25000, banido = false, modelo = '570s', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('675lt'), name = '675lt', price = 25000, banido = false, modelo = '675lt', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('720s'), name = '720s', price = 25000, banido = false, modelo = '720s', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('911r'), name = '911r', price = 25000, banido = false, modelo = '911r', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('918'), name = '918', price = 25000, banido = false, modelo = '918', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('918spyder'), name = '918spyder', price = 25000, banido = false, modelo = '918spyder', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('918spyder2'), name = '918spyder2', price = 25000, banido = false, modelo = '918spyder2', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('aakuma'), name = 'aakuma', price = 25000, banido = false, modelo = 'aakuma', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('abarth695'), name = 'abarth695', price = 25000, banido = false, modelo = 'abarth695', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('africat'), name = 'africat', price = 25000, banido = false, modelo = 'africat', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('agerars'), name = 'agerars', price = 25000, banido = false, modelo = 'agerars', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('airbus'), name = 'airbus', price = 25000, banido = false, modelo = 'airbus', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('akuruma'), name = 'akuruma', price = 25000, banido = false, modelo = 'akuruma', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('ambulance'), name = 'ambulance', price = 25000, banido = false, modelo = 'ambulance', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('amcdefiant'), name = 'amcdefiant', price = 25000, banido = false, modelo = 'amcdefiant', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('apanto'), name = 'apanto', price = 25000, banido = false, modelo = 'apanto', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('astonmartinvantage'), name = 'astonmartinvantage', price = 25000, banido = false, modelo = 'astonmartinvantage', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('atug'), name = 'atug', price = 25000, banido = false, modelo = 'atug', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('audir8'), name = 'audir8', price = 25000, banido = false, modelo = 'audir8', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('audirs6'), name = 'audirs6', price = 25000, banido = false, modelo = 'audirs6', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('audirs7'), name = 'audirs7', price = 25000, banido = false, modelo = 'audirs7', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('auditt'), name = 'auditt', price = 25000, banido = false, modelo = 'auditt', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('auno'), name = 'auno', price = 25000, banido = false, modelo = 'auno', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('ayamahar1'), name = 'ayamahar1', price = 25000, banido = false, modelo = 'ayamahar1', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bacalar'), name = 'bacalar', price = 25000, banido = false, modelo = 'bacalar', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bananao'), name = 'bananao', price = 25000, banido = false, modelo = 'bananao', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bbentayga'), name = 'bbentayga', price = 25000, banido = false, modelo = 'bbentayga', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bentleygt'), name = 'bentleygt', price = 25000, banido = false, modelo = 'bentleygt', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bikeifood'), name = 'bikeifood', price = 25000, banido = false, modelo = 'bikeifood', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bme6tun'), name = 'bme6tun', price = 25000, banido = false, modelo = 'bme6tun', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwi8'), name = 'bmwi8', price = 25000, banido = false, modelo = 'bmwi8', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwboltz'), name = 'bmwboltz', price = 25000, banido = false, modelo = 'bmwboltz', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwm3f80'), name = 'bmwm3f80', price = 25000, banido = false, modelo = 'bmwm3f80', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwm3gtr'), name = 'bmwm3gtr', price = 25000, banido = false, modelo = 'bmwm3gtr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwm4gts'), name = 'bmwm4gts', price = 25000, banido = false, modelo = 'bmwm4gts', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwm5e34'), name = 'bmwm5e34', price = 25000, banido = false, modelo = 'bmwm5e34', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwm5f90'), name = 'bmwm5f90', price = 25000, banido = false, modelo = 'bmwm5f90', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwm8'), name = 'bmwm8', price = 25000, banido = false, modelo = 'bmwm8', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwm8gte'), name = 'bmwm8gte', price = 25000, banido = false, modelo = 'bmwm8gte', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwm135i'), name = 'bmwm135i', price = 25000, banido = false, modelo = 'bmwm135i', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmwz4'), name = 'bmwz4', price = 25000, banido = false, modelo = 'bmwz4', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bnr34'), name = 'bnr34', price = 25000, banido = false, modelo = 'bnr34', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bolide'), name = 'bolide', price = 25000, banido = false, modelo = 'bolide', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('boxster'), name = 'boxster', price = 25000, banido = false, modelo = 'boxster', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bugattichiron'), name = 'bugattichiron', price = 25000, banido = false, modelo = 'bugattichiron', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('c7'), name = 'c7', price = 25000, banido = false, modelo = 'c7', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('c63amg'), name = 'c63amg', price = 25000, banido = false, modelo = 'c63amg', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('c63b'), name = 'c63b', price = 25000, banido = false, modelo = 'c63b', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('camarozl1'), name = 'camarozl1', price = 25000, banido = false, modelo = 'camarozl1', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('caravan'), name = 'caravan', price = 25000, banido = false, modelo = 'caravan', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cb500x'), name = 'cb500x', price = 25000, banido = false, modelo = 'cb500x', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cda500x'), name = 'cda500x', price = 25000, banido = false, modelo = 'cda500x', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdaaltafome'), name = 'cdaaltafome', price = 25000, banido = false, modelo = 'cdaaltafome', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cda500xt'), name = 'cda500xt', price = 25000, banido = false, modelo = 'cda500xt', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdaas350'), name = 'cdaas350', price = 25000, banido = false, modelo = 'cdaas350', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdaavalanches'), name = 'cdaavalanches', price = 25000, banido = false, modelo = 'cdaavalanches', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdac7'), name = 'cdac7', price = 25000, banido = false, modelo = 'cdac7', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdacaddy'), name = 'cdacaddy', price = 25000, banido = false, modelo = 'cdacaddy', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdacg'), name = 'cdacg', price = 25000, banido = false, modelo = 'cdacg', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdacivic'), name = 'cdacivic', price = 25000, banido = false, modelo = 'cdacivic', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdaentregas'), name = 'cdaentregas', price = 25000, banido = false, modelo = 'cdaentregas', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdagas'), name = 'cdagas', price = 25000, banido = false, modelo = 'cdagas', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdanews'), name = 'cdanews', price = 25000, banido = false, modelo = 'cdanews', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdanewsvan'), name = 'cdanewsvan', price = 25000, banido = false, modelo = 'cdanewsvan', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdaporsche'), name = 'cdaporsche', price = 25000, banido = false, modelo = 'cdaporsche', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdaram2500'), name = 'cdaram2500', price = 25000, banido = false, modelo = 'cdaram2500', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdaraptor'), name = 'cdaraptor', price = 25000, banido = false, modelo = 'cdaraptor', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdaseas'), name = 'cdaseas', price = 25000, banido = false, modelo = 'cdaseas', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdasprinter'), name = 'cdasprinter', price = 25000, banido = false, modelo = 'cdasprinter', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdataxi'), name = 'cdataxi', price = 25000, banido = false, modelo = 'cdataxi', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('cdauno'), name = 'cdauno', price = 25000, banido = false, modelo = 'cdauno', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('celta'), name = 'celta', price = 25000, banido = false, modelo = 'celta', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('chevroletcamarozl1'), name = 'chevroletcamarozl1', price = 25000, banido = false, modelo = 'chevroletcamarozl1', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('chillybin'), name = 'chillybin', price = 25000, banido = false, modelo = 'chillybin', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('compass'), name = 'compass', price = 25000, banido = false, modelo = 'compass', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('compass2'), name = 'compass2', price = 25000, banido = false, modelo = 'compass2', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('corvettec8'), name = 'corvettec8', price = 25000, banido = false, modelo = 'corvettec8', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('db11'), name = 'db11', price = 25000, banido = false, modelo = 'db11', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('dbs'), name = 'dbs', price = 25000, banido = false, modelo = 'dbs', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('dodgechallenger'), name = 'dodgechallenger', price = 25000, banido = false, modelo = 'dodgechallenger', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('dodgecharger'), name = 'dodgecharger', price = 25000, banido = false, modelo = 'dodgecharger', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('dodgechargersrt'), name = 'dodgechargersrt', price = 25000, banido = false, modelo = 'dodgechargersrt', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('dodgeram2500'), name = 'dodgeram2500', price = 25000, banido = false, modelo = 'dodgeram2500', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('domo'), name = 'domo', price = 25000, banido = false, modelo = 'domo', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('drone'), name = 'drone', price = 25000, banido = false, modelo = 'drone', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('eclipse'), name = 'eclipse', price = 25000, banido = false, modelo = 'eclipse', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('eg6'), name = 'eg6', price = 25000, banido = false, modelo = 'eg6', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('escort'), name = 'escort', price = 25000, banido = false, modelo = 'escort', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('essenza'), name = 'essenza', price = 25000, banido = false, modelo = 'essenza', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('ferrari458'), name = 'ferrari458', price = 25000, banido = false, modelo = 'ferrari458', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('ferrari812'), name = 'ferrari812', price = 25000, banido = false, modelo = 'ferrari812', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('ferraricalifornia'), name = 'ferraricalifornia', price = 25000, banido = false, modelo = 'ferraricalifornia', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('ferrarif12tdf'), name = 'ferrarif12tdf', price = 25000, banido = false, modelo = 'ferrarif12tdf', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('ferrarif40'), name = 'ferrarif40', price = 25000, banido = false, modelo = 'ferrarif40', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('filthynsx'), name = 'filthynsx', price = 25000, banido = false, modelo = 'filthynsx', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('fordfocusrs'), name = 'fordfocusrs', price = 25000, banido = false, modelo = 'fordfocusrs', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('fordmustang'), name = 'fordmustang', price = 25000, banido = false, modelo = 'fordmustang', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('fordraptor2017'), name = 'fordraptor2017', price = 25000, banido = false, modelo = 'fordraptor2017', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('fordshelby'), name = 'fordshelby', price = 25000, banido = false, modelo = 'fordshelby', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('fxxkevo'), name = 'fxxkevo', price = 25000, banido = false, modelo = 'fxxkevo', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('greenheli'), name = 'greenheli', price = 25000, banido = false, modelo = 'greenheli', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('greenranger'), name = 'greenranger', price = 25000, banido = false, modelo = 'greenranger', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('gs1'), name = 'gs1', price = 25000, banido = false, modelo = 'gs1', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('gt17'), name = 'gt17', price = 25000, banido = false, modelo = 'gt17', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('gt63'), name = 'gt63', price = 25000, banido = false, modelo = 'gt63', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('gtr50'), name = 'gtr50', price = 25000, banido = false, modelo = 'gtr50', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('harleydavidsonfx'), name = 'harleydavidsonfx', price = 25000, banido = false, modelo = 'harleydavidsonfx', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('harleydavidsonrg'), name = 'harleydavidsonrg', price = 25000, banido = false, modelo = 'harleydavidsonrg', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('helinews'), name = 'helinews', price = 25000, banido = false, modelo = 'helinews', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('hondacbr650r'), name = 'hondacbr650r', price = 25000, banido = false, modelo = 'hondacbr650r', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('hondacivic2000'), name = 'hondacivic2000', price = 25000, banido = false, modelo = 'hondacivic2000', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('hondafk8'), name = 'hondafk8', price = 25000, banido = false, modelo = 'hondafk8', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('hondansx'), name = 'hondansx', price = 25000, banido = false, modelo = 'Audi A4 Policia', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('i8'), name = 'i8', price = 25000, banido = false, modelo = 'i8', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('ie'), name = 'ie', price = 25000, banido = false, modelo = 'ie', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('jeepcherokee'), name = 'jeepcherokee', price = 25000, banido = false, modelo = 'jeepcherokee', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('jeepgladiator'), name = 'jeepgladiator', price = 25000, banido = false, modelo = 'jeepgladiator', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('jesko'), name = 'jesko', price = 25000, banido = false, modelo = 'jesko', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('kombi'), name = 'kombi', price = 25000, banido = false, modelo = 'kombi', capacidade = 20, tipo = 'exclusive' },
	
	{ hash = GetHashKey('laferrari'), name = 'laferrari', price = 25000, banido = false, modelo = 'laferrari', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lamborghinievo'), name = 'lamborghinievo', price = 25000, banido = false, modelo = 'lamborghinievo', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lamborghinievos'), name = 'lamborghinievos', price = 25000, banido = false, modelo = 'lamborghinievos', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lamborghinihuracan'), name = 'lamborghinihuracan', price = 25000, banido = false, modelo = 'lamborghinihuracan', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lamborghinigallardo'), name = 'lamborghinigallardo', price = 25000, banido = false, modelo = 'lamborghinigallardo', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lamtmc'), name = 'lamtmc', price = 25000, banido = false, modelo = 'lamtmc', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lancerevolution9'), name = 'lancerevolution9', price = 25000, banido = false, modelo = 'lancerevolution9', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lancerevolutionx'), name = 'lancerevolutionx', price = 25000, banido = false, modelo = 'lancerevolutionx', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lexuslfa'), name = 'lexuslfa', price = 25000, banido = false, modelo = 'lexuslfa', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lp670'), name = 'lp670', price = 25000, banido = false, modelo = 'lp670', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lp700r'), name = 'lp700r', price = 25000, banido = false, modelo = 'lp700r', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('lp6504'), name = 'lp6504', price = 25000, banido = false, modelo = 'lp6504', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('m2'), name = 'm2', price = 25000, banido = false, modelo = 'm2', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('m6e63'), name = 'm6e63', price = 25000, banido = false, modelo = 'm6e63', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mazdarx7'), name = 'mazdarx7', price = 25000, banido = false, modelo = 'mazdarx7', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mbati'), name = 'mbati', price = 25000, banido = false, modelo = 'mbati', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mbride'), name = 'mbride', price = 25000, banido = false, modelo = 'mbride', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mclarensenna'), name = 'mclarensenna', price = 25000, banido = false, modelo = 'mclarensenna', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mercedesa45'), name = 'mercedesa45', price = 25000, banido = false, modelo = 'mercedesa45', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mercedesamggtr'), name = 'mercedesamggtr', price = 25000, banido = false, modelo = 'mercedesamggtr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mercedescla45'), name = 'mercedescla45', price = 25000, banido = false, modelo = 'mercedescla45', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mercedesg65'), name = 'mercedesg65', price = 25000, banido = false, modelo = 'mercedesg65', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mercedess63'), name = 'mercedess63', price = 25000, banido = false, modelo = 'mercedess63', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mercedesslsamg'), name = 'mercedesslsamg', price = 25000, banido = false, modelo = 'mercedesslsamg', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('monstergt'), name = 'monstergt', price = 25000, banido = false, modelo = 'monstergt', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('monsterr'), name = 'monsterr', price = 25000, banido = false, modelo = 'monsterr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('monza'), name = 'monza', price = 25000, banido = false, modelo = 'monza', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('msanchez'), name = 'msanchez', price = 25000, banido = false, modelo = 'msanchez', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mustangeleanor'), name = 'mustangeleanor', price = 25000, banido = false, modelo = 'mustangeleanor', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('nissan370z'), name = 'nissan370z', price = 25000, banido = false, modelo = 'nissan370z', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('nissangtr'), name = 'nissangtr', price = 25000, banido = false, modelo = 'nissangtr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('nissangtrnismo'), name = 'nissangtrnismo', price = 25000, banido = false, modelo = 'nissangtrnismo', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('nissansilvias15'), name = 'nissansilvias15', price = 25000, banido = false, modelo = 'nissansilvias15', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('nissanskyliner34'), name = 'nissanskyliner34', price = 25000, banido = false, modelo = 'nissanskyliner34', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('nissantitan17'), name = 'nissantitan17', price = 25000, banido = false, modelo = 'nissantitan17', capacidade = 20, tipo = 'exclusive' },

	{ hash = GetHashKey('opalass'), name = 'opalass', price = 25000, banido = false, modelo = 'opalass', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('p1'), name = 'p1', price = 25000, banido = false, modelo = 'p1', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('p1gtr'), name = 'p1gtr', price = 25000, banido = false, modelo = 'p1gtr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('panamera'), name = 'panamera', price = 25000, banido = false, modelo = 'panamera', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('porsche930'), name = 'porsche930', price = 25000, banido = false, modelo = 'porsche930', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('porsche992'), name = 'porsche992', price = 25000, banido = false, modelo = 'porsche992', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('porschemacan'), name = 'porschemacan', price = 25000, banido = false, modelo = 'porschemacan', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('quadra'), name = 'quadra', price = 25000, banido = false, modelo = 'quadra', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('r32'), name = 'r32', price = 25000, banido = false, modelo = 'r32', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('r33'), name = 'r33', price = 25000, banido = false, modelo = 'r33', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('rangerovervelar'), name = 'rangerovervelar', price = 25000, banido = false, modelo = 'rangerovervelar', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('regera'), name = 'regera', price = 25000, banido = false, modelo = 'regera', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('rmodamgc63'), name = 'rmodamgc63', price = 25000, banido = false, modelo = 'rmodamgc63', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('rmodbugatti'), name = 'rmodbugatti', price = 25000, banido = false, modelo = 'rmodbugatti', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('rr14'), name = 'rr14', price = 25000, banido = false, modelo = 'rr14', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('rs6'), name = 'rs6', price = 25000, banido = false, modelo = 'rs6', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('rumpo'), name = 'rumpo', price = 25000, banido = false, modelo = 'rumpo', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('s15'), name = 's15', price = 25000, banido = false, modelo = 's15', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('s600'), name = 's600', price = 25000, banido = false, modelo = 's600', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('scaniarepair'), name = 'scaniarepair', price = 25000, banido = false, modelo = 'scaniarepair', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('sennagtr'), name = 'sennagtr', price = 25000, banido = false, modelo = 'sennagtr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('sian'), name = 'sian', price = 25000, banido = false, modelo = 'sian', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('silv86'), name = 'silv86', price = 25000, banido = false, modelo = 'silv86', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('skart'), name = 'skart', price = 25000, banido = false, modelo = 'skart', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('skyr34'), name = 'skyr34', price = 25000, banido = false, modelo = 'skyr34', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('snowmobile'), name = 'snowmobile', price = 25000, banido = false, modelo = 'snowmobile', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('speedtail'), name = 'speedtail', price = 25000, banido = false, modelo = 'speedtail', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('subarubrz'), name = 'subarubrz', price = 25000, banido = false, modelo = 'subarubrz', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('subaruwrx2004'), name = 'subaruwrx2004', price = 25000, banido = false, modelo = 'subaruwrx2004', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('supragr'), name = 'supragr', price = 25000, banido = false, modelo = 'supragr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('svj63'), name = 'svj63', price = 25000, banido = false, modelo = 'svj63', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('tembici'), name = 'tembici', price = 25000, banido = false, modelo = 'tembici', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('teslamodelx'), name = 'teslamodelx', price = 25000, banido = false, modelo = 'teslamodelx', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('teslaprior'), name = 'teslaprior', price = 25000, banido = false, modelo = 'teslaprior', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('tonkat'), name = 'tonkat', price = 25000, banido = false, modelo = 'tonkat', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('toyotasupra'), name = 'toyotasupra', price = 25000, banido = false, modelo = 'toyotasupra', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('trator'), name = 'trator', price = 25000, banido = false, modelo = 'trator', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('urus'), name = 'urus', price = 25000, banido = false, modelo = 'urus', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('rmodgt63mini'), name = 'GTmini', price = 25000, banido = false, modelo = 'rmodgt63mini', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('veneno'), name = 'veneno', price = 25000, banido = false, modelo = 'veneno', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('viper'), name = 'viper', price = 25000, banido = false, modelo = 'viper', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('vwamarok'), name = 'vwamarok', price = 25000, banido = false, modelo = 'vwamarok', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('vwfox'), name = 'vwfox', price = 25000, banido = false, modelo = 'vwfox', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('vwfusca'), name = 'vwfusca', price = 25000, banido = false, modelo = 'vwfusca', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('vwgol'), name = 'vwgol', price = 25000, banido = false, modelo = 'vwgol', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('vwjetta'), name = 'vwjetta', price = 25000, banido = false, modelo = 'vwjetta', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('vwpassat'), name = 'vwpassat', price = 25000, banido = false, modelo = 'vwpassat', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('vwpassat2'), name = 'vwpassat2', price = 25000, banido = false, modelo = 'vwpassat2', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('yamahar1'), name = 'yamahar1', price = 25000, banido = false, modelo = 'yamahar1', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('phantom'), name = 'phantom', price = 25000, banido = false, modelo = 'phantom', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('iak_wheelchair'), name = 'iak_wheelchair', price = 25000, banido = false, modelo = 'iak_wheelchair', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('flatbed3'), name = 'flatbed3', price = 25000, banido = false, modelo = 'flatbed3', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('Wrasprinter'), name = 'Wrasprinter', price = 25000, banido = false, modelo = 'Wrasprinter', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('WRr1200'), name = 'WRr1200', price = 25000, banido = false, modelo = 'WRr1200', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('WR19raptor'), name = 'WR19raptor', price = 25000, banido = false, modelo = 'WR19raptor', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('audia4'), name = 'audia4', price = 25000, banido = false, modelo = 'audia4', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('audiq8'), name = 'audiq8', price = 25000, banido = false, modelo = 'audiq8', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('fordpolicia'), name = 'fordpolicia', price = 25000, banido = false, modelo = 'fordpolicia', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('riotpolicia'), name = 'riotpolicia', price = 25000, banido = false, modelo = 'riotpolicia', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('audirs62'), name = 'audirs62', price = 25000, banido = false, modelo = 'audirs62', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('wrsxr'), name = 'wrsxr', price = 25000, banido = false, modelo = 'wrsxr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('WRc8'), name = 'WRc8', price = 25000, banido = false, modelo = 'WRc8', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('WRbmwm4'), name = 'WRbmwm4', price = 25000, banido = false, modelo = 'WRbmwm4', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('trash'), name = 'trash', price = 25000, banido = false, modelo = 'trash', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('19raptor'), name = '19raptor', price = 25000, banido = false, modelo = '19raptor', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('s1000rr'), name = 's1000rr', price = 25000, banido = false, modelo = 's1000rr', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('mt03'), name = 'mt03', price = 25000, banido = false, modelo = 'mt03', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('yzfr7'), name = 'yzfr7', price = 25000, banido = false, modelo = 'yzfr7', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('r25'), name = 'r25', price = 25000, banido = false, modelo = 'r25', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('z1000'), name = 'z1000', price = 25000, banido = false, modelo = 'z1000', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bmws'), name = 'bmws', price = 25000, banido = false, modelo = 'bmws', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('hcbr17'), name = 'hcbr17', price = 25000, banido = false, modelo = 'hcbr17', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('r1'), name = 'r1', price = 25000, banido = false, modelo = 'r1', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('r1250'), name = 'r1250', price = 25000, banido = false, modelo = 'r1250', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('tiger'), name = 'tiger', price = 25000, banido = false, modelo = 'tiger', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('zx10r'), name = 'zx10r', price = 25000, banido = false, modelo = 'zx10r', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('dm1200'), name = 'dm1200', price = 25000, banido = false, modelo = 'dm1200', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('hilux2016'), name = 'hilux2016', price = 25000, banido = false, modelo = 'hilux2016', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('punto'), name = 'punto', price = 25000, banido = false, modelo = 'punto', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('rmodmk7'), name = 'rmodmk7', price = 25000, banido = false, modelo = 'rmodmk7', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('B412'), name = 'B412', price = 25000, banido = false, modelo = 'B412', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('bcat'), name = 'bcat', price = 25000, banido = false, modelo = 'bcat', capacidade = 20, tipo = 'exclusive' },
	{ hash = GetHashKey('Tiger900pm'), name = 'Tiger900pm', price = 25000, banido = false, modelo = 'Tiger900pm', capacidade = 20, tipo = 'exclusive' },






	{ hash = 216350205, name = 'rs18', price = 100000000, banido = false, modelo = 'AUDI RS3', capacidade = 90, tipo = 'exclusive' },


	{ hash = 1127131465, name = 'fbi', price = 0, banido = true, modelo = 'fbi', capacidade = 0, tipo = 'work' },
  }
----------------------------------------------
----------------------------------------------
----------------------------------------------


-- RETORNA A LISTA DE VEÍCULOS
config.getVehList = function()
	return config.vehList
end

-- RETORNA AS INFORMAÇÕES CONTIDAS NA LISTA DE UM VEÍCULO ESPECÍFICO
config.getVehicleInfo = function(vehicle)
	for i in ipairs(config.vehList) do
		if vehicle == config.vehList[i].hash or vehicle == config.vehList[i].name then
            return config.vehList[i]
        end
    end
    return false
end

-- RETORNA O MODELO DE UM VEÍCULO ESPECÍFICO (NOME BONITINHO)
config.getVehicleModel = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.modelo or vehicle
	end
	return vehicle
end

-- RETORNA A CAPACIDADE DO PORTA-MALAS DE UM VEÍCULO ESPECÍFICO
config.getVehicleTrunk = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.capacidade or 0
	end
	return 0
end

-- RETORNA O PREÇO DE UM VEÍCULO ESPECÍFICO
config.getVehiclePrice = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.price or 0
	end
	return 0
end

-- RETORNA O TIPO DE UM VEÍCULO ESPECÍFICO
config.getVehicleType = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.tipo or 0
	end
	return "none"
end

-- RETORNA O STATUS DE BANIDO DE UM VEÍCULO ESPECÍFICO
config.isVehicleBanned = function(vehicle)
	local vehInfo = config.getVehicleInfo(vehicle)
	if vehInfo then
		return vehInfo.banido
	end
	return false
end



-----------------------------------------------------------------
------------- GARAGENS PÚBLICAS E DE SERVIÇO --------------------
-----------------------------------------------------------------

config.garages = {
	[1] = { type = 'public', coords = vec3(-362.83, -885.54, 31.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-361.05, -889.29, 31.08), h = 270.00 },
		[2] = { vec3(-361.33, -893.17, 31.08), h = 270.00 },
	  },
	},
	[2] = { type = 'public', coords = vec3(596.68, 91.69, 93.13), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(599.38,98.16,92.06), h = 249.86 },
		[2] = { vec3(600.04, 102.25, 92.91), h = 249.86 },
		[3] = { vec3(609.93, 94.23, 92.52), h = 156.09 },
	  },
	},
	[3] = { type = 'public', coords = vec3(-340.76,265.97,85.67), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-329.74,274.2,85.44), h = 93.8 },
		[2] = { vec3(-329.47, 277.81, 86.31), h = 93.8 },
	  },
	},
	[4] = { type = 'public', coords = vec3(5000,-465.97,11.6), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-2024.27,-471.93,11.4), h = 140.0 },
	  },
	},
	[5] = { type = 'public', coords = vec3(-1184.92,-1510.0,4.64), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-1183.49,-1495.92,4.37), h = 125.0 },
		[2] = { vec3(-1185.22, -1493.19, 4.38), h = 125.0 },
	  },
	},
	[6] = { type = 'public', coords = vec3(-73.44,-2004.99,18.27), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-84.96,-2004.22,18.01), h = 352.0 },
		[2] = { vec3(-88.86, -2003.68, 18.02), h = 352.0 },
	  },
	},
	[7] = { type = 'public', coords = vec3(214.02,-808.44,31.01), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(222.11,-804.16,29.83), h = 247.0 },
		[2] = { vec3(224.20,-799.43,30.65), h = 247.0 },
	  },
	},
	[8] = { type = 'public', coords = vec3(-348.88,-874.02,31.31), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-343.73,-875.45,30.22), h = 168.42 },
		[2] = { vec3(-340.09,-876.25,31.07), h = 168.42 },
	  },
	},
	[9] = { type = 'public', coords = vec3(67.74,12.27,69.21), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(64.17,17.22,68.37), h = 339.38 },
	  },
	},
	[10] = { type = 'public', coords = vec3(361.9,297.81,103.88), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(361.08,293.5,102.65), h = 249.67 },
	  },
	},
	[11] = { type = 'public', coords = vec3(-773.34,5598.15,33.6), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-771.76, 5578.34, 33.49), h = 89.01 },
		[2] = { vec3(-771.53, 5575.25, 33.49), h = 89.01 },
	  },
	},
	[12] = { type = 'public', coords = vec3(323.5,-203.07,54.08), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(318.07,-203.28,53.24), h = 249.14 },
	  },
	},
	[13] = { type = 'public', coords = vec3(317.25,2623.14,44.46), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(334.52,2623.09,44.49), h = 20.0 },
	  },
	},
	[14] = { type = 'public', coords = vec3(1156.9,-453.73,66.98), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(1155.2,-461.58,65.97), h = 167.96 },
		[2] = { vec3(1151.67, -460.83, 66.84), h = 167.96 },
	  },
	},
	[15] = { type = 'public', coords = vec3(-102.21,6345.18,31.57), perm = nil,
	  vehiclePositions = {
		[1] = { vec3(-98.29,6341.76,30.64), h = 224.27 },
	  },
	},
    [15] = { type = 'public', coords = vec3(-423.49, -342.7, 24.23), perm = nil,        
	  vehiclePositions = {
		[1] = { vec3(-440.05, -337.99, 24.24), h = 200.00 },
		[2] = { vec3(-444.28, -339.11, 24.24), h = 200.00 },
	  },
	},
	[16] = { type = 'service', coords = vec3(463.2,-981.8, 43.7), perm = 'policia.permissao', --//dp da praia
	  vehiclePositions = {
		[1] = { vec3(449.3,-981.33,43.7), h = 274.9507446289063 },
	  },
	  vehicles = {
		{ vehicle = 'b412', modelo = 'Helicoptero da Core' },
	  },
	},
	[17] = { type = 'service', coords = vec3(441.57,-988.73,25.7), perm = 'policia.permissao', --//dp da praia
	  vehiclePositions = {
		[1] = { vec3(445.18,-994.29,25.7), h = 89.35476884570312 },
	  },
	  vehicles = {
		{ vehicle = 'wrbmwm5', modelo = 'BMW M5 Policia' },
		{ vehicle = 'wrsubaru', modelo = 'Subaru Policia' },
		{ vehicle = 'wrclassxv2', modelo = 'Class XV2 Policia' },
		{ vehicle = 'wrtiger900', modelo = 'Tiger 900 Policia' },						
	  },
	},
	[18] = { type = 'service', coords = vec3(-1857.87,-314.12,49.2), perm = 'paramedico.permissao', --/HP
	  vehiclePositions = {
		[1] = { vec3(-1858.66,-306.93,49.15), h = 226.1752166748047 },
	  },
	  vehicles = {
		{ vehicle = 'ambulance', modelo = 'Ambulancia' },
	  },
	},
	[19] = { type = 'service', coords = vec3(-174.32,-1309.34,31.34), perm = 'policia.permissao', --/BENNYS
	  vehiclePositions = {
		[1] = { vec3(-170.64,-1303.9,31.29), h = 94.31919860839844 },
	  },
	  vehicles = {
		{ vehicle = 'police', modelo = 'police' },
		{ vehicle = 'police3', modelo = 'police3' },		
	  },
	},
	[20] = { type = 'service', coords = vec3(748.4,6453.32,32.0), perm = nil, --/Graos
	  vehiclePositions = {
		[1] = { vec3(743.61,6448.78,32.08), h = 81.99 },
		[2] = { vec3(736.26,6450.16,32.0), h = 81.99 },
	  },
	  vehicles = {
		{ vehicle = 'tractor2', modelo = 'Trator' },
		{ vehicle = 'rebel', modelo = 'Rebel' },		
	  },
	},
	[21] = { type = 'service', coords = vec3(453.66,-600.49,28.6), perm = nil, --/Graos
	  vehiclePositions = {
		[1] = { vec3(465.16,-611.29,28.49), h = 177.63 },
	  },
	  vehicles = {
		{ vehicle = 'coach', modelo = 'Onibus' },			
	  },
	},
	[22] = { type = 'service', coords = vec3(-350.05,-1569.99,25.23), perm = nil, --/Graos
	  vehiclePositions = {
		[1] = { vec3(-344.87,-1562.32,25.24), h = 84.96 },
	  },
	  vehicles = {
		{ vehicle = 'trash', modelo = 'Caminhao de Lixo' },	
	  },
	},
	[23] = { type = 'service', coords = vec3(2412.04,4997.3,46.6), perm = nil, --/Graos
	  vehiclePositions = {
		[1] = { vec3(2411.95,4989.8,46.26), h = 143.33 },
	  },
	  vehicles = {
		{ vehicle = 'rebel', modelo = 'Rebel' },					
				
	  }
	},
  }
  
----------------------------------------------------------------- -349.87,-1570.27,25.23
-----------------------------------------------------------------



-----------------------------------------------------------------
------------------ GARAGENS DAS CASAS ---------------------------
-----------------------------------------------------------------

config.homeGarages = {
	[1] = { type = 'home', coords = vec3(21.41,548.3,176.02),
	  vehiclePositions = {
		[1] = { vec3(14.98,549.89,175.5), h = 60.7 },
	  },
	  home = 'MS01'
	},
	[2] = { type = 'home', coords = vec3(-813.06,184.23,72.47),
	  vehiclePositions = {
		[1] = { vec3(-821.16,185.31,71.25), h = 119.13 },
	  },
	  home = 'MS02'
	},
	[3] = { type = 'home', coords = vec3(-681.48,901.64,230.57),
	  vehiclePositions = {
		[1] = { vec3(-675.44,903.59,229.73), h = 326.35 },
	  },
	  home = 'MS03'
	},
	[4] = { type = 'home', coords = vec3(-2596.87,1927.04,167.31),
	  vehiclePositions = {
		[1] = { vec3(-2588.73,1929.85,166.46), h = 275.01 },
	  },
	  home = 'MS04'
	},
	[5] = { type = 'home', coords = vec3(-3014.84,740.75,27.58),
	  vehiclePositions = {
		[1] = { vec3(-3019.92,740.24,26.63), h = 103.34 },
	  },
	  home = 'MS05'
	},
	[6] = { type = 'home', coords = vec3(-1890.29,-572.99,11.82),
	  vehiclePositions = {
		[1] = { vec3(-1886.63,-571.43,10.93), h = 319.54 },
	  },
	  home = 'MS09'
	},
	[7] = { type = 'home', coords = vec3(1551.96,2190.1,78.85),
	  vehiclePositions = {
		[1] = { vec3(1554.26,2196.07,78.5), h = 352.11 },
	  },
	  home = 'SS01'
	},
	[8] = { type = 'home', coords = vec3(-2977.14,650.92,25.78),
	  vehiclePositions = {
		[1] = { vec3(-2982.74,654.65,25.015), h = 106.83 },
	  },
	  home = 'MS08'
	},
	[9] = { type = 'home', coords = vec3(1398.36,1115.1,114.84),
	  vehiclePositions = {
		[1] = { vec3(1401.95,1118.01,114.84), h = 355.97 },
	  },
	  home = 'FZ01'
	},
	[10] = { type = 'home', coords = vec3(-1937.07,577.96,119.56),
	  vehiclePositions = {
		[1] = { vec3(-1943.92,583.37,118.79), h = 255.987 },
	  },
	  home = 'LX41'
	},
	[11] = { type = 'home', coords = vec3(-491.13,751.51,162.84),
	  vehiclePositions = {
		[1] = { vec3(-492.05,745.92,162.84), h = 329.81 },
	  },
	  home = 'FH85'
	},
	[12] = { type = 'home', coords = vec3(-877.56,497.95,91.02),
	  vehiclePositions = {
		[1] = { vec3(-872.97,499.76,90.47), h = 106.56 },
	  },
	  home = 'FH02'
	},
	[13] = { type = 'home', coords = vec3(-1005.17,715.55,164.0),
	  vehiclePositions = {
		[1] = { vec3(-1006.29,709.66,162.37), h = 344.07 },
	  },
	  home = 'FH16'
	},
	[14] = { type = 'home', coords = vec3(151.2,568.06,183.98),
	  vehiclePositions = {
		[1] = { vec3(148.7,572.69,183.95), h = 86.85 },
	  },
	  home = 'LX57'
	},
	[15] = { type = 'home', coords = vec3(-864.47,463.46,88.22),
	  vehiclePositions = {
		[1] = { vec3(-861.31,462.66,86.93), h = 276.73 },
	  },
	  home = 'FH01'
	},
	[16] = { type = 'home', coords = vec3(-850.62,522.18,90.62),
	  vehiclePositions = {
		[1] = { vec3(-851.05,514.29,90.15), h = 106.56 },
	  },
	  home = 'FH04'
	},
	[17] = { type = 'home', coords = vec3(-938.56,445.34,80.42),
	  vehiclePositions = {
		[1] = { vec3(-942.71,443.81,79.99), h = 198.88 },
	  },
	  home = 'FH11'
	},
	[18] = { type = 'home', coords = vec3(-1074.27,468.75,77.82),
	  vehiclePositions = {
		[1] = { vec3(-1079.1,465.49,76.79), h = 144.79 },
	  },
	  home = 'FH15'
	},
	[19] = { type = 'home', coords = vec3(-971.31,455.98,79.82),
	  vehiclePositions = {
		[1] = { vec3(-967.03,450.03,78.97), h = 199.58 },
	  },
	  home = 'FH19'
	},
	[20] = { type = 'home', coords = vec3(-736.59,439.85,106.9),
	  vehiclePositions = {
		[1] = { vec3(-736.19,446.59,105.88), h = 3.21 },
	  },
	  home = 'FH23'
	},
	[21] = { type = 'home', coords = vec3(-716.59,500.53,109.27),
	  vehiclePositions = {
		[1] = { vec3(-716.94,495.36,108.43), h = 206.78 },
	  },
	  home = 'FH24'
	},
	[22] = { type = 'home', coords = vec3(-692.91,507.84,110.36),
	  vehiclePositions = {
		[1] = { vec3(-688.85,500.77,109.21), h = 201.51 },
	  },
	  home = 'FH26'
	},
	[23] = { type = 'home', coords = vec3(-574.21,492.54,106.97),
	  vehiclePositions = {
		[1] = { vec3(-573.79,498.15,105.38), h = 9.46 },
	  },
	  home = 'FH29'
	},
	[24] = { type = 'home', coords = vec3(-589.59,531.83,108.17),
	  vehiclePositions = {
		[1] = { vec3(-586.67,526.68,106.72), h = 215.41 },
	  },
	  home = 'FH31'
	},
	[25] = { type = 'home', coords = vec3(-574.01,394.76,100.67),
	  vehiclePositions = {
		[1] = { vec3(-574.73,401.65,99.82), h = 19.61 },
	  },
	  home = 'FH32'
	},
	[26] = { type = 'home', coords = vec3(-447.07,376.54,104.77),
	  vehiclePositions = {
		[1] = { vec3(-456.49,372.48,103.93), h = 358.58 },
	  },
	  home = 'FH45'
	},
	[27] = { type = 'home', coords = vec3(-523.67,525.26,112.44),
	  vehiclePositions = {
		[1] = { vec3(-526.66,530.68,110.95), h = 44.11 },
	  },
	  home = 'FH48'
	},
	[28] = { type = 'home', coords = vec3(-517.36,578.31,120.84),
	  vehiclePositions = {
		[1] = { vec3(-511.63,577.15,119.52), h = 97.85 },
	  },
	  home = 'FH49'
	},
	[29] = { type = 'home', coords = vec3(-470.24,538.11,121.46),
	  vehiclePositions = {
		[1] = { vec3(-468.04,542.62,119.92), h = 355.06 },
	  },
	  home = 'FH52'
	},
	[30] = { type = 'home', coords = vec3(-397.25,512.34,120.19),
	  vehiclePositions = {
		[1] = { vec3(-398.63,518.94,119.68), h = 355.21 },
	  },
	  home = 'FH54'
	},
	[31] = { type = 'home', coords = vec3(-356.43,473.56,112.52),
	  vehiclePositions = {
		[1] = { vec3(-351.33,474.7,111.89), h = 299.59 },
	  },
	  home = 'FH55'
	},
	[32] = { type = 'home', coords = vec3(-357.14,517.38,120.15),
	  vehiclePositions = {
		[1] = { vec3(-362.62,514.72,118.67), h = 134.89 },
	  },
	  home = 'FH58'
	},
	[33] = { type = 'home', coords = vec3(-312.45,483.18,113.46),
	  vehiclePositions = {
		[1] = { vec3(-320.42,480.85,111.44), h = 118.55 },
	  },
	  home = 'FH59'
	},
	[34] = { type = 'home', coords = vec3(-1371.63,451.89,105.34),
	  vehiclePositions = {
		[1] = { vec3(-1376.73,453.26,104.04), h = 80.28 },
	  },
	  home = 'FH68'
	},
	[35] = { type = 'home', coords = vec3(-463.57,676.11,148.54),
	  vehiclePositions = {
		[1] = { vec3(-467.37,673.46,146.8), h = 148.4 },
	  },
	  home = 'FH81'
	},
	[36] = { type = 'home', coords = vec3(-956.88,804.188,177.56),
	  vehiclePositions = {
		[1] = { vec3(-958.62,800.59,176.76), h = 152.94 },
	  },
	  home = 'FH91'
	},
	[37] = { type = 'home', coords = vec3(-921.15,813.8,184.33),
	  vehiclePositions = {
		[1] = { vec3(-920.0,806.38,183.37), h = 189.06 },
	  },
	  home = 'FH92'
	},
	[38] = { type = 'home', coords = vec3(-1004.0,783.99,171.38),
	  vehiclePositions = {
		[1] = { vec3(-997.95,786.76,171.06), h = 293.5 },
	  },
	  home = 'FH93'
	},
	[39] = { type = 'home', coords = vec3(-810.25,803.55,202.18),
	  vehiclePositions = {
		[1] = { vec3(-811.6,809.51,201.24), h = 19.71 },
	  },
	  home = 'FH94'
	},
	[40] = { type = 'home', coords = vec3(-876.54,-57.11,38.05),
	  vehiclePositions = {
		[1] = { vec3(-869.45,-54.25,37.6), h = 281.38 },
	  },
	  home = 'LX01'
	},
	[41] = { type = 'home', coords = vec3(-890.55,-17.35,43.1),
	  vehiclePositions = {
		[1] = { vec3(-885.98,-16.18,42.15), h = 304.12 },
	  },
	  home = 'LX02'
	},
	[42] = { type = 'home', coords = vec3(-872.28,51.35,48.78),
	  vehiclePositions = {
		[1] = { vec3(-875.02,46.86,48.39), h = 195.46 },
	  },
	  home = 'LX03'
	},
	[43] = { type = 'home', coords = vec3(-969.08,107.74,55.66),
	  vehiclePositions = {
		[1] = { vec3(-960.77,109.36,55.49), h = 314.26 },
	  },
	  home = 'LX04'
	},
	[44] = { type = 'home', coords = vec3(-1885.63,629.92,129.99),
	  vehiclePositions = {
		[1] = { vec3(-1890.51,626.0,129.15), h = 136.16 },
	  },
	  home = 'LX05'
	},
	[45] = { type = 'home', coords = vec3(-997.43,142.37,60.66),
	  vehiclePositions = {
		[1] = { vec3(-992.02,144.19,59.81), h = 269.99 },
	  },
	  home = 'LX06'
	},
	[46] = { type = 'home', coords = vec3(-1045.16,224.98,63.76),
	  vehiclePositions = {
		[1] = { vec3(-1048.01,219.47,62.91), h = 184.73 },
	  },
	  home = 'LX07'
	},
	[47] = { type = 'home', coords = vec3(-923.9,212.7,67.46),
	  vehiclePositions = {
		[1] = { vec3(-933.57,210.69,66.61), h = 163.52 },
	  },
	  home = 'LX08'
	},
	[48] = { type = 'home', coords = vec3(-905.04,196.27,69.5),
	  vehiclePositions = {
		[1] = { vec3(-911.78,190.68,68.59), h = 179.92 },
	  },
	  home = 'LX09'
	},
	[49] = { type = 'home', coords = vec3(-915.48,114.68,55.31),
	  vehiclePositions = {
		[1] = { vec3(-920.41,112.49,54.47), h = 84.9 },
	  },
	  home = 'LX10'
	},
	[50] = { type = 'home', coords = vec3(-931.72,13.37,47.91),
	  vehiclePositions = {
		[1] = { vec3(-925.27,9.31,46.87), h = 214.83 },
	  },
	  home = 'LX11'
	},
	[51] = { type = 'home', coords = vec3(-835.07,119.47,55.46),
	  vehiclePositions = {
		[1] = { vec3(-839.12,112.3,54.43), h = 210.36 },
	  },
	  home = 'LX12'
	},
	[52] = { type = 'home', coords = vec3(-1058.75,299.58,66.0),
	  vehiclePositions = {
		[1] = { vec3(-1061.49,305.25,65.13), h = 353.81 },
	  },
	  home = 'LX13'
	},
	[53] = { type = 'home', coords = vec3(-827.87,267.95,86.2),
	  vehiclePositions = {
		[1] = { vec3(-824.72,273.44,85.68), h = 342.78 },
	  },
	  home = 'LX14'
	},
	[54] = { type = 'home', coords = vec3(-869.56,322.71,83.97),
	  vehiclePositions = {
		[1] = { vec3(-870.29,317.83,83.13), h = 186.23 },
	  },
	  home = 'LX15'
	},
	[55] = { type = 'home', coords = vec3(-1026.73,363.75,71.36),
	  vehiclePositions = {
		[1] = { vec3(-1011.08,360.01,70.05), h = 331.43 },
	  },
	  home = 'LX17'
	},
	[56] = { type = 'home', coords = vec3(-1555.85,426.75,109.62),
	  vehiclePositions = {
		[1] = { vec3(-1547.98,426.58,109.09), h = 272.82 },
	  },
	  home = 'LX18'
	},
	[57] = { type = 'home', coords = vec3(-1211.88,274.79,69.51),
	  vehiclePositions = {
		[1] = { vec3(-1204.83,267.12,68.69), h = 284.35 },
	  },
	  home = 'LX19'
	},
	[58] = { type = 'home', coords = vec3(-1101.71,354.46,68.48),
	  vehiclePositions = {
		[1] = { vec3(-1096.63,360.3,67.69), h = 357.45 },
	  },
	  home = 'LX20'
	},
	[59] = { type = 'home', coords = vec3(-1490.24,18.76,54.71),
	  vehiclePositions = {
		[1] = { vec3(-1490.16,23.07,53.88), h = 354.88 },
	  },
	  home = 'LX21'
	},
	[60] = { type = 'home', coords = vec3(-1457.65,-50.22,54.65),
	  vehiclePositions = {
		[1] = { vec3(-1455.68,-55.37,52.6), h = 240.6 },
	  },
	  home = 'LX22'
	},
	[61] = { type = 'home', coords = vec3(-1504.43,19.84,56.4),
	  vehiclePositions = {
		[1] = { vec3(-1503.75,26.86,55.15), h = 8.38 },
	  },
	  home = 'LX23'
	},
	[62] = { type = 'home', coords = vec3(-1581.46,-81.3,54.2),
	  vehiclePositions = {
		[1] = { vec3(-1577.19,-86.02,53.29), h = 270.66 },
	  },
	  home = 'LX24'
	},
	[63] = { type = 'home', coords = vec3(-1585.69,-55.63,56.48),
	  vehiclePositions = {
		[1] = { vec3(-1582.02,-61.06,55.64), h = 270.18 },
	  },
	  home = 'LX25'
	},
	[64] = { type = 'home', coords = vec3(-1558.52,17.86,58.83),
	  vehiclePositions = {
		[1] = { vec3(-1552.69,22.78,57.7), h = 347.5 },
	  },
	  home = 'LX26'
	},
	[65] = { type = 'home', coords = vec3(-1616.73,14.71,62.17),
	  vehiclePositions = {
		[1] = { vec3(-1613.07,20.02,61.32), h = 335.94 },
	  },
	  home = 'LX27'
	},
	[66] = { type = 'home', coords = vec3(-1892.99,120.59,81.64),
	  vehiclePositions = {
		[1] = { vec3(-1887.23,123.26,80.86), h = 338.84 },
	  },
	  home = 'LX28'
	},
	[67] = { type = 'home', coords = vec3(-1940.13,179.1,84.66),
	  vehiclePositions = {
		[1] = { vec3(-1932.93,182.84,83.68), h = 307.83 },
	  },
	  home = 'LX29'
	},
	[68] = { type = 'home', coords = vec3(-2000.65,296.59,91.76),
	  vehiclePositions = {
		[1] = { vec3(-1994.21,290.29,90.85), h = 221.21 },
	  },
	  home = 'LX32'
	},
	[69] = { type = 'home', coords = vec3(-2013.18,453.64,102.67),
	  vehiclePositions = {
		[1] = { vec3(-2006.95,454.86,101.79), h = 276.63 },
	  },
	  home = 'LX34'
	},
	[70] = { type = 'home', coords = vec3(-2016.62,485.7,107.18),
	  vehiclePositions = {
		[1] = { vec3(-2011.39,482.71,106.07), h = 255.38 },
	  },
	  home = 'LX35'
	},
	[71] = { type = 'home', coords = vec3(-1868.36,192.09,84.29),
	  vehiclePositions = {
		[1] = { vec3(-1874.17,194.45,83.77), h = 126.46 },
	  },
	  home = 'LX36'
	},
	[72] = { type = 'home', coords = vec3(-1899.62,241.7,86.26),
	  vehiclePositions = {
		[1] = { vec3(-1904.45,242.14,85.6), h = 27.89 },
	  },
	  home = 'LX37'
	},
	[73] = { type = 'home', coords = vec3(-1918.91,285.25,89.07),
	  vehiclePositions = {
		[1] = { vec3(-1925.28,283.01,88.23), h = 182.84 },
	  },
	  home = 'LX38'
	},
	[74] = { type = 'home', coords = vec3(-1935.69,366.09,93.82),
	  vehiclePositions = {
		[1] = { vec3(-1940.58,360.31,92.55), h = 160.68 },
	  },
	  home = 'LX39'
	},
	[75] = { type = 'home', coords = vec3(-1938.82,386.17,96.5),
	  vehiclePositions = {
		[1] = { vec3(-1943.95,385.19,95.6), h = 96.89 },
	  },
	  home = 'LX40'
	},
	[76] = { type = 'home', coords = vec3(-1937.4,462.55,102.42),
	  vehiclePositions = {
		[1] = { vec3(-1947.37,462.9,101.12), h = 99.05 },
	  },
	  home = 'LX41'
	},
	[77] = { type = 'home', coords = vec3(-1856.34,322.6,88.72),
	  vehiclePositions = {
		[1] = { vec3(-1857.45,328.42,87.8), h = 11.41 },
	  },
	  home = 'LX42'
	},
	[78] = { type = 'home', coords = vec3(-1789.94,345.73,88.55),
	  vehiclePositions = {
		[1] = { vec3(-1790.72,353.87,87.72), h = 64.22 },
	  },
	  home = 'LX43'
	},
	[79] = { type = 'home', coords = vec3(-1745.31,368.33,89.72),
	  vehiclePositions = {
		[1] = { vec3(-1750.77,365.56,88.85), h = 114.91 },
	  },
	  home = 'LX44'
	},
	[80] = { type = 'home', coords = vec3(-1665.21,385.25,89.49),
	  vehiclePositions = {
		[1] = { vec3(-1663.42,391.43,88.39), h = 9.57 },
	  },
	  home = 'LX45'
	},
	[81] = { type = 'home', coords = vec3(-1785.52,456.14,128.3),
	  vehiclePositions = {
		[1] = { vec3(-1794.11,459.4,127.46), h = 98.09 },
	  },
	  home = 'LX46'
	},
	[82] = { type = 'home', coords = vec3(-1991.66,605.61,117.9),
	  vehiclePositions = {
		[1] = { vec3(-1985.63,602.72,117.28), h = 238.48 },
	  },
	  home = 'LX47'
	},
	[83] = { type = 'home', coords = vec3(-1937.7,529.39,110.73),
	  vehiclePositions = {
		[1] = { vec3(-1944.07,521.99,108.31), h = 71.0 },
	  },
	  home = 'LX48'
	},
	[84] = { type = 'home', coords = vec3(-1977.58,624.88,122.53),
	  vehiclePositions = {
		[1] = { vec3(-1971.35,620.69,121.14), h = 246.1 },
	  },
	  home = 'LX50'
	},
	[85] = { type = 'home', coords = vec3(-165.4,919.61,235.65),
	  vehiclePositions = {
		[1] = { vec3(-162.36,926.68,234.8), h = 234.16 },
	  },
	  home = 'LX51'
	},
	[86] = { type = 'home', coords = vec3(-172.67,966.12,237.53),
	  vehiclePositions = {
		[1] = { vec3(-167.03,970.73,235.79), h = 316.56 },
	  },
	  home = 'LX52'
	},
	[87] = { type = 'home', coords = vec3(-124.76,1010.75,235.73),
	  vehiclePositions = {
		[1] = { vec3(-127.89,1001.16,234.88), h = 198.68 },
	  },
	  home = 'LX53'
	},
	[88] = { type = 'home', coords = vec3(-101.17,823.95,235.72),
	  vehiclePositions = {
		[1] = { vec3(-105.63,832.61,234.86), h = 10.25 },
	  },
	  home = 'LX54'
	},
	[89] = { type = 'home', coords = vec3(220.71,755.29,204.85),
	  vehiclePositions = {
		[1] = { vec3(215.84,759.38,203.83), h = 47.56 },
	  },
	  home = 'LX55'
	},
	[90] = { type = 'home', coords = vec3(100.21,563.99,182.94),
	  vehiclePositions = {
		[1] = { vec3(93.13,575.77,182.13), h = 86.85 },
	  },
	  home = 'LX58'
	},
	[91] = { type = 'home', coords = vec3(52.84,559.77,180.21),
	  vehiclePositions = {
		[1] = { vec3(53.19,563.71,179.54), h = 21.7 },
	  },
	  home = 'LX59'
	},
	[92] = { type = 'home', coords = vec3(-143.65,593.14,203.9),
	  vehiclePositions = {
		[1] = { vec3(-142.21,597.23,203.12), h = 358.34 },
	  },
	  home = 'LX60'
	},
	[93] = { type = 'home', coords = vec3(-196.6,621.58,197.91),
	  vehiclePositions = {
		[1] = { vec3(-199.24,615.31,196.21), h = 178.98 },
	  },
	  home = 'LX61'
	},
	[94] = { type = 'home', coords = vec3(-174.92,590.04,197.63),
	  vehiclePositions = {
		[1] = { vec3(-178.23,587.21,197.03), h = 359.63 },
	  },
	  home = 'LX62'
	},
	[95] = { type = 'home', coords = vec3(-224.87,588.93,190.02),
	  vehiclePositions = {
		[1] = { vec3(-221.77,593.25,189.61), h = 331.22 },
	  },
	  home = 'LX63'
	},
	[96] = { type = 'home', coords = vec3(-271.65,599.1,181.68),
	  vehiclePositions = {
		[1] = { vec3(-272.26,603.6,181.15), h = 346.6 },
	  },
	  home = 'LX64'
	},
	[97] = { type = 'home', coords = vec3(-241.91,614.9,187.77),
	  vehiclePositions = {
		[1] = { vec3(-244.12,610.79,186.09), h = 149.22 },
	  },
	  home = 'LX65'
	},
	[98] = { type = 'home', coords = vec3(1290.05,-585.69,71.75),
	  vehiclePositions = {
		[1] = { vec3(1295.49,-567.62,71.49), h = 344.65 },
	  },
	  home = 'LS01'
	},
	[99] = { type = 'home', coords = vec3(1311.03,-593.07,72.93),
	  vehiclePositions = {
		[1] = { vec3(1319.19,-575.18,73.25), h = 336.97 },
	  },
	  home = 'LS02'
	},
	[100] = { type = 'home', coords = vec3(1344.65,-609.86,74.36),
	  vehiclePositions = {
		[1] = { vec3(1348.97,-603.76,74.64), h = 334.73 },
	  },
	  home = 'LS03'
	},
	[101] = { type = 'home', coords = vec3(1359.91,-620.48,74.34),
	  vehiclePositions = {
		[1] = { vec3(1360.55,-601.83,74.62), h = 359.42 },
	  },
	  home = 'LS04'
	},
	[102] = { type = 'home', coords = vec3(1392.87,-607.72,74.35),
	  vehiclePositions = {
		[1] = { vec3(1378.33,-596.21,74.61), h = 52.88 },
	  },
	  home = 'LS05'
	},
	[103] = { type = 'home', coords = vec3(1404.84,-570.68,74.35),
	  vehiclePositions = {
		[1] = { vec3(1387.73,-577.37,74.62), h = 113.2 },
	  },
	  home = 'LS06'
	},
	[104] = { type = 'home', coords = vec3(1366.95,-544.46,74.34),
	  vehiclePositions = {
		[1] = { vec3(1363.05,-551.94,74.62), h = 157.25 },
	  },
	  home = 'LS07'
	},
	[105] = { type = 'home', coords = vec3(1360.66,-536.8,73.78),
	  vehiclePositions = {
		[1] = { vec3(1352.89,-553.3,74.31), h = 156.76 },
	  },
	  home = 'LS08'
	},
	[106] = { type = 'home', coords = vec3(1322.0,-524.9,72.13),
	  vehiclePositions = {
		[1] = { vec3(1318.24,-532.96,72.35), h = 160.86 },
	  },
	  home = 'LS09'
	},
	[107] = { type = 'home', coords = vec3(1314.79,-516.59,71.41),
	  vehiclePositions = {
		[1] = { vec3(1307.96,-533.58,71.56), h = 160.38 },
	  },
	  home = 'LS10'
	},
	[108] = { type = 'home', coords = vec3(1245.08,-518.7,69.0),
	  vehiclePositions = {
		[1] = { vec3(1247.17,-522.7,69.25), h = 257.36 },
	  },
	  home = 'LS11'
	},
	[109] = { type = 'home', coords = vec3(1251.25,-490.29,69.5),
	  vehiclePositions = {
		[1] = { vec3(1260.63,-494.22,69.59), h = 255.66 },
	  },
	  home = 'LS12'
	},
	[110] = { type = 'home', coords = vec3(1259.55,-477.81,70.19),
	  vehiclePositions = {
		[1] = { vec3(1280.06,-472.81,69.24), h = 170.02 },
	  },
	  home = 'LS13'
	},
	[111] = { type = 'home', coords = vec3(1268.56,-461.81,69.84),
	  vehiclePositions = {
		[1] = { vec3(1270.98,-463.9,69.87), h = 328.18 },
	  },
	  home = 'LS14'
	},
	[112] = { type = 'home', coords = vec3(1261.12,-426.7,69.81),
	  vehiclePositions = {
		[1] = { vec3(1261.45,-419.35,69.58), h = 297.04 },
	  },
	  home = 'LS15'
	},
	[113] = { type = 'home', coords = vec3(1234.75,-578.25,69.49),
	  vehiclePositions = {
		[1] = { vec3(1243.86,-579.36,69.64), h = 271.53 },
	  },
	  home = 'LS16'
	},
	[114] = { type = 'home', coords = vec3(1236.79,-589.55,69.79),
	  vehiclePositions = {
		[1] = { vec3(1242.92,-586.85,69.55), h = 269.57 },
	  },
	  home = 'LS17'
	},
	[115] = { type = 'home', coords = vec3(1250.47,-626.17,69.35),
	  vehiclePositions = {
		[1] = { vec3(1259.06,-624.91,69.58), h = 296.96 },
	  },
	  home = 'LS18'
	},
	[116] = { type = 'home', coords = vec3(1257.67,-660.38,67.93),
	  vehiclePositions = {
		[1] = { vec3(1271.84,-659.12,68.0), h = 293.69 },
	  },
	  home = 'LS19'
	},
	[117] = { type = 'home', coords = vec3(1267.25,-673.65,65.75),
	  vehiclePositions = {
		[1] = { vec3(1276.75,-673.42,66.25), h = 277.48 },
	  },
	  home = 'LS20'
	},
	[118] = { type = 'home', coords = vec3(1259.79,-711.08,64.72),
	  vehiclePositions = {
		[1] = { vec3(1263.72,-716.66,64.75), h = 239.07 },
	  },
	  home = 'LS21'
	},
	[119] = { type = 'home', coords = vec3(1225.19,-723.04,60.64),
	  vehiclePositions = {
		[1] = { vec3(1223.46,-730.21,60.4), h = 163.48 },
	  },
	  home = 'LS22'
	},
	[120] = { type = 'home', coords = vec3(1228.5,-703.47,60.68),
	  vehiclePositions = {
		[1] = { vec3(1217.85,-704.09,60.7), h = 97.24 },
	  },
	  home = 'LS23'
	},
	[121] = { type = 'home', coords = vec3(1220.91,-664.18,63.13),
	  vehiclePositions = {
		[1] = { vec3(1214.36,-665.12,62.85), h = 103.07 },
	  },
	  home = 'LS24'
	},
	[122] = { type = 'home', coords = vec3(1206.75,-614.0,66.12),
	  vehiclePositions = {
		[1] = { vec3(1199.98,-612.47,65.36), h = 94.4 },
	  },
	  home = 'LS25'
	},
	[123] = { type = 'home', coords = vec3(1192.48,-597.08,64.01),
	  vehiclePositions = {
		[1] = { vec3(1188.28,-595.06,64.23), h = 34.45 },
	  },
	  home = 'LS26'
	},
	[124] = { type = 'home', coords = vec3(1189.79,-573.78,64.32),
	  vehiclePositions = {
		[1] = { vec3(1185.82,-569.96,64.56), h = 25.68 },
	  },
	  home = 'LS27'
	},
	[125] = { type = 'home', coords = vec3(1191.61,-554.97,64.71),
	  vehiclePositions = {
		[1] = { vec3(1187.47,-550.38,64.83), h = 86.85 },
	  },
	  home = 'LS28'
	},
	[126] = { type = 'home', coords = vec3(1089.59,-495.42,65.07),
	  vehiclePositions = {
		[1] = { vec3(1084.78,-493.34,64.4), h = 79.01 },
	  },
	  home = 'LS29'
	},
	[127] = { type = 'home', coords = vec3(1101.7,-468.42,67.06),
	  vehiclePositions = {
		[1] = { vec3(1091.28,-470.87,65.47), h = 77.7 },
	  },
	  home = 'LS30'
	},
	[128] = { type = 'home', coords = vec3(1111.03,-417.0,67.16),
	  vehiclePositions = {
		[1] = { vec3(1111.15,-419.57,67.43), h = 83.31 },
	  },
	  home = 'LS31'
	},
	[129] = { type = 'home', coords = vec3(1112.77,-394.29,68.74),
	  vehiclePositions = {
		[1] = { vec3(1106.07,-399.24,68.2), h = 78.01 },
	  },
	  home = 'LS32'
	},
	[130] = { type = 'home', coords = vec3(1057.42,-384.09,67.86),
	  vehiclePositions = {
		[1] = { vec3(1056.9,-388.45,68.09), h = 221.13 },
	  },
	  home = 'LS33'
	},
	[131] = { type = 'home', coords = vec3(1021.13,-414.33,65.95),
	  vehiclePositions = {
		[1] = { vec3(1022.37,-419.52,66.05), h = 219.15 },
	  },
	  home = 'LS34'
	},
	[132] = { type = 'home', coords = vec3(1009.82,-418.88,64.96),
	  vehiclePositions = {
		[1] = { vec3(1015.92,-423.87,65.32), h = 217.1 },
	  },
	  home = 'LS35'
	},
	[133] = { type = 'home', coords = vec3(987.71,-438.07,63.75),
	  vehiclePositions = {
		[1] = { vec3(995.76,-435.43,64.23), h = 271.01 },
	  },
	  home = 'LS36'
	},
	[134] = { type = 'home', coords = vec3(971.53,-447.94,62.41),
	  vehiclePositions = {
		[1] = { vec3(975.54,-454.41,62.86), h = 213.74 },
	  },
	  home = 'LS37'
	},
	[135] = { type = 'home', coords = vec3(939.3,-463.22,61.26),
	  vehiclePositions = {
		[1] = { vec3(942.05,-469.79,61.53), h = 212.33 },
	  },
	  home = 'LS38'
	},
	[136] = { type = 'home', coords = vec3(928.77,-475.65,60.7),
	  vehiclePositions = {
		[1] = { vec3(933.31,-480.49,60.88), h = 203.27 },
	  },
	  home = 'LS39'
	},
	[137] = { type = 'home', coords = vec3(909.42,-489.73,59.02),
	  vehiclePositions = {
		[1] = { vec3(914.46,-490.17,59.29), h = 204.27 },
	  },
	  home = 'LS40'
	},
	[138] = { type = 'home', coords = vec3(873.98,-503.77,57.5),
	  vehiclePositions = {
		[1] = { vec3(874.77,-507.45,57.72), h = 226.29 },
	  },
	  home = 'LS41'
	},
	[139] = { type = 'home', coords = vec3(854.95,-516.17,57.33),
	  vehiclePositions = {
		[1] = { vec3(858.81,-522.39,57.59), h = 227.66 },
	  },
	  home = 'LS42'
	},
	[140] = { type = 'home', coords = vec3(848.57,-540.12,57.33),
	  vehiclePositions = {
		[1] = { vec3(853.51,-542.76,57.6), h = 266.06 },
	  },
	  home = 'LS43'
	},
	[141] = { type = 'home', coords = vec3(842.1,-567.41,57.71),
	  vehiclePositions = {
		[1] = { vec3(849.29,-567.47,57.99), h = 279.71 },
	  },
	  home = 'LS44'
	},
	[142] = { type = 'home', coords = vec3(868.47,-594.02,58.3),
	  vehiclePositions = {
		[1] = { vec3(872.86,-590.11,58.28), h = 317.23 },
	  },
	  home = 'LS45'
	},
	[143] = { type = 'home', coords = vec3(875.58,-602.34,58.45),
	  vehiclePositions = {
		[1] = { vec3(875.55,-598.36,58.45), h = 316.61 },
	  },
	  home = 'LS46'
	},
	[144] = { type = 'home', coords = vec3(912.15,-631.81,58.05),
	  vehiclePositions = {
		[1] = { vec3(917.67,-627.46,58.32), h = 319.36 },
	  },
	  home = 'LS47'
	},
	[145] = { type = 'home', coords = vec3(913.03,-645.12,57.87),
	  vehiclePositions = {
		[1] = { vec3(917.96,-639.77,58.14), h = 318.18 },
	  },
	  home = 'LS48'
	},
	[146] = { type = 'home', coords = vec3(946.14,-657.5,58.02),
	  vehiclePositions = {
		[1] = { vec3(951.67,-654.13,58.16), h = 309.34 },
	  },
	  home = 'LS49'
	},
	[147] = { type = 'home', coords = vec3(940.18,-672.19,58.02),
	  vehiclePositions = {
		[1] = { vec3(946.99,-669.22,58.29), h = 297.96 },
	  },
	  home = 'LS50'
	},
	[148] = { type = 'home', coords = vec3(969.7,-688.32,57.95),
	  vehiclePositions = {
		[1] = { vec3(973.59,-685.58,57.91), h = 309.99 },
	  },
	  home = 'LS51'
	},
	[149] = { type = 'home', coords = vec3(976.24,-713.97,57.87),
	  vehiclePositions = {
		[1] = { vec3(982.5,-709.42,57.88), h = 312.02 },
	  },
	  home = 'LS52'
	},
	[150] = { type = 'home', coords = vec3(1004.32,-734.1,57.46),
	  vehiclePositions = {
		[1] = { vec3(1008.02,-731.13,57.88), h = 311.05 },
	  },
	  home = 'LS53'
	},
	[151] = { type = 'home', coords = vec3(981.21,-614.8,58.84),
	  vehiclePositions = {
		[1] = { vec3(973.52,-619.61,59.1), h = 128.1 },
	  },
	  home = 'LS54'
	},
	[152] = { type = 'home', coords = vec3(959.79,-601.7,59.5),
	  vehiclePositions = {
		[1] = { vec3(955.45,-598.08,59.65), h = 27.96 },
	  },
	  home = 'LS55'
	},
	[153] = { type = 'home', coords = vec3(984.25,-579.14,59.28),
	  vehiclePositions = {
		[1] = { vec3(982.93,-572.6,59.53), h = 31.32 },
	  },
	  home = 'LS56'
	},
	[154] = { type = 'home', coords = vec3(1008.54,-565.15,60.2),
	  vehiclePositions = {
		[1] = { vec3(1012.51,-563.56,60.44), h = 263.72 },
	  },
	  home = 'LS57'
	},
	[155] = { type = 'home', coords = vec3(943.81,-243.89,68.63),
	  vehiclePositions = {
		[1] = { vec3(939.22,-250.12,68.69), h = 150.37 },
	  },
	  home = 'LS58'
	},
	[156] = { type = 'home', coords = vec3(1003.79,-588.12,59.14),
	  vehiclePositions = {
		[1] = { vec3(1009.07,-590.25,59.2), h = 258.95 },
	  },
	  home = 'LS59'
	},
	[157] = { type = 'home', coords = vec3(922.71,-564.06,57.97),
	  vehiclePositions = {
		[1] = { vec3(926.46,-567.39,58.24), h = 206.14 },
	  },
	  home = 'LS60'
	},
	[158] = { type = 'home', coords = vec3(956.87,-546.73,59.53),
	  vehiclePositions = {
		[1] = { vec3(957.91,-552.49,59.55), h = 211.12 },
	  },
	  home = 'LS61'
	},
	[159] = { type = 'home', coords = vec3(981.96,-530.0,60.12),
	  vehiclePositions = {
		[1] = { vec3(983.27,-536.41,60.19), h = 211.11 },
	  },
	  home = 'LS62'
	},
	[160] = { type = 'home', coords = vec3(1001.36,-510.47,60.7),
	  vehiclePositions = {
		[1] = { vec3(1003.89,-518.48,60.98), h = 205.24 },
	  },
	  home = 'LS63'
	},
	[161] = { type = 'home', coords = vec3(1045.95,-495.92,64.08),
	  vehiclePositions = {
		[1] = { vec3(1049.91,-488.79,64.19), h = 257.03 },
	  },
	  home = 'LS64'
	},
	[162] = { type = 'home', coords = vec3(1049.12,-479.89,64.1),
	  vehiclePositions = {
		[1] = { vec3(1056.64,-483.32,64.11), h = 257.85 },
	  },
	  home = 'LS65'
	},
	[163] = { type = 'home', coords = vec3(1055.36,-445.56,65.97),
	  vehiclePositions = {
		[1] = { vec3(1062.56,-445.67,66.16), h = 257.58 },
	  },
	  home = 'LS66'
	},
	[164] = { type = 'home', coords = vec3(1020.06,-464.4,63.9),
	  vehiclePositions = {
		[1] = { vec3(1019.04,-459.29,64.37), h = 38.05 },
	  },
	  home = 'LS67'
	},
	[165] = { type = 'home', coords = vec3(966.19,-505.37,61.74),
	  vehiclePositions = {
		[1] = { vec3(960.86,-500.52,61.65), h = 29.8 },
	  },
	  home = 'LS68'
	},
	[166] = { type = 'home', coords = vec3(950.42,-516.97,60.25),
	  vehiclePositions = {
		[1] = { vec3(948.5,-511.66,60.5), h = 29.22 },
	  },
	  home = 'LS69'
	},
	[167] = { type = 'home', coords = vec3(921.11,-527.47,59.58),
	  vehiclePositions = {
		[1] = { vec3(915.83,-522.63,59.03), h = 25.35 },
	  },
	  home = 'LS70'
	},
	[168] = { type = 'home', coords = vec3(893.88,-547.44,58.17),
	  vehiclePositions = {
		[1] = { vec3(888.36,-551.92,58.24), h = 115.0 },
	  },
	  home = 'LS71'
	},
	[169] = { type = 'home', coords = vec3(1103.28,-429.62,67.4),
	  vehiclePositions = {
		[1] = { vec3(1097.86,-428.24,66.68), h = 80.97 },
	  },
	  home = 'LS72'
	},
	[170] = { type = 'home', coords = vec3(102.82,-1959.78,20.84),
	  vehiclePositions = {
		[1] = { vec3(104.57,-1954.94,20.95), h = 355.58 },
	  },
	  home = 'KR01'
	},
	[171] = { type = 'home', coords = vec3(72.16,-1935.47,20.99),
	  vehiclePositions = {
		[1] = { vec3(81.72,-1932.41,21.02), h = 316.63 },
	  },
	  home = 'KR02'
	},
	[172] = { type = 'home', coords = vec3(14.13,-1886.93,23.24),
	  vehiclePositions = {
		[1] = { vec3(18.48,-1880.11,23.28), h = 320.5 },
	  },
	  home = 'KR03'
	},
	[173] = { type = 'home', coords = vec3(98.75,-1907.55,21.07),
	  vehiclePositions = {
		[1] = { vec3(89.81,-1917.18,20.98), h = 140.59 },
	  },
	  home = 'KR04'
	},
	[174] = { type = 'home', coords = vec3(101.95,-1883.62,24.02),
	  vehiclePositions = {
		[1] = { vec3(105.76,-1879.36,24.22), h = 319.71 },
	  },
	  home = 'KR05'
	},
	[175] = { type = 'home', coords = vec3(157.6,-1901.16,23.0),
	  vehiclePositions = {
		[1] = { vec3(162.82,-1899.28,23.26), h = 334.81 },
	  },
	  home = 'KR06'
	},
	[176] = { type = 'home', coords = vec3(163.9,-1954.67,19.32),
	  vehiclePositions = {
		[1] = { vec3(165.73,-1959.08,19.43), h = 227.78 },
	  },
	  home = 'KR07'
	},
	[177] = { type = 'home', coords = vec3(152.53,-1960.61,19.08),
	  vehiclePositions = {
		[1] = { vec3(152.79,-1965.88,19.04), h = 228.5 },
	  },
	  home = 'KR08'
	},
	[178] = { type = 'home', coords = vec3(58.69,-1878.41,22.39),
	  vehiclePositions = {
		[1] = { vec3(52.14,-1878.42,22.53), h = 136.83 },
	  },
	  home = 'KR09'
	},
	[179] = { type = 'home', coords = vec3(45.4,-1849.13,22.84),
	  vehiclePositions = {
		[1] = { vec3(41.44,-1853.34,23.11), h = 135.2 },
	  },
	  home = 'KR10'
	},
	[180] = { type = 'home', coords = vec3(-45.22,-1791.79,27.45),
	  vehiclePositions = {
		[1] = { vec3(-53.0,-1801.42,27.36), h = 50.04 },
	  },
	  home = 'KR11'
	},
	[181] = { type = 'home', coords = vec3(-54.09,-1781.86,27.88),
	  vehiclePositions = {
		[1] = { vec3(-57.67,-1785.85,28.12), h = 136.73 },
	  },
	  home = 'KR12'
	},
	[182] = { type = 'home', coords = vec3(140.35,-1866.11,24.32),
	  vehiclePositions = {
		[1] = { vec3(136.94,-1869.3,24.4), h = 155.02 },
	  },
	  home = 'KR13'
	},
	[183] = { type = 'home', coords = vec3(189.37,-1872.27,24.73),
	  vehiclePositions = {
		[1] = { vec3(186.58,-1877.13,24.85), h = 154.49 },
	  },
	  home = 'KR14'
	},
	[184] = { type = 'home', coords = vec3(248.21,-1732.71,29.38),
	  vehiclePositions = {
		[1] = { vec3(244.51,-1728.83,29.5), h = 49.0 },
	  },
	  home = 'KR15'
	},
	[185] = { type = 'home', coords = vec3(272.34,-1704.01,29.31),
	  vehiclePositions = {
		[1] = { vec3(268.09,-1700.73,29.57), h = 49.31 },
	  },
	  home = 'KR16'
	},
	[186] = { type = 'home', coords = vec3(291.46,-1783.92,28.26),
	  vehiclePositions = {
		[1] = { vec3(297.45,-1791.53,28.19), h = 228.58 },
	  },
	  home = 'KR17'
	},
	[187] = { type = 'home', coords = vec3(319.33,-1769.51,29.08),
	  vehiclePositions = {
		[1] = { vec3(321.52,-1773.31,28.93), h = 229.23 },
	  },
	  home = 'KR18'
	},
	[188] = { type = 'home', coords = vec3(142.93,-1832.74,27.07),
	  vehiclePositions = {
		[1] = { vec3(138.97,-1830.69,27.29), h = 49.32 },
	  },
	  home = 'KR19'
	},
	[189] = { type = 'home', coords = vec3(83.64,-1973.9,20.93),
	  vehiclePositions = {
		[1] = { vec3(87.72,-1968.8,21.03), h = 319.25 },
	  },
	  home = 'KR20'
	},
	[190] = { type = 'home', coords = vec3(80.39,-1949.55,20.8),
	  vehiclePositions = {
		[1] = { vec3(89.19,-1934.65,20.91), h = 217.76 },
	  },
	  home = 'KR21'
	},
	[191] = { type = 'home', coords = vec3(54.53,-1921.05,21.66),
	  vehiclePositions = {
		[1] = { vec3(62.29,-1910.55,21.78), h = 230.76 },
	  },
	  home = 'KR22'
	},
	[192] = { type = 'home', coords = vec3(37.3,-1926.34,21.8),
	  vehiclePositions = {
		[1] = { vec3(42.47,-1920.65,21.94), h = 320.78 },
	  },
	  home = 'KR23'
	},
	[193] = { type = 'home', coords = vec3(-10.49,-1883.78,24.15),
	  vehiclePositions = {
		[1] = { vec3(0.4,-1878.23,23.07), h = 319.84 },
	  },
	  home = 'KR24'
	},
	[194] = { type = 'home', coords = vec3(7.46,-1884.39,23.32),
	  vehiclePositions = {
		[1] = { vec3(15.62,-1871.47,23.56), h = 228.24 },
	  },
	  home = 'KR25'
	},
	[195] = { type = 'home', coords = vec3(-23.09,-1857.7,25.04),
	  vehiclePositions = {
		[1] = { vec3(-22.28,-1852.32,25.35), h = 318.16 },
	  },
	  home = 'KR26'
	},
	[196] = { type = 'home', coords = vec3(-33.91,-1855.64,26.01),
	  vehiclePositions = {
		[1] = { vec3(-36.14,-1861.29,26.03), h = 318.25 },
	  },
	  home = 'KR27'
	},
	[197] = { type = 'home', coords = vec3(123.49,-1927.1,21.01),
	  vehiclePositions = {
		[1] = { vec3(118.66,-1940.02,20.95), h = 86.06 },
	  },
	  home = 'KR28'
	},
	[198] = { type = 'home', coords = vec3(116.48,-1918.75,20.94),
	  vehiclePositions = {
		[1] = { vec3(109.49,-1924.84,21.03), h = 159.44 },
	  },
	  home = 'KR29'
	},
	[199] = { type = 'home', coords = vec3(112.4,-1884.8,23.59),
	  vehiclePositions = {
		[1] = { vec3(125.42,-1877.96,23.98), h = 245.04 },
	  },
	  home = 'KR30'
	},
	[200] = { type = 'home', coords = vec3(163.74,-1922.7,21.2),
	  vehiclePositions = {
		[1] = { vec3(166.25,-1929.66,21.29), h = 230.07 },
	  },
	  home = 'KR31'
	},
	[201] = { type = 'home', coords = vec3(142.93,-1970.81,18.86),
	  vehiclePositions = {
		[1] = { vec3(153.95,-1978.59,18.55), h = 139.63 },
	  },
	  home = 'KR32'
	},
	[202] = { type = 'home', coords = vec3(28.49,-1852.1,23.68),
	  vehiclePositions = {
		[1] = { vec3(20.42,-1863.32,23.63), h = 50.07 },
	  },
	  home = 'KR33'
	},
	[203] = { type = 'home', coords = vec3(11.84,-1843.19,24.53),
	  vehiclePositions = {
		[1] = { vec3(8.43,-1845.9,24.64), h = 139.44 },
	  },
	  home = 'KR34'
	},
	[204] = { type = 'home', coords = vec3(167.84,-1854.07,24.29),
	  vehiclePositions = {
		[1] = { vec3(165.62,-1861.16,24.41), h = 155.81 },
	  },
	  home = 'KR35'
	},
	[205] = { type = 'home', coords = vec3(206.99,-1892.89,24.43),
	  vehiclePositions = {
		[1] = { vec3(198.9,-1897.55,24.5), h = 142.92 },
	  },
	  home = 'KR36'
	},
	[206] = { type = 'home', coords = vec3(302.56,-1777.35,29.1),
	  vehiclePositions = {
		[1] = { vec3(312.42,-1785.76,28.42), h = 229.27 },
	  },
	  home = 'KR37'
	},
	[207] = { type = 'home', coords = vec3(289.96,-1789.91,27.7),
	  vehiclePositions = {
		[1] = { vec3(297.45,-1791.53,28.19), h = 228.58 },
	  },
	  home = 'KR38'
	},
	[208] = { type = 'home', coords = vec3(311.04,-1735.44,29.54),
	  vehiclePositions = {
		[1] = { vec3(315.43,-1739.08,29.73), h = 231.04 },
	  },
	  home = 'KR39'
	},
	[209] = { type = 'home', coords = vec3(269.11,-1728.64,29.65),
	  vehiclePositions = {
		[1] = { vec3(264.26,-1718.68,29.56), h = 49.25 },
	  },
	  home = 'KR40'
	},
	[210] = { type = 'home', coords = vec3(269.79,-1710.52,29.34),
	  vehiclePositions = {
		[1] = { vec3(257.55,-1701.71,29.31), h = 320.02 },
	  },
	  home = 'KR41'
	},
	[211] = { type = 'home', coords = vec3(248.94,-1936.94,24.35),
	  vehiclePositions = {
		[1] = { vec3(240.16,-1927.99,24.39), h = 319.7 },
	  },
	  home = 'LV01'
	},
	[212] = { type = 'home', coords = vec3(269.8,-1932.86,25.44),
	  vehiclePositions = {
		[1] = { vec3(263.07,-1921.28,25.41), h = 54.74 },
	  },
	  home = 'LV02'
	},
	[213] = { type = 'home', coords = vec3(270.61,-1914.8,25.81),
	  vehiclePositions = {
		[1] = { vec3(270.12,-1905.53,26.78), h = 51.02 },
	  },
	  home = 'LV03'
	},
	[214] = { type = 'home', coords = vec3(279.17,-1899.45,26.89),
	  vehiclePositions = {
		[1] = { vec3(269.73,-1892.82,26.83), h = 319.63 },
	  },
	  home = 'LV04'
	},
	[215] = { type = 'home', coords = vec3(318.07,-1856.29,27.11),
	  vehiclePositions = {
		[1] = { vec3(305.2,-1850.27,27.0), h = 320.21 },
	  },
	  home = 'LV05'
	},
	[216] = { type = 'home', coords = vec3(340.81,-1849.98,27.77),
	  vehiclePositions = {
		[1] = { vec3(335.81,-1835.98,27.61), h = 44.87 },
	  },
	  home = 'LV06'
	},
	[217] = { type = 'home', coords = vec3(344.21,-1828.31,27.95),
	  vehiclePositions = {
		[1] = { vec3(333.16,-1817.23,27.99), h = 320.18 },
	  },
	  home = 'LV07'
	},
	[218] = { type = 'home', coords = vec3(350.15,-1811.51,28.8),
	  vehiclePositions = {
		[1] = { vec3(342.37,-1806.23,28.48), h = 319.97 },
	  },
	  home = 'LV08'
	},
	[219] = { type = 'home', coords = vec3(404.54,-1753.91,29.37),
	  vehiclePositions = {
		[1] = { vec3(403.61,-1739.39,29.54), h = 46.7 },
	  },
	  home = 'LV09'
	},
	[220] = { type = 'home', coords = vec3(430.66,-1741.22,29.61),
	  vehiclePositions = {
		[1] = { vec3(431.33,-1735.54,28.65), h = 50.2 },
	  },
	  home = 'LV10'
	},
	[221] = { type = 'home', coords = vec3(434.96,-1715.43,29.33),
	  vehiclePositions = {
		[1] = { vec3(430.06,-1715.87,28.69), h = 49.34 },
	  },
	  home = 'LV11'
	},
	[222] = { type = 'home', coords = vec3(442.86,-1698.41,29.38),
	  vehiclePositions = {
		[1] = { vec3(442.78,-1693.12,28.66), h = 51.33 },
	  },
	  home = 'LV12'
	},
	[223] = { type = 'home', coords = vec3(498.38,-1698.89,29.41),
	  vehiclePositions = {
		[1] = { vec3(498.01,-1702.77,29.64), h = 236.28 },
	  },
	  home = 'LV13'
	},
	[224] = { type = 'home', coords = vec3(479.02,-1718.03,29.37),
	  vehiclePositions = {
		[1] = { vec3(490.02,-1721.93,29.62), h = 251.19 },
	  },
	  home = 'LV14'
	},
	[225] = { type = 'home', coords = vec3(464.62,-1740.78,29.11),
	  vehiclePositions = {
		[1] = { vec3(473.8,-1744.08,29.21), h = 250.4 },
	  },
	  home = 'LV15'
	},
	[226] = { type = 'home', coords = vec3(475.52,-1755.13,28.76),
	  vehiclePositions = {
		[1] = { vec3(488.5,-1757.75,28.71), h = 163.16 },
	  },
	  home = 'LV16'
	},
	[227] = { type = 'home', coords = vec3(475.02,-1772.84,28.7),
	  vehiclePositions = {
		[1] = { vec3(478.21,-1779.06,28.93), h = 270.19 },
	  },
	  home = 'LV17'
	},
	[228] = { type = 'home', coords = vec3(511.46,-1778.19,28.51),
	  vehiclePositions = {
		[1] = { vec3(499.79,-1777.14,28.64), h = 201.67 },
	  },
	  home = 'LV18'
	},
	[229] = { type = 'home', coords = vec3(504.82,-1799.04,28.49),
	  vehiclePositions = {
		[1] = { vec3(500.19,-1792.86,28.65), h = 161.09 },
	  },
	  home = 'LV19'
	},
	[230] = { type = 'home', coords = vec3(504.77,-1808.65,28.51),
	  vehiclePositions = {
		[1] = { vec3(491.87,-1805.02,28.65), h = 138.92 },
	  },
	  home = 'LV20'
	},
	[231] = { type = 'home', coords = vec3(487.7,-1826.73,28.53),
	  vehiclePositions = {
		[1] = { vec3(479.28,-1819.72,28.1), h = 139.7 },
	  },
	  home = 'LV21'
	},
	[232] = { type = 'home', coords = vec3(431.96,-1828.9,28.18),
	  vehiclePositions = {
		[1] = { vec3(437.06,-1837.91,28.21), h = 223.26 },
	  },
	  home = 'LV22'
	},
	[233] = { type = 'home', coords = vec3(428.72,-1839.65,28.08),
	  vehiclePositions = {
		[1] = { vec3(434.57,-1841.14,28.23), h = 222.18 },
	  },
	  home = 'LV23'
	},
	[234] = { type = 'home', coords = vec3(401.5,-1849.32,27.32),
	  vehiclePositions = {
		[1] = { vec3(394.61,-1849.77,26.41), h = 225.55 },
	  },
	  home = 'LV24'
	},
	[235] = { type = 'home', coords = vec3(396.69,-1872.65,26.25),
	  vehiclePositions = {
		[1] = { vec3(397.28,-1877.44,26.35), h = 222.91 },
	  },
	  home = 'LV25'
	},
	[236] = { type = 'home', coords = vec3(385.03,-1890.77,25.32),
	  vehiclePositions = {
		[1] = { vec3(384.63,-1896.36,25.21), h = 222.83 },
	  },
	  home = 'LV26'
	},
	[237] = { type = 'home', coords = vec3(360.06,-1894.9,24.99),
	  vehiclePositions = {
		[1] = { vec3(357.8,-1896.77,25.08), h = 227.0 },
	  },
	  home = 'LV27'
	},
	[238] = { type = 'home', coords = vec3(315.73,-1937.5,24.82),
	  vehiclePositions = {
		[1] = { vec3(315.5,-1942.05,24.92), h = 230.52 },
	  },
	  home = 'LV28'
	},
	[239] = { type = 'home', coords = vec3(310.66,-1965.91,23.74),
	  vehiclePositions = {
		[1] = { vec3(316.82,-1970.62,23.69), h = 138.57 },
	  },
	  home = 'LV29'
	},
	[240] = { type = 'home', coords = vec3(299.42,-1971.96,22.49),
	  vehiclePositions = {
		[1] = { vec3(306.82,-1982.39,22.39), h = 139.63 },
	  },
	  home = 'LV30'
	},
	[241] = { type = 'home', coords = vec3(282.89,-1980.29,21.4),
	  vehiclePositions = {
		[1] = { vec3(285.64,-1985.85,21.41), h = 229.16 },
	  },
	  home = 'LV31'
	},
	[242] = { type = 'home', coords = vec3(280.83,-1991.24,20.46),
	  vehiclePositions = {
		[1] = { vec3(286.37,-1992.54,20.81), h = 228.61 },
	  },
	  home = 'LV32'
	},
	[243] = { type = 'home', coords = vec3(256.42,-2026.71,18.86),
	  vehiclePositions = {
		[1] = { vec3(267.58,-2029.38,18.82), h = 142.23 },
	  },
	  home = 'LV33'
	},
	[244] = { type = 'home', coords = vec3(240.68,-2021.42,18.71),
	  vehiclePositions = {
		[1] = { vec3(246.74,-2035.94,18.53), h = 228.9 },
	  },
	  home = 'LV34'
	},
	[245] = { type = 'home', coords = vec3(241.9,-2042.78,18.02),
	  vehiclePositions = {
		[1] = { vec3(245.74,-2053.88,18.1), h = 134.18 },
	  },
	  home = 'LV35'
	},
	[246] = { type = 'home', coords = vec3(-442.95,6202.62,29.56),
	  vehiclePositions = {
		[1] = { vec3(-435.4,6206.42,29.57), h = 278.13 },
	  },
	  home = 'PB01'
	},
	[247] = { type = 'home', coords = vec3(-375.5,6187.37,31.54),
	  vehiclePositions = {
		[1] = { vec3(-379.5,6184.85,31.4), h = 223.82 },
	  },
	  home = 'PB02'
	},
	[248] = { type = 'home', coords = vec3(-361.91,6204.76,31.58),
	  vehiclePositions = {
		[1] = { vec3(-367.92,6200.05,31.4), h = 224.98 },
	  },
	  home = 'PB03'
	},
	[249] = { type = 'home', coords = vec3(-359.1,6227.29,31.5),
	  vehiclePositions = {
		[1] = { vec3(-349.5,6217.17,31.4), h = 223.88 },
	  },
	  home = 'PB04'
	},
	[250] = { type = 'home', coords = vec3(-381.48,6254.9,31.49),
	  vehiclePositions = {
		[1] = { vec3(-388.73,6273.42,30.02), h = 50.83 },
	  },
	  home = 'PB05'
	},
	[251] = { type = 'home', coords = vec3(-360.84,6265.04,31.53),
	  vehiclePositions = {
		[1] = { vec3(-352.17,6265.07,31.32), h = 46.14 },
	  },
	  home = 'PB06'
	},
	[252] = { type = 'home', coords = vec3(-436.46,6264.1,30.09),
	  vehiclePositions = {
		[1] = { vec3(-429.99,6260.87,30.31), h = 258.67 },
	  },
	  home = 'PB07'
	},
	[253] = { type = 'home', coords = vec3(-402.95,6317.15,28.95),
	  vehiclePositions = {
		[1] = { vec3(-396.68,6311.99,28.84), h = 220.7 },
	  },
	  home = 'PB08'
	},
	[254] = { type = 'home', coords = vec3(-364.3,6337.74,29.85),
	  vehiclePositions = {
		[1] = { vec3(-360.16,6328.54,29.75), h = 220.61 },
	  },
	  home = 'PB09'
	},
	[255] = { type = 'home', coords = vec3(-311.14,6310.94,32.48),
	  vehiclePositions = {
		[1] = { vec3(-318.17,6317.76,31.77), h = 45.39 },
	  },
	  home = 'PB10'
	},
	[256] = { type = 'home', coords = vec3(-291.83,6335.9,32.49),
	  vehiclePositions = {
		[1] = { vec3(-296.49,6340.57,31.82), h = 46.26 },
	  },
	  home = 'PB11'
	},
	[257] = { type = 'home', coords = vec3(-272.11,6353.73,32.49),
	  vehiclePositions = {
		[1] = { vec3(-267.41,6355.22,32.4), h = 47.15 },
	  },
	  home = 'PB12'
	},
	[258] = { type = 'home', coords = vec3(-250.27,6355.12,31.5),
	  vehiclePositions = {
		[1] = { vec3(-255.08,6360.48,31.39), h = 45.08 },
	  },
	  home = 'PB13'
	},
	[259] = { type = 'home', coords = vec3(-271.22,6408.91,31.12),
	  vehiclePositions = {
		[1] = { vec3(-265.26,6406.49,30.88), h = 210.49 },
	  },
	  home = 'PB14'
	},
	[260] = { type = 'home', coords = vec3(-217.34,6374.6,31.68),
	  vehiclePositions = {
		[1] = { vec3(-219.54,6383.16,31.52), h = 45.87 },
	  },
	  home = 'PB15'
	},
	[261] = { type = 'home', coords = vec3(-238.3,6423.56,31.46),
	  vehiclePositions = {
		[1] = { vec3(-233.04,6420.27,31.16), h = 220.84 },
	  },
	  home = 'PB16'
	},
	[262] = { type = 'home', coords = vec3(-201.42,6396.75,31.87),
	  vehiclePositions = {
		[1] = { vec3(-201.53,6401.82,31.77), h = 46.62 },
	  },
	  home = 'PB17'
	},
	[263] = { type = 'home', coords = vec3(-229.57,6445.5,31.2),
	  vehiclePositions = {
		[1] = { vec3(-224.33,6435.29,31.11), h = 22964 },
	  },
	  home = 'PB18'
	},
	[264] = { type = 'home', coords = vec3(-187.33,6412.01,31.92),
	  vehiclePositions = {
		[1] = { vec3(-187.43,6418.12,31.78), h = 44.99 },
	  },
	  home = 'PB19'
	},
	[265] = { type = 'home', coords = vec3(-122.88,6561.7,29.53),
	  vehiclePositions = {
		[1] = { vec3(-115.59,6567.64,29.43), h = 224.24 },
	  },
	  home = 'PB20'
	},
	[266] = { type = 'home', coords = vec3(-101.69,6531.68,29.81),
	  vehiclePositions = {
		[1] = { vec3(-106.48,6536.09,29.72), h = 45.2 },
	  },
	  home = 'PB21'
	},
	[267] = { type = 'home', coords = vec3(-37.32,6578.82,32.35),
	  vehiclePositions = {
		[1] = { vec3(-40.97,6593.44,30.34), h = 37.22 },
	  },
	  home = 'PB22'
	},
	[268] = { type = 'home', coords = vec3(-15.06,6566.75,31.91),
	  vehiclePositions = {
		[1] = { vec3(-8.44,6561.16,31.88), h = 224.22 },
	  },
	  home = 'PB23'
	},
	[269] = { type = 'home', coords = vec3(11.48,6578.36,33.08),
	  vehiclePositions = {
		[1] = { vec3(15.78,6583.02,32.35), h = 223.198 },
	  },
	  home = 'PB24'
	},
	[270] = { type = 'home', coords = vec3(-17.04,6598.51,31.48),
	  vehiclePositions = {
		[1] = { vec3(-8.5,6598.24,31.38), h = 39.88 },
	  },
	  home = 'PB25'
	},
	[271] = { type = 'home', coords = vec3(-43.93,6634.26,30.23),
	  vehiclePositions = {
		[1] = { vec3(-52.4,6623.94,29.87), h = 221 },
	  },
	  home = 'PB26'
	},
	[272] = { type = 'home', coords = vec3(-14.79,6650.52,31.15),
	  vehiclePositions = {
		[1] = { vec3(-15.82,6645.42,31.03), h = 208.0 },
	  },
	  home = 'PB27'
	},
	[273] = { type = 'home', coords = vec3(2.37,6618.26,31.47),
	  vehiclePositions = {
		[1] = { vec3(-5.0,6618.68,31.34), h = 60.09 },
	  },
	  home = 'PB28'
	},
	[274] = { type = 'home', coords = vec3(25.06,6601.97,32.48),
	  vehiclePositions = {
		[1] = { vec3(36.23,6606.74,32.38), h = 267.62 },
	  },
	  home = 'PB29'
	},
	[275] = { type = 'home', coords = vec3(24.79,6659.22,31.65),
	  vehiclePositions = {
		[1] = { vec3(21.16,6661.48,31.44), h = 182.65 },
	  },
	  home = 'PB30'
	},
	[276] = { type = 'public', coords = vec3(2555.76, -413.08, 93.16), perm = nil, 
	vehiclePositions = {
	  [1] = { vec3(2552.45, -408.55, 93.0), h = 342.66},
	  [2] = { vec3(2556.41, -408.48, 93.0), h = 342.66},
	  
	},
  }, 
	[277] = { type = 'public', coords = vec3(-947.92, -2456.7, 13.84), perm = nil, 
	vehiclePositions = {
	  [1] = { vec3(-956.34, -2449.17, 13.84), h = 233.80},
	  [2] = { vec3(-954.11, -2446.56, 13.84), h = 236.13},
	  
	},
  }, 
	[278] = { type = 'public', coords = vec3(-503.5, -287.59, 35.51), perm = nil, 
	vehiclePositions = {
	  [1] = { vec3(-508.57, -285.58, 35.33), h = 289.52},
	  [2] = { vec3(-513.35, -293.98, 35.25), h = 21.65},
	  [3] = { vec3(-517.61, -295.77, 35.22), h = 21.65},
	  
	},
  }, 
	[279] = { type = 'public', coords = vec3(-102.22, 6345.28, 31.58), perm = nil, 
	vehiclePositions = {
	  [1] = { vec3(-94.58, 6339.21, 31.5), h = 314.71 },
	  [2] = { vec3(-93.25, 6347.39, 31.5), h = 223.39},
	  [3] = { vec3(-96.01, 6344.75, 31.5), h = 223.39},
	  
	},
  }, 
	[280] = { type = 'public', coords = vec3(1898.52,3707.37,32.78), perm = nil, 
	vehiclePositions = {
	  [1] = { vec3(1894.84,3706.28,32.82), h = 115.92 },
	  [2] = { vec3(1893.88,3709.26,32.81), h = 115.92 },
	  
	},
  }, 
	[281] = { type = 'public', coords = vec3(-3137.92,1074.47,20.58), perm = nil, 
	vehiclePositions = {
	  [1] = { vec3(-3139.04,1078.72,20.62), h = 81.48 },
	  [2] = { vec3(-3138.66,1082.61,20.65), h = 81.48 },
	  
	},
  }, 
	[282] = { type = 'public', coords = vec3(-2030.18,-465.92,11.60), perm = nil, 
	vehiclePositions = {
	  [1] = { vec3(-2024.15,-471.87,11.40), h = 141.90 },
	  [2] = { vec3(-2021.72,-473.74,11.40), h = 141.90 },
	  
	},
  }, 
    [283] = { type = 'public', coords = vec3(-39.53, -1117.77, 26.44), perm = nil, 
    vehiclePositions = {
	[1] = { vec3(-45.0, -1116.38, 26.44), h = 1.92 },
	[2] = { vec3(-50.6, -1117.09, 26.44), h = 1.92 },
	
    },
  }, 
	[284] = { type = 'home', coords = vec3(81.27,6644.04,31.93),
	  vehiclePositions = {
		[1] = { vec3(72.41,6635.25,31.75), h = 142.72 },
	  },
	  home = 'PB31'
	},
  }
  
-----------------------------------------------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------



--------------------------------------------------------------------------------
-- função para checar se o player é dono da casa para poder acessar à  --
--------------------------------------------------------------------------------
config.hasHome = function(source,user_id,home)
	local hasHome = vRP.query("Bjorn/get_homeuser", {user_id = user_id, home = home})
	if hasHome and #hasHome > 0 then
		return true
	end
	TriggerClientEvent("Notify",source,"negado","Você não tem acesso à essa residência.",3000)
	return false
end
  