local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Proxy.getInterface("vRP")

tk = {}
Tunnel.bindInterface("desmanche", tk)

vCLIENT = Tunnel.getInterface("desmanche")

local desmanche = ""

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

------------------------------------------------------
-- CONFIG 
------------------------------------------------------
local RestritoParaDesmanche = true -- É restrito para quem tiver só a permissão do desmanche? (TRUE/FALSE)
local PermissaoDesmanche = 'desmanche.permissao' -- Se RestritoParaDesmanche for TRUE, aqui deverá ter a permissão que será verifiada.

local PrecisaDeItem = false -- Precisa de item para iniciar o desmanche? (TRUE/FALSE)
local ItemNecessario = 'c4' -- Qual item precisa para iniciar o desmanche?
local QtdNecessaria = 1 -- Quantos itens precisará para iniciar o desmanche?


local CarrosDesmanches = {

-------------------------------------------------------------------------|
----- CONCESSIONÁRIA ----------------------------------------------------|
-------------------------------------------------------------------------| 
    
['celta'] = 16000,
['versa'] = 20000,
['passat'] = 50000,
['vwgolf'] = 30000,
['chevette'] = 16000,
['corsa98'] = 10800,
['fusca'] = 8000,
['fiat'] = 4800,
['upzinho'] = 16000,
['primo'] = 28000,
['zion'] = 34000,
['felon2'] = 38000,
['emperor'] = 20000,
['sultan'] = 35000,
['hilux2019'] = 25000,
['amarok'] = 50000,
['nissantitan17'] = 50000,
['civic2016'] = 21000,
['eletran17'] = 32000,
['19raptor'] = 50000,
['fordka'] = 30000,
['fusion'] = 22000,
['golg7'] = 15000,
['l200civil'] = 50000,
['p207'] = 18000,
['punto'] = 20000,
['palio'] = 11000,
['santafe'] = 28000,
['saveiro'] = 50000,
['sonata18'] = 35000,
['veloster'] = 35000,
['vwpolo'] = 15000,
['cullinan'] = 50000,
['supra19'] = 60000,
['mvisiongt'] = 50000,
['jza80'] = 50000,
['urus'] = 60000,
['streetr33'] = 45000,
['bme6tun'] = 60000,
['mustangmach1'] = 50000,
['cyrus'] = 50000,
['carbonizzare'] = 50000,
['elegy2'] = 50000,
['jester'] = 50000,
['evoq'] = 50000,
['gresley'] = 50000,
['bestiagts'] = 50000,
['kuruma'] = 50000,
['ninef2'] = 50000,
['raiden'] = 50000,
['ruston'] = 50000,
['seven70'] = 50000,
['specter'] = 50000,
['nero2'] = 50000,
['osiris'] = 50000,
['pfister811'] = 50000,
['t20'] = 50000,
['turismor'] = 50000,
['vacca'] = 50000,
['visione'] = 50000,
['voltic'] = 50000,
['tyrant'] = 50000,
['entity2'] = 50000,
['flashgt'] = 50000,
['dominator3'] = 50000,
['taipan'] = 50000,
['xa21'] = 50000,
['tezeract'] = 50000,
['schlagen'] = 50000,
['350z'] = 100000, ['TipoVeh'] = "carro", 
['acuransx'] = 100000,
['ambulance'] = 100000,
['astonmartindbs'] = 100000,
['audir8'] = 100000,
['audirs6'] = 100000,
['bmwi8'] = 100000,
['bmwm1wb'] = 100000,
['bmwm4gts'] = 100000,
['bmwm5e34'] = 100000,
['civictyper'] = 100000,
['dodgecharger69'] = 100000,
['dodgechargersrt'] = 100000,
['dodgeramtrx'] = 100000,
['escalade2021'] = 100000,
['escaladegt900'] = 100000,
['f8t'] = 100000,
['ferrari812'] = 100000,
['ferrarif12'] = 100000,
['ferrarif40'] = 100000,
['fordmustang'] = 100000,
['golf75r'] = 100000,
['golfgti'] = 100000,
['golfmk7'] = 100000,
['jeepcherokee'] = 100000,
['lamborghinihuracan'] = 100000,
['lamborghinihuracanlw'] = 100000,
['lancerevolution9'] = 100000,
['lancerevolutionx'] = 100000,
['maverick2'] = 100000,
['mazdarx7'] = 100000,
['mazdarx72'] = 100000,
['mclarenp1'] = 100000,
['mclarensenna'] = 100000,
['mercedesamg63'] = 100000,
['mercedesgt63'] = 100000,
['mustangfast'] = 100000,
['nissangtr'] = 100000,
['nissangtr2'] = 100000,
['nissangtr3'] = 100000,
['nissangtr50'] = 100000,
['nissangtrnismo'] = 100000,
['panameramansory'] = 100000,
['porsche718'] = 100000,
['rs52018'] = 100000,
['sanchez3'] = 100000,
['toyotasupra'] = 100000,
['shelbygt500'] = 100000,
['silverado1500'] = 100000,
['skyliner34'] = 100000,
['skyliner342'] = 100000,
['stockade'] = 100000,
['subarubrz'] = 100000,
['subaruimpreza'] = 100000,
['toyotasupra2'] = 100000,
['wheelchair'] = 100000,
['winky2'] = 100000,

-------------------------------------------------------------------------|
----- CONCESSIONÁRIA CARROS COMUNS --------------------------------------|
-------------------------------------------------------------------------|

['revolter'] = 50000,
['viseris'] = 50000,
['blista'] = 50000,
['brioso'] = 50000,
['dilettante'] = 50000,
['issi2'] = 50000,
['panto'] = 50000,
['dune'] = 50000,
['prairie'] = 50000,
['kalahari'] = 50000,
['rhapsody'] = 50000,
['cogcabrio'] = 50000,
['emperor2'] = 50000,
['phoenix'] = 50000,
['premier'] = 50000,
['glendale'] = 50000,
['intruder'] = 50000,
['exemplar'] = 50000,
['f620'] = 50000,
['felon'] = 50000,
['ingot'] = 50000,
['jackal'] = 50000,
['oracle'] = 50000,
['oracle2'] = 50000,
['sentinel'] = 50000,
['sentinel2'] = 50000,
['windsor'] = 50000,
['windsor2'] = 50000,
['zion2'] = 50000,
['blade'] = 50000,
['buccaneer'] = 50000,
['buccaneer2'] = 50000,
['chino'] = 50000,
['coquette3'] = 50000,
['dominator'] = 50000,
['dominator2'] = 50000,
['dukes'] = 50000,
['faction'] = 50000,
['caracara2'] = 50000,
['drafter'] = 50000,
['dynasty'] = 50000,
['emerus'] = 50000,
['coquette4'] = 50000,
['faction3'] = 50000,
['gauntlet'] = 50000,
['gauntlet2'] = 50000,
['gauntlet3'] = 50000,
['gauntlet4'] = 50000,
['hellion'] = 50000,
['imorgon'] = 50000,
['italirsx'] = 50000,
['jugular'] = 50000,
['komoda'] = 50000,
['neo'] = 50000,
['novak'] = 50000,
['outlaw'] = 50000,
['paragon'] = 50000,
['sugoi'] = 50000,
['vstr'] = 50000,
['thrax'] = 50000,
['penumbra2'] = 50000,
['peyote2'] = 50000,
['peyote3'] = 50000,
['hermes'] = 50000,
['hotknife'] = 50000,
['moonbeam'] = 50000,
['moonbeam2'] = 50000,
['nightshade'] = 50000,
['picador'] = 50000,
['ruiner'] = 50000,
['sabregt'] = 50000,
['sabregt2'] = 50000,
['regina'] = 50000,
['slamvan'] = 50000,
['slamvan3'] = 50000,
['stalion'] = 50000,
['stalion2'] = 50000,
['tampa'] = 50000,
['vigero'] = 50000,
['virgo'] = 50000,
['mk7pandem'] = 50000,
['s1000rr'] = 50000,
['virgo2'] = 50000,
['virgo3'] = 50000,
['voodoo'] = 50000,
['voodoo2'] = 50000,
['yosemite'] = 50000,
['bfinjection'] = 50000,
['bifta'] = 50000,
['bodhi2'] = 50000,
['brawler'] = 50000,
['trophytruck'] = 50000,
['trophytruck2'] = 50000,
['dubsta3'] = 50000,
['mesa3'] = 50000,
['rancherxl'] = 50000,
['rebel2'] = 50000,
['riata'] = 50000,
['dloader'] = 50000,
['sandking'] = 50000,
['sandking2'] = 50000,
['baller'] = 50000,
['baller2'] = 50000,
['baller3'] = 50000,
['baller4'] = 50000,
['baller5'] = 50000,
['baller6'] = 50000,
['bjxl'] = 50000,
['cavalcade'] = 50000,
['cavalcade2'] = 50000,
['contender'] = 50000,
['dubsta'] = 50000,
['dubsta2'] = 50000,
['fq2'] = 50000,
['granger'] = 50000,
['gresley'] = 50000,
['habanero'] = 50000,
['seminole'] = 50000,
['serrano'] = 50000,
['xls'] = 50000,
['xls2'] = 50000,
['asea'] = 50000,
['asterope'] = 50000,
['cog552'] = 50000,
['cognoscenti'] = 50000,
['cognoscenti2'] = 50000,
['stanier'] = 50000,
['stratum'] = 50000,
['surge'] = 50000,
['tailgater'] = 50000,
['warrener'] = 50000,
['washington'] = 50000,
['alpha'] = 50000,
['banshee'] = 50000,
['bestiagts'] = 50000,
['blista2'] = 50000,
['blista3'] = 50000,
['buffalo'] = 50000,
['buffalo2'] = 50000,
['buffalo3'] = 50000,
['comet2'] = 50000,
['comet3'] = 50000,
['comet5'] = 50000,
['coquette'] = 50000,
['elegy'] = 50000,
['elegy2'] = 50000,
['feltzer2'] = 50000,
['furoregt'] = 50000,
['fusilade'] = 50000,
['futo'] = 50000,
['jester'] = 50000,
['jester2'] = 50000,
['khamelion'] = 50000,
['kuruma'] = 50000,
['massacro'] = 50000,
['massacro2'] = 50000,
['ninef'] = 50000,
['ninef2'] = 50000,
['omnis'] = 50000,
['pariah'] = 50000,
['penumbra'] = 50000,
['raiden'] = 50000,
['rapidgt'] = 50000,
['rapidgt2'] = 50000,
['ruston'] = 50000,
['schafter3'] = 50000,
['schafter4'] = 50000,
['schafter5'] = 50000,
['schwarzer'] = 50000,
['sentinel3'] = 50000,
['specter2'] = 50000,
['streiter'] = 50000,
['surano'] = 50000,
['tampa2'] = 50000,
['tropos'] = 50000,
['verlierer2'] = 50000,
['btype2'] = 50000,
['btype3'] = 50000,
['casco'] = 50000,
['cheetah'] = 50000,
['coquette2'] = 50000,
['feltzer3'] = 50000,
['gt500'] = 50000,
['infernus2'] = 50000,
['jb700'] = 50000,
['mamba'] = 50000,
['manana'] = 50000,
['monroe'] = 50000,
['peyote'] = 50000,
['pigalle'] = 50000,
['rapidgt3'] = 50000,
['retinue'] = 50000,
['stinger'] = 50000,
['stingergt'] = 50000,
['torero'] = 50000,
['tornado'] = 50000,
['tornado2'] = 50000,
['tornado6'] = 50000,
['turismo2'] = 50000,
['ztype'] = 50000,
['adder'] = 50000,
['autarch'] = 50000,
['banshee2'] = 50000,
['bullet'] = 50000,
['cheetah2'] = 50000,
['entityxf'] = 50000,
['fmj'] = 50000,
['gp1'] = 50000,
['infernus'] = 50000,
['nero'] = 50000,
['penetrator'] = 50000,
['reaper'] = 50000,
['sc1'] = 50000,
['sultanrs'] = 50000,
['tempesta'] = 50000,
['tyrus'] = 50000,
['zentorno'] = 50000,
['sadler'] = 50000,
['bison'] = 50000,
['bison2'] = 50000,
['bobcatxl'] = 50000,
['burrito'] = 50000,
['burrito2'] = 50000,
['burrito3'] = 50000,
['burrito4'] = 50000,
['minivan'] = 50000,
['minivan2'] = 50000,
['paradise'] = 50000,
['pony'] = 50000,
['pony2'] = 50000,
['rumpo'] = 50000,
['rumpo2'] = 50000,
['rumpo3'] = 50000,
['surfer'] = 50000,
['youga'] = 50000,
['huntley'] = 50000,
['landstalker'] = 50000,
['mesa'] = 50000,
['patriot'] = 50000,
['radi'] = 50000,
['rocoto'] = 50000,
['cheburek'] = 50000,
['hotring'] = 50000,
['jester3'] = 50000,
['ellie'] = 50000,
['michelli'] = 50000,
['fagaloa'] = 50000,
['dominator2'] = 50000,
['issi3'] = 50000,
['gb200'] = 50000,
['stretch'] = 50000,
['guardian'] = 50000,
['kamacho'] = 50000,
['neon'] = 50000,
['cyclone'] = 50000,
['italigtb'] = 50000,
['italigtb2'] = 50000,
['vagner'] = 50000,
['prototipo'] = 50000,
['patriot2'] = 50000,
['swinger'] = 50000,
['clique'] = 50000,
['deveste'] = 50000,
['deviant'] = 50000,
['impaler'] = 50000,
['italigto'] = 50000,
['toros'] = 50000,
['tulip'] = 50000,
['vamos'] = 50000,
['freecrawler'] = 50000,
['fugitive'] = 50000,
['le7b'] = 50000,
['lurcher'] = 50000,
['lynx'] = 50000,
['raptor'] = 50000,
['sheava'] = 50000,
['z190'] = 50000,
['gburrito2'] = 50000,
['mule'] = 50000,
['mule2'] = 50000,
['mule3'] = 50000,
['mule4'] = 50000,
['benson'] = 50000,
['pounder'] = 50000,
['pounder2'] = 50000,
['rallytruck'] = 50000,
['trailers2'] = 50000,
['nissangtr'] = 50000,
['nissan370z'] = 50000,
['dodgechargersrt'] = 50000,
['ferrariitalia'] = 50000,
['fordmustang'] = 50000,
['mazdarx7'] = 50000,
['toyotasupra'] = 50000,
['mercedesa45'] = 50000,
['focusrs'] = 50000,
['lancerevolution9'] = 50000,
['ninjah2'] = 50000,
['trr'] = 50000,
['p1'] = 50000,
['bettle'] = 50000,
['rmodx6'] = 50000,
['bnteam'] = 50000,
['lamtmc'] = 50000,
['slsamg'] = 50000,
['g65amg'] = 50000,
['eleanor'] = 50000,
['rmodamgc63'] = 50000,
['palameila'] = 50000,
['bmws'] = 50000,
['rsvr16'] = 50000,
['19ramdonk'] = 50000,
['silv86'] = 50000,
['70camarofn'] = 50000,
['bbentayga'] = 50000,
['nissantitan17'] = 50000,
['911r'] = 50000,
['africat'] = 50000,
['msohs'] = 50000,
['gt17'] = 50000,
['defiant'] = 50000,
['f12tdf'] = 50000,
['71gtx'] = 50000,
['m6e63'] = 50000,
['180sx'] = 50000,
['audirs7'] = 50000,
['hondafk8'] = 50000,
['porsche930'] = 50000,
['raptor2017'] = 50000,
['eclipse'] = 50000,
['fe86'] = 50000,
['type263'] = 50000,
['pistas'] = 50000,
['yzfr125'] = 50000,
['20r1'] = 50000,
['SVR14'] = 50000,
['Bimota'] = 50000,
['r8ppi'] = 50000,
['bobbes2'] = 50000,
['bobber'] = 50000,
['911tbs'] = 50000,
['zx10r'] = 50000,
['fox600lt'] = 50000,
['foxbent1'] = 50000,
['foxevo'] = 50000,
['jeepg'] = 50000,
['foxharley1'] = 50000,
['foxharley2'] = 50000,
['foxleggera'] = 50000,
['foxrossa'] = 50000,
['foxshelby'] = 50000,
['foxsian'] = 50000,
['foxsterrato'] = 50000,
['foxsupra'] = 50000,
['m6x6'] = 50000,
['m6gt3'] = 50000,
['w900'] = 50000,
['918'] = 50000,
['alfieri'] = 50000,
['bdivo'] = 50000,
['boxterlb'] = 50000,
['brz'] = 50000,
['btsupra94'] = 50000,
['chiron17'] = 50000,
['ctsv16'] = 50000,
['fusca'] = 50000,
['granlb'] = 50000,
['gsxr'] = 50000,
['gt86'] = 50000,
['hcbr17'] = 50000,
['rt70'] = 50000,
['silvia3'] = 50000,
['z15326power'] = 50000,
['2f2fgtr34'] = 50000,
['2f2fgts'] = 50000,
['2f2fmk4'] = 50000,
['2f2fmle7'] = 50000,
['ff4wrx'] = 50000,
['fnf4r34'] = 50000,
['fnflan'] = 50000,
['fnfmits'] = 50000,
['fnfmk4'] = 50000,
['fnfrx7'] = 50000,
['acr'] = 50000,
['audiq7'] = 50000,
['r8ppi'] = 50000,
['ar8lb'] = 50000,
['sq72016'] = 50000,
['bentaygast'] = 50000,
['x6m'] = 50000,
['c7'] = 50000,
['c7r'] = 50000,
['dk350z'] = 50000,
['diavel'] = 50000,
['fm488'] = 50000,
['f12m'] = 50000,
['fiattoro'] = 50000,
['boss302'] = 50000,
['mk7'] = 50000,
['civic'] = 50000,
['inf'] = 50000,
['avj'] = 50000,
['sv'] = 50000,
['fq2'] = 50000,
['wraith'] = 50000,
['bmwm8'] = 50000,
['rmodmi8lb'] = 50000,
['rmodmk7'] = 50000,
['RS62'] = 50000,
['q820'] = 50000,
['rmodamgc63'] = 50000,
['dodgecnp'] = 50000,
['dustgn'] = 50000,
['nc750x'] = 50000,
['teslaprior'] = 50000,
['18velar'] = 50000,
['599xxevo'] = 50000,
['amaroktdi'] = 50000,
['fox'] = 50000,
['rencaptur'] = 50000,
['sont18'] = 50000,
['ram2500'] = 50000,
['bmw320i'] = 50000,
['cayenneturbo'] = 50000,
['pm19'] = 50000,
['pturismo'] = 50000,
['bate'] = 50000,
['rs318'] = 50000,
['mers63c'] = 50000,
['trhawk'] = 50000,
['prius'] = 50000,
['hevo'] = 50000,
['lspdunm'] = 50000,
['lspdunm'] = 50000,
['rs18'] = 50000,

----------------------------------------------------------------------|
----- moto CONCESSIONARIA -------------------------------------------|
----------------------------------------------------------------------| 

["dm1200"] = 50000, ['TipoVeh'] = "moto", 
["xj"] = 46000, ['TipoVeh'] = "moto",
["biz25"] = 2500, ['TipoVeh'] = "moto",
["150"] = 6000, ['TipoVeh'] = "moto",
["z1000"] = 50000, ['TipoVeh'] = "moto",
["diablous"] = 35000, ['TipoVeh'] = "moto",
["cb500x"] = 45000, ['TipoVeh'] = "moto",
["gs310"] = 50000, ['TipoVeh'] = "moto",
["450crf"] = 50000, ['TipoVeh'] = "moto",
["bros60"] = 20000, ['TipoVeh'] = "moto",
["xt66"] = 30000, ['TipoVeh'] = "moto",
["akuma"] = 50000, ['TipoVeh'] = "moto",
["avarus"] = 50000, ['TipoVeh'] = "moto",
["bagger"] = 50000, ['TipoVeh'] = "moto",
["bati"] = 50000, ['TipoVeh'] = "moto",
["bati2"] = 50000, ['TipoVeh'] = "moto",
["bf400"] = 50000, ['TipoVeh'] = "moto",
["carbonrs"] = 50000, ['TipoVeh'] = "moto",
["chimera"] = 50000, ['TipoVeh'] = "moto",
["cliffhanger"] = 50000, ['TipoVeh'] = "moto",
["daemon2"] = 50000, ['TipoVeh'] = "moto",
["defiler"] = 50000, ['TipoVeh'] = "moto",
["diablous2"] = 50000, ['TipoVeh'] = "moto",
["double"] = 50000, ['TipoVeh'] = "moto",
["enduro"] = 50000, ['TipoVeh'] = "moto",
["esskey"] = 50000, ['TipoVeh'] = "moto",
["faggio"] = 50000, ['TipoVeh'] = "moto",
["faggio2"] = 50000, ['TipoVeh'] = "moto",
["faggio3"] = 50000, ['TipoVeh'] = "moto",
["fcr"] = 50000, ['TipoVeh'] = "moto",
["fcr2"] = 50000, ['TipoVeh'] = "moto",
["gargoyle"] = 50000, ['TipoVeh'] = "moto",
["hakuchou"] = 50000, ['TipoVeh'] = "moto",
["hakuchou2"] = 50000, ['TipoVeh'] = "moto",
["hexer"] = 50000, ['TipoVeh'] = "moto",
["innovation"] = 50000, ['TipoVeh'] = "moto",
["lectro"] = 50000, ['TipoVeh'] = "moto",
["manchez"] = 50000, ['TipoVeh'] = "moto",
["nemesis"] = 50000, ['TipoVeh'] = "moto",
["nightblade"] = 50000, ['TipoVeh'] = "moto",
["pcj"] = 50000, ['TipoVeh'] = "moto",
["ruffian"] = 50000, ['TipoVeh'] = "moto",
["sanchez"] = 50000, ['TipoVeh'] = "moto",
["sanchez2"] = 50000, ['TipoVeh'] = "moto",
["sovereign"] = 50000, ['TipoVeh'] = "moto",
["stryder"] = 50000, ['TipoVeh'] = "moto",
["thrust"] = 50000, ['TipoVeh'] = "moto",
["vindicator"] = 50000, ['TipoVeh'] = "moto",
["vortex"] = 50000, ['TipoVeh'] = "moto",
["wolfsbane"] = 50000, ['TipoVeh'] = "moto",
["zombiea"] = 50000, ['TipoVeh'] = "moto",
["zombieb"] = 50000, ['TipoVeh'] = "moto",
["blazer"] = 50000, ['TipoVeh'] = "moto",
["blazer4"] = 50000, ['TipoVeh'] = "moto",
["shotaro"] = 50000, ['TipoVeh'] = "moto",
["ratbike"] = 50000, ['TipoVeh'] = "moto",
["s1000rr"] = 50000, ['TipoVeh'] = "moto",
["jeepreneg"] = 50000, ['TipoVeh'] = "moto",
["mt10"] = 50000, ['TipoVeh'] = "moto",
["rc"] = 50000, ['TipoVeh'] = "moto",
["hornet"] = 50000, ['TipoVeh'] = "moto",
["mt03"] = 50000, ['TipoVeh'] = "moto",

----------------------------------------------------------------------|
----- MOTOS VIPS -----------------------------------------------------|
----------------------------------------------------------------------| 

["r1250"] = 100000, ['TipoVeh'] = "moto",
["cbrr"] = 100000, ['TipoVeh'] = "moto",
["r1"] = 100000, ['TipoVeh'] = "moto",
["r6"] = 100000, ['TipoVeh'] = "moto",
["vader"] = 100000, ['TipoVeh'] = "moto",
["m1000rr"] = 100000, ['TipoVeh'] = "moto",
["nh2r"] = 100000, ['TipoVeh'] = "moto",
["r1"] = 50000, ['TipoVeh'] = "moto",
["r6"] = 50000, ['TipoVeh'] = "moto",
["bloodline"] = 50000, ['TipoVeh'] = "moto",
["ducati1200"] = 50000, ['TipoVeh'] = "moto",
["manchez2"] = 50000, ['TipoVeh'] = "moto",
["VRdm1200"] = 50000, ['TipoVeh'] = "moto",
["s1000rr"] = 50000, ['TipoVeh'] = "moto",
["sanchez3"] = 50000, ['TipoVeh'] = "moto",
["urbandevil"] = 50000, ['TipoVeh'] = "moto",

----------------------------------------------------------------------|
----- CARROS VIPS ----------------------------------------------------|
----------------------------------------------------------------------| 

['m2'] = 100000,
['bmwm3f80'] = 100000,
['bmwm4gts'] = 100000,
['lamborghinihuracan'] = 100000,
['lancerevolutionx'] = 100000,
['teslaprior'] = 100000,
['a45amg'] = 100000,
['c8'] = 100000,
['xxxxx'] = 100000,
['18velar'] = 100000,
['divo'] = 100000,
['gtr50'] = 100000,
['mache'] = 100000,
['pgt3'] = 100000,
['r8v10'] = 100000,
['rmodjeep'] = 100000,
['srt8'] = 100000,
['techart17'] = 100000,
['tuatara'] = 200000,
['variszupra'] = 100000,
['18macan'] = 100000,
['19ftype'] = 100000,
['agerars'] = 100000,
['488gtb'] = 100000,
['2018zl1'] = 100000,
['amggtr'] = 100000,
['aperta'] = 100000,
['bc'] = 100000,
['db11'] = 100000,
['fc15'] = 100000,
['filthynsx'] = 100000,
['fxxkevo'] = 100000,
['i8'] = 100000,
['lp700r'] = 100000,
['porsche992'] = 100000,
['regera'] = 100000,
['s15'] = 100000,
['senna'] = 100000,
['vantage'] = 100000,
['veneno'] = 100000,
['civictyper'] = 100000,
['audirs6'] = 100000,
['ferrari812'] = 100000,
['mercedesgt63'] = 100000,
['nissangtrnismo'] = 100000,
['subaruimpreza'] = 100000,
['nissanskyliner34'] = 100000,

    




}

