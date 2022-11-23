local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local fov_min = 5.0
local fov_max = 70.0
local binoculos = false
local camera = false
local fov = (fov_max+fov_min)*0.5

local animacoes = {
	
	{ nome = "varinha" , dict = "amb@world_human_car_park_attendant@male@base" , anim = "base" , prop = "mah_wand" , flag = 49 , hand = 28422 },
	{ nome = "lockpickteste" , dict = "missfbi_s4mop" , anim = "clean_mop_back_player" , andar = false , loop = true },
	{ nome = "obito" , dict = "amb@medic@standing@timeofdeath@idle_a" , anim = "idle_b" , andar = false , loop = true },

    -- COMIDAS --

    { nome = "pipoca" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "mah_popcorn" , flag = 49 , hand = 28422 },
	{ nome = "pizza", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_a", prop = "mah_pizza", flag = 49, hand = 28422 },
	{ nome = "hamburguer", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "mah_burger", flag = 49, hand = 28422 },
    { nome = "donuts", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "mah_donut", flag = 49, hand = 28422 },
	{ nome = "hotdog", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "mah_hotdog", flag = 49, hand = 28422 },
    { nome = "chocolate", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_a", prop = "mah_chocolate", flag = 49, hand = 28422 },
	{ nome = "taco", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "mah_taco", flag = 49, hand = 28422 },
	{ nome = "temaki", dict = "amb@code_human_wander_eating_donut@female@idle_a", anim = "idle_c", prop = "mah_temaki", flag = 49, hand = 28422 },
	{ nome = "morango", dict = "amb@code_human_wander_eating_donut@female@idle_a", anim = "idle_c", prop = "mah_morango", flag = 49, hand = 28422 },
	{ nome = "paodequeijo", dict = "amb@code_human_wander_eating_donut@female@idle_a", anim = "idle_c", prop = "paodequeijo", flag = 49, hand = 28422 },
	{ nome = "laranja", dict = "amb@code_human_wander_eating_donut@female@idle_a", anim = "idle_c", prop = "mah_laranja", flag = 49, hand = 28422 },
	{ nome = "trakinas", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_a", prop = "mah_trakinas", flag = 49, hand = 28422 },
	{ nome = "picole", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_a", prop = "mah_picole", flag = 49, hand = 28422 },
    { nome = "brigadeiro", dict = "amb@code_human_wander_eating_donut@female@idle_a", anim = "idle_a", prop = "mah_brigadeiro", flag = 49, hand = 28422 },
	{ nome = "croissant", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_a", prop = "mah_croissant", flag = 49, hand = 28422 }, 
	{ nome = "espeto", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_a", prop = "mah_espeto", flag = 49, hand = 28422 }, 
	{ nome = "pastel", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_a", prop = "mah_pastel", flag = 49, hand = 28422 }, 
	{ nome = "mamadeira", dict = "amb@world_human_aa_coffee@idle_a", anim = "idle_a", prop = "mah_mamadeira", flag = 49, hand = 28422 },
	{ nome = "jack", dict = "amb@world_human_aa_coffee@idle_a", anim = "idle_a", prop = "mah_daniels", flag = 49, hand = 28422 },
	{ nome = "heineken", dict = "amb@world_human_aa_coffee@idle_a", anim = "idle_a", prop = "mah_hein", flag = 49, hand = 28422 },
	{ nome = "tanqueray", dict = "amb@world_human_aa_coffee@idle_a", anim = "idle_a", prop = "mah_tanqueray", flag = 49, hand = 28422 },
	{ nome = "chandom", dict = "amb@world_human_aa_coffee@idle_a", anim = "idle_a", prop = "mah_chandom", flag = 49, hand = 28422 },
	{ nome = "beats", dict = "amb@world_human_aa_coffee@idle_a", anim = "idle_a", prop = "mah_beats", flag = 49, hand = 28422 },
	{ nome = "toddy", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "mah_toddynho", flag = 49, hand = 28422 },
	{ nome = "monster", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "mah_monster", flag = 49, hand = 28422 },
	{ nome = "energetico", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "mah_energetico", flag = 49, hand = 28422 },
	{ nome = "cocacola", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "mah_coke", flag = 49, hand = 28422 },
	{ nome = "frap", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "mah_frap", flag = 49, hand = 28422 },
    { nome = "frap2" , dict = "amb@world_human_aa_coffee@base" , anim = "base" , prop = "p_shk_frappuccino_06" , flag = 50 , hand = 28422 },
	{ nome = "pao", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "v_res_fa_bread03", flag = 49, hand = 28422 },	
	{ nome = "coxinha", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "bagdad_coxinha", flag = 49, hand = 28422 },	
	{ nome = "banana", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "bag_banana", flag = 49, hand = 28422 },	

    -- GARÇOM --

    { nome = "garcom", dict = "anim@move_f@waitress", anim = "idle", prop = "vw_prop_vw_tray_01a", flag = 49, hand = 28422 },
    { nome = "garcom2", dict = "anim@move_f@waitress", anim = "idle", prop = "prop_food_tray_01", flag = 49, hand = 28422 },
    { nome = "garcom3", dict = "anim@move_f@waitress", anim = "idle", prop = "prop_food_tray_02", flag = 49, hand = 28422 },
    { nome = "garcom4", dict = "anim@move_f@waitress", anim = "idle", prop = "prop_food_tray_03", flag = 49, hand = 28422 },
    { nome = "garcom5", dict = "anim@move_f@waitress", anim = "idle", prop = "h4_prop_h4_champ_tray_01b", flag = 49, hand = 28422 },
    { nome = "garcom6", dict = "anim@move_f@waitress", anim = "idle", prop = "h4_prop_h4_champ_tray_01c", flag = 49, hand = 28422 },

    -- BEBER --
    
    { nome = "beber" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "ba_prop_club_water_bottle" , flag = 49 , hand = 28422 },
    { nome = "beber2" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "laranja_suco" , flag = 49 , hand = 28422 },
    { nome = "beber3" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "mah_beats" , flag = 49 , hand = 28422 },
    { nome = "beber4" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "mah_chandom" , flag = 49 , hand = 28422 },
    { nome = "beber5" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "mah_daniels" , flag = 49 , hand = 28422 },
    { nome = "beber6" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "mah_hein" , flag = 49 , hand = 28422 },
    { nome = "beber7" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "mah_tanqueray" , flag = 49 , hand = 28422 },
    { nome = "beber8" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "mah_toddynho" , flag = 49 , hand = 28422 },
    { nome = "beber9" , dict = "amb@world_human_drinking@coffee@male@idle_a" , anim = "idle_a" , prop = "mah_coke" , flag = 49 , hand = 28422 },
    { nome = "beber10" , dict = "amb@world_human_drinking@coffee@male@idle_a" , anim = "idle_a" , prop = "mah_energetico" , flag = 49 , hand = 28422 },
    { nome = "beber11" , dict = "amb@world_human_drinking@coffee@male@idle_a" , anim = "idle_a" , prop = "mah_monster" , flag = 49 , hand = 28422 },

    --[[{ nome = "beber12", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "", flag = 49, hand = 28422, pos1 = 0.0, pos2 = 0.0, pos3 = 0.05, pos4 = 0.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "beber13", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "p_whiskey_notop", flag = 49, hand = 28422, pos1 = 0.0, pos2 = 0.0, pos3 = 0.05, pos4 = 0.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "beber14", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "prop_beer_logopen", flag = 49, hand = 28422, pos1 = 0.0, pos2 = 0.0, pos3 = -0.10, pos4 = 0.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "beber15", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "prop_beer_blr", flag = 49, hand = 28422, pos1 = 0.0, pos2 = 0.0, pos3 = -0.10, pos4 = 0.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "beber16", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "prop_ld_flow_bottle", flag = 49, hand = 28422, pos1 = 0.0, pos2 = 0.0, pos3 = 0.05, pos4 = 0.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "beber17", dict = "amb@world_human_drinking@coffee@male@idle_a", anim = "idle_c", prop = "prop_plastic_cup_02", flag = 49, hand = 28422 },
    { nome = "beber18", dict = "amb@world_human_drinking@coffee@male@idle_a", anim = "idle_c", prop = "prop_food_bs_juice03", flag = 49, hand = 28422, pos1 = 0.0, pos2 = -0.01, pos3 = -0.15, pos4 = 0.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "beber19", dict = "amb@world_human_drinking@coffee@male@idle_a", anim = "idle_c", prop = "ng_proc_sodacan_01b", flag = 49, hand = 28422, pos1 = 0.0, pos2 = -0.01, pos3 = -0.08, pos4 = 0.0, pos5 = 0.0, pos6 = 0.0 },
	{ nome = "remedio", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "mah_remedio", flag = 49, hand = 28422 },]]


    -- PROPS --
    { nome = "bolsa", prop = "prop_ld_case_01", flag = 50, hand = 57005, pos1 = 0.16, pos2 = 0, pos3 = 0, pos4 = 0, pos5 = 260.0, pos6 = 60.0 },
    { nome = "bolsa2", prop = "prop_ld_case_01_s", flag = 50, hand = 57005, pos1 = 0.16, pos2 = 0, pos3 = 0, pos4 = 0, pos5 = 260.0, pos6 = 60.0 },
    { nome = "bolsa3", prop = "prop_security_case_01", flag = 50, hand = 57005, pos1 = 0.16, pos2 = 0, pos3 = -0.01, pos4 = 0, pos5 = 260.0, pos6 = 60.0 },
    { nome = "bolsa4", prop = "w_am_case", flag = 50, hand = 57005, pos1 = 0.08, pos2 = 0, pos3 = 0, pos4 = 0, pos5 = 260.0, pos6 = 60.0 },
    { nome = "lixo", prop = "prop_cs_rub_binbag_01", flag = 50, hand = 57005, pos1 = 0.11, pos2 = 0, pos3 = 0.0, pos4 = 0, pos5 = 260.0, pos6 = 60.0 },
    { nome = "mic", prop = "prop_microphone_02", flag = 50, hand = 60309, pos1 = 0.08, pos2 = 0.03, pos3 = 0.0, pos4 = 240.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "mic2", prop = "p_ing_microphonel_01", flag = 50, hand = 60309, pos1 = 0.08, pos2 = 0.03, pos3 = 0.0, pos4 = 240.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "mic3", dict = "missfra1", anim = "mcs2_crew_idle_m_boom", prop = "prop_v_bmike_01", flag = 50, hand = 28422 },
    { nome = "mic4" , dict = "missmic4premiere" , anim = "interview_short_lazlow" , prop = "p_ing_microphonel_01" , flag = 50 , hand = 28422 },
    { nome = "mic5" , dict = "anim@random@shop_clothes@watches" , anim = "base" , prop = "p_ing_microphonel_01" , andar = true , loop = true , flag = 49 , hand = 60309 , pos1 = 0.10 , pos2 = 0.04 , pos3 = 0.012 , pos4 = -60.0 , pos5 = 60.0 , pos6 = -30.0 , propAnim = true },
    { nome = "buque", prop = "prop_snow_flower_02", flag = 50, hand = 60309, pos1 = 0.0, pos2 = 0.0, pos3 = 0.0, pos4 = 300.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "rosa", prop = "prop_single_rose", flag = 50, hand = 60309, pos1 = 0.055, pos2 = 0.05, pos3 = 0.0, pos4 = 240.0, pos5 = 0.0, pos6 = 0.0 },
    { nome = "prebeber", dict = "amb@code_human_wander_drinking@beer@male@base", anim = "static", prop = "prop_fib_coffee", flag = 49, hand = 28422 },
    { nome = "prebeber2", dict = "amb@code_human_wander_drinking@beer@male@base", anim = "static", prop = "prop_ld_flow_bottle", flag = 49, hand = 28422 },
    { nome = "prebeber3", dict = "amb@code_human_wander_drinking@beer@male@base", anim = "static", prop = "prop_cs_bs_cup", flag = 49, hand = 28422 },
    { nome = "prebeber4", dict = "amb@code_human_wander_drinking@beer@male@base", anim = "static", prop = "brahma_garrafa_individual", flag = 49, hand = 28422 },
    { nome = "agua", dict = "amb@world_human_drinking@beer@male@idle_a", anim = "idle_a", prop = "prop_ld_flow_bottle", flag = 49, hand = 28422 },
    { nome = "champ", dict = "anim@mp_player_intupperspray_champagne", anim = "idle_a", prop = "ba_prop_battle_champ_open", flag = 49, hand = 28422, loop = true },
    { nome = "taca", dict = "anim@heists@humane_labs@finale@keycards", anim = "ped_a_enter_loop", prop = "prop_drink_champ", flag = 49, hand = 18905, pos1 = 0.10, pos2 = -0.03, pos3 = 0.03, pos4 = -100.0, pos5 = 0.0, pos6 = -10.0 },
    { nome = "taca2", dict = "anim@heists@humane_labs@finale@keycards", anim = "ped_a_enter_loop", prop = "prop_drink_redwine", flag = 49, hand = 18905, pos1 = 0.10, pos2 = -0.03, pos3 = 0.03, pos4 = -100.0, pos5 = 0.0, pos6 = -10.0 },
    { nome = "sinalizar", dict = "amb@world_human_car_park_attendant@male@base", anim = "base", prop = "prop_parking_wand_01", flag = 49, hand = 28422 },
    { nome = "placa", dict = "amb@world_human_bum_freeway@male@base", anim = "base", prop = "prop_beggers_sign_01", flag = 49, hand = 28422 },
    { nome = "placa2", dict = "amb@world_human_bum_freeway@male@base", anim = "base", prop = "prop_beggers_sign_03", flag = 49, hand = 28422 },
    { nome = "placa3", dict = "amb@world_human_bum_freeway@male@base", anim = "base", prop = "prop_beggers_sign_04", flag = 49, hand = 28422 },
    { nome = "radio", dict = "cellphone@", anim = "cellphone_call_in", prop = "prop_cs_hand_radio", flag = 50, hand = 28422 },  
    { nome = "radio2", prop = "prop_boombox_01", flag = 50, hand = 57005, pos1 = 0.30, pos2 = 0, pos3 = 0, pos4 = 0, pos5 = 260.0, pos6 = 60.0 },
    { nome = "radio3" , prop = "prop_portable_hifi_01" , flag = 50 , hand = 28422 , pos1 = 0.26 , pos2 = 0.1 , pos3 = 0.08 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
    { nome = "cafe", dict = "amb@world_human_aa_coffee@base", anim = "base", prop = "prop_fib_coffee", flag = 50, hand = 28422 },
    { nome = "cafe2", dict = "amb@world_human_aa_coffee@idle_a", anim = "idle_a", prop = "prop_fib_coffee", flag = 49, hand = 28422 },
	{ nome = "cafe3" , dict = "amb@world_human_aa_coffee@idle_a" , anim = "idle_a" , prop = "mah_frap" , flag = 49 , hand = 28422 },    
    { nome = "cafe4" , dict = "amb@world_human_aa_coffee@idle_a" , anim = "idle_a" , prop = "p_shk_frappuccino_06" , flag = 49 , hand = 28422 },
    { nome = "caixa", dict = "anim@heists@box_carry@", anim = "idle", prop = "hei_prop_heist_box", flag = 50, hand = 28422 },
    { nome = "caixa2", prop = "prop_tool_box_04", flag = 50, hand = 57005, pos1 = 0.45, pos2 = 0, pos3 = 0.05, pos4 = 0, pos5 = 260.0, pos6 = 60.0 },
    { nome = "caixa3" , dict = "anim@heists@box_carry@" , anim = "idle" , prop = "xm_prop_smug_crate_s_medical" , flag = 50 , hand = 28422 },
    { nome = "chuva", dict = "amb@world_human_drinking@coffee@male@base", anim = "base", prop = "p_amb_brolly_01", flag = 50, hand = 28422 },
    { nome = "chuva2", dict = "amb@world_human_drinking@coffee@male@base", anim = "base", prop = "p_amb_brolly_01_s", flag = 50, hand = 28422 },
    { nome = "comer", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "prop_cs_burger_01", flag = 49, hand = 28422 },
    { nome = "comer2", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "prop_cs_hotdog_01", flag = 49, hand = 28422 },
    { nome = "comer3", dict = "amb@code_human_wander_eating_donut@male@idle_a", anim = "idle_c", prop = "prop_amb_donut", flag = 49, hand = 28422 },
    { nome = "varrer", dict = "amb@world_human_janitor@male@idle_a", anim = "idle_a", prop = "prop_tool_broom", flag = 49, hand = 28422 },
    { nome = "musica", dict = "amb@world_human_musician@guitar@male@base", anim = "base", prop = "prop_el_guitar_01", flag = 49, hand = 60309 },
    { nome = "musica2", dict = "amb@world_human_musician@guitar@male@base", anim = "base", prop = "prop_el_guitar_02", flag = 49, hand = 60309 },
    { nome = "musica3", dict = "amb@world_human_musician@guitar@male@base", anim = "base", prop = "prop_el_guitar_03", flag = 49, hand = 60309 },
    { nome = "musica4", dict = "amb@world_human_musician@guitar@male@base", anim = "base", prop = "prop_acc_guitar_01", flag = 49, hand = 60309 },
    { nome = "camera", dict = "amb@world_human_paparazzi@male@base", anim = "base", prop = "prop_pap_camera_01", flag = 49, hand = 28422 },
    { nome = "camera2", dict = "missfinale_c2mcs_1", anim = "fin_c2_mcs_1_camman", prop = "prop_v_cam_01", flag = 49, hand = 28422 },
    { nome = "prancheta", dict = "amb@world_human_clipboard@male@base", anim = "base", prop = "p_amb_clipboard_01", flag = 50, hand = 60309 },
    { nome = "mapa", dict = "amb@world_human_clipboard@male@base", anim = "base", prop = "prop_tourist_map_01", flag = 50, hand = 60309 },
    { nome = "anotar", dict = "amb@medic@standing@timeofdeath@base", anim = "base", prop = "prop_notepad_01", flag = 49, hand = 60309 },
	{ nome = "anotar2" , dict = "cellphone@" , anim = "cellphone_text_in" , prop = "prop_police_phone" , flag = 50 , hand = 28422 }, -- prop_police_phone

	
	
	{ nome = "britadeira", dict = "amb@world_human_const_drill@male@drill@base", anim = "base", prop = "prop_tool_jackham", flag = 15, hand = 28422 },
    -- { nome = "cerveja", dict = "amb@world_human_partying@male@partying_beer@idle_a", anim = "idle_b", prop = "brahma_garrafa_individual", flag = 1, hand = 28422 },
    -- { nome = "cerveja2", dict = "anim@amb@casino@peds@", anim = "amb_world_human_drinking_beer_male_base", prop = "brahma_garrafa_individual", flag = 1, hand = 28422 },
    -- { nome = "cerveja3", dict = "anim@amb@casino@peds@", anim = "amb_world_human_drinking_beer_female_base", prop = "brahma_garrafa_individual", flag = 1, hand = 28422 },
    { nome = "fumar" , anim = "WORLD_HUMAN_SMOKING" },
	{ nome = "fumar2" , anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS" },
	{ nome = "fumar3" , anim = "WORLD_HUMAN_AA_SMOKE" },
	{ nome = "fumar4" , anim = "WORLD_HUMAN_SMOKING_POT" },
	{ nome = "fumar5" , dict = "amb@world_human_aa_smoke@male@idle_a" , anim = "idle_c" , prop = "prop_cs_ciggy_01" , flag = 49 , hand = 28422 },
	{ nome = "fumar6" , dict = "amb@world_human_smoking@female@idle_a" , anim = "idle_b" , prop = "prop_cs_ciggy_01" , flag = 49 , hand = 28422 },
    { nome = "baseado", anim = "WORLD_HUMAN_SMOKING_POT" },
	{ nome = "tragar" , anim = "WORLD_HUMAN_DRUG_DEALER" },
    { nome = "martelo", dict = "amb@world_human_hammering@male@base", anim = "base", prop = "prop_tool_hammer", flag = 49, hand = 28422 },
    { nome = "pescar", dict = "amb@world_human_stand_fishing@base", anim = "base", prop = "prop_fishing_rod_01", flag = 49, hand = 60309 },
    { nome = "pescar2", dict = "amb@world_human_stand_fishing@idle_a", anim = "idle_c", prop = "prop_fishing_rod_01", flag = 49, hand = 60309 },
    { nome = "soprador", dict = "amb@code_human_wander_gardener_leaf_blower@base", anim = "static", prop = "prop_leaf_blower_01", flag = 49, hand = 28422 },
    { nome = "soprador2", dict = "amb@code_human_wander_gardener_leaf_blower@idle_a", anim = "idle_a", prop = "prop_leaf_blower_01", flag = 49, hand = 28422 },
    { nome = "soprador3", dict = "amb@code_human_wander_gardener_leaf_blower@idle_a", anim = "idle_b", prop = "prop_leaf_blower_01", flag = 49, hand = 28422 },
    { nome = "selfie", dict = "cellphone@self", anim = "selfie_in_from_text", prop = "prop_amb_phone", flag = 50, hand = 28422 },
    { nome = "selfie2", dict = "cellphone@", anim = "cellphone_text_read_base_cover_low", prop = "prop_amb_phone", flag = 50, hand = 28422 },
    { nome = "carrinho", dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz", prop = "prop_rub_trolley01a", flag = 50, hand = 24818, pos1 = -0.48 , pos2 = 1.2 , pos3 = 0.0 , pos4 = -15.0 , pos5 = 90.0 , pos6 = 180.0  },
	{ nome = "pullover" , dict = "misscarsteal3pullover" , anim = "pull_over_right" , andar = false , loop = false },
	{ nome = "airguitar" , dict = "anim@mp_player_intcelebrationfemale@air_guitar" , anim = "air_guitar" , andar = false , loop = true },
	{ nome = "airsynth" , dict = "anim@mp_player_intcelebrationfemale@air_synth" , anim = "air_synth" , andar = false , loop = true },
	{ nome = "rastejar" , dict = "move_crawl" , anim = "onfront_fwd" , andar = false , loop = true },
	{ nome = "rastejar2" , dict = "move_injured_ground" , anim = "front_loop" , andar = false , loop = true },
	{ nome = "rastejar3" , dict = "missfbi3_sniping" , anim = "prone_dave" , andar = false , loop = true },
    { nome = "triste" , dict = "misscarsteal2car_stolen" , anim = "chad_car_stolen_reaction" , andar = false , loop = false },
    { nome = "senha" , dict = "mp_heists@keypad@" , anim = "idle_a" , andar = false , loop = true },
    { nome = "lavar" , dict = "missheist_agency3aig_23" , anim = "urinal_sink_loop" , andar = true , loop = true },
    { nome = "olhar" , dict = "oddjobs@basejump@" , anim = "ped_d_loop" , andar = true , loop = true },
	{ nome = "olhar2" , dict = "friends@fra@ig_1" , anim = "base_idle" , andar = true , loop = true },
    { nome = "fedo" , dict = "anim@mp_player_intcelebrationfemale@stinker" , anim = "stinker" , andar = false , loop = false },
    { nome = "explodir" , dict = "anim@mp_player_intcelebrationmale@mind_blown" , anim = "mind_blown" , andar = false , loop = false },
    { nome = "ferido" , dict = "anim@amb@casino@hangout@ped_female@stand_withdrink@01b@base" , anim = "base" , andar = true , loop = true },
	{ nome = "ferido2" , dict = "combat@damage@injured_pistol@to_writhe" , anim = "variation_d" , andar = false , loop = false },
    { nome = "fera" , dict = "anim@mp_fm_event@intro" , anim = "beast_transform" , andar = true , loop = false },
	{ nome = "pensar" , dict = "anim@amb@casino@out_of_money@ped_male@01b@base" , anim = "base" , andar = true , loop = true },
	{ nome = "pensar2" , dict = "misscarsteal4@aliens" , anim = "rehearsal_base_idle_director" , andar = true , loop = true },
	{ nome = "abracocintura" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_chad" , andar = false , loop = true },
	{ nome = "abracocintura2" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_chad" , andar = false , loop = true },
	{ nome = "abracoombro" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_girl" , andar = false , loop = true },
	{ nome = "abracoombro2" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_girl" , andar = false , loop = true },
	
	{ nome = "fortnite" , dict = "custom@floss" , anim = "floss" , andar = false , loop = true },
	{ nome = "fortnite2" , dict = "custom@dont_start" , anim = "dont_start" , andar = false , loop = true },
	{ nome = "fortnite3" , dict = "custom@renegade" , anim = "renegade" , andar = false , loop = true },
	{ nome = "fortnite4" , dict = "custom@savage" , anim = "savage" , andar = false , loop = true },
	{ nome = "fortnite5" , dict = "custom@sayso" , anim = "sayso" , andar = false , loop = true },
	{ nome = "passa" , dict = "mini@strip_club@lap_dance@ld_girl_a_approach" , anim = "ld_girl_a_approach_f" , andar = false , loop = false },	
	{ nome = "passaro" , dict = "random@peyote@bird" , anim = "wakeup" , andar = false , loop = false },
	{ nome = "passaro2" , dict = "random@peyote@bird", anim = "wakeup", andar = true, loop = true },
	{ nome = "aqc" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_a" , andar = false , loop = false },
	{ nome = "aqc2" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_d" , andar = false , loop = false },
	{ nome = "inspec" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_b" , andar = false , loop = true },
	{ nome = "inspec2" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_c" , andar = false , loop = false },
	{ nome = "inspec3" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_d" , andar = false , loop = false },
	{ nome = "inspec4" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_e" , andar = false , loop = false },
	{ nome = "inspec5" , dict = "mp_deathmatch_intros@1hmale" , anim = "intro_male_1h_a_michael" , andar = false , loop = false },
	{ nome = "inspec6" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_a" , andar = false , loop = false },
	{ nome = "inspec7" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_b" , andar = false , loop = false },
	{ nome = "inspec8" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_c" , andar = false , loop = false },
	{ nome = "inspec9" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_d" , andar = false , loop = false },
	{ nome = "inspec10" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_e" , andar = false , loop = false },
	{ nome = "inspec11" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_a" , andar = false , loop = false },
	{ nome = "inspec12" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_b" , andar = false , loop = false },
	{ nome = "inspec13" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_c" , andar = false , loop = false },
	{ nome = "inspec14" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_d" , andar = false , loop = false },
	{ nome = "inspec15" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_e" , andar = false , loop = false },
	{ nome = "inspec16" , dict = "anim@deathmatch_intros@1hmale" , anim = "intro_male_1h_d_michael" , andar = true , loop = false },
	{ nome = "swat" , dict = "swat" , anim = "come" , andar = true , loop = false },
	{ nome = "swat2" , dict = "swat" , anim = "freeze" , andar = true , loop = false },
	{ nome = "swat3" , dict = "swat" , anim = "go_fwd" , andar = true , loop = false },
	{ nome = "swat4" , dict = "swat" , anim = "rally_point" , andar = true , loop = false },
	{ nome = "swat5" , dict = "swat" , anim = "understood" , andar = true , loop = false },
	{ nome = "swat6" , dict = "swat" , anim = "you_back" , andar = true , loop = false },
	{ nome = "swat7" , dict = "swat" , anim = "you_fwd" , andar = true , loop = false },
	{ nome = "swat8" , dict = "swat" , anim = "you_left" , andar = true , loop = false },
	{ nome = "swat9" , dict = "swat" , anim = "you_right" , andar = true , loop = false },
    { nome = "casalm" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedontknowwhy_trevor" , andar = false , loop = true },
    { nome = "casalf" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedontknowwhy_patricia" , andar = false , loop = true },
    { nome = "casalm2" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedesertissobeautiful_trevor" , andar = false , loop = true },
    { nome = "casalf2" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedesertissobeautiful_patricia" , andar = false , loop = true },
	{ nome = "poledance" , dict = "mini@strip_club@pole_dance@pole_dance1" , anim = "pd_dance_01" , andar = false , loop = true },
	{ nome = "poledance2" , dict = "mini@strip_club@pole_dance@pole_dance2" , anim = "pd_dance_02" , andar = false , loop = true },
	{ nome = "poledance3" , dict = "mini@strip_club@pole_dance@pole_dance3" , anim = "pd_dance_03" , andar = false , loop = true },
	{ nome = "fazermassagem" , dict = "missheistdocks2aleadinoutlsdh_2a_int" , anim = "massage_loop_floyd" , andar = false , loop = true },
    { nome = "recebermassagem" , dict = "missheistdocks2aleadinoutlsdh_2a_int" , anim = "massage_loop_trevor" , andar = false , loop = true },
    { nome = "fazermassagemperna" , dict = "missheistdocks2bleadinoutlsdh_2b_int" , anim = "leg_massage_b_floyd" , andar = false , loop = true },
    { nome = "recebermassagemperna" , dict = "missheistdocks2bleadinoutlsdh_2b_int" , anim = "leg_massage_b_trevor" , andar = false , loop = true },
    { nome = "megaphone" , dict = "anim@random@shop_clothes@watches" , anim = "base" , prop = "prop_megaphone_01" , andar = true , loop = true , flag = 49 , hand = 60309 , pos1 = 0.10 , pos2 = 0.04 , pos3 = 0.012 , pos4 = -60.0 , pos5 = 100.0 , pos6 = -30.0 , propAnim = true },
	{ nome = "churrasco" , dict = "amb@prop_human_bbq@male@idle_a", anim = "idle_c", andar = false, loop = true },
	{ nome = "agitar" , dict = "random@street_race", anim = "_streetracer_accepted", andar = false, loop = false },
	{ nome = "agitar2" , dict = "random@street_race", anim = "grid_girl_a", andar = false, loop = false },
	{ nome = "agitar3" , dict = "random@street_race", anim = "grid_girl_b", andar = false, loop = false },
	{ nome = "alianca", dict = "amb@code_human_wander_eating_donut_fat@female@base" , anim = "static" , prop = "mah_alianca" , flag = 50 , hand = 28422 },
	{ nome = "alianca2", dict = "amb@medic@standing@kneel@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "argue" , dict = "misscarsteal4@actor", anim = "actor_berating_loop", andar = true, loop = true },
	{ nome = "boquete" , dict = "misscarsteal2pimpsex",  anim = "pimpsex_hooker" , andar = false , loop = false },
    { nome = "boquete2" , dict = "misscarsteal2pimpsex",  anim = "pimpsex_punter" , andar = false , loop = false },
	{ nome = "punheta" , dict = "anim@mp_player_intselfiewank", anim = "enter" , andar = true , loop = false },
	{ nome = "creu" , dict = "anim@mp_player_intupperair_shagging", anim = "idle_a_fp" , andar = true , loop = false },
	{ nome = "comeatmebro" , dict = "mini@triathlon", anim = "want_some_of_this", andar = true, loop = true },
	{ nome = "argumentar" , dict = "oddjobs@assassinate@vice@hooker", anim = "argue_a", andar = true, loop = true },
	{ nome = "argumentar2" , dict = "oddjobs@bailbond_mountain", anim = "excited_idle_b", andar = true, loop = true },
	{ nome = "argumentar3" , dict = "oddjobs@bailbond_hobohang_out_street_c", anim = "idle_c", andar = false, loop = true },
	{ nome = "argumentar4" , dict = "oddjobs@assassinate@old_lady", anim = "looking_for_help", andar = false, loop = true },
	{ nome = "wave" , dict = "random@mugging5", anim = "001445_01_gangintimidation_1_female_idle_b", andar = true, loop = true },
	{ nome = "wave2" , dict = "friends@fra@ig_1", anim = "over_here_idle_a", andar = true, loop = true },
	{ nome = "wave3" , dict = "friends@frj@ig_1", anim = "wave_e", andar = true, loop = true },
	{ nome = "wave4" , dict = "anim@mp_player_intcelebrationfemale@wave", anim = "wave", andar = true, loop = false },
	{ nome = "wave5" , dict = "friends@frj@ig_1", anim = "wave_c", andar = true, loop = false },
	{ nome = "wave6" , dict = "friends@frj@ig_1", anim = "wave_d", andar = true, loop = false },
	{ nome = "ajustar" , dict = "missmic4", anim = "michael_tux_fidget", andar = true, loop = false },
	{ nome = "knucklecrunch" , dict = "anim@mp_player_intcelebrationfemale@knuckle_crunch", anim = "knuckle_crunch", andar = true, loop = false },
	{ nome = "leanside" , dict = "misscarstealfinalecar_5_ig_1", anim = "waitloop_lamar", andar = true, loop = true },
	{ nome = "screwyou" , dict = "misscommon@response", anim = "screw_you", andar = true, loop = false },
	{ nome = "flipoff" , dict = "anim@arena@celeb@podium@no_prop@", anim = "flip_off_c_1st", andar = true, loop = true },
	{ nome = "bow" , dict = "anim@arena@celeb@podium@no_prop@", anim = "regal_c_1st", andar = true, loop = false },
	{ nome = "bow2" , dict = "anim@arena@celeb@podium@no_prop@", anim = "regal_a_1st", andar = true, loop = false },
	{ nome = "cabecada" , dict = "melee@unarmed@streamed_variations", anim = "plyr_takedown_front_headbutt", andar = true, loop = false },
	{ nome = "cough" , dict = "timetable@gardener@smoking_joint", anim = "idle_cough", andar = true, loop = true },
	{ nome = "stretch" , dict = "mini@triathlon", anim = "idle_f", andar = true, loop = true },
	{ nome = "mindcontrol" , dict = "rcmbarry", anim = "bar_1_attack_idle_aln", andar = true, loop = true },
	{ nome = "boxing" , dict = "anim@mp_player_intcelebrationfemale@shadow_boxing", anim = "shadow_boxing", andar = true, loop = true },
	{ nome = "cop" , dict = "amb@code_human_police_investigate@idle_a", anim = "idle_b", andar = true, loop = true },
	{ nome = "countdown" , dict = "random@street_race", anim = "grid_girl_race_start", andar = true, loop = false },
	{ nome = "reverencia" , dict = "anim@mp_player_intcelebrationpaired@f_f_sarcastic", anim = "sarcastic_left", andar = true, loop = true },
	{ nome = "damn" , dict = "gestures@m@standing@casual", anim = "gesture_damn", andar = true, loop = false },
	{ nome = "damn2" , dict = "misscommon@response", anim = "damn", andar = true, loop = false },
	{ nome = "handshake" , dict = "mp_ped_interaction", anim = "handshake_guy_a", andar = true, loop = false },
	{ nome = "handshake2" , dict = "mp_ped_interaction", anim = "handshake_guy_b", andar = true, loop = false },
    
	-- [ Cayo Dances ] --
	
	{ nome = "dildo" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_cs_dildo_01" , flag = 49 , hand = 28422 },
	{ nome = "dildo2" , prop = "prop_cs_dildo_01" , flag = 50 , hand = 60309 , pos1 = 0.055 , pos2 = 0.05 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "dildo3" , prop = "v_res_d_dildo_f" , flag = 50 , hand = 60309 , pos1 = 0.055 , pos2 = 0.05 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "dildo4" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "v_res_d_dildo_f" , flag = 49 , hand = 28422 },
	{ nome = "dildo5" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "v_res_d_dildo_b" , flag = 49 , hand = 28422 },
	{ nome = "dildo6" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "v_res_d_dildo_c" , flag = 49 , hand = 28422 },
	{ nome = "dildo7" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "v_res_d_dildo_a" , flag = 49 , hand = 28422 },
	{ nome = "dildo8" , prop = "v_res_d_dildo_a" , flag = 50 , hand = 60309 , pos1 = 0.055 , pos2 = 0.05 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "vela" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "v_res_fa_candle04" , flag = 49 , hand = 28422 },
	{ nome = "vela2" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "v_res_fa_candle01" , flag = 49 , hand = 28422 },
	{ nome = "tapa" , dict = "melee@unarmed@streamed_variations" , anim = "plyr_takedown_front_slap" , andar = false , loop = false },

    -- AÇÕES --
    
	{ nome = "foto" , dict = "amb@lo_res_idles@" , anim ="world_human_lean_male_hands_together_lo_res_base" , andar = false , loop = true },
	{ nome = "foto1" , dict = "amb@code_human_cross_road@female@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto2" , dict = "amb@code_human_in_car_mp_actions@tit_squeeze@bodhi@rps@base" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto3" , dict = "amb@world_human_hang_out_street@female_arm_side@enter" , anim ="enter" , andar = false , loop = true },
	{ nome = "foto4" , dict = "amb@world_human_hang_out_street@female_arm_side@idle_a" , anim ="idle_b" , andar = false , loop = true },
	{ nome = "foto5" , dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a" , anim ="idle_b" , andar = false , loop = true },
	{ nome = "foto6" , dict = "friends@" , anim ="pickupwait" , andar = false , loop = true },
	{ nome = "foto7" , dict = "mini@hookers_sp" , anim ="idle_reject_loop_a" , andar = false , loop = true },
	{ nome = "foto8" , dict = "misscarsteal2" , anim ="sweep_high" , andar = false , loop = true },
	{ nome = "foto9" , dict = "missheist_agency3aig_23" , anim ="urinal_base" , andar = false , loop = true },
	{ nome = "foto10" , dict = "misstrevor2ron_basic_moves" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto11" , dict = "oddjobs@basejump@" , anim ="ped_a_loop" , andar = false , loop = true },
	{ nome = "foto12" , dict = "rcmjosh1" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto13" , dict = "switch@franklin@plays_w_dog" , anim ="001916_01_fras_v2_9_plays_w_dog_idle" , andar = false , loop = true },
	{ nome = "foto14" , dict = "timetable@amanda@ig_9" , anim ="ig_9_base_amanda" , andar = false , loop = true },
	{ nome = "foto15" , dict = "misscommon@response" , anim ="bring_it_on" , andar = false , loop = true },
	{ nome = "foto16" , dict = "cover@first_person@move@base@core" , anim ="low_idle_l_facecover" , andar = false , loop = true },
	{ nome = "foto17" , dict = "cover@weapon@core" , anim ="idle_turn_stop" , andar = false , loop = true },
	{ nome = "foto18" , dict = "anim@amb@casino@hangout@ped_female@stand@02b@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto19" , dict = "anim@amb@casino@hangout@ped_male@stand@01a@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto20" , dict = "anim@amb@casino@out_of_money@ped_male@01b@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto21" , dict = "anim@amb@casino@shop@ped_female@01a@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto22" , dict = "anim@mp_corona_idles@female_c@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto23" , dict = "anim@random@shop_clothes@watches" , anim ="base" , andar = false , loop = true },
	{ nome = "foto24" , dict = "iaa_int-11" , anim ="csb_avon_dual-11" , andar = false , loop = true },
	{ nome = "foto25" , dict = "mini@strip_club@lap_dance@ld_girl_a_approach" , anim ="ld_girl_a_approach_f" , andar = false , loop = true },
    { nome = "foto26" , dict = "amb@code_human_in_car_mp_actions@rock@bodhi@rps@base" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto27" , dict = "mini@hookers_spcrackhead" , anim ="idle_reject_loop_c" , andar = false , loop = true },
	{ nome = "foto28" , dict = "anim@mp_player_intupperfinger" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto29" , dict = "switch@franklin@lamar_tagging_wall" , anim ="lamar_tagging_wall_loop_franklin" , andar = false , loop = true },
	{ nome = "foto30" , dict = "mp_move@prostitute@m@cokehead" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto31" , dict = "anim@amb@casino@valet_scenario@pose_c@" , anim ="base_a_m_y_vinewood_01" , andar = false , loop = true },
	{ nome = "foto32" , dict = "anim@amb@casino@valet_scenario@pose_d@" , anim ="look_ahead_l_a_m_y_vinewood_01" , andar = false , loop = true },
	{ nome = "foto33" , dict = "anim@special_peds@casino@beth@wheel@" , anim ="action10_beth" , andar = false , loop = true },
	{ nome = "foto34" , dict = "anim@special_peds@casino@beth@wheel@" , anim ="action2_beth" , andar = false , loop = true },
	{ nome = "foto35" , dict = "anim@mp_player_intcelebrationfemale@v_sign" , anim ="v_sign" , andar = false , loop = true },
	{ nome = "foto36" , dict = "mini@strip_club@idles@stripper" , anim ="stripper_idle_03" , andar = false , loop = true },
	{ nome = "foto37" , dict = "mini@strip_club@idles@stripper" , anim ="stripper_idle_04" , andar = false , loop = true },
	{ nome = "foto38" , dict = "anim_heist@arcade@fortune@female@" , anim ="reaction_pondering" , andar = false , loop = true },
	{ nome = "foto39" , dict = "anim@mp_player_intcelebrationfemale@peace" , anim ="peace" , andar = false , loop = true },
	{ nome = "foto40" , dict = "missfbi3_party_d" , anim ="stand_talk_loop_b_female" , andar = false , loop = true },
	{ nome = "foto41" , dict = "armenian_1_int-44" , anim ="a_m_y_musclbeac_01^1_dual-44" , andar = false , loop = true },
	{ nome = "foto42" , dict = "mp_clothing@female@trousers" , anim ="try_trousers_positive_a" , andar = false , loop = true },
	{ nome = "foto43" , dict = "silj_ext-19" , anim ="mp_m_freemode_01^3_dual-19" , andar = false , loop = true },
	{ nome = "foto44" , dict = "sdrm_mcs_2-0" , anim ="ig_bestmen^1-0" , andar = false , loop = true },
	{ nome = "foto45" , dict = "anim_heist@arcade_combined@" , anim ="ped_female@_stand@_02a@_idles_convo_idle_c" , andar = false , loop = true },
	{ nome = "foto46" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim ="thumbs_down_a_player_a" , andar = false , loop = true },
	{ nome = "foto47" , dict = "guard_reactions" , anim ="1hand_aiming_cycle" , andar = false , loop = true },
	{ nome = "foto48" , dict = "anim@move_f@waitress" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto49" , dict = "anim_heist@arcade_combined@" , anim ="ped_female@_stand_withdrink@_01b@_base_base" , andar = false , loop = true },
	{ nome = "foto50" , dict = "amb@lo_res_idles@" , anim ="world_human_security_shine_torch_lo_res_base" , andar = false , loop = true },
	{ nome = "foto51" , dict = "rcmjosh2" , anim ="stand_lean_back_beckon_a" , andar = false , loop = true },
    { nome = "foto52" , dict = "rcmjosh2" , anim ="stand_lean_back_beckon_b" , andar = false , loop = true },
	{ nome = "foto53" , dict = "pro_mcs_7_concat-1" , anim ="cs_priest_dual-1" , andar = false , loop = true },
	{ nome = "foto54" , dict = "clothingshirt" , anim ="try_shirt_base" , andar = false , loop = true },
	{ nome = "foto55" , dict = "special_ped@pamela@trevor_1@trevor_1a" , anim ="pamela_convo_trevor_im_trying_to_get_noticed_0" , andar = false , loop = true },
    { nome = "foto56" , dict = "special_ped@impotent_rage@intro" , anim ="idle_intro" , andar = false , loop = true },
	{ nome = "foto57" , dict = "random@escape_paparazzi@standing@" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto58" , dict = "pro_mcs_7_concat-8" , anim ="player_two_dual-8" , andar = false , loop = true },
	{ nome = "foto59" , dict = "anim@heists@ornate_bank@thermal_charge" , anim ="cover_eyes_loop" , andar = false , loop = true },
	{ nome = "foto60" , dict = "low_fun_int-7" , anim ="cs_lamardavis_dual-7" , andar = false , loop = true },
    { nome = "foto61" , dict = "tale_intro-12" , anim ="a_f_y_genhot_01^2_dual-12" , andar = false , loop = true },
	{ nome = "foto62" , dict = "amb@code_human_police_investigate@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto63" , dict = "anim@mp_player_intincarpeacebodhi@ds@" , anim ="enter" , andar = false , loop = true },
	{ nome = "foto64" , dict = "anim@mp_corona_idles@female_c@idle_a" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto65" , dict = "anim@miss@low@fin@vagos@" , anim ="idle_ped07" , andar = false , loop = true },
	{ nome = "foto66" , dict = "oddjobs@assassinate@multi@" , anim ="idle_a_pros" , andar = false , loop = true },
	{ nome = "foto67" , dict = "timetable@jimmy@ig_5@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto68" , dict = "rcmnigel1bnmt_1b" , anim ="base_tyler" , andar = false , loop = true },
	{ nome = "foto69" , dict = "mp_fm_intro_cut" , anim ="world_human_standing_male_01_idle_03" , andar = false , loop = true },
	{ nome = "foto70" , dict = "mic_4_int-0" , anim ="a_f_y_bevhills_04-0" , andar = false , loop = true },
	{ nome = "foto71" , dict = "mic_4_int-0" , anim ="cs_milton_dual-0" , andar = false , loop = true },
	{ nome = "foto72" , dict = "cellphone@self@franklin@" , anim ="west_coast" , andar = false , loop = true },
	{ nome = "foto73" , dict = "anim@random@shop_clothes@watches" , anim ="idle_d" , andar = false , loop = true },
	{ nome = "foto74" , dict = "amb@world_human_muscle_flex@arms_in_front@idle_a" , anim ="idle_b" , andar = false , loop = true },
	{ nome = "foto75" , dict = "amb@world_human_prostitute@crackhooker@idle_a" , anim ="idle_c" , andar = false , loop = true },
	{ nome = "foto76" , dict = "amb@world_human_prostitute@hooker@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto77" , dict = "anim@mp_player_intupperfinger" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto78" , dict = "anim@mp_player_intcelebrationmale@blow_kiss" , anim ="blow_kiss" , andar = false , loop = true },
	{ nome = "foto79" , dict = "anim@mp_player_intcelebrationmale@knuckle_crunch" , anim ="knuckle_crunch" , andar = false , loop = true },
	{ nome = "foto80" , dict = "anim@mp_player_intupperthumbs_up" , anim ="idle_a_fp" , andar = false , loop = true },
	{ nome = "foto81" , dict = "switch@michael@prostitute" , anim ="exit_hooker" , andar = false , loop = true },
	{ nome = "foto82" , dict = "mp_player_int_upperbro_love" , anim ="mp_player_int_bro_love_fp" , andar = false , loop = true },
	{ nome = "foto83" , dict = "hs3_arc_int-9" , anim ="csb_georginacheng_dual-9" , andar = false , loop = true },
	{ nome = "foto84" , dict = "armenian_1_int-0" , anim ="a_f_y_beach_01_dual-0" , andar = false , loop = true },
	{ nome = "foto85" , dict = "armenian_1_int-0" , anim ="a_f_y_hipster_02^2-0" , andar = false , loop = true },
	{ nome = "foto86" , dict = "armenian_1_int-0" , anim ="a_f_y_tourist_01^2-0" , andar = false , loop = true },
	{ nome = "foto87" , dict = "armenian_1_int-0" , anim ="a_m_y_beach_03-0" , andar = false , loop = true },
	{ nome = "foto88" , dict = "special_ped@pamela@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto89" , dict = "mp_fm_intro_cut" , anim ="world_human_standing_male_01_idle_01" , andar = false , loop = true },
	{ nome = "foto90" , dict = "amb@world_human_leaning@female@smoke@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto91" , dict = "amb@world_human_leaning@female@wall@back@hand_up@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto92" , dict = "amb@code_human_cross_road@female@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto93" , dict = "anim@heists@heist_corona@single_team" , anim = "single_team_intro_boss" , andar = false , loop = true },
	{ nome = "foto94" , dict = "amb@incar@male@smoking@idle_a" , anim = "idle_b" , andar = false , loop = true },
	{ nome = "foto95" , anim = "idle_a" , dict  = "anim@amb@casino@hangout@ped_male@stand@02b@idles" , andar = false , loop = true },
	{ nome = "foto96" , anim = "rub_neck_a_m_y_vinewood_01" , dict  = "anim@amb@casino@valet_scenario@pose_c@" , andar = false , loop = true },
	{ nome = "foto97" , dict = "anim@mp_player_intuppershush" , anim = "idle_a_fp" , andar = false , loop = true },
	{ nome = "foto98" , anim = "_car_a_flirt_girl" , dict  = "random@street_race" , andar = false , loop = true },
	{ nome = "foto99" , dict = "misshair_shop@barbers" , anim = "keeper_base" , andar = false , loop = true },
	{ nome = "foto100" , dict = "cellphone@self@franklin@" , anim = "chest_bump" , andar = false , loop = true },
    { nome = "foto101" , dict = "amb@world_human_leaning@male@wall@back@foot_up@aggro_react" , anim = "aggro_react_forward_enter", andar = false , loop = true },
    { nome = "foto102" , dict = "martin_1_int-0" , anim = "cs_patricia_dual-0" , andar = false , loop = true },
    { nome = "foto103" , dict = "mini@strip_club@lap_dance_2g@ld_2g_decline" , anim = "ld_2g_decline_h_s2" , andar = false , loop = true },
    { nome = "foto104" , anim = "stripper_idle_03" , dict  = "mini@strip_club@idles@stripper" , andar = false , loop = true },
    { nome = "foto105" , dict = "amb@world_human_binoculars@male@base" , anim ="base" , andar = false , loop = true },
    { nome = "foto106" , dict = "amb@world_human_tourist_mobile@male@base" , anim ="base" , andar = false , loop = true },
    { nome = "foto107" , dict = "anim@amb@board_room@whiteboard@" , anim ="read_03_amy_skater_01" , andar = false , loop = true },
    { nome = "foto108" , dict = "anim@heists@team_respawn@variations@variation_b_rot" , anim ="respawn_b_ped_c" , andar = false , loop = true },
	{ nome = "foto109" , anim = "idle_d" , dict  = "anim@amb@casino@hangout@ped_female@stand@01a@idles" , andar = false , loop = true },
	{ nome = "foto110" , dict = "amb@world_human_stand_guard@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "foto111" , dict = "amb@world_human_tourist_mobile@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto112" , dict = "switch@michael@pharmacy" , anim = "mics1_ig_11_loop" , andar = false , loop = true },
	{ nome = "foto113" , dict = "weapons@first_person@aim_idle@p_m_one@unarmed@fidgets@c" , anim = "fidget_low_loop" , andar = false , loop = true },
	{ nome = "foto114" , dict = "armenian_1_int-0" , anim = "player_one_dual-0" , andar = false , loop = true },
	{ nome = "foto115" , dict = "amb@world_human_bum_wash@male@low@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "foto116" , dict = "anim@amb@casino@hangout@ped_male@stand_withdrink@01b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto117" , dict = "anim@move_m@trash_rc" , anim = "aim_high_loop" , andar = false , loop = true },
	{ nome = "foto118" , dict = "martin_1_int-10" , anim = "cs_patricia_dual-10" , andar = false , loop = true },
	{ nome = "foto119" , dict = "club_open-30" , anim = "ig_djsolmanager_dual-30" , andar = false , loop = true },
	{ nome = "foto120" , dict= "anim_heist@arcade_combined@" , anim = "ped_female@_stand@_02a@_idles_convo_idle_d" , andar = false , loop = true },
	{ nome = "foto121" , dict= "amb@code_human_police_investigate@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto122" , dict= "amb@world_human_golf_player@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto123" , dict= "rcmnigel1a" , anim = "base" , andar = false , loop = true },
	{ nome = "foto124" , dict= "timetable@ron@ig_1" , anim = "ig_1_base" , andar = false , loop = true },
	{ nome = "foto125" , dict= "anim@amb@code_human_in_car_idles@arm@generic@ds@idle_j" , anim = "idle_lowdoor" , andar = false , loop = true },
	{ nome = "foto126" , dict= "club_open-0" , anim = "cs_lazlow_2_dual-0" , andar = false , loop = true },
	{ nome = "foto127" , dict= "armenian_1_int-33" , anim = "a_m_y_runner_01-33" , andar = false , loop = true },
	{ nome = "foto128" , dict= "armenian_1_int-33" , anim = "ig_lamardavis_dual-33" , andar = false , loop = true },
	{ nome = "foto129" , dict= "armenian_1_int-3" , anim = "a_f_y_fitness_02^5-3" , andar = false , loop = true },
	{ nome = "foto130" , dict = "pose1@animation" , anim = "pose1_clip" , andar = false , loop = true },
	{ nome = "foto131" , dict = "pose2@animation" , anim = "pose2_clip" , andar = false , loop = true },
	{ nome = "foto132" , dict = "pose3@animation" , anim = "pose3_clip" , andar = false , loop = true },
	{ nome = "foto133" , dict = "pose5@animation" , anim = "pose5_clip" , andar = false , loop = true },
	{ nome = "foto134" , dict = "pose6@animation" , anim = "pose6_clip" , andar = false , loop = true },
	{ nome = "foto135" , dict = "pose8@animation" , anim = "pose8_clip" , andar = false , loop = true },
	{ nome = "foto136" , dict = "pose9@animation" , anim = "pose9_clip" , andar = false , loop = true },
	{ nome = "foto137" , dict = "pose10@animation" , anim = "pose10_clip" , andar = false , loop = true },
	{ nome = "foto138" , dict = "pose11@animation" , anim = "pose11_clip" , andar = false , loop = true },
	{ nome = "foto139" , dict = "pose12@animation" , anim = "pose12_clip" , andar = false , loop = true },
	{ nome = "foto140" , dict = "pose13@animation" , anim = "pose13_clip" , andar = false , loop = true },
	{ nome = "foto141" , dict = "pose14@animation" , anim = "pose14_clip" , andar = false , loop = true },


	{ nome = "foto142" , dict = "mggyhang1@animation" , anim = "mggyhang1_clip" , andar = false , loop = true },
	{ nome = "foto143" , dict = "mggyhang2@animation" , anim = "mggyhang2_clip" , andar = false , loop = true },
	{ nome = "foto144" , dict = "mggyhang3@animation" , anim = "mggyhang3_clip" , andar = false , loop = true },
	{ nome = "foto145" , dict = "mggypiggypair1@animation" , anim = "mggypiggypair1_clip" , andar = false , loop = true },
	{ nome = "foto146" , dict = "mggypiggypair2@animation" , anim = "mggypiggypair2_clip" , andar = false , loop = true },

	{ nome = "foto147" , dict = "lunyx@rgmp01" , anim = "rgmp01" , andar = false , loop = true },
	{ nome = "foto148" , dict = "lunyx@rgmp02" , anim = "rgmp02" , andar = false , loop = true },
	{ nome = "foto149" , dict = "lunyx@rgmp03" , anim = "rgmp03" , andar = false , loop = true },
	{ nome = "foto150" , dict = "lunyx@rgmp04" , anim = "rgmp04" , andar = false , loop = true },
	{ nome = "foto151" , dict = "lunyx@rgmp05" , anim = "rgmp05" , andar = false , loop = true },
	{ nome = "foto152" , dict = "lunyx@rgmp06" , anim = "rgmp06" , andar = false , loop = true },
	{ nome = "foto153" , dict = "lunyx@rgmp07" , anim = "rgmp07" , andar = false , loop = true },

	{ nome = "foto154" , dict = "syx@cute01" , anim = "cute01" , andar = false , loop = true },
	{ nome = "foto155" , dict = "syx@cute02" , anim = "cute02" , andar = false , loop = true },
	{ nome = "foto156" , dict = "syx@cute03" , anim = "cute03" , andar = false , loop = true },
	{ nome = "foto157" , dict = "syx@cute04" , anim = "cute04" , andar = false , loop = true },
	{ nome = "foto158" , dict = "syx@cute05" , anim = "cute05" , andar = false , loop = true },

	{ nome = "foto159" , dict = "wristcheck@animation" , anim = "wristcheck_clip" , andar = false , loop = true },
	{ nome = "foto160" , dict = "crossfinger@animation" , anim = "crossfinger_clip" , andar = false , loop = true },
	{ nome = "foto161" , dict = "seat1@animation" , anim = "seat1_clip" , andar = false , loop = true },
	{ nome = "foto162" , dict = "bag@animation" , anim = "bag_clip" , andar = false , loop = true },

	
	{ nome = "netin" , dict = "westmoney@cubandark" , anim = "westmoney@cubandark" , andar = false , loop = true },

	{ nome = "foto163" , dict = "card@warly" , anim = "card1" , andar = false , loop = true },
	{ nome = "foto164" , dict = "card2@warly" , anim = "card2" , andar = false , loop = true },
	{ nome = "foto165" , dict = "card3@warly" , anim = "card3" , andar = false , loop = true },
	{ nome = "foto166" , dict = "card4@warly" , anim = "card4" , andar = false , loop = true },
	{ nome = "foto167" , dict = "card5@warly" , anim = "card5" , andar = false , loop = true },

	{ nome = "foto168" , dict = "dollie_mods@follow_me_001" , anim = "follow_me_001" , andar = false , loop = true },
	{ nome = "foto169" , dict = "dollie_mods@follow_me_002" , anim = "follow_me_002" , andar = false , loop = true },

	{ nome = "foto170" , dict = "arron@simspose1" , anim = "simspose1" , andar = false , loop = true },
	{ nome = "foto171" , dict = "arron@simspose2" , anim = "simspose2" , andar = false , loop = true },
	{ nome = "foto172" , dict = "arron@simspose3" , anim = "simspose3" , andar = false , loop = true },
	{ nome = "foto173" , dict = "arron@simspose4" , anim = "simspose4" , andar = false , loop = true },
	{ nome = "foto174" , dict = "arron@simspose5" , anim = "simspose5" , andar = false , loop = true },

	{ nome = "foto175" , dict = "wrldmods@trippieredd" , anim = "trippieredd" , andar = false , loop = true },

	{ nome = "foto176" , dict = "holdhip@animation" , anim = "holdhip_clip" , andar = false , loop = true },
	{ nome = "foto177" , dict = "holdhipb@animation" , anim = "holdhipb_clip" , andar = false , loop = true },
	{ nome = "foto178" , dict = "holdass@animation" , anim = "holdass_clip" , andar = false , loop = true },
	{ nome = "foto179" , dict = "holdassb@animation" , anim = "holdassb_clip" , andar = false , loop = true },
	{ nome = "foto180" , dict = "coupleseat1@animation" , anim = "coupleseat1_clip" , andar = false , loop = true },
	{ nome = "foto181" , dict = "coupleseat1b@animation" , anim = "coupleseat1b_clip" , andar = false , loop = true },


	{ nome = "foto182" , dict = "lunyx@random@v3@pose001" , anim = "random@v3@pose001" , andar = false , loop = true },
	{ nome = "foto183" , dict = "lunyx@random@v3@pose002" , anim = "random@v3@pose002" , andar = false , loop = true },
	{ nome = "foto184" , dict = "lunyx@random@v3@pose003" , anim = "random@v3@pose003" , andar = false , loop = true },
	{ nome = "foto185" , dict = "lunyx@random@v3@pose004" , anim = "random@v3@pose004" , andar = false , loop = true },
	{ nome = "foto186" , dict = "lunyx@random@v3@pose005" , anim = "random@v3@pose005" , andar = false , loop = true },
	{ nome = "foto187" , dict = "lunyx@random@v3@pose006" , anim = "random@v3@pose006" , andar = false , loop = true },
	{ nome = "foto188" , dict = "lunyx@random@v3@pose007" , anim = "random@v3@pose007" , andar = false , loop = true },
	{ nome = "foto189" , dict = "lunyx@random@v3@pose008" , anim = "random@v3@pose008" , andar = false , loop = true },
	{ nome = "foto190" , dict = "lunyx@random@v3@pose009" , anim = "random@v3@pose009" , andar = false , loop = true },
	{ nome = "foto191" , dict = "lunyx@random@v3@pose010" , anim = "random@v3@pose010" , andar = false , loop = true },
	{ nome = "foto192" , dict = "lunyx@random@v3@pose011" , anim = "random@v3@pose011" , andar = false , loop = true },
	{ nome = "foto193" , dict = "lunyx@random@v3@pose012" , anim = "random@v3@pose012" , andar = false , loop = true },
	{ nome = "foto194" , dict = "lunyx@random@v3@pose013" , anim = "random@v3@pose013" , andar = false , loop = true },
	{ nome = "foto195" , dict = "lunyx@random@v3@pose014" , anim = "random@v3@pose014" , andar = false , loop = true },
	{ nome = "foto196" , dict = "lunyx@random@v3@pose015" , anim = "random@v3@pose015" , andar = false , loop = true },
	{ nome = "foto197" , dict = "lunyx@random@v3@pose016" , anim = "random@v3@pose016" , andar = false , loop = true },
	{ nome = "foto198" , dict = "lunyx@random@v3@pose017" , anim = "random@v3@pose017" , andar = false , loop = true },
	{ nome = "foto199" , dict = "lunyx@random@v3@pose018" , anim = "random@v3@pose018" , andar = false , loop = true },
	{ nome = "foto200" , dict = "lunyx@random@v3@pose019" , anim = "random@v3@pose019" , andar = false , loop = true },
	{ nome = "foto201" , dict = "lunyx@random@v3@pose020" , anim = "random@v3@pose020" , andar = false , loop = true },


	{ nome = "foto202" , dict = "mx@pose1" , anim = "mx_animclip1" , andar = false , loop = true },
	{ nome = "foto203" , dict = "mx@pose2" , anim = "mx_animclip2" , andar = false , loop = true },
	{ nome = "foto204" , dict = "mx@pose3" , anim = "mx_animclip3" , andar = false , loop = true },
	{ nome = "foto205" , dict = "mx@pose4" , anim = "mx_animclip4" , andar = false , loop = true },

	{ nome = "foto206" , dict = "random@shop_tattoo", anim = "_idle_a", andar = true, loop = true },
	{ nome = "foto207" , dict = "rcmnigel1cnmt_1c", anim = "base", andar = true, loop = true },
	{ nome = "foto208" , dict = "rcmjosh1", anim = "idle", andar = true, loop = true },
	{ nome = "foto209" , dict = "timetable@amanda@ig_3", anim = "ig_3_base_tracy", andar = true, loop = true },
	{ nome = "foto210" , dict = "misshair_shop@hair_dressers", anim = "keeper_base", andar = true, loop = true },
	{ nome = "foto211" , dict = "jh_1_ig_3-2", anim = "cs_jewelass_dual-2", andar = true, loop = true },
	{ nome = "foto212" , dict = "oddjobs@taxi@", anim = "idle_a", andar = false, loop = true },
	{ nome = "foto213" , dict = "amb@world_human_bum_standing@twitchy@base", anim = "base", andar = true, loop = true },


	{ nome = "foto214" , dict = "anim@heists@heist_corona@team_idles@male_a", anim = "idle", andar = true, loop = true },
	{ nome = "foto215" , dict = "anim@heists@heist_corona@team_idles@female_a", anim = "idle", andar = true, loop = true },
	{ nome = "foto216" , dict = "anim@heists@humane_labs@finale@strip_club", anim = "ped_b_celebrate_loop", andar = true, loop = true },
	{ nome = "foto217" , dict = "anim@mp_celebration@idles@female", anim = "celebration_idle_f_a", andar = true, loop = true },
	{ nome = "foto218" , dict = "anim@mp_corona_idles@female_b@idle_a", anim = "idle_a", andar = true, loop = true },
	{ nome = "foto219" , dict = "anim@mp_corona_idles@male_c@idle_a", anim = "idle_a", andar = true, loop = true },
	{ nome = "foto220" , dict = "anim@mp_corona_idles@male_d@idle_a", anim = "idle_a", andar = true, loop = true },
	{ nome = "foto221" , dict = "amb@world_human_hang_out_street@male_b@idle_a", anim = "idle_b", andar = true, loop = true },
	{ nome = "foto222" , dict = "friends@fra@ig_1", anim = "base_idle", andar = true, loop = true },
	{ nome = "foto223" , dict = "mp_move@prostitute@m@french", anim = "idle", andar = true, loop = true },
	{ nome = "foto224" , dict = "random@countrysiderobbery", anim = "idle_a", andar = true, loop = true },
	{ nome = "foto225" , dict = "amb@world_human_drug_dealer_hard@male@idle_b", anim = "idle_d", andar = false, loop = true },
	{ nome = "foto226" , dict = "anim@mp_player_intincarrockstd@ps@", anim = "idle_a", andar = true, loop = true },
	{ nome = "foto227" , dict = "amb@world_human_leaning@female@wall@back@hand_up@idle_a", anim = "idle_a", andar = true, loop = true },
	{ nome = "foto228" , dict = "amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", anim = "idle_a", andar = true, loop = true },
	{ nome = "foto229" , dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a", anim = "idle_a", andar = true, loop = true },
	{ nome = "foto230" , dict = "amb@world_human_hang_out_street@male_c@idle_a", anim = "idle_b", andar = true, loop = true },
	{ nome = "foto231" , dict = "random@shop_gunstore", anim = "_idle", andar = true, loop = true },
	{ nome = "foto232" , dict = "rcmnigel1a_band_groupies", anim = "base_m2", andar = true, loop = true },
	{ nome = "foto233" , dict = "misscarsteal4@aliens", anim = "rehearsal_base_idle_director", andar = true, loop = true },
	{ nome = "foto234" , dict = "missheist_jewelleadinout", anim = "jh_int_outro_loop_a", andar = true, loop = true },
	{ nome = "foto235" , dict = "timetable@tracy@ig_8@base", anim = "base", andar = true, loop = true },
	{ nome = "foto236" , dict = "mp_cp_welcome_tutthink", anim = "b_think", andar = true, loop = false },

    { nome = "wanna_see_me" , dict = "custom@wanna_see_me" , anim = "wanna_see_me" , andar = false , loop = true },
	{ nome = "billybounce" , dict = "custom@billybounce" , anim = "billybounce" , andar = false , loop = true },
    { nome = "randompose1" , dict = "lunyx@rgmp01" , anim = "rgmp01" , andar = true , loop = true },
	{ nome = "randompose2" , dict = "lunyx@rgmp02" , anim = "rgmp02" , andar = true , loop = true },
	{ nome = "randompose3" , dict = "lunyx@rgmp03" , anim = "rgmp03" , andar = true , loop = true },
	{ nome = "randompose4" , dict = "lunyx@rgmp04" , anim = "rgmp04" , andar = true , loop = true },
	{ nome = "randompose5" , dict = "lunyx@rgmp05" , anim = "rgmp05" , andar = true , loop = true },
	{ nome = "randompose6" , dict = "lunyx@rgmp06" , anim = "rgmp06" , andar = true , loop = true },
	{ nome = "randompose7" , dict = "lunyx@rgmp07" , anim = "rgmp07" , andar = true , loop = true },
	{ nome = "downward_fortnite" , dict = "custom@downward_fortnite" , anim = "downward_fortnite" , andar = false , loop = true },
	{ nome = "pullup" , dict = "custom@pullup" , anim = "pullup" , andar = false , loop = true },
	{ nome = "rollie" , dict = "custom@rollie" , anim = "rollie" , andar = false , loop = true },
	{ nome = "fofo" , dict = "syx@cute01" , anim = "cute01" , andar = true , loop = true },
	{ nome = "fofo2" , dict = "syx@cute02" , anim = "cute02" , andar = true , loop = true },
	{ nome = "fofo3" , dict = "syx@cute03" , anim = "cute03" , andar = true , loop = true },
	{ nome = "fofo4" , dict = "syx@cute04" , anim = "cute04" , andar = true , loop = true },
	{ nome = "fofo5" , dict = "syx@cute05" , anim = "cute05" , andar = true , loop = true },
	{ nome = "posea" , dict = "lunyx@random001" , anim = "random001" , andar = false , loop = true },
	{ nome = "poseb" , dict = "lunyx@random002" , anim = "random002" , andar = false , loop = true },
	{ nome = "posec" , dict = "lunyx@random003" , anim = "random003" , andar = false , loop = true },
	{ nome = "gangsign" , dict = "mp_player_int_uppergang_sign_a" , anim = "mp_player_int_gang_sign_a" , andar = true , loop = true },
    { nome = "gangsign2" , dict = "mp_player_int_uppergang_sign_b" , anim = "mp_player_int_gang_sign_b" , andar = true , loop = true },
	{ nome = "abafa" , dict = "kukas@abafa" , anim = "abafa" , andar = false , loop = false },
    { nome = "verificar", dict = "amb@medic@standing@tendtodead@idle_a", anim = "idle_a", andar = false, loop = true },
    { nome = "mexer", dict = "amb@prop_human_parking_meter@female@idle_a", anim = "idle_a_female", andar = true, loop = true },
    { nome = "cuidar", dict = "mini@cpr@char_a@cpr_str", anim = "cpr_pumpchest", andar = true, loop = true },
    { nome = "cuidar2", dict = "mini@cpr@char_a@cpr_str", anim = "cpr_kol", andar = true, loop = true},
    { nome = "cuidar3", dict = "mini@cpr@char_a@cpr_str", anim = "cpr_kol_idle", andar = true, loop = true },
    { nome = "cansado", dict = "rcmbarry", anim = "idle_d", andar = false, loop = true },
    { nome = "meleca", dict = "anim@mp_player_intuppernose_pick", anim = "idle_a", andar = true, loop = true },
    { nome = "meleca2", dict = "anim@mp_player_intcelebrationfemale@nose_pick", anim = "nose_pick", andar = false, loop = false },
    { nome = "meleca3", dict = "move_p_m_two_idles@generic", anim = "fidget_sniff_fingers", andar = true, loop = false },
    { nome = "bora", dict = "missfam4", anim = "say_hurry_up_a_trevor", andar = true, loop = false },
    { nome = "limpar", dict = "missfbi3_camcrew", anim = "final_loop_guy", andar = true, loop = false },
    { nome = "galinha", dict = "random@peyote@chicken", anim = "wakeup", andar = true, loop = true },
    { nome = "amem", dict = "rcmepsilonism8", anim = "worship_base", andar = true, loop = true },
    { nome = "nervoso", dict = "rcmme_tracey1", anim = "nervous_loop", andar = true, loop = true },
    { nome = "ajoelhar", dict = "amb@medic@standing@kneel@idle_a", anim = "idle_a", andar = false, loop = true },
    { nome = "abanar", dict = "timetable@amanda@facemask@base", anim = "base", andar = true, loop = true },
    { nome = "cocada", dict = "mp_player_int_upperarse_pick", anim = "mp_player_int_arse_pick", andar = true, loop = true },
    { nome = "cocada2", dict = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch", andar = true, loop = true },
	{ nome = "lero" , dict = "anim@mp_player_intselfiejazz_hands" , anim = "idle_a" , andar = true , loop = false },
	{ nome = "lero2" , dict = "anim@mp_player_intcelebrationfemale@thumb_on_ears" , anim = "thumb_on_ears" , andar = false , loop = false },
	{ nome = "lero3" , dict = "anim@mp_player_intcelebrationfemale@cry_baby" , anim = "cry_baby" , andar = false , loop = false },
	{ nome = "beijo" , dict = "anim@mp_player_intselfieblow_kiss" , anim = "exit" , andar = true , loop = false },
	{ nome = "beijo2" , dict = "anim@mp_player_intcelebrationfemale@blow_kiss", anim = "blow_kiss", andar = true, loop = true },
	{ nome = "beijo3" , dict = "anim@mp_player_intcelebrationfemale@blow_kiss" , anim = "blow_kiss" , andar = false , loop = false },
	{ nome = "beijo4" , dict = "anim@mp_player_intselfieblow_kiss" , anim = "exit" , andar = false , loop = false },
	{ nome = "malicia", dict = "anim@mp_player_intupperdock", anim = "idle_a", andar = true, loop = false },
    { nome = "ligar", dict = "cellphone@", anim = "cellphone_call_in", prop = "prop_amb_phone", flag = 50, hand = 28422 },
    { nome = "digitar", dict = "anim@heists@prison_heistig1_p1_guard_checks_bus", anim = "loop", andar = false, loop = true },
    { nome = "digitar2" , dict = "mp_fbi_heist" , anim = "loop" , andar = false , loop = true },
    { nome = "continencia", dict = "mp_player_int_uppersalute", anim = "mp_player_int_salute", andar = true, loop = true },
    { nome = "atm", dict = "amb@prop_human_atm@male@idle_a", anim = "idle_a", andar = false, loop = false },
	{ nome = "palmas" , dict = "anim@mp_player_intcelebrationfemale@slow_clap" , anim = "slow_clap" , andar = true , loop = false },
	{ nome = "palmas2" , dict = "amb@world_human_cheering@male_b" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas3" , dict = "amb@world_human_cheering@male_d" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas4" , dict = "amb@world_human_cheering@male_e" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas5" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "angry_clap_a_player_a" , andar = false , loop = true },
	{ nome = "palmas6" , dict = "anim@mp_player_intupperslow_clap" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "palmas7" , dict = "anim@arena@celeb@flat@solo@no_props@", anim = "angry_clap_a_player_a", andar = true, loop = true },
    { nome = "postura", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "cop_a_idle", andar = true, loop = true },
    { nome = "postura2", dict = "amb@world_human_cop_idles@female@base", anim = "base", andar = true, loop = true },
    { nome = "peace", dict = "mp_player_int_upperpeace_sign", anim = "mp_player_int_peace_sign", andar = true, loop = true },
    { nome = "peace2" , dict = "anim@mp_player_intupperpeace" , anim = "idle_a" , andar = true , loop = true },
    { nome = "desce", dict = "misssagrab_flyhome", anim = "direct_heli_loop", andar = false, loop = true },    
	{ nome = "debrucar" , dict = "amb@prop_human_bum_shopping_cart@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "debrucar2" , dict = "anim@amb@casino@valet_scenario@pose_b@" , anim = "base_a_m_y_vinewood_01" , andar = false , loop = true },
	{ nome = "debrucar3" , dict = "anim@amb@casino@valet_scenario@pose_a@" , anim = "base_a_m_y_vinewood_01" , andar = false , loop = true },
	{ nome = "debrucar4" , dict = "anim@amb@casino@out_of_money@ped_female@02a@base" , anim = "base" , andar = false , loop = true },
	{ nome = "debrucar5" , dict = "anim@mini@yacht@bar@drink@four" , anim = "four_bartender" , andar = false , loop = true },
    { nome = "beijar", dict = "mp_ped_interaction", anim = "kisses_guy_a", andar = false, loop = false },
    { nome = "striper", dict = "mini@strip_club@idles@stripper", anim = "stripper_idle_02", andar = false, loop = true },
    { nome = "escutar", dict = "mini@safe_cracking", anim = "idle_base", andar = false, loop = true },
    { nome = "dj", dict = "anim@mp_player_intupperdj", anim = "idle_a", andar = true, loop = true },
    { nome = "dj2", dict = "anim@mp_player_intupperair_synth", anim = "idle_a_fp", andar = false, loop = true },
	{ nome = "dj3" , dict = "anim@mp_player_intcelebrationfemale@air_synth" , anim = "air_synth" , andar = false , loop = false },
    { nome = "rock", dict = "anim@mp_player_intcelebrationmale@air_guitar", anim = "air_guitar", andar = false, loop = true },
    { nome = "rock2", dict = "mp_player_introck", anim = "mp_player_int_rock", andar = false, loop = false },
    { nome = "abracar", dict = "mp_ped_interaction", anim = "hugs_guy_a", andar = false, loop = false },
    { nome = "abracar2", dict = "mp_ped_interaction", anim = "kisses_guy_b", andar = false, loop = false },
    { nome = "peitos", dict = "mini@strip_club@backroom@", anim = "stripper_b_backroom_idle_b", andar = false, loop = false },
    { nome = "espernear", dict = "missfam4leadinoutmcs2", anim = "tracy_loop", andar = false, loop = true },
    { nome = "arrumar", dict = "anim@amb@business@coc@coc_packing_hi@", anim = "full_cycle_v1_pressoperator", andar = false, loop = true },
    { nome = "yoga", dict = "missfam5_yoga", anim = "f_yogapose_a", andar = false, loop = true },
    { nome = "yoga2", dict = "amb@world_human_yoga@male@base", anim = "base_a", andar = false, loop = true },
    { nome = "abdominal", dict = "amb@world_human_sit_ups@male@base", anim = "base", andar = false, loop = true },
    { nome = "linda", anim = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS" },
    { nome = "consertar", anim = "WORLD_HUMAN_WELDING" },
    { nome = "dormir", dict = "anim@heists@ornate_bank@hostages@hit", anim = "hit_react_die_loop_ped_a", andar = false, loop = true },
    { nome = "dormir2", dict = "anim@heists@ornate_bank@hostages@hit", anim = "hit_react_die_loop_ped_e", andar = false, loop = true },
    { nome = "dormir3", dict = "anim@heists@ornate_bank@hostages@hit", anim = "hit_react_die_loop_ped_h", andar = false, loop = true },
    { nome = "dormir4", dict = "mp_sleep", anim = "sleep_loop", andar = false, loop = true },
    { nome = "dormir5" , dict = "missarmenian2" , anim = "drunk_loop" , andar = false , loop = true },
	{ nome = "encostar" , dict = "amb@lo_res_idles@" , anim = "world_human_lean_male_foot_up_lo_res_base" , andar = false , loop = true },
	{ nome = "encostar2" , dict = "bs_2a_mcs_10-0" , anim = "hc_gunman_dual-0" , andar = false , loop = true },
	{ nome = "encostar3" , dict = "misscarstealfinalecar_5_ig_1" , anim = "waitloop_lamar" , andar = false , loop = true },
	{ nome = "encostar4" , dict = "anim@amb@casino@out_of_money@ped_female@02b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar5" , dict = "anim@amb@casino@hangout@ped_male@stand@03b@base" , anim = "base" , andar = true , loop = true },
	{ nome = "encostar6" , dict = "anim@amb@casino@hangout@ped_female@stand@02b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar7" , dict = "anim@amb@casino@hangout@ped_female@stand@02a@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar8" , dict = "anim@amb@casino@hangout@ped_female@stand@01b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar9" , dict = "anim@amb@clubhouse@bar@bartender@" , anim = "base_bartender" , andar = false , loop = true },
	{ nome = "encostar10" , dict = "missclothing" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "encostar11" , dict = "misscarstealfinale" , anim = "packer_idle_1_trevor" , andar = false , loop = true },
	{ nome = "encostar12" , dict = "missarmenian1leadinoutarm_1_ig_14_leadinout" , anim = "leadin_loop" , andar = false , loop = true },
	{ nome = "encostar13" , dict = "rcmjosh2" , anim ="josh_2_intp1_base" , andar = false , loop = true },
    { nome = "encostar14" , dict = "rcmjosh2" , anim ="josh_wait_loop" , andar = false , loop = true },
    { nome = "encostar15" , dict = "anim@amb@yacht@bow@male@variation_01@" , anim ="base" , andar = false , loop = true },
    { nome = "encostar16" , dict = "anim@heists@prison_heist" , anim ="ped_b_loop_a" , andar = false , loop = true },
    { nome = "encostar17" , dict = "anim@heists@prison_heiststation@cop_reactions" , anim ="drunk_idle" , andar = false , loop = true },
    { nome = "encostar18" , dict = "missarmenian1leadinoutarm_1_ig_14_leadinout" , anim ="leadin_loop" , andar = false , loop = true },
    { nome = "encostar19" , dict = "misscarsteal1car_1_ext_leadin" , anim ="base_driver1" , andar = false , loop = true },
    { nome = "encostar20" , dict = "missclothing" , anim ="idle_b" , andar = false , loop = true },
    { nome = "encostar21" , dict = "missfbi1ig_8" , anim ="outro1_pedb" , andar = false , loop = true },
    { nome = "encostar22" , dict = "missfbi1leadinout" , anim ="fbi_1_int_leadin_exit_loop_daven" , andar = false , loop = true },
    { nome = "encostar23" , dict = "misshair_shop@hair_dressers" , anim ="assistant_base" , andar = false , loop = true },
    { nome = "encostar24" , dict = "missheist_agency2aig_4" , anim ="look_plan_base_worker2" , andar = false , loop = true },
    { nome = "encostar26" , dict = "missheistdockssetup1ig_12@base" , anim ="talk_gantry_idle_base_worker4" , andar = false , loop = true },
    { nome = "encostar25" , dict = "missstrip_club_lean" , anim ="player_lean_rail_loop" , andar = false , loop = true },
    { nome = "encostar26" , dict = "mini@strip_club@leaning@base" , anim ="base" , andar = false , loop = true },
    { nome = "encostar27" , dict = "missheist_jewelleadinout" , anim ="jh_int_outro_loop_c" , andar = false , loop = true },
    { nome = "encostar28" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim ="stand_phone_phoneputdown_fallasleep_nowork" , andar = false , loop = true },
    { nome = "encostar29" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim ="stand_phone_phoneputdown_idle_nowork" , andar = false , loop = true },
    { nome = "encostar30" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim ="stand_phone_phoneputdown_stretching_nowork" , andar = false , loop = true },
    { nome = "encostar31" , dict = "anim@amb@clubhouse@bar@bartender@" , anim ="greeting_c_bartender" , andar = false , loop = true },
    { nome = "encostar32" , dict = "anim@amb@clubhouse@bar@drink@base" , anim ="idle_a" , andar = false , loop = true },
    { nome = "encostar33" , dict = "misscarsteal4leadinout" , anim ="ig_1_base" , andar = false , loop = true },
    { nome = "encostar34" , dict = "missclothing" , anim ="base" , andar = false , loop = true },
    { nome = "encostar35" , dict = "missheistdockssetup1ig_5@base" , anim ="workers_talking_base_dockworker2" , andar = false , loop = true },
    { nome = "encostar36" , dict = "switch@michael@sitting_on_car_bonnet" , anim ="sitting_on_car_bonnet_loop" , andar = false , loop = true },
    { nome = "encostar37" , dict = "amb@world_human_leaning@male@wall@back@foot_up@react_shock" , anim ="front" , andar = false , loop = true },
    { nome = "encostar38" , dict = "anim@amb@world_human_valet@informal@idle_a@" , anim ="idle_a_a_m_y_vinewood_01" , andar = false , loop = true },
    { nome = "encostar39" , dict = "anim@amb@nightclub@dancers@club_ambientpeds@low-med_intensity" , anim ="li-mi_amb_club_06_base_female^1" , andar = false , loop = true },
    { nome = "encostar40" , dict = "ah_1_int-4" , anim ="cs_davenorton_dual-4" , andar = false , loop = true },
    { nome = "encostar41" , dict = "silj_int-8" , anim ="csb_mp_agent14_dual-8" , andar = false , loop = true },
    { nome = "encostar42" , dict = "anim@veh@btype@side_ds@base" , anim ="sit" , andar = false , loop = true },
    { nome = "encostar43" , dict = "anim@veh@btype@side_ps@base" , anim ="sit" , andar = false , loop = true },
    { nome = "encostar44" , dict = "timetable@michael@talk_phonebase" , anim = "talk_phone_base" , andar = false , loop = true },
    { nome = "encostar45" , dict = "anim@amb@clubhouse@bar@bartender@" , anim = "base_bartender" , andar = false , loop = true },
    { nome = "encostar46" , dict = "anim@amb@yacht@jacuzzi@standing@female@variation_02@" , anim = "base_b" , andar = false , loop = true },
    { nome = "encostar47" , anim = "assistant_idle_a" , dict  = "misshair_shop@hair_dressers" , andar = false , loop = true },
    { nome = "encostar48" , anim = "assistant_base" , dict  = "misshair_shop@hair_dressers" , andar = false , loop = true },
    { nome = "encostar49" , dict = "rcmjosh2" , anim = "josh_2_intp1_base" , andar = false , loop = true },
	{ nome = "encostar50" , dict = "anim@arena@prize_wheel@male" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar51" , dict = "hs3_arc_int-15" , anim = "csb_wendy_dual-15" , andar = false , loop = true },
	{ nome = "encostar52" , dict = "anim@amb@yacht@rail@seated@female@variant_02@" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar53" , dict = "anim@amb@yacht@rail@seated@male@variant_01@" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar54" , dict= "misscarsteal4leadinout" , anim = "ig_1_base" , andar = false , loop = true },
	{ nome = "encostar55" , dict= "missclothing" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar56" , dict= "missheistdockssetup1ig_5@base" , anim = "workers_talking_base_dockworker2" , andar = false , loop = true },
	{ nome = "encostar57" , dict= "fra_0_int-9" , anim = "player_one_dual-9" , andar = false , loop = true },
	{ nome = "encostar58" , dict= "fra_0_int-9" , anim = "player_one_dual-9" , andar = false , loop = true },
	{ nome = "encostar59" , dict= "missheistdocks2aleadinoutlsdh_2a_int" , anim = "massage_loop_floyd" , andar = false , loop = true },
	{ nome = "encostar60" , dict = "amb@lo_res_idles@" , anim = "world_human_lean_female_holding_elbow_lo_res_base" , andar = false , loop = true },
    { nome = "encostar61" , dict = "anim@amb@yacht@jacuzzi@standing@female@variation_01@" , anim ="base" , andar = false , loop = true },
    { nome = "encostar62" , dict = "anim@amb@yacht@jacuzzi@standing@female@variation_02@" , anim ="base" , andar = false , loop = true },
	{ nome = "encostar63" , dict = "anim@amb@yacht@jacuzzi@standing@male@variation_01@" , anim ="base" , andar = false , loop = true },
	{ nome = "encostar64" , dict = "anim@amb@yacht@jacuzzi@standing@male@variation_02@" , anim ="base" , andar = false , loop = true },
	{ nome = "encostar65" , dict = "switch@michael@pier" , anim ="pier_lean_toss_cigarette" , andar = false , loop = true },
    { nome = "encostar66" , dict = "missheistdockssetup1ig_10@idle_d" , anim ="talk_pipe_d_worker2" , andar = false , loop = true },
    { nome = "encostar67" , dict = "missheistdockssetup1ig_10@idle_a" , anim ="talk_pipe_a_worker2" , andar = false , loop = true },
    { nome = "encostar68" , dict = "amb@code_human_in_car_mp_actions@finger@std@rps@base" , anim ="idle_a" , andar = false , loop = true },
    { nome = "encostar69" , dict = "anim@amb@nightclub@dancers@club_ambientpeds@low-med_intensity" , anim ="li-mi_amb_club_10_v1_male^3" , andar = false , loop = true },
    { nome = "encostar70" , dict = "anim@amb@business@meth@meth_monitoring_no_work@" , anim ="turnaround_idle_v1_lazycook" , andar = false , loop = true },
    { nome = "encostar71" , dict = "sub_int-42" , anim ="a_m_y_busicas_01_dual-42" , andar = false , loop = true },
    { nome = "encostar72" , dict = "rcmnigel1a_band_groupies" , anim ="base_m2" , andar = false , loop = true },
	{ nome = "encostar73" , dict = "amb@prop_human_bum_shopping_cart@male@idle_a", anim = "idle_c", andar = true, loop = true },
	{ nome = "encostar74" , dict = "anim@amb@nightclub@lazlow@ig1_vip@", anim = "clubvip_base_laz", andar = true, loop = true },
	{ nome = "encostar75" , dict = "anim@heists@prison_heist", anim = "ped_b_loop_a", andar = true, loop = true },
	{ nome = "estatua", dict = "amb@world_human_statue@base", anim = "base", andar = false, loop = true },
    { nome = "estatua2", dict = "fra_0_int-1", anim = "cs_lamardavis_dual-1", andar = false, loop = true },
    { nome = "estatua3", dict = "club_intro2-0", anim = "csb_englishdave_dual-0", andar = false, loop = true },
    { nome = "flexao", dict = "amb@world_human_push_ups@male@base", anim = "base", andar = false, loop = true },
    { nome = "fisico" , anim = "WORLD_HUMAN_MUSCLE_FLEX" },
    { nome = "malhar", dict = "amb@world_human_muscle_free_weights@male@barbell@base", anim = "base", prop = "prop_curl_bar_01", flag = 49, hand = 28422 },
    { nome = "malhar2", dict = "amb@prop_human_muscle_chin_ups@male@base", anim = "base", andar = false, loop = true },    
    { nome = "plantar", dict = "amb@world_human_gardener_plant@female@base", anim = "base_female", andar = false, loop = true },
    { nome = "plantar2", dict = "amb@world_human_gardener_plant@female@idle_a", anim = "idle_a_female", andar = false, loop = true },
    { nome = "procurar", dict = "amb@world_human_bum_wash@male@high@base", anim = "base", andar = false, loop = true },        
    { nome = "trotar", dict = "amb@world_human_jog_standing@male@fitidle_a", anim = "idle_a", andar = false, loop = true },
	{ nome = "esquentar" , dict = "amb@world_human_stand_fire@male@base", anim = "base", andar = false, loop = true },
    { nome = "mecanico", dict = "amb@world_human_vehicle_mechanic@male@idle_a", anim = "idle_a", andar = false, loop = true },
    { nome = "mecanico2", dict = "mini@repair", anim = "fixing_a_player", andar = false, loop = true },
    { nome = "mecanico3", dict = "mini@repair", anim = "fixing_a_ped", andar = false, loop = true }, 
    { nome = "capo" , dict = "anim@heists@box_carry@" , anim = "idle" , prop = "imp_prop_impexp_bonnet_03a" , andar = true , loop = true , flag = 49 , hand = 28422 , pos1 = 0.2 , pos2 = 0.2 , pos3 = -0.1 , pos4 = 0.0 , pos5 = 0.0 , pos6 = 180.0 , propAnim = true },
    { nome = "puto", dict = "misscarsteal4@actor", anim = "actor_berating_loop", andar = true, loop = true },
    { nome = "puto2", dict = "oddjobs@assassinate@vice@hooker", anim = "argue_a", andar = true, loop = true },
    { nome = "puto3", dict = "mini@triathlon", anim = "want_some_of_this", andar = false, loop = false },
    { nome = "unhas", dict = "anim@amb@clubhouse@bar@drink@idle_a", anim = "idle_a_bartender", andar = true, loop = true },
    { nome = "mandarbeijo", dict = "anim@mp_player_intcelebrationfemale@blow_kiss", anim = "blow_kiss", andar = false, loop = false },
    { nome = "mandarbeijo2", dict = "anim@mp_player_intselfieblow_kiss", anim = "exit", andar = false, loop = false },
    { nome = "bale", dict = "anim@mp_player_intcelebrationpaired@f_f_sarcastic", anim = "sarcastic_left", andar = false, loop = true },
    { nome = "bonzao", dict = "misscommon@response", anim = "bring_it_on", andar = false, loop = false },
    { nome = "cruzarbraco", dict = "anim@amb@nightclub@peds@", anim = "rcmme_amanda1_stand_loop_cop", andar = true, loop = true },
    { nome = "cruzarbraco2", dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a", anim = "idle_a", andar = true, loop = true },
    { nome = "wtf", dict = "anim@mp_player_intcelebrationfemale@face_palm", anim = "face_palm", andar = true, loop = false },
    { nome = "wtf2", dict = "random@car_thief@agitated@idle_a", anim = "agitated_idle_a", andar = true, loop = false },
    { nome = "wtf3", dict = "missminuteman_1ig_2", anim = "tasered_2", andar = true, loop = false },
    { nome = "wtf4", dict = "anim@mp_player_intupperface_palm", anim = "idle_a", andar = true, loop = false },
    { nome = "bebado" , dict = "missfam5_blackout" , anim = "pass_out" , andar = false , loop = false },
	{ nome = "bebado2" , dict = "missheist_agency3astumble_getup" , anim = "stumble_getup" , andar = false , loop = false },
	{ nome = "bebado3" , dict = "missfam5_blackout" , anim = "vomit" , andar = false , loop = false },
	{ nome = "bebado4" , dict = "random@drunk_driver_1" , anim = "drunk_fall_over" , andar = false , loop = false },
	{ nome = "bebado5" , dict = "misscarsteal4@actor" , anim = "stumble" , andar = false , loop = false },
	{ nome = "bebado6" , dict = "anim@amb@nightclub@mini@drinking@drinking_shots@ped_c@drunk" , anim = "outro_fallover" , andar = false , loop = false },
	{ nome = "bebado7" , dict = "switch@trevor@puking_into_fountain" , anim = "trev_fountain_puke_loop" , andar = false , loop = true },
	{ nome = "bebado8" , dict = "switch@trevor@head_in_sink" , anim = "trev_sink_idle" , andar = false , loop = true },
    { nome = "suicidio", dict = "mp_suicide", anim = "pistol", andar = false, loop = false },
    { nome = "suicidio2", dict = "mp_suicide", anim = "pill", andar = false, loop = false },
    { nome = "lutar", dict = "anim@deathmatch_intros@unarmed", anim = "intro_male_unarmed_c", andar = false, loop = false },
    { nome = "lutar2", dict = "anim@deathmatch_intros@unarmed", anim = "intro_male_unarmed_e", andar = false, loop = false },
    { nome = "lutar3", dict = "rcmextreme2", anim = "loop_punching", andar = true, loop = true },
    { nome = "dedo", dict = "anim@mp_player_intselfiethe_bird", anim = "idle_a", andar = false, loop = false },
	{ nome = "dedo2", dict = "anim@arena@celeb@flat@paired@no_props@", anim = "the_bird_a_player_a", andar = false, loop = true }, 
	{ nome = "mochila", dict = "move_m@hiking", anim = "idle", andar = true, loop = true },
    { nome = "exercicios", dict = "timetable@reunited@ig_2", anim = "jimmy_getknocked", andar = true, loop = true },
    { nome = "escorar", dict = "timetable@mime@01_gc", anim = "idle_a", andar = false, loop = true },
    { nome = "escorar2", dict = "misscarstealfinale", anim = "packer_idle_1_trevor", andar = false, loop = true },
    { nome = "escorar3", dict = "misscarstealfinalecar_5_ig_1", anim = "waitloop_lamar", andar = false, loop = true },
    { nome = "escorar4", dict = "rcmjosh2", anim = "josh_2_intp1_base", andar = false, loop = true },
    { nome = "meditar", dict = "rcmcollect_paperleadinout@", anim = "meditiate_idle", andar = false, loop = true },
    { nome = "meditar2", dict = "rcmepsilonism3", anim = "ep_3_rcm_marnie_meditating", andar = false, loop = true },
    { nome = "meditar3", dict = "rcmepsilonism3", anim = "base_loop", andar = false, loop = true },
    { nome = "cortaessa", dict = "gestures@m@standing@casual", anim = "gesture_no_way", andar = false, loop = false },
    { nome = "joia", dict = "anim@mp_player_intincarthumbs_uplow@ds@", anim = "enter", andar = false, loop = false },
    { nome = "joia2", dict = "anim@mp_player_intselfiethumbs_up", anim = "idle_a", andar = false, loop = false },
	{ nome = "joia3" , dict = "anim@mp_player_intupperthumbs_up", anim = "idle_a", andar = true, loop = false },
	{ nome = "yeah", dict = "anim@mp_player_intupperair_shagging", anim = "idle_a", andar = false, loop = false },    
	{ nome = "teste", dict = "special_ped@jane@monologue_5@monologue_5c", anim = "brotheradrianhasshown_2", andar = false, loop = false },    
	{ nome = "teste2", dict = "oddjobs@shop_robbery@rob_till", anim = "enter", andar = false, loop = false },    
	{ nome = "roubar", dict = "anim@heists@ornate_bank@grab_cash", anim = "grab", andar = false, loop = false },    


	
    { nome = "assobiar", dict = "taxi_hail", anim = "hail_taxi", andar = false, loop = false },
    { nome = "carona", dict = "random@hitch_lift", anim = "idle_f", andar = true, loop = false },
    { nome = "colher", dict = "creatures@rottweiler@tricks@", anim = "petting_franklin", andar = false, loop = false },
    { nome = "pirueta", dict = "anim@arena@celeb@flat@solo@no_props@", anim = "cap_a_player_a", andar = false, loop = false },
    { nome = "pirueta2", dict = "anim@arena@celeb@flat@solo@no_props@", anim = "flip_a_player_a", andar = false, loop = false },
    { nome = "taco", dict = "anim@arena@celeb@flat@solo@no_props@", anim = "slugger_a_player_a", andar = false, loop = false },
    { nome = "onda", dict = "anim@mp_player_intupperfind_the_fish", anim = "idle_a", andar = false, loop = true },
	{ nome = "alongar" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_e" , andar = false , loop = true },
	{ nome = "alongar2" , dict = "mini@triathlon" , anim = "idle_e" , andar = false , loop = true },
	{ nome = "alongar3" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_c" , andar = false , loop = false },
	{ nome = "alongar4" , dict = "mini@triathlon" , anim = "idle_f" , andar = false , loop = true },
	{ nome = "alongar5" , dict = "mini@triathlon" , anim = "idle_d" , andar = false , loop = true },
	{ nome = "alongar6" , dict = "rcmfanatic1maryann_stretchidle_b" , anim = "idle_e" , andar = false , loop = true },
	{ nome = "alongar7" , dict = "timetable@reunited@ig_2" , anim = "jimmy_getknocked" , andar = false , loop = true },
    { nome = "heroi", dict = "rcmbarry", anim = "base", andar = true, loop = true },
    { nome = "boboalegre", dict = "rcm_barry2", anim = "clown_idle_0", andar = false, loop = false },
    { nome = "boboalegre2", dict = "rcm_barry2", anim = "clown_idle_1", andar = false, loop = false },
    { nome = "boboalegre3", dict = "rcm_barry2", anim = "clown_idle_2", andar = false, loop = false },
    { nome = "boboalegre4", dict = "rcm_barry2", anim = "clown_idle_3", andar = false, loop = false },
    { nome = "boboalegre4", dict = "rcm_barry2", anim = "clown_idle_6", andar = false, loop = false },
    { nome = "meditar4", dict = "timetable@amanda@ig_4", anim = "ig_4_base", andar = false, loop = true },
    { nome = "cachorro", dict = "random@peyote@dog", anim = "wakeup", andar = false, loop = false },
    { nome = "karate", dict = "anim@mp_player_intcelebrationfemale@karate_chops", anim = "karate_chops", andar = false, loop = false },
    { nome = "karate2", dict = "anim@mp_player_intcelebrationmale@karate_chops", anim = "karate_chops", andar = false, loop = false },
    { nome = "ameacar", dict = "anim@mp_player_intcelebrationmale@cut_throat", anim = "cut_throat", andar = false, loop = false },
    { nome = "ameacar2", dict = "anim@mp_player_intcelebrationfemale@cut_throat", anim = "cut_throat", andar = false, loop = false },
    { nome = "boxe", dict = "anim@mp_player_intcelebrationmale@shadow_boxing", anim = "shadow_boxing", andar = false, loop = false },
    { nome = "boxe2", dict = "anim@mp_player_intcelebrationfemale@shadow_boxing", anim = "shadow_boxing", andar = false, loop = false },
    { nome = "mamamia", dict = "anim@mp_player_intcelebrationmale@finger_kiss", anim = "finger_kiss", andar = true, loop = false },
    { nome = "louco", dict = "anim@mp_player_intincaryou_locobodhi@ds@", anim = "idle_a", andar = true, loop = true },
    { nome = "xiu", dict = "anim@mp_player_intincarshushbodhi@ds@", anim = "idle_a_fp", andar = true, loop = true },
    { nome = "ok" , dict = "anim@mp_player_intselfiedock" , anim = "idle_a" , andar = true , loop = true },
    { nome = "tiltado" , dict = "anim@mp_player_intcelebrationfemale@freakout" , anim = "freakout" , andar = false , loop = false },
    { nome = "cruzar", dict = "amb@world_human_cop_idles@female@idle_b", anim = "idle_e", andar = true, loop = true },
    { nome = "cruzar2" , dict = "anim@amb@casino@hangout@ped_male@stand@02b@idles" , anim = "idle_a" , andar = true , loop = true },
    { nome = "cruzar3" , dict = "amb@world_human_hang_out_street@male_c@idle_a" , anim = "idle_b" , andar = true , loop = true },
	{ nome = "cruzar4" , dict = "random@street_race" , anim = "_car_b_lookout" , andar = true , loop = true },
	{ nome = "cruzar5" , dict = "random@shop_gunstore" , anim = "_idle" , andar = true , loop = true },
	{ nome = "cruzar6" , dict = "move_m@hiking" , anim = "idle" , andar = true , loop = true },
	{ nome = "cruzar7" , dict = "anim@amb@casino@valet_scenario@pose_d@" , anim = "base_a_m_y_vinewood_01" , andar = true , loop = true },
	{ nome = "cruzar8" , dict = "anim@amb@casino@shop@ped_female@01a@base" , anim = "base" , andar = true , loop = true },
	{ nome = "cruzar9" , dict = "anim@amb@casino@valet_scenario@pose_c@" , anim = "shuffle_feet_a_m_y_vinewood_01" , andar = true , loop = true },
	{ nome = "cruzar10" , dict = "anim@amb@casino@hangout@ped_male@stand@03a@idles_convo" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "cruzar11" , dict = "oddjobs@assassinate@guard" , anim = "unarmed_fold_arms" , andar = true , loop = true },
    { nome = "tchau", dict = "anim@mp_player_intupperwave", anim = "idle_a", andar = true, loop = true },
	{ nome = "naruto" , dict = "missfbi1" , anim = "ledge_loop" , andar = true , loop = true },
	{ nome = "naruto2" , dict = "missfam5_yoga" , anim = "a2_pose" , andar = true , loop = true },
    { nome = "selimpar" , dict = "missfbi3_camcrew" , anim = "final_loop_guy" , andar = true , loop = false },
	{ nome = "rebolar" , dict = "switch@trevor@mocks_lapdance" , anim = "001443_01_trvs_28_idle_stripper" , andar = false , loop = true },
	{ nome = "spiderman" , dict = "missexile3" , anim = "ex03_train_roof_idle" , andar = false , loop = true },
	{ nome = "morto" , dict = "anim@mp_player_intcelebrationmale@cut_throat" , anim = "cut_throat" , andar = true , loop = false },
	{ nome = "morto2" , dict = "anim@mp_player_intcelebrationfemale@cut_throat" , anim = "cut_throat" , andar = true , loop = false },
    { nome = "morrer" , dict = "misslamar1dead_body" , anim = "dead_idle" , andar = false , loop = true },
	{ nome = "jog3" , dict = "amb@world_human_jog_standing@female@idle_a", anim = "idle_a", andar = true, loop = true },
	{ nome = "me" , dict = "gestures@f@standing@casual", anim = "gesture_me_hard", andar = true, loop = false },
	{ nome = "mindblown" , dict = "anim@mp_player_intcelebrationmale@mind_blown", anim = "mind_blown", andar = true, loop = true },
	{ nome = "mindblown2" , dict = "anim@mp_player_intcelebrationfemale@mind_blown", anim = "mind_blown", andar = true, loop = true },
	{ nome = "mindcontrol2" , dict = "rcmbarry", anim = "mind_control_b_loop", andar = true, loop = true },

	{ nome = "olhadinha" , dict = "random@paparazzi@peek", anim = "left_peek_a", andar = true, loop = true },
	{ nome = "pointdown" , dict = "gestures@f@standing@casual", anim = "gesture_hand_down", andar = true, loop = false },
	{ nome = "banho" , dict = "mp_safehouseshower@male@", anim = "male_shower_idle_a", andar = true, loop = true },
	{ nome = "cokecut" , dict = "anim@amb@business@coc@coc_unpack_cut@", anim = "fullcut_cycle_v6_cokecutter", andar = true, loop = true },
	{ nome = "taxi" , dict = "taxi_hail", anim = "hail_taxi", andar = true, loop = false },
	{ nome = "medo" , dict = "amb@code_human_cower@male@base", anim = "base", andar = true, loop = true },
	{ nome = "conv" , dict = "special_ped@jessie@monologue_5@monologue_5c", anim = "jessie_ig_1_p5_heressomthinginteresting_2", andar = true, loop = false },
	{ nome = "conv2" , dict = "special_ped@jessie@monologue_11@monologue_11c", anim = "jessie_ig_1_p11_canyouimagine_2", andar = true, loop = true },
	{ nome = "conv3" , dict = "rcmjosh4", anim = "beckon_a_cop_b", andar = true, loop = true },
	{ nome = "ohno" , dict = "misscommon@response", anim = "numbnuts", andar = true, loop = false },
	{ nome = "ohno2" , dict = "misscommon@response", anim = "give_me_a_break", andar = true, loop = false },
	{ nome = "sleep" , dict = "timetable@tracy@sleep@", anim = "idle_c", andar = false, loop = true, },
	{ nome = "shrug" , dict = "gestures@m@standing@casual", anim = "gesture_shrug_hard", andar = true, loop = false },
	{ nome = "sitscared" , dict = "amb@code_human_cower@male@base", anim = "base", andar = false, loop = true },
	{ nome = "choque" , dict = "stungun@standing", anim = "damage", andar = false, loop = true },
	{ nome = "tryclothes" , dict = "mp_clothing@female@trousers", anim = "try_trousers_neutral_a", andar = false, loop = false },
	{ nome = "tryclothes2" , dict = "mp_clothing@female@shirt", anim = "try_shirt_positive_a", andar = false, loop = false },
	{ nome = "tryclothes3" , dict = "mp_clothing@female@shoes", anim = "try_shoes_positive_a", andar = false, loop = false },
	{ nome = "tryclothes4" , dict = "clothingtie", anim = "try_tie_neutral_c", andar = false, loop = false },
	{ nome = "tryclothes5" , dict = "clothingtie", anim = "try_tie_neutral_d", andar = false, loop = false },
	{ nome = "washhand" , dict = "missheist_agency3aig_23", anim = "urinal_sink_loop", andar = false, loop = true },
	{ nome = "checkout" , dict = "anim@amb@carmeet@checkout_car@male_a@idles", anim = "idle_b", andar = false, loop = false },
	{ nome = "checkout2" , dict = "anim@amb@carmeet@checkout_car@male_c@idles", anim = "idle_a", andar = false, loop = true },
	{ nome = "noway" , dict = "oddjobs@towingpleadingbase", anim = "base", andar = false, loop = false },
	{ nome = "noway2" , dict = "gestures@m@car@std@casual@ds", anim = "gesture_no_way", andar = false, loop = false },
	{ nome = "why" , dict = "random@shop_robbery_reactions@", anim = "is_this_it", andar = false, loop = false },
	{ nome = "shock" , dict = "random@shop_robbery_reactions@", anim = "shock", andar = false, loop = false },
	{ nome = "good" , dict = "missclothing", anim = "good_choice_storeclerk", andar = false, loop = false },
	{ nome = "sunbathem" , dict = "amb@world_human_sunbathe@male@back@idle_a", anim = "idle_c", andar = false, loop = true },
	{ nome = "jogger" , dict = "move_f@jogger", anim = "idle", andar = false, loop = true },
	{ nome = "jogger2" , dict = "move_m@jogger", anim = "idle", andar = false, loop = true },
	{ nome = "swatch" , dict = "amb@world_human_strip_watch_stand@male_c@idle_a", anim = "idle_b", andar = false, loop = true },
	{ nome = "musculo" , dict = "oddjobs@assassinate@multi@", anim = "idle_a", andar = false, loop = false },
	{ nome = "lookplan" , dict = "missheist_agency2aig_4", anim = "look_plan_c_worker2", andar = false, loop = true },
	{ nome = "thanks" , dict = "random@arrests", anim = "thanks_male_05", andar = false, loop = false },
	{ nome = "assaltar" , dict = "random@countryside_gang_fight" , anim = "biker_02_stickup_loop" , andar = false , loop = true },
	{ nome = "rendido" , dict = "missminuteman_1ig_2" , anim = "handsup_base" , andar = false , loop = true },
	{ nome = "mano" , dict = "mp_ped_interaction" , anim = "hugs_guy_b" , andar = false , loop = true },
	{ nome = "discutir" , dict = "oddjobs@assassinate@vice@hooker" , anim = "argue_a" , andar = true , loop = true },
	{ nome = "vem" , dict = "misscommon@response" , anim = "bring_it_on" , andar = true , loop = false },
	{ nome = "vem2" , dict = "mini@triathlon" , anim = "want_some_of_this" , andar = true , loop = false },
	{ nome = "baixo" , dict = "gestures@f@standing@casual" , anim = "gesture_hand_down" , andar = true , loop = false },
	{ nome = "espreguicar" , dict = "amb@world_human_jog_standing@female@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "toctoc" , dict = "missheistfbi3b_ig7" , anim = "lift_fibagent_loop" , andar = false , loop = true },
	{ nome = "debochar", anim = "WORLD_HUMAN_HANG_OUT_STREET", ProibidoArmado = true  },
	{ nome = "seguranca", anim = "WORLD_HUMAN_GUARD_STAND", ProibidoArmado = true  },
	{ nome = "tossir" , dict = "timetable@gardener@smoking_joint" , anim = "idle_cough" , andar = true , loop = false },
	{ nome = "w" , dict = "anim@mp_player_intcelebrationmale@bang_bang" , anim = "bang_bang" , andar = true , loop = false },
	{ nome = "w2" , dict = "anim@mp_player_intcelebrationmale@air_drums" , anim = "air_drums" , andar = true , loop = false },
	{ nome = "w3" , dict = "anim@mp_player_intcelebrationmale@call_me" , anim = "call_me" , andar = true , loop = false },
	{ nome = "w4" , dict = "anim@mp_player_intcelebrationmale@coin_roll_and_toss" , anim = "coin_roll_and_toss" , andar = true , loop = false },
	{ nome = "w5" , dict = "anim@mp_player_intcelebrationmale@mind_blown" , anim = "mind_blown" , andar = true , loop = false },
	{ nome = "w6" , dict = "anim@mp_player_intcelebrationmale@respect" , anim = "respect" , andar = true , loop = false },
	{ nome = "w7" , dict = "anim@amb@casino@hangout@ped_male@stand@01a@base" , anim = "base" , andar = true , loop = true },
	{ nome = "w8" , dict = "anim@amb@casino@hangout@ped_male@stand@01b@enter" , anim = "enter" , andar = true , loop = false },
	{ nome = "w9" , dict = "anim@amb@casino@hangout@ped_male@stand@01b@exit" , anim = "exit" , andar = true , loop = false },


    -- NOVAS

    { nome = "pose", dict = "missmic4premiere", anim = "prem_actress_star_a", andar = false, loop = true },
    { nome = "bjs", dict = "mini@hookers_spvanilla", anim = "idle_a", andar = true, loop = false },
    { nome = "vemca", dict = "anim@heists@chicken_heist@ig_5_guard_wave_in", anim = "guard_reaction_quick", andar = true, loop = false },   
    { nome = "cruzarbraco3", dict = "anim@heists@heist_safehouse_intro@variations@male@window", anim = "window_part_one_loop", andar = true, loop = false },   
    { nome = "chute", dict = "anim@mp_freemode_return@f@fail", anim = "fail_a", andar = false, loop = false },
    { nome = "no", dict = "mp_player_int_upper_nod", anim = "mp_player_int_nod_no", andar = true, loop = true },
    { nome = "nao", dict = "anim@arena@celeb@podium@no_prop@", anim = "dance_b_3rd", andar = false, loop = true },
	{ nome = "nao2" , dict = "anim@heists@ornate_bank@chat_manager", anim = "fail", andar = true, loop = false },
	{ nome = "palhaco", dict = "rcm_barry2", anim = "clown_idle_6", andar = false, loop = true },
    { nome = "dancinha", dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", anim = "med_center_down", andar = false, loop = true },   
    { nome = "dancinha2", dict = "anim@amb@nightclub@dancers@crowddance_groups@", anim = "hi_dance_crowd_09_v1_female^3", andar = false, loop = true },  
    { nome = "dancinha2", dict = "anim@amb@nightclub@dancers@crowddance_groups@", anim = "hi_dance_crowd_09_v1_female^3", andar = false, loop = true },   
    { nome = "deaf", dict = "misscarsteal2", anim = "sweep_high", andar = false, loop = true }, 
    { nome = "deaf2", dict = "gestures@miss@dockssetup1", anim = "floyd_dh1_aeab_01_g1", andar = true, loop = false }, 
    { nome = "deaf3", dict = "gestures@miss@fra_0", anim = "lamar_fkn0_cjae_01_g4", andar = false, loop = false }, 
    { nome = "deaf4", dict = "missexile2", anim = "franklinwavetohelicopter", andar = false, loop = false }, 
    { nome = "deaf5", dict = "missheist_jewelleadinout", anim = "jh_int_outro_loop_c", andar = false, loop = false }, 
    { nome = "celebration", dict = "anim@arena@celeb@flat@solo@no_props@", anim = "pageant_a_player_a", andar = false, loop = false },
    { nome = "celebrar" , dict = "rcmfanatic1celebrate" , anim = "celebrate" , andar = false , loop = false },
    { nome = "encostado", dict = "misshair_shop@hair_dressers", anim = "assistant_base", andar = false, loop = true }, 
    { nome = "encostado2", dict = "anim@heists@prison_heist", anim = "ped_b_react", andar = false, loop = true },    
    { nome = "encostado3", dict = "anim@heists@prison_heiststation@cop_reactions", anim = "drunk_idle", andar = false, loop = true },    
    { nome = "dancinha3", dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", anim = "high_right_down", andar = false, loop = true },    
    { nome = "tempo", dict = "anim@random@shop_clothes@watches", anim = "idle_c", andar = false, loop = true },
    { nome = "olha", dict = "mini@strip_club@lap_dance@ld_girl_a_approach", anim = "ld_girl_a_approach_f", andar = false, loop = true },
    { nome = "mantra", dict = "misscarsteal1leadin", anim = "devon_idle_02", andar = false, loop = true },
    { nome = "mecanico4", dict = "anim@amb@garage@chassis_repair@", anim = "idle_02_amy_skater_01", andar = false, loop = true },
    { nome = "esperando", dict = "anim@amb@casino@shop@ped_female@01a@idles", anim = "idle_a", andar = false, loop = true },
    { nome = "calmaai", dict = "anim@heists@ornate_bank@chat_manager", anim = "average_car", andar = false, loop = true },
    { nome = "basta", dict = "anim@heists@ornate_bank@chat_manager", anim = "fail", andar = false, loop = false },
    { nome = "basta2", dict = "mini@hookers_sp", anim = "idle_reject", andar = false, loop = false },
    { nome = "dancinha4", dict = "anim@amb@nightclub@dancers@crowddance_groups@", anim = "mi_dance_crowd_17_v2_female^6", andar = false, loop = false }, 
    { nome = "postura3", dict = "missbigscore2aleadinout@bs_2a_mcs_3", anim = "bankman_leadout_action", andar = true, loop = true }, 
    { nome = "postura4", dict = "missfbi2@leadinoutfbi_2_mcs_1", anim = "_leadin_loop_fbi", andar = true, loop = true },       
    { nome = "postura5", dict = "timetable@amanda@ig_9", anim = "ig_9_base_amanda", andar = true, loop = true },     
    { nome = "cruzarbraco4", dict = "anim@heists@heist_corona@single_team", anim = "single_team_intro_boss", andar = true, loop = true },     
    { nome = "explicar", dict = "random@bus_tour_guide@idle_a", anim = "idle_b", andar = true, loop = false },  
    { nome = "obrigado", dict = "anim@arena@celeb@podium@no_prop@", anim = "regal_a_1st", andar = false, loop = false },  
    { nome = "unhas2", dict = "friends@fra@ig_1", anim = "base_idle", andar = false, loop = true },  
    { nome = "podeser", dict = "amb@world_human_hang_out_street@male_a@idle_a", anim = "idle_e", andar = false, loop = false },  
    { nome = "xiu2", dict = "anim@arena@celeb@flat@solo@no_props@", anim = "giggle_a_player_a", andar = false, loop = false },
    { nome = "tablet" , dict = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a" , anim = "idle_b" , prop = "prop_cs_tablet" , flag = 49 , hand = 60309 },

    -- SENTAR --

	{ nome = "sentar2" , dict = "amb@world_human_picnic@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar3" , dict = "anim@heists@fleeca_bank@ig_7_jetski_owner" , anim = "owner_idle" , andar = false , loop = true },
	{ nome = "sentar4" , dict = "amb@world_human_stupor@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar5" , dict = "amb@world_human_picnic@female@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar6" , dict = "anim@amb@nightclub@lazlow@lo_alone@" , anim = "lowalone_base_laz" , andar = false , loop = true },
	{ nome = "sentar7" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim = "sit_phone_phoneputdown_idle_nowork" , andar = false , loop = true },
	{ nome = "sentar8" , dict = "rcm_barry3" , anim = "barry_3_sit_loop" , andar = false , loop = true },
	{ nome = "sentar9" , dict = "amb@world_human_picnic@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar10" , dict = "amb@world_human_picnic@female@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar11" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "idle_a_jimmy" , andar = false , loop = true },
	{ nome = "sentar12" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "mics3_15_base_jimmy" , andar = false , loop = true },
	{ nome = "sentar13" , dict = "amb@world_human_stupor@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar14" , dict = "timetable@tracy@ig_14@" , anim = "ig_14_base_tracy" , andar = false , loop = true },
	{ nome = "sentar15" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_loop_ped_b" , andar = false , loop = true },
	{ nome = "sentar16" , dict = "anim@heists@ornate_bank@hostages@ped_e@" , anim = "flinch_loop" , andar = false , loop = true },
	{ nome = "sentar17" , dict = "timetable@ron@ig_5_p3" , anim = "ig_5_p3_base" , andar = false , loop = true },
	{ nome = "sentar18" , dict = "timetable@reunited@ig_10" , anim = "base_amanda" , andar = false , loop = true },
	{ nome = "sentar19" , dict = "timetable@ron@ig_3_couch" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar20" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "mics3_15_base_tracy" , andar = false , loop = true },
	{ nome = "sentar21" , dict = "timetable@maid@couch@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar22" , dict = "timetable@ron@ron_ig_2_alt1" , anim = "ig_2_alt1_base" , andar = false , loop = true },
	{ nome = "sentar23" , dict = "timetable@reunited@ig_10" , anim ="shouldntyouguys_jimmy" , andar = false , loop = true },
    { nome = "sentar24" , dict = "timetable@tracy@ig_2@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar25" , dict = "anim@amb@office@boss@female@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar26" , dict = "anim@amb@casino@out_of_money@ped_female@01a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar27" , dict = "anim@amb@casino@out_of_money@ped_female@01b@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar28" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar29" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_male@regular@01b@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar30" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_male@regular@02a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar31" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_male@regular@02b@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar32" , dict = "anim_casino_a@amb@casino@games@slots@ped_female@regular@02a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar33" , dict = "anim_casino_b@amb@casino@games@blackjack@ped_male@engaged@01a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar34" , dict = "misslester1aig_3main" , anim ="air_guitar_01_a" , andar = false , loop = true },
    { nome = "sentar35" , dict = "missheistdocks2aleadinoutlsdh_2a_int" , anim ="sitting_loop_wade" , andar = false , loop = true },
    { nome = "sentar36" , dict = "switch@franklin@stripclub2" , anim ="ig_16_base" , andar = false , loop = true },
    { nome = "sentar37" , dict = "switch@michael@restaurant" , anim ="001510_02_gc_mics3_ig_1_base_amanda" , andar = false , loop = true },
    { nome = "sentar38" , dict = "switch@michael@ronex_ig_5_p2" , anim ="base_michael" , andar = false , loop = true },
    { nome = "sentar39" , dict = "timetable@amanda@facemask@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar40" , dict = "timetable@reunited@ig_7" , anim ="amandabase_amanda" , andar = false , loop = true },
    { nome = "sentar41" , dict = "timetable@tracy@ig_2@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar42" , dict = "mini@strip_club@backroom@" , anim ="leadin_loop_idle_c_stripper_c" , andar = false , loop = true },
    { nome = "sentar43" , dict = "timetable@trevor@smoking_meth@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar44" , dict = "switch@michael@sitting_on_car_premiere" , anim ="sitting_on_car_premiere_loop_player" , andar = false , loop = true },
    { nome = "sentar45" , dict = "mp_am_stripper" , anim ="lap_dance_player" , andar = false , loop = true },
    { nome = "sentar46" , dict = "switch@michael@opens_door_for_ama" , anim ="001895_02_mics3_17_opens_door_for_ama_idle_ama" , andar = false , loop = true },
    { nome = "sentar47" , dict = "switch@michael@lounge_chairs" , anim ="001523_01_mics3_9_lounge_chairs_idle_mic" , andar = false , loop = true },
    { nome = "sentar48" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01a@base_big_screen" , anim ="base_big_screen" , andar = false , loop = true },
    { nome = "sentar49" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01b@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar50" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01b@base_big_screen" , anim ="base_big_screen" , andar = false , loop = true },
    { nome = "sentar51" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@regular@01a@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar52" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_female@regular@01b@base_big_screen" , anim ="base_big_screen" , andar = false , loop = true },
    { nome = "sentar53" , dict = "anim_casino_a@amb@casino@games@insidetrack@ped_male@regular@02a@trans" , anim ="base_to_big_screen" , andar = false , loop = true },
    { nome = "sentar54" , dict = "switch@michael@parkbench_smoke_ranger" , anim ="parkbench_smoke_ranger_loop" , andar = false , loop = true },
    { nome = "sentar55" , dict = "switch@michael@lounge_chairs" , anim ="001523_01_mics3_9_lounge_chairs_idle_mic" , andar = false , loop = true },
    { nome = "sentar56" , dict = "anim@amb@business@cfm@cfm_machine_no_work@" , anim ="smokers_cough_v1_operator" , andar = false , loop = true },
    { nome = "sentar57" , dict = "rcmnigel1a_band_groupies" , anim ="bump_f1" , andar = false , loop = true },
    { nome = "sentar58" , dict = "anim@amb@nightclub@smoking@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar59" , dict = "amb@lo_res_idles@" , anim = "world_human_picnic_female_lo_res_base" , andar = false , loop = true },
    { nome = "sentar60" , dict = "missheistdocks2aleadinoutlsdh_2a_int" , anim ="massage_loop_2_trevor" , andar = false , loop = true },
    { nome = "sentar61" , dict = "anim_casino_b@amb@casino@games@blackjack@ped_female@no_heels@regular@02a@reacts@v01" , anim ="reaction_impartial_var03" , andar = false , loop = true },
    { nome = "sentar62" , dict = "anim@amb@clubhouse@boss@female@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar63" , dict = "timetable@denice@ig_4" , anim = "base" , andar = false , loop = true },
    { nome = "sentar64" , anim = "snort_coke_a_female" , dict  = "missfbi3_party" , andar = false , loop = true },
    { nome = "sentar65" , anim = "loop_amanda" , dict  = "switch@michael@cafe" , andar = false , loop = true },
	{ nome = "sentar66" , dict = "safe@michael@ig_3" , anim ="base_michael" , andar = false , loop = true },
	{ nome = "sentar67" , dict = "rcmnigel1a_band_groupies" , anim ="base_m1" , andar = false , loop = true },
	{ nome = "sentar68" , dict = "anim@heists@fleeca_bank@hostages@intro" , anim ="intro_loop_ped_a" , andar = false , loop = true },
	{ nome = "sentar69" , dict = "switch@michael@ronex_ig_5_p2" , anim ="base_michael" , andar = false , loop = true },
	{ nome = "sentar70" , dict = "timetable@reunited@ig_10" , anim = "shouldntyouguys_amanda" , andar = false , loop = true },
	{ nome = "sentar71" , dict = "bs_1_int-9" , anim = "player_one_dual-9" , andar = false , loop = true },
	{ nome = "sentar72" , dict = "anim@amb@office@boss@female@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar73" , dict = "rcmnigel1a_band_groupies" , anim = "bump_f1" , andar = false , loop = true },
	{ nome = "sentar74" , dict= "missheistdocks2aleadinoutlsdh_2a_int" , anim = "sitting_loop_wade" , andar = false , loop = true },
	{ nome = "sentar75" , dict= "anim@amb@business@cfid@cfid_desk_no_work_bgen_chair_no_work@" , anim = "lookaround_phoneless_lazyworker" , andar = false , loop = true },
	{ nome = "sentar76" , dict= "switch@michael@restaurant" , anim = "001510_02_gc_mics3_ig_1_base_amanda" , andar = false , loop = true },
	{ nome = "sentar77" , dict= "timetable@reunited@ig_7" , anim = "amandabase_amanda" , andar = false , loop = true },
	{ nome = "sentar78" , dict= "mini@strip_club@backroom@" , anim = "leadin_loop_idle_c_stripper_c" , andar = false , loop = true },
	{ nome = "sentar79" , dict= "switch@michael@lounge_chairs" , anim = "001523_01_mics3_9_lounge_chairs_idle_mic" , andar = false , loop = true },
	{ nome = "sentar80" , dict= "anim_casino_a@amb@casino@games@insidetrack@ped_female@engaged@01b@base_big_screen" , anim = "base_big_screen" , andar = false , loop = true },
	{ nome = "sentar81" , dict= "anim_casino_a@amb@casino@games@insidetrack@ped_female@regular@01a@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar82" , dict= "missheistdocks2aleadinoutlsdh_2a_int" , anim = "massage_loop_2_trevor" , andar = false , loop = true },
	{ nome = "sentar83" , dict= "timetable@amanda@ig_7" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar84" , dict= "hs3_pln_int-0" , anim = "csb_huang_dual-0" , andar = false , loop = true },
	{ nome = "sentar85" , dict = "timetable@tracy@ig_14@" , anim ="ig_14_iwishall_a_tracy" , andar = false , loop = true },
    { nome = "sentar86" , dict = "mp_safehouselost_table@" , anim ="lost_table_idle_a" , andar = false , loop = true },
    { nome = "sentar87" , dict = "timetable@ron@ron_ig_2_alt1" , anim ="ig_2_alt1_base" , andar = false , loop = true },
    { nome = "sentar88" , dict = "anim@amb@office@boss@female@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar89" , dict = "rcmnigel1aig_1" , anim ="you_know_girl" , andar = false , loop = true },
    { nome = "sentar90" , dict = "anim@amb@clubhouse@boardroom@boss@female@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar91" , dict = "anim@amb@facility@briefing_room@seating@female@var_b@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar92" , dict = "switch@michael@ronex_ig_5_p2" , anim ="base_michael" , andar = false , loop = true },
    { nome = "sentar93" , dict = "switch@franklin@stripclub3" , anim ="ig_17_base" , andar = false , loop = true },
    { nome = "sentar94" , dict = "safe@franklin@ig_14" , anim ="base" , andar = false , loop = true },
    { nome = "sentar95" , dict = "rcmnigel1bnmt_1b" , anim ="base_girl" , andar = false , loop = true },
    { nome = "sentar96" , dict = "anim@amb@business@cfm@cfm_machine_no_work@" , anim ="hanging_out_operator" , andar = false , loop = true },
    { nome = "sentar97" , dict = "timetable@reunited@ig_10" , anim ="shouldntyouguys_tracy" , andar = false , loop = true },
    { nome = "sentar98" , dict = "missfbi3_party" , anim ="snort_coke_b_male5" , andar = false , loop = true },
    { nome = "sentar99" , dict = "missheistpaletoscoresetupleadin" , anim ="rbhs_mcs_1_leadin" , andar = false , loop = true },
    { nome = "sentar100" , dict = "misslester1aig_3exit" , anim ="air_guitar_01_exitloop_d" , andar = false , loop = true },
    { nome = "sentar101" , dict = "misslester1aig_3main" , anim ="air_guitar_01_b" , andar = false , loop = true },
    { nome = "sentar102" , dict = "misslester1aig_5intro" , anim ="boardroom_intro_f_c" , andar = false , loop = true },
    { nome = "sentar103" , dict = "misslester1b_crowd@m_" , anim ="001082_01_m_a" , andar = false , loop = true },
    { nome = "sentar104" , dict = "mp_am_stripper" , anim ="lap_dance_player" , andar = false , loop = true },
    { nome = "sentar105" , dict = "safe@franklin@ig_14" , anim ="base" , andar = false , loop = true },
    { nome = "sentar106" , dict = "switch@trevor@mocks_lapdance" , anim ="001443_01_trvs_28_idle_man" , andar = false , loop = true },
    { nome = "sentar107" , dict = "switch@trevor@rude_at_cafe" , anim ="001218_03_trvs_23_rude_at_cafe_idle_female" , andar = false , loop = true },
	{ nome = "sentar108" , dict = "amb@world_human_seat_steps@female@hands_by_sides@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar109" , dict = "amb@world_human_seat_wall@female@hands_by_sides@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar110" , dict = "timetable@trevor@trv_ig_2" , anim ="base_trevor" , andar = false , loop = true },
    { nome = "sentar111" , dict = "missdrfriedlanderdrf_idles" , anim ="drf_idle_drf" , andar = false , loop = true },
    { nome = "sentar112" , dict = "anim@amb@clubhouse@boss@female@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar113" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_b@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar114" , dict = "anim@amb@office@seating@female@var_b@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar115" , dict = "anim@amb@office@seating@female@var_c@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar116" , dict = "amb@world_human_seat_steps@male@elbows_on_knees@base" , anim ="base" , andar = false , loop = true },
    { nome = "sentar117" , dict = "anim@amb@facility@briefing_room@seating@male@var_a@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar118" , dict = "anim@amb@clubhouse@boardroom@boss@female@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar119" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar120" , dict = "iaaj_ext-27" , anim ="csb_mp_agent14_dual-27" , andar = false , loop = true },
    { nome = "sentar121" , dict = "anim@amb@facility@briefing_room@seating@male@var_b@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar122" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base_l@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar123" , dict = "missfam2_bikehire@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar124" , dict = "missarmenian2" , anim ="car_react_gang_ps" , andar = false , loop = true },
    { nome = "sentar125" , dict = "anim@amb@office@boardroom@boss@male@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar126" , dict = "anim@amb@office@seating@female@var_a@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar127" , dict = "anim@amb@office@seating@male@var_b@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar128" , dict = "anim@amb@office@seating@male@var_e@base@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar129" , dict = "anim@amb@office@boardroom@crew@male@var_b@base_r@" , anim ="base" , andar = false , loop = true },
    { nome = "sentar130" , dict = "sub_int-38" , anim ="mp_m_freemode_01^1_dual-38" , andar = false , loop = true },
    { nome = "sentar131" , dict = "sil_int-28" , anim ="mp_m_freemode_01_dual-28" , andar = false , loop = true },
    { nome = "sentar132" , dict = "drf_mic_1_cs_1-15" , anim ="cs_drfriedlander_dual-15" , andar = false , loop = true },
    { nome = "sentar133" , dict = "drf_mic_1_cs_1-24" , anim ="cs_drfriedlander_dual-24" , andar = false , loop = true },
    { nome = "sentar134" , dict = "drf_mic_1_cs_1-30" , anim ="cs_drfriedlander_dual-30" , andar = false , loop = true },
    { nome = "sentar135" , dict = "amb@lo_res_idles@" , anim = "prop_human_deckchair_female_lo_res_base" , andar = false , loop = true },
    { nome = "sentar136" , dict = "anim@amb@office@boardroom@boss@male@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar137" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar138" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base_l@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar139" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_a@base_r@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar140" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_b@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar141" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_b@base_r@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar142" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_c@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar143" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_c@base_l@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar144" , dict = "anim@amb@clubhouse@boardroom@crew@female@var_c@base_r@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar145" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_a@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar146" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_a@base_l@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar147" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_a@base_r@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar148" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_b@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar149" , dict = "anim@amb@clubhouse@boardroom@crew@male@var_c@base@" , anim = "base" , andar = false , loop = true },
    { nome = "sentar150" , dict = "amb@incar@male@smoking_van@enter" , anim = "enter" , andar = false , loop = true },
    { nome = "sentar151" , dict = "anim@amb@yacht@jacuzzi@seated@female@variation_05@" , anim = "idle_a" , andar = false , loop = true },
    { nome = "sentar152" , dict = "family_4_mcs_2-2" , anim = "csb_hugh_dual-2" , andar = false , loop = true },
	{ nome = "sentar153" , dict = "anim@amb@office@boardroom@crew@female@var_a@base_r@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar154" , dict = "arm_1_mcs_2_concat-0" , anim = "cs_denise_dual-0" , andar = false , loop = true },
	{ nome = "sentar155" , dict= "anim@amb@facility@briefing_room@seating@male@var_a@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar156" , dict= "anim@amb@office@seating@female@var_b@base@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar157" , dict= "anim@amb@office@seating@female@var_c@base@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar158" , dict= "anim@amb@clubhouse@boardroom@crew@female@var_a@base_r@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar159" , dict= "missheist_jewelleadinout" , anim = "jh_int_outro_loop_d" , andar = false , loop = true },
	{ nome = "sentar160" , dict= "drf_mic_1_cs_1-15" , anim = "cs_drfriedlander_dual-15" , andar = false , loop = true },
	{ nome = "sentar161" , dict= "sol_3_int-9" , anim = "cs_molly_dual-9" , andar = false , loop = true },
	{ nome = "sentar162" , dict= "sil_int-29" , anim = "mp_m_freemode_01^3_dual-29" , andar = false , loop = true },


	-- [ Props ] --
	{ nome = "lanca", dict = "amb@incar@male@smoking@enter", anim = "enter", prop = "mah_lanca" , flag = 49 , hand = 28422},  
	{ nome = "lancab", dict = "amb@incar@male@smoking@enter", anim = "enter", prop = "mah_lanca_02" , flag = 49 , hand = 28422}, 

    -- DEITAR --

    { nome = "deitar", dict = "amb@world_human_sunbathe@female@back@idle_a", anim = "idle_a", andar = false, loop = true },
    { nome = "deitar2", dict = "amb@world_human_sunbathe@female@front@idle_a", anim = "idle_a", andar = false, loop = true },
    { nome = "deitar3", dict = "amb@world_human_sunbathe@male@back@idle_a", anim = "idle_a", andar = false, loop = true },
    { nome = "deitar4", dict = "amb@world_human_sunbathe@male@front@idle_a", anim = "idle_a", andar = false, loop = true },
    { nome = "deitar5", dict = "mini@cpr@char_b@cpr_str", anim = "cpr_kol_idle", andar = false, loop = true },
    { nome = "deitar6", dict = "switch@trevor@scares_tramp", anim = "trev_scares_tramp_idle_tramp", andar = false, loop = true },
    { nome = "deitar7", dict = "switch@trevor@annoys_sunbathers", anim = "trev_annoys_sunbathers_loop_girl", andar = false, loop = true },
    { nome = "deitar8", dict = "switch@trevor@annoys_sunbathers", anim = "trev_annoys_sunbathers_loop_guy", andar = false, loop = true },

    -- DANÇAS --
	
	{ nome ="tiktok" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome ="tiktok2" ,  dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_f@" , anim = "ped_a_dance_idle" , andar = false , loop = true },
	{ nome ="tiktok3" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_f@" , anim = "ped_b_dance_idle" , andar = false , loop = true },
	{ nome ="tiktok4" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_h@" , anim = "ped_a_dance_idle" , andar = false , loop = true },
	{ nome ="tiktok5" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_h@" , anim = "ped_b_dance_idle" , andar = false , loop = true },
	{ nome ="tiktok6" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_j@" , anim = "ped_a_dance_idle" , andar = false , loop = true },
	{ nome ="tiktok7" , dict = "anim@amb@nightclub@mini@dance@dance_paired@dance_m@" , anim = "ped_a_dance_idle" , andar = false , loop = true },
	{ nome ="tiktok8" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_f02" , andar = false , loop = true },
	{ nome ="tiktok9" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "mi_idle_b_f02" , andar = false , loop = true },
	{ nome ="tiktok10" , dict = "anim@mp_player_intcelebrationfemale@crowd_invitation" , anim = "crowd_invitation" , andar = false , loop = true },
	{ nome ="tiktok11" , dict = "anim@mp_player_intcelebrationfemale@driver" , anim = "driver" , andar = false , loop = true },
	{ nome ="tiktok12" , dict = "anim@mp_player_intcelebrationfemale@shooting" , anim = "shooting" , andar = false , loop = true },
	{ nome ="tiktok13" , dict = "anim@mp_player_intcelebrationmale@shooting" , anim = "shooting" , andar = false , loop = true },
	{ nome ="tiktok14" , dict = "anim@mp_player_intcelebrationmale@suck_it" , anim = "suck_it" , andar = false , loop = true },
	{ nome ="tiktok15" , dict = "anim@mp_player_intuppercrowd_invitation" , anim = "idle_a" , andar = false , loop = true },
	{ nome ="tiktok16" , dict = "anim@mp_player_intuppershooting" , anim = "idle_a" , andar = false , loop = true },
	{ nome ="tiktok17" , dict = "anim@mp_player_intuppersuck_it" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "tiktok18" , dict = "custom@dont_start" , anim = "dont_start" , andar = false , loop = true },
	{ nome = "tiktok19" , dict = "custom@renegade" , anim = "renegade" , andar = false , loop = true },
	{ nome = "tiktok20" , dict = "custom@savage" , anim = "savage" , andar = false , loop = true },
	{ nome = "tiktok21" , dict = "custom@sayso" , anim = "sayso" , andar = false , loop = true },
	{ nome = "tiktok22" , dict = "custom@take_l" , anim = "take_l" , andar = false , loop = true },
	{ nome = "tiktok23" , dict = "custom@rickroll" , anim = "rickroll" , andar = false , loop = true },
	{ nome = "tiktok24" , dict = "custom@orangejustice" , anim = "orangejustice" , andar = false , loop = true },
	{ nome = "tiktok25" , dict = "custom@floss" , anim = "floss" , andar = false , loop = true },
	{ nome = "tiktok26" , dict = "custom@crossbounce" , anim = "crossbounce" , andar = false , loop = true },
	{ nome = "tiktok27" , dict = "custom@toosie_slide" , anim = "toosie_slide" , andar = false , loop = true },
	{ nome = "tiktok28" , dict= "custom@around_the_clock" , anim = "around_the_clock" , andar = false , loop = true },
	{ nome = "tiktok29" , dict= "custom@dancemoves" , anim = "dancemoves" , andar = false , loop = true },
	{ nome = "tiktok30" , dict= "custom@disco_dance" , anim = "disco_dance" , andar = false , loop = true },
	{ nome = "tiktok31" , dict= "custom@electroshuffle_original" , anim = "electroshuffle_original" , andar = false , loop = true },
	{ nome = "tiktok32" , dict= "custom@electroshuffle" , anim = "electroshuffle" , andar = false , loop = true },
	{ nome = "tiktok33" , dict= "custom@fresh_fortnite" , anim = "fresh_fortnite" , andar = false , loop = true },
	{ nome = "tiktok34" , dict= "custom@gylphic" , anim = "gylphic" , andar = false , loop = true },
	{ nome = "tiktok35" , dict= "custom@hitit" , anim = "hitit" , andar = false , loop = true },
	{ nome = "tiktok36" , dict= "custom@in_da_party" , anim = "in_da_party" , andar = false , loop = true },
	{ nome = "tiktok37" , dict= "custom@robotdance_fortnite" , anim = "robotdance_fortnite" , andar = false , loop = true },
	{ nome = "tiktok38" , dict= "custom@frightfunk" , anim = "frightfunk" , andar = false , loop = true },
	{ nome = "tiktok39" , dict= "custom@gloss" , anim = "gloss" , andar = false , loop = true },
	{ nome = "tiktok40" , dict= "custom@last_forever" , anim = "last_forever" , andar = false , loop = true },
	{ nome = "tiktok41" , dict= "custom@smooth_moves" , anim = "smooth_moves" , andar = false , loop = true },
	{ nome = "tiktok42" , dict= "custom@bellydance2" , anim = "bellydance2" , andar = false , loop = true },
	{ nome = "tiktok43" , dict= "custom@introducing" , anim = "introducing" , andar = false , loop = true },
	{ nome = "tiktok44" , dict= "custom@footwork" , anim = "footwork" , andar = false , loop = true },
	{ nome = "tiktok45" , dict= "custom@headspin" , anim = "headspin" , andar = false , loop = true },
	{ nome = "tiktok46" , dict= "custom@hiphop_pumpup" , anim = "hiphop_pumpup" , andar = false , loop = true },
	{ nome = "tiktok47" , dict= "custom@hiphop_yeah" , anim = "hiphop_yeah" , andar = false , loop = true },
	{ nome = "tiktok48" , dict= "custom@salsatime" , anim = "salsatime" , andar = false , loop = true },
	{ nome = "tiktok49" , dict= "custom@samba" , anim = "samba" , andar = false , loop = true },
	{ nome = "tiktok50" , dict= "custom@shockdance" , anim = "shockdance" , andar = false , loop = true },
	{ nome = "tiktok51" , dict= "custom@specialdance" , anim = "specialdance" , andar = false , loop = true },
	{ nome = "tiktok52" , dict= "custom@toetwist" , anim = "toetwist" , andar = false , loop = true },
	{ nome = "tiktok53" , dict= "custom@gangnamstyle" , anim = "gangnamstyle" , andar = false , loop = true },
	{ nome = "tiktok54" , dict= "behere@danceanimation" , anim = "behere_clip" , andar = false , loop = true },
	{ nome = "tiktok55" , dict= "comrade@danceanimation" , anim = "comrade_clip" , andar = false , loop = true },
	{ nome = "tiktok56" , dict= "jumpinglow@danceanimation" , anim = "jumpinglow_clip" , andar = false , loop = true },
	{ nome = "tiktok57" , dict= "layers@danceanimation" , anim = "layers_clip" , andar = false , loop = true },
	{ nome = "tiktok58" , dict= "ondaonda@danceanimation" , anim = "onda_clip" , andar = false , loop = true },
	{ nome = "tiktok59" , dict= "sexydance@danceanimations" , anim = "sexydance" , andar = false , loop = true },
	{ nome = "tiktok60" , dict= "tonal@danceanimation" , anim = "tonal_clip" , andar = false , loop = true },
	{ nome = "tiktok61" , dict = "custom@downward_fortnite" , anim = "Downward_fortnite" , andar = false , loop = true },
	{ nome = "tiktok62" , dict = "custom@pullup" , anim = "pullup" , andar = false , loop = true },
	{ nome = "tiktok63" , dict = "custom@rollie" , anim = "rollie" , andar = false , loop = true },
	{ nome = "tiktok64" , dict = "custom@wanna_see_me" , anim = "wanna_see_me" , andar = false , loop = true },
	{ nome = "tiktok65" , dict = "custom@billybounce" , anim = "billybounce" , andar = false , loop = true },
	{ nome = "tiktok66" , dict = "poseanimada" , anim = "poseanimada_clip" , andar = false , loop = true },
    { nome = "tiktok67" , dict = "divined@dances@new" , anim = "ddance1" , andar = false , loop = true },
    { nome = "tiktok68" , dict = "divined@dances@new" , anim = "ddance2" , andar = false , loop = true },
    { nome = "tiktok69" , dict = "divined@dances@new" , anim = "ddance3" , andar = false , loop = true },
    { nome = "tiktok70" , dict = "divined@dances@new" , anim = "ddance4" , andar = false , loop = true },
    { nome = "tiktok71" , dict = "divined@dances@new" , anim = "ddance5" , andar = false , loop = true },
    { nome = "tiktok72" , dict = "divined@dances@new" , anim = "ddance6" , andar = false , loop = true },
    { nome = "tiktok73" , dict = "divined@dances@new" , anim = "ddance7" , andar = false , loop = true },
    { nome = "tiktok74" , dict = "divined@dances@new" , anim = "ddance8" , andar = false , loop = true },
    { nome = "tiktok75" , dict = "divined@dances@new" , anim = "ddance9" , andar = false , loop = true },
    { nome = "tiktok76" , dict = "divined@dances@new" , anim = "ddance10" , andar = false , loop = true },
    { nome = "tiktok77" , dict = "divined@dances@new" , anim = "ddance11" , andar = false , loop = true },
    { nome = "tiktok78" , dict = "divined@dances@new" , anim = "ddance12" , andar = false , loop = true },
    { nome = "tiktok79" , dict = "divined@dances@new" , anim = "ddance13" , andar = false , loop = true },

	{ nome = "tiktok80" , dict = "div@gdances@test" , anim = "ashton" , andar = false , loop = true },
    { nome = "tiktok81" , dict = "div@gdances@test" , anim = "charleston" , andar = false , loop = true },
    { nome = "tiktok82" , dict = "div@gdances@test" , anim = "doggystrut" , andar = false , loop = true },
    { nome = "tiktok83" , dict = "div@gdances@test" , anim = "dreamfeeet" , andar = false , loop = true },
    { nome = "tiktok84" , dict = "div@gdances@test" , anim = "eerie" , andar = false , loop = true },
    { nome = "tiktok85" , dict = "div@gdances@test" , anim = "fancyfeet" , andar = false , loop = true },
    { nome = "tiktok86" , dict = "div@gdances@test" , anim = "festivus" , andar = false , loop = true },
    { nome = "tiktok87" , dict = "div@gdances@test" , anim = "flamingo" , andar = false , loop = true },
    { nome = "tiktok88" , dict = "div@gdances@test" , anim = "fresh" , andar = false , loop = true },
    { nome = "tiktok89" , dict = "div@gdances@test" , anim = "getgriddy" , andar = false , loop = true },
    { nome = "tiktok90" , dict = "div@gdances@test" , anim = "handstand" , andar = false , loop = true },
    { nome = "tiktok91" , dict = "div@gdances@test" , anim = "imsmooth" , andar = false , loop = true },
    { nome = "tiktok92" , dict = "div@gdances@test" , anim = "keepdance" , andar = false , loop = true },
    { nome = "tiktok93" , dict = "div@gdances@test" , anim = "montecarlo" , andar = false , loop = true },
    { nome = "tiktok94" , dict = "div@gdances@test" , anim = "octopus" , andar = false , loop = true },
    { nome = "tiktok95" , dict = "div@gdances@test" , anim = "pointydance" , andar = false , loop = true },
    { nome = "tiktok96" , dict = "divined@pack@new" , anim = "dpack_9" , andar = false , loop = true },
    { nome = "tiktok97" , dict = "divined@pack@new" , anim = "dpack_10" , andar = false , loop = true },
    { nome = "tiktok98" , dict = "divined@pack@new" , anim = "dpack_11" , andar = false , loop = true },
    { nome = "tiktok99" , dict = "divined@pack@new" , anim = "dpack_12" , andar = false , loop = true },
    { nome = "tiktok100" , dict = "divined@pack@new" , anim = "dpack_13" , andar = false , loop = true },
    { nome = "tiktok101" , dict = "divined@pack@new" , anim = "dpack_14" , andar = false , loop = true },
    { nome = "tiktok102" , dict = "divined@pack@new" , anim = "dpack_15" , andar = false , loop = true },
    { nome = "tiktok103" , dict = "divined@pack@new" , anim = "dpack_16" , andar = false , loop = true },
    { nome = "tiktok104" , dict = "divined@pack@new" , anim = "dpack_17" , andar = false , loop = true },
    { nome = "tiktok105" , dict = "divined@pack@new" , anim = "dpack_18" , andar = false , loop = true },
    { nome = "tiktok106" , dict = "divined@dancesv2@new" , anim = "divdance1" , andar = false , loop = true },
    { nome = "tiktok107" , dict = "divined@dancesv2@new" , anim = "divdance2" , andar = false , loop = true },
    { nome = "tiktok108" , dict = "divined@dancesv2@new" , anim = "divdance3" , andar = false , loop = true },
    { nome = "tiktok109" , dict = "divined@dancesv2@new" , anim = "divdance4" , andar = false , loop = true },
    { nome = "tiktok110" , dict = "divined@dancesv2@new" , anim = "divdance5" , andar = false , loop = true },
    { nome = "tiktok111" , dict = "divined@dancesv2@new" , anim = "divdance6" , andar = false , loop = true },
    { nome = "tiktok112" , dict = "divined@dancesv2@new" , anim = "divdance7" , andar = false , loop = true },
    { nome = "tiktok113" , dict = "divined@dancesv2@new" , anim = "divdance8" , andar = false , loop = true },
    { nome = "tiktok114" , dict = "divined@dancesv2@new" , anim = "divdance9" , andar = false , loop = true },
    { nome = "tiktok115" , dict = "divined@dancesv2@new" , anim = "divdance10" , andar = false , loop = true },
    { nome = "tiktok116" , dict = "divined@dancesv2@new" , anim = "divdance11" , andar = false , loop = true },
    { nome = "tiktok117" , dict = "divined@dancesv2@new" , anim = "divdance12" , andar = false , loop = true },
    { nome = "tiktok118" , dict = "divined@dancesv2@new" , anim = "divdance13" , andar = false , loop = true },
    { nome = "tiktok119" , dict = "divined@dancesv2@new" , anim = "divdance14" , andar = false , loop = true },
    { nome = "tiktok120" , dict = "divined@fndances@new" , anim = "dbdance1" , andar = false , loop = true },
    { nome = "tiktok121" , dict = "divined@fndances@new" , anim = "dbdance2" , andar = false , loop = true },
    { nome = "tiktok122" , dict = "divined@fndances@new" , anim = "dbdance3" , andar = false , loop = true },
    { nome = "tiktok123" , dict = "divined@fndances@new" , anim = "dbdance4" , andar = false , loop = true },
    { nome = "tiktok124" , dict = "divined@fndances@new" , anim = "dbdance5" , andar = false , loop = true },
    { nome = "tiktok125" , dict = "divined@fndances@new" , anim = "dbdance6" , andar = false , loop = true },
    { nome = "tiktok126" , dict = "divined@fndances@new" , anim = "dbdance7" , andar = false , loop = true },
    { nome = "tiktok127" , dict = "divined@fndances@new" , anim = "dbdance8" , andar = false , loop = true },
    { nome = "tiktok128" , dict = "divined@fndances@new" , anim = "dbdance9" , andar = false , loop = true },
    { nome = "tiktok129" , dict = "divined@fndances@new" , anim = "dbdance10" , andar = false , loop = true },
    { nome = "tiktok130" , dict = "divined@fndances@new" , anim = "dbdance11" , andar = false , loop = true },
    { nome = "tiktok131" , dict = "divined@fndances@new" , anim = "dbdance12" , andar = false , loop = true },
    { nome = "tiktok132" , dict = "divined@fndances@new" , anim = "dbdance13" , andar = false , loop = true },
    { nome = "tiktok133" , dict = "divined@fndances@new" , anim = "dbdance14" , andar = false , loop = true },
    { nome = "tiktok134" , dict = "divined@fndances@new" , anim = "dbdance15" , andar = false , loop = true },
    { nome = "tiktok135" , dict = "divined@fndances@new" , anim = "dbdance16" , andar = false , loop = true },
    { nome = "tiktok136" , dict = "divined@fndances@new" , anim = "dbdance17" , andar = false , loop = true },
    { nome = "tiktok137" , dict = "divined@fndances@new" , anim = "dbdance18" , andar = false , loop = true },
    { nome = "tiktok138" , dict = "divined@fndances@new" , anim = "dbdance19" , andar = false , loop = true },
    { nome = "tiktok139" , dict = "divined@fndances@new" , anim = "dbdance20" , andar = false , loop = true },
    { nome = "tiktok140" , dict = "divined@fndances@new" , anim = "dbdance21" , andar = false , loop = true },
    { nome = "tiktok141" , dict = "divined@tdances@new" , anim = "dtdance1" , andar = false , loop = true },
    { nome = "tiktok142" , dict = "divined@tdances@new" , anim = "dtdance2" , andar = false , loop = true },
    { nome = "tiktok143" , dict = "divined@tdances@new" , anim = "dtdance3" , andar = false , loop = true },
    { nome = "tiktok144" , dict = "divined@tdances@new" , anim = "dtdance4" , andar = false , loop = true },
    { nome = "tiktok145" , dict = "divined@tdances@new" , anim = "dtdance5" , andar = false , loop = true },
    { nome = "tiktok146" , dict = "divined@tdances@new" , anim = "dtdance6" , andar = false , loop = true },
    { nome = "tiktok147" , dict = "divined@tdances@new" , anim = "dtdance7" , andar = false , loop = true },
    { nome = "tiktok148" , dict = "divined@tdances@new" , anim = "dtdance8" , andar = false , loop = true },
    { nome = "tiktok149" , dict = "divined@tdances@new" , anim = "dtdance9" , andar = false , loop = true },
    { nome = "tiktok150" , dict = "divined@tdances@new" , anim = "dtdance10" , andar = false , loop = true },
    { nome = "tiktok151" , dict = "divined@tdances@new" , anim = "dtdance11" , andar = false , loop = true },
    { nome = "tiktok152" , dict = "divined@tdances@new" , anim = "dtdance12" , andar = false , loop = true },
    { nome = "tiktok153" , dict = "divined@tdances@new" , anim = "dtdance13" , andar = false , loop = true },
    { nome = "tiktok154" , dict = "divined@tdances@new" , anim = "dtdance14" , andar = false , loop = true },
    { nome = "tiktok155" , dict = "divined@tdances@new" , anim = "dtdance15" , andar = false , loop = true },
    { nome = "tiktok156" , dict = "divined@tdances@new" , anim = "dtdance16" , andar = false , loop = true },
    { nome = "tiktok157" , dict = "divined@tdances@new" , anim = "dtdance17" , andar = false , loop = true },
    { nome = "tiktok158" , dict = "divined@tdances@new" , anim = "dtdance18" , andar = false , loop = true },
    { nome = "tiktok159" , dict = "divined@tdances@new" , anim = "dtdance19" , andar = false , loop = true },
    { nome = "tiktok160" , dict = "divined@tdances@new" , anim = "dtdance20" , andar = false , loop = true },
    { nome = "tiktok161" , dict = "divined@tdances@new" , anim = "dtdance21" , andar = false , loop = true },

	{ nome = "desire1", dict = "littlespoon@desire001" , anim = "desire001" , andar = false , loop = true },
	{ nome = "desire2", dict = "littlespoon@desire002" , anim = "desire002" , andar = false , loop = true },
	{ nome = "desire3", dict = "littlespoon@desire003" , anim = "desire003" , andar = false , loop = true },
	{ nome = "desire4", dict = "littlespoon@desire004" , anim = "desire004" , andar = false , loop = true },
	{ nome = "desire5", dict = "littlespoon@desire005" , anim = "desire005" , andar = false , loop = true },
	{ nome = "desire6", dict = "littlespoon@desire006" , anim = "desire006" , andar = false , loop = true },
	{ nome = "desire7", dict = "littlespoon@desire007" , anim = "desire007" , andar = false , loop = true },
	{ nome = "desire8", dict = "littlespoon@desire008" , anim = "desire008" , andar = false , loop = true },
	{ nome = "desire9", dict = "littlespoon@desire009" , anim = "desire009" , andar = false , loop = true },
	{ nome = "desire10", dict = "littlespoon@desire010" , anim = "desire010" , andar = false , loop = true },
	{ nome = "desire11", dict = "littlespoon@desire011" , anim = "desire011" , andar = false , loop = true },
	{ nome = "desire12", dict = "littlespoon@desire012" , anim = "desire012" , andar = false , loop = true },

	{ nome = "hhf1", dict = "littlespoon@himandhisfriend001" , anim = "himandhisfriend001" , andar = false , loop = true },
	{ nome = "hhf2", dict = "littlespoon@himandhisfriend002" , anim = "himandhisfriend002" , andar = false , loop = true },
	{ nome = "hhf3", dict = "littlespoon@himandhisfriend003" , anim = "himandhisfriend003" , andar = false , loop = true },
	{ nome = "hhf4", dict = "littlespoon@himandhisfriend004" , anim = "himandhisfriend004" , andar = false , loop = true },
	{ nome = "hhf5", dict = "littlespoon@himandhisfriend005" , anim = "himandhisfriend005" , andar = false , loop = true },
	{ nome = "hhf6", dict = "littlespoon@himandhisfriend006" , anim = "himandhisfriend006" , andar = false , loop = true },
	{ nome = "hhf7", dict = "littlespoon@himandhisfriend007" , anim = "himandhisfriend007" , andar = false , loop = true },
	{ nome = "hhf8", dict = "littlespoon@himandhisfriend008" , anim = "himandhisfriend008" , andar = false , loop = true },
	{ nome = "hhf9", dict = "littlespoon@himandhisfriend009" , anim = "himandhisfriend009" , andar = false , loop = true },

	{ nome = "intimacy1", dict = "littlespoon@intimacy001" , anim = "intimacy001" , andar = false , loop = true },
	{ nome = "intimacy2", dict = "littlespoon@intimacy002" , anim = "intimacy002" , andar = false , loop = true },
	{ nome = "intimacy3", dict = "littlespoon@intimacy003" , anim = "intimacy003" , andar = false , loop = true },
	{ nome = "intimacy4", dict = "littlespoon@intimacy004" , anim = "intimacy004" , andar = false , loop = true },
	{ nome = "intimacy5", dict = "littlespoon@intimacy005" , anim = "intimacy005" , andar = false , loop = true },
	{ nome = "intimacy6", dict = "littlespoon@intimacy006" , anim = "intimacy006" , andar = false , loop = true },
	{ nome = "intimacy7", dict = "littlespoon@intimacy007" , anim = "intimacy007" , andar = false , loop = true },

	{ nome = "sexy1", dict = "littlespoon@sexy001" , anim = "sexy001" , andar = false , loop = true },
	{ nome = "sexy2", dict = "littlespoon@sexy002" , anim = "sexy002" , andar = false , loop = true },
	{ nome = "sexy3", dict = "littlespoon@sexy003" , anim = "sexy003" , andar = false , loop = true },
	{ nome = "sexy4", dict = "littlespoon@sexy004" , anim = "sexy004" , andar = false , loop = true },
	{ nome = "sexy5", dict = "littlespoon@sexy005" , anim = "sexy005" , andar = false , loop = true },
	{ nome = "sexy6", dict = "littlespoon@sexy006" , anim = "sexy006" , andar = false , loop = true },
	{ nome = "sexy7", dict = "littlespoon@sexy007" , anim = "sexy007" , andar = false , loop = true },
	{ nome = "sexy8", dict = "littlespoon@sexy008" , anim = "sexy008" , andar = false , loop = true },
	{ nome = "sexy9", dict = "littlespoon@sexy009" , anim = "sexy009" , andar = false , loop = true },
	{ nome = "sexy10", dict = "littlespoon@sexy010" , anim = "sexy010" , andar = false , loop = true },
	{ nome = "sexy11", dict = "littlespoon@sexy011" , anim = "sexy011" , andar = false , loop = true },
	{ nome = "sexy11", dict = "littlespoon@sexy012" , anim = "sexy012" , andar = false , loop = true },

	{ nome = "dancar" , dict = "rcmnigel1bnmt_1b" , anim = "dance_loop_tyler" , andar = false , loop = true },
	{ nome = "dancar2" , dict = "mp_safehouse" , anim = "lap_dance_girl" , andar = false , loop = true },
	{ nome = "dancar3" , dict = "misschinese2_crystalmazemcs1_cs" , anim = "dance_loop_tao" , andar = false , loop = true },
	{ nome = "dancar4" , dict = "mini@strip_club@private_dance@part1" , anim = "priv_dance_p1" , andar = false , loop = true },
	{ nome = "dancar5" , dict = "mini@strip_club@private_dance@part2" , anim = "priv_dance_p2" , andar = false , loop = true },
	{ nome = "dancar6" , dict = "mini@strip_club@private_dance@part3" , anim = "priv_dance_p3" , andar = false , loop = true },
	{ nome = "dancar7" , dict = "special_ped@mountain_dancer@monologue_2@monologue_2a" , anim = "mnt_dnc_angel" , andar = false , loop = true },
	{ nome = "dancar8" , dict = "special_ped@mountain_dancer@monologue_3@monologue_3a" , anim = "mnt_dnc_buttwag" , andar = false , loop = true },
	{ nome = "dancar9" , dict = "missfbi3_sniping" , anim = "dance_m_default" , andar = false , loop = true },
	{ nome = "dancar10" , dict = "anim@amb@nightclub@dancers@black_madonna_entourage@" , anim = "hi_dance_facedj_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar11" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar12" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar13" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar14" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar15" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar16" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar17" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar18" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar19" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar20" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar21" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar22" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar23" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar24" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar25" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar26" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar27" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar28" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar29" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar30" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar31" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar32" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar33" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar34" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar35" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar36" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar37" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar38" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar39" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar40" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar41" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar42" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar43" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar44" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar45" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar46" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar47" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar48" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar49" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar50" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar51" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar52" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar53" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar54" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar55" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar56" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar57" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar58" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar59" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar60" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar61" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar62" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar63" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar64" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar65" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar66" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar67" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar68" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar69" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar70" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar71" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar72" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar73" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar74" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar75" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar76" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar77" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar78" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar79" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar80" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar81" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar82" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar83" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar84" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar85" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar86" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar87" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar88" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar89" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar90" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar91" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar92" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar93" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar94" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar95" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar96" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar97" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar98" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar99" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar100" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar101" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar102" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar103" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar104" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar105" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar106" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar107" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar108" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar109" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar110" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar111" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar112" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar113" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar114" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar115" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar116" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar117" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar118" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar119" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar120" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar121" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar122" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar123" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar124" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar125" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar126" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar127" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar128" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar129" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar130" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar131" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar132" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar133" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar134" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar135" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar136" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar137" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar138" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar139" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar140" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar141" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar142" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar143" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar144" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar145" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar146" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar147" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar148" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar149" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar150" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar151" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar152" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar153" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar154" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar155" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar156" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar157" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar158" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar159" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar160" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar161" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar162" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar163" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar164" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar165" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar166" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar167" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar168" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar169" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar170" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar171" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar172" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar173" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar174" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar175" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar176" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar177" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar178" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar179" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar180" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar181" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar182" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar183" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar184" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar185" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar186" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar187" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar188" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar189" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar190" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar191" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar192" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar193" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar194" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar195" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar196" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar197" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar198" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar199" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar200" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar201" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar202" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar203" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar204" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar205" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar206" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar207" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar208" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar209" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar210" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar211" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar212" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar213" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar214" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar215" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar216" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar217" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar218" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar219" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar220" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar221" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar222" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar223" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar224" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar225" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar226" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar227" , dict = "anim@amb@nightclub@lazlow@hi_podium@" , anim = "danceidle_hi_11_buttwiggle_b_laz" , andar = false , loop = true },
	{ nome = "dancar228" , dict = "timetable@tracy@ig_5@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "dancar229" , dict = "anim@mp_player_intupperfind_the_fish" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "dancar230" , dict = "anim@amb@nightclub@dancers@podium_dancers@" , anim = "hi_dance_facedj_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar231" , dict = "anim@amb@nightclub@dancers@solomun_entourage@" , anim = "mi_dance_facedj_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar232" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar233" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar234" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar235" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar236" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar237" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar238" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar239" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar240" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar241" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar242" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar243" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar244" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar245" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar246" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar247" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar248" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar249" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar250" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar251" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar252" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar253" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar254" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar255" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar256" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar257" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar258" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar259" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar260" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar261" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar262" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar263" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar264" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar265" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar266" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar267" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar268" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar269" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar270" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar271" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar272" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar273" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar274" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar275" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar276" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar277" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar278" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar279" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar280" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar281" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar282" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar283" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar284" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar285" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar286" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar287" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar288" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar289" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar290" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar291" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar292" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar293" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar294" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar295" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar296" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar297" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar298" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar299" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar300" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar301" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar302" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar303" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar304" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar305" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar306" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar307" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar308" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar309" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar310" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar311" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar312" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar313" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar314" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar315" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar316" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar317" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar318" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar319" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar320" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar321" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar322" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar323" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar324" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar325" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar326" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar327" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar328" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar329" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar330" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar331" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar332" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar333" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar334" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar335" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar336" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar337" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar338" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar339" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar340" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar341" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar342" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar343" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar344" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar345" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar346" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar347" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar348" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar349" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar350" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar351" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar352" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar353" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar354" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar355" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar356" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar357" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar358" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar359" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar360" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar361" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar362" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar363" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar364" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar365" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar366" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar367" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center" , andar = false , loop = true },	
	{ nome = "dancar368" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center_down" , andar = false , loop = true },	
	{ nome = "dancar369" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center_up" , andar = false , loop = true },	
	{ nome = "dancar370" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left" , andar = false , loop = true },	
	{ nome = "dancar371" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left_down" , andar = false , loop = true },	
	{ nome = "dancar372" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left_up" , andar = false , loop = true },	
	{ nome = "dancar373" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right" , andar = false , loop = true },	
	{ nome = "dancar374" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right_down" , andar = false , loop = true },	
	{ nome = "dancar375" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right_up" , andar = false , loop = true },	
	{ nome = "dancar376" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center" , andar = false , loop = true },	
	{ nome = "dancar377" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center_down" , andar = false , loop = true },	
	{ nome = "dancar378" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center_up" , andar = false , loop = true },	
	{ nome = "dancar379" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left" , andar = false , loop = true },	
	{ nome = "dancar380" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left_down" , andar = false , loop = true },	
	{ nome = "dancar381" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left_up" , andar = false , loop = true },	
	{ nome = "dancar382" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right" , andar = false , loop = true },	
	{ nome = "dancar383" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right_down" , andar = false , loop = true },	
	{ nome = "dancar384" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right_up" , andar = false , loop = true },	
	{ nome = "dancar385" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center" , andar = false , loop = true },	
	{ nome = "dancar386" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center_down" , andar = false , loop = true },	
	{ nome = "dancar387" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center_up" , andar = false , loop = true },	
	{ nome = "dancar388" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left" , andar = false , loop = true },	
	{ nome = "dancar389" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left_down" , andar = false , loop = true },	
	{ nome = "dancar390" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left_up" , andar = false , loop = true },	
	{ nome = "dancar391" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right" , andar = false , loop = true },	
	{ nome = "dancar392" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right_down" , andar = false , loop = true },	
	{ nome = "dancar393" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar394" , dict = "anim@mp_player_intcelebrationfemale@shooting" , anim = "shooting" , andar = false , loop = true },
	{ nome = "dancar395" , dict = "anim@mp_player_intcelebrationmale@shooting" , anim = "shooting" , andar = false , loop = true },
	{ nome = "dancar396" , dict = "anim@mp_player_intuppershooting" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "dancar397" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_f02" , andar = false , loop = true },
	{ nome = "dancar398" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_m01" , andar = false , loop = true },
	{ nome = "dancar399" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_m02" , andar = false , loop = true },
	{ nome = "dancar400" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_m03" , andar = false , loop = true },
	{ nome = "dancar401" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_f01" , andar = false , loop = true },
	{ nome = "dancar402" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_f02" , andar = false , loop = true },
	{ nome = "dancar403" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_f03" , andar = false , loop = true },
	{ nome = "dancar404" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_m01" , andar = false , loop = true },
	{ nome = "dancar405" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_m02" , andar = false , loop = true },
	{ nome = "dancar406" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_b_m03" , andar = false , loop = true },
	{ nome = "dancar407" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_f01" , andar = false , loop = true },
	{ nome = "dancar408" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_f02" , andar = false , loop = true },
	{ nome = "dancar409" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_f03" , andar = false , loop = true },
	{ nome = "dancar410" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_m01" , andar = false , loop = true },
	{ nome = "dancar411" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_m02" , andar = false , loop = true },
	{ nome = "dancar412" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_c_m03" , andar = false , loop = true },
	{ nome = "dancar413" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_f01" , andar = false , loop = true },
	{ nome = "dancar414" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_f02" , andar = false , loop = true },
	{ nome = "dancar415" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_f03" , andar = false , loop = true },
	{ nome = "dancar416" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_m01" , andar = false , loop = true },
	{ nome = "dancar417" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_m02" , andar = false , loop = true },
	{ nome = "dancar418" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_d_m03" , andar = false , loop = true },
	{ nome = "dancar419" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_e_f02" , andar = false , loop = true },
	{ nome = "dancar420" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_f_f02" , andar = false , loop = true },
	{ nome = "dancar421" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_f01" , andar = false , loop = true },
	{ nome = "dancar422" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_f02" , andar = false , loop = true },
	{ nome = "dancar423" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_f03" , andar = false , loop = true },
	{ nome = "dancar424" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_m01" , andar = false , loop = true },
	{ nome = "dancar425" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_m02" , andar = false , loop = true },
	{ nome = "dancar426" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_loop_m03" , andar = false , loop = true },
	{ nome = "dancar427" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_f01" , andar = false , loop = true },
	{ nome = "dancar428" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_f02" , andar = false , loop = true },
	{ nome = "dancar429" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_f03" , andar = false , loop = true },
	{ nome = "dancar430" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_m01" , andar = false , loop = true },
	{ nome = "dancar431" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_m02" , andar = false , loop = true },
	{ nome = "dancar432" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_li_m03" , andar = false , loop = true },
	{ nome = "dancar433" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_f01" , andar = false , loop = true },
	{ nome = "dancar434" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_f02" , andar = false , loop = true },
	{ nome = "dancar435" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_f03" , andar = false , loop = true },
	{ nome = "dancar436" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_m01" , andar = false , loop = true },
	{ nome = "dancar437" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_m02" , andar = false , loop = true },
	{ nome = "dancar438" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_mi_m03" , andar = false , loop = true },
	{ nome = "dancar439" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_si_f01" , andar = false , loop = true },
	{ nome = "dancar440" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_ti_f01" , andar = false , loop = true },
	{ nome = "dancar441" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_ti_f02" , andar = false , loop = true },
	{ nome = "dancar442" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_to_ti_f03" , andar = false , loop = true },
	{ nome = "dancar443" , dict = "anim@amb@nightclub_island@dancers@club@" , anim = "hi_idle_a_f01" , andar = false , loop = true },
	{ nome = "dancar444", extra = function()
        vRP.DeletarObjeto()
        vRP._playAnim(false, { "anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz" }, true)
        vRP.CarregarObjeto("", "", "ba_prop_battle_glowstick_01", 49, 28422, 0.0700, 0.1400, 0.0, -80.0, 20.0)
        vRP.CarregarObjeto("", "", "ba_prop_battle_glowstick_01", 49, 60309, 0.0700, 0.0900, 0.0, -120.0, -20.0)
    end },
    { nome = "dancar445", extra = function()
        vRP.DeletarObjeto()
        vRP._playAnim(false, { "anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz" }, true)
        vRP.CarregarObjeto("", "", "ba_prop_battle_glowstick_01", 49, 28422, 0.0700, 0.1400, 0.0, -80.0, 20.0)
        vRP.CarregarObjeto("", "", "ba_prop_battle_glowstick_01", 49, 60309, 0.0700, 0.0900, 0.0, -120.0, -20.0)
    end },
    { nome = "dancar446", extra = function()
        vRP.DeletarObjeto()
        vRP._playAnim(false, { "anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz" }, true)
        vRP.CarregarObjeto("", "", "ba_prop_battle_hobby_horse", 49, 28422, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    end },
	{ nome = "sexo" , dict = "rcmpaparazzo_2" , anim = "shag_loop_poppy" , andar = false , loop = true },
	{ nome = "sexo2" , dict = "rcmpaparazzo_2" , anim = "shag_loop_a" , andar = false , loop = true },
	{ nome = "sexo3" , dict = "anim@mp_player_intcelebrationfemale@air_shagging" , anim = "air_shagging" , andar = false , loop = true },
	{ nome = "sexo4" , dict = "oddjobs@towing" , anim = "m_blow_job_loop" , andar = false , loop = true , carros = true },
	{ nome = "sexo5" , dict = "oddjobs@towing" , anim = "f_blow_job_loop" , andar = false , loop = true , carros = true },
	{ nome = "sexo6" , ict = "mini@prostitutes@sexlow_veh" , anim = "low_car_sex_loop_female" , andar = false , loop = true , carros = true },
	{ nome = "sexo7" , dict = "misscarsteal2pimpsex" , anim = "pimpsex_punter" , andar = false , loop = true },
	{ nome = "sexo8" , dict = "random@drunk_driver_2" , anim = "cardrunksex_loop_m" , andar = false , loop = true },
	{ nome = "sexo9" , dict = "mini@prostitutes@sexlow_veh" , anim = "low_car_sex_loop_player" , andar = false , loop = true },
	{ nome = "sexo10" , dict = "misscarsteal2pimpsex" , anim = "shagloop_pimp" , andar = false , loop = true },
	{ nome = "sexo11" , dict = "random@train_tracks" , anim = "frontseat_carsex_loop_low_guy" , andar = false , loop = true },
	{ nome = "sexo12" , dict = "misscarsteal2pimpsex" , anim = "shagloop_hooker" , andar = false , loop = true },
	{ nome = "sexo13" , dict = "random@train_tracks" , anim = "frontseat_carsex_loop_top_guy" , andar = false , loop = true },
	{ nome = "sexo14" , dict = "rcmpaparazzo_2" , anim = "shag_loop_poppy" , andar = false , loop = true },
	{ nome = "sexo15" , dict = "oddjobs@towing" , anim = "f_blow_job_loop" , andar = false , loop = true },
	{ nome = "sexo16" , dict = "misscarsteal2pimpsex" , anim = "pimpsex_hooker" , andar = false , loop = true },
	{ nome = "sexo17" , dict = "mini@prostitutes@sexnorm_veh" , anim = "sex_loop_prostitute" , andar = false , loop = true },
	{ nome = "sexo18" , dict = "mini@prostitutes@sexnorm_veh" , anim = "bj_loop_prostitute" , andar = false , loop = true },
	{ nome = "sexo19" , dict = "random@drunk_driver_2" , anim = "cardrunksex_loop_f" , andar = false , loop = true },
	{ nome = "sexo20" , dict = "misscarsteal2pimpsex" , anim = "pimpsex_hooker" , andar = false , loop = true },
	{ nome = "sexo21" , dict = "rcmpaparazzo_2" , anim = "shag_loop_a" , andar = false , loop = true },
	{ nome = "sexo22" , dict = "oddjobs@towing" , anim = "m_blow_job_loop" , andar = false , loop = true },
	{ nome = "sexo23" , dict = "timetable@trevor@skull_loving_bear" , anim = "skull_loving_bear" , andar = false , loop = true },

    -- { nome = "sentar" , anim = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" , extra = function()
    --     local ped = PlayerPedId()
    --     local x,y,z = table.unpack(GetEntityCoords(ped))
    --     for k,v in pairs(chairs) do
    --         local object = GetClosestObjectOfType(x,y,z,0.7,GetHashKey(v[1]),0,0,0)
    --         if DoesEntityExist(object) then
    --             local x2,y2,z2 = table.unpack(GetEntityCoords(object))
    --             FreezeEntityPosition(object,true)
    --             SetEntityCoords(ped,x2,y2,z2+v[2])
    --             SetEntityHeading(ped,GetEntityHeading(object)-180.0)
    --         end
    --     end
    -- end },

    { nome = "binoculos", dict = "amb@world_human_binoculars@male@enter", anim = "enter", prop = "prop_binoc_01", flag = 50, hand = 28422, extra = function()
        binoculos = true
    end },
	{ nome = "urso" , dict = "impexp_int-0" , anim = "mp_m_waremech_01_dual-0" , andar = true , loop = true , item = "urso" , extra = function()
		vRP._CarregarObjeto("","","v_ilev_mr_rasberryclean",49,24817,-0.20,0.46,-0.016,-180.0,-90.0,0.0)
	end },
	{ nome = "dinheiro" , dict = "anim@mp_player_intupperraining_cash" , anim = "idle_a" , andar = true , loop = true , extra = function()
		vRP._CarregarObjeto("","","prop_anim_cash_pile_01",49,60309,0.0,0.0,0.0,180.0,0.0,70.0)
	end },
	{ nome = "parachoque" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
	end },
	{ nome = "porta" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_door_01",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "porta2" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_door_02",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "porta3" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
		vRP._CarregarObjeto("","","prop_car_door_03",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "porta4" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_door_04",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "banco" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
		vRP._CarregarObjeto("","","prop_car_seat",49,28422,0.0,-0.2,-0.14,0.0,0.0,0.0)
	end },
	{ nome = "pneu" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_wheel_tyre",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "pneu2" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_wheel_03",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "bateria" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_battery_01",49,28422,0.0,-0.1,-0.10,0.0,0.0,0.0)
	end },
	{ nome = "motor" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_engine_01",49,28422,0.0,-0.1,-0.10,0.0,0.0,0.0)
	end },
    { nome = "pano2", dict = "timetable@maid@cleaning_surface@base", anim = "base", prop = "prop_rag_01", flag = 49, hand = 28422, extra = function()
        local vehicle = vRP.getNearestVehicle(7)
        if IsEntityAVehicle(vehicle) then
            SetTimeout(15000, function()
                TriggerServerEvent("tryclean", VehToNet(vehicle))
            end)
        end
    end },
    { nome = "camera2", dict = "missfinale_c2mcs_1", anim = "fin_c2_mcs_1_camman", prop = "prop_v_cam_01", flag = 49, hand = 28422, extra = function()
        camera = true
    end },
    { nome = "pano", dict = "timetable@maid@cleaning_window@base", anim = "base", prop = "prop_rag_01", flag = 49, hand = 28422, extra = function()
        local vehicle = vRP.getNearestVehicle(7)
        if IsEntityAVehicle(vehicle) then
            SetTimeout(15000, function()
                TriggerServerEvent("tryclean", VehToNet(vehicle))
            end)
        end
    end },
    { nome = "bong", dict = "anim@safehouse@bong", anim = "bong_stage1", prop = "prop_bong_01", flag = 50, hand = 60309, extra = function()
        if not IsPedInAnyVehicle(PlayerPedId()) then
            TriggerEvent('cancelando', true)
            TriggerEvent("progress", 9, "fumando")
            TriggerEvent("vrp_sound:source", 'bong', 0.5)
            SetTimeout(8700, function()
                vRP._DeletarObjeto()
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.5)
            end)
            SetTimeout(9000, function()
                vRP.loadAnimSet("MOVE_M@DRUNK@VERYDRUNK")
                SetTimecycleModifier("REDMIST_blend")
                ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 1.0)
                StartScreenEffect("DMT_flight", 30000, false)
                Wait(30000)
                TriggerEvent('cancelando', false)
                SetTimecycleModifier("")
                SetTransitionTimecycleModifier("")
                StopGameplayCamShaking()
                ResetPedMovementClipset(PlayerPedId())
            end)
        end
    end },
    { nome = "livro", dict = "cellphone@", anim = "cellphone_text_read_base", andar = true, loop = true, extra = function()
        vRP._CarregarObjeto("", "", "prop_novel_01", 49, 6286, 0.15, 0.03, -0.065, 0.0, 180.0, 90.0)
    end },
	

	{ nome = "bengala" , andar = true , loop = false , extra = function()
		local ped = PlayerPedId()
		TriggerEvent('animations:UseWandelStok')
	end	}
}

RegisterNetEvent('animations:UseWandelStok')
AddEventHandler('animations:UseWandelStok', function()
    local ped = PlayerPedId()
    if not WalkstickUsed then
        RequestAnimSet('move_heist_lester')
        while not HasAnimSetLoaded('move_heist_lester') do
            Citizen.Wait(1)
        end
        SetPedMovementClipset(ped, 'move_heist_lester', 1.0) 
        WandelstokObject = CreateObject(GetHashKey("prop_cs_walking_stick"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(WandelstokObject, ped, GetPedBoneIndex(ped, 57005), 0.16, 0.06, 0.0, 335.0, 300.0, 120.0, true, true, false, true, 5, true)
    else
        ResetPedMovementClipset(ped,0.25)
        DetachEntity(WandelstokObject, 0, 0)
        DeleteEntity(WandelstokObject)
    end
    WalkstickUsed = not WalkstickUsed
end)

RegisterNetEvent('emotes')
AddEventHandler('emotes',function(nome)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 100 then
		vRP.DeletarObjeto()
		for _,emote in pairs(animacoes) do
			if not IsPedInAnyVehicle(ped) and not emote.carros then
				if nome == emote.nome then
					if emote.extra then emote.extra() end
					if emote.pos1 then
						vRP.CarregarObjeto("","",emote.prop,emote.flag,emote.hand,emote.pos1,emote.pos2,emote.pos3,emote.pos4,emote.pos5,emote.pos6)
					elseif emote.prop then
						vRP.CarregarObjeto(emote.dict,emote.anim,emote.prop,emote.flag,emote.hand)
					elseif emote.dict then
						vRP._playAnim(emote.andar,{{emote.dict,emote.anim}},emote.loop)
					else
						vRP._playAnim(false,{task=emote.anim},false)
					end
				end
			end
		end
	end
end)
------------------------------------------------------------------------
-- SYNC
------------------------------------------------------------------------
RegisterNetEvent('syncanim')
AddEventHandler('syncanim',function(pos)
 	local pedInFront = GetPlayerPed(GetClosestPlayer())
    local heading = GetEntityHeading(pedInFront)
    local coords = GetOffsetFromEntityInWorldCoords(pedInFront,0.0,pos,0.0)
    SetEntityHeading(PlayerPedId(),heading-180.1)
    SetEntityCoordsNoOffset(PlayerPedId(),coords.x,coords.y,coords.z,0)
end)

RegisterNetEvent('dancalouca')
AddEventHandler('dancalouca',function()
	vRP._playAnim(false, {{"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag"}}, true)
end)

RegisterNetEvent('yoga')
AddEventHandler('yoga',function()
	vRP._playAnim(false, {{"amb@world_human_yoga@male@base", "base_a"}}, true)
end)

RegisterNetEvent('beijar')
AddEventHandler('beijar',function()
	vRP._playAnim(false, {{"mp_ped_interaction", "kisses_guy_a"}}, true)
end)

RegisterNetEvent('abracar')
AddEventHandler('abracar',function()
	vRP._playAnim(false, {{"mp_ped_interaction", "hugs_guy_a"}}, true)
end)

RegisterNetEvent('abracar2')
AddEventHandler('abracar2',function()
	vRP._playAnim(false, {{"mp_ped_interaction", "kisses_guy_b"}}, true)
end)

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function PtfxThis(asset)
	while not HasNamedPtfxAssetLoaded(asset) do
	  RequestNamedPtfxAsset(asset)
	  Wait(10)
	end
	UseParticleFxAssetNextCall(asset)
  end

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		
        if binoculos then
            local scaleform = RequestScaleformMovie("BINOCULARS")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(10)
            end
 
            local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
            AttachCamToEntity(cam,PlayerPedId(),0.0,0.0,1.0,true)
            SetCamRot(cam,0.0,0.0,GetEntityHeading(PlayerPedId()))
            SetCamFov(cam,fov)
            RenderScriptCams(true,false,0,1,0)
 
            while binoculos and true do
                Citizen.Wait(1)
                BlockWeaponWheelThisFrame()
                local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
                CheckInputRotation(cam,zoomvalue)
                HandleZoom(cam)
                DrawScaleformMovieFullscreen(scaleform,255,255,255,255)
            end
 
            fov = (fov_max+fov_min)*0.5
            RenderScriptCams(false,false,0,1,0)
            SetScaleformMovieAsNoLongerNeeded(scaleform)
            DestroyCam(cam,false)
            SetNightvision(false)
            SetSeethrough(false)
		end
		
        if IsControlJustPressed(0,38) then
            if IsEntityPlayingAnim(PlayerPedId(),"missfinale_c2mcs_1","fin_c2_mcs_1_camman",3) then
                camera = true
            end
            if camera then
                local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
                AttachCamToEntity(cam,PlayerPedId(),0.0,0.0,1.0,true)
                SetCamRot(cam,0.0,0.0,GetEntityHeading(PlayerPedId()))
                SetCamFov(cam,fov)
                RenderScriptCams(true,false,0,1,0)
 
                while camera and true do
                    Citizen.Wait(1)
                    BlockWeaponWheelThisFrame()
                    local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
                    CheckInputRotation(cam,zoomvalue)
					HandleZoom(cam)
					TriggerEvent("status:celular",true)
					TriggerEvent("status:chat",true)
                    if IsControlJustPressed(0,38) then
						camera = false
						TriggerEvent("status:celular",false)
						TriggerEvent("status:chat",false)
                    end
                end
 
                fov = (fov_max+fov_min)*0.5
                RenderScriptCams(false,false,0,1,0)
                SetScaleformMovieAsNoLongerNeeded(scaleform)
                SetScaleformMovieAsNoLongerNeeded(scaleform2)
                DestroyCam(cam,false)
                SetNightvision(false)
                SetSeethrough(false)
            end
		end
		
    end
end)
 
RegisterNetEvent('binoculos')
AddEventHandler('binoculos',function()
    if IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_binoculars@male@enter","enter",3) then
        binoculos = true
        camera = true
    else
        binoculos = false
        camera = false
    end
end)
 
function CheckInputRotation(cam,zoomvalue)
    local rightAxisX = GetDisabledControlNormal(0,220)
    local rightAxisY = GetDisabledControlNormal(0,221)
    local rotation = GetCamRot(cam,2)
    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        new_z = rotation.z+rightAxisX*-1.0*(8.0)*(zoomvalue+0.1)
        new_x = math.max(math.min(20.0,rotation.x+rightAxisY*-1.0*(8.0)*(zoomvalue+0.1)),-89.5)
        SetCamRot(cam,new_x,0.0,new_z,2)
    end
end
 
function HandleZoom(cam)
    if IsControlJustPressed(0,241) then
        fov = math.max(fov-10.0,fov_min)
    end
 
    if IsControlJustPressed(0,242) then
        fov = math.min(fov+10.0,fov_max)
    end
 
    local current_fov = GetCamFov(cam)
    if math.abs(fov-current_fov) < 0.1 then
        fov = current_fov
    end
    SetCamFov(cam,current_fov+(fov-current_fov)*0.05)
end
 
function Breaking(text)
    SetTextColour(255,255,255,255)
    SetTextFont(8)
    SetTextScale(1.2,1.2)
    SetTextWrap(0.0,1.0)
    SetTextCentre(false)
    SetTextDropshadow(0,0,0,0,255)
    SetTextEdge(1,0,0,0,205)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.2,0.85)
end