------------------------------------------------------
------------------------------------------------------
------------------------------------------------------


-- RETORNA VEICULOS PERMITIDOS
function tk.GetVehs()
    return CarrosDesmanches
end


-- FUNÇÃO VERIFICAR PERMISSÃO DO DESMANCHE
function tk.CheckPerm()
    local source = source
    local user_id = vRP.getUserId(source)
    if RestritoParaDesmanche then
        if vRP.hasPermission(user_id, PermissaoDesmanche) then
            return true
        end
        return false
    end
    return true
end

-- FUNÇÃO PRA VERIFICAR SE POSSUI O ITEM
function tk.CheckItem()
    local source = source
    local user_id = vRP.getUserId(source)
    if PrecisaDeItem then
        if vRP.tryGetInventoryItem(user_id,ItemNecessario,QtdNecessaria) then
            return true
        end
        return false
    end
    return true
end


-- FUNÇÃO PARA GERAR O PAGAMENTO E OS ITENS
function tk.GerarPagamento(placa, nomeFeio, nomeBonito)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    for k, v in pairs(CarrosDesmanches) do
        if string.upper(k) == string.upper(nomeFeio) then
            local pagamento = v
            -- vRP.giveMoney(user_id,pagamento) -- DINHEIRO LIMPO
            vRP.giveInventoryItem(user_id,'placa',math.random(1,5)) -- DINHEIRO SUJO

            local puser_id = vRP.getUserByRegistration(placa)
            if puser_id then
                local value = vRP.getUData(puser_id,'vRP:multas')
                local multas = json.decode(value) or 0
                multas = multas + pagamento
                vRP.setUData(puser_id,'vRP:multas',json.encode(parseInt(multas)))
                local nsource = vRP.getUserSource(puser_id)
                if nsource then
                    TriggerClientEvent('Notify', nsource, 'aviso', 'AVISO SEGURADORA', 'Você foi multado em <b>R$' .. vRP.format(pagamento) .. '</b> referente ao seguro do veículo <b>' .. nomeBonito .. ' (' .. nomeFeio .. ')</b>.')
                end
            end
            TriggerClientEvent("vrp_sound:source",source,'coins',0.3)
            TriggerClientEvent('Notify', source, 'sucesso', 'Vendedor Desmanche', 'Você recebeu <b>R$'..vRP.format(pagamento)..'</b> pelo desmanche de um <b>'..nomeBonito..' ('.. nomeFeio..' - PLACA [' .. placa .. '])</b>.' )
            SendWebhookMessage(desmanche,"```prolog\n[PASSAPORTE]: "..user_id.." \n[NOME]: "..identity.name.." "..identity.firstname.." \n[DESMANCHOU]: "..nomeBonito.."  \n[PLACA]: ".. placa .." \n[E RECEBEU]: ".. vRP.format(pagamento) .." "..os.date("\n[Data]: %d/%m/%y \n[Hora]: %H/%M/%S").." \r```")
        end
    end
end


