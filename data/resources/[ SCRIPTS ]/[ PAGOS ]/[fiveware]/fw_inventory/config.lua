config = {
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- TECLAS DE ABRIR OS MENUS
    -----------------------------------------------------------------------------------------------------------------------------------------
    teclas_abrir_interface = {
        inventario = "OEM_3",
        porta_malas = "PAGEUP",
        baus = 38,
        lojas = 38,
        craft = 38
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- DISTANCIA DO PLAYER PROXIMO ( EVITAR DUP DE ITENS )
    -----------------------------------------------------------------------------------------------------------------------------------------
    distancia_player_proximo = 1,
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- FORMATOS DO NOME DOS ARMAMENTOS
    -----------------------------------------------------------------------------------------------------------------------------------------
    armamentos_formatos = {
        arma = "wbody|",
        municao = "wammo|"
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- SISTEMAS
    -----------------------------------------------------------------------------------------------------------------------------------------
    modulos_ativos = {
        inventario = true,
        porta_malas = true,
        baus = true,
        casas = true,
        inspecionar = true,
        lojas = true,
        craft = true
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- TABELA DE DADOS
    -----------------------------------------------------------------------------------------------------------------------------------------
    tabela_de_dados = {
        porta_malas = "chest",
        baus = "chest",
        casas_bau = "homesVault",
        casas_tabela = "vrp_homes_permissions"
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- WEBHOOKS
    -----------------------------------------------------------------------------------------------------------------------------------------
	webhook_config = {
		icon = "https://i.imgur.com/6UJQDZJ.png",
		color = 7419530
	},
	webhooks = {
		usar_item = "",
		pegar_drop = "",
		enviar_item = "",
		dropar_item = "",

		portamalas = "",

		bau_casa = "",
        compra_casa = "",
        transferir_casa = "",

        comprar_item_loja = "",
        vender_item_loja = "",

		craft_item = ""
	},
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- COMANDOS HOMES
    -----------------------------------------------------------------------------------------------------------------------------------------
    comandos_casas = {
        entrar_na_casa = "enter",
        sair_da_casa = "exit",
        bau_da_casa = "vault",

        homes = "homes",
        adicionar_jogador = "add",
        remover_jogador = "rem",
        adicionar_jogador_garagem = "garage",
        listar_casas = "list",
        checar_casa = "check",
        transferir_casa = "transfer",
        pagar_taxa = "tax",

        outfit = "outfit",
        salvar_outfit = "save",
        remover_outfit = "rem",
        aplicar_outfit = "apply"
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- REVISTAR
    -----------------------------------------------------------------------------------------------------------------------------------------
	inspecionar = {
        revistar = {
            habilitar_comando = true,
            comando = "revistar",
            perm_policia = "policia.permissao",
            min_policiais_em_servico = 0,
            webhook = ""
        },
        saquear = {
            habilitar_comando = true,
            comando = "saquear",
            perm_policia = "policia.permissao",
            min_policiais_em_servico = 0,
            webhook = ""
        },
        revistar_admin = {
            habilitar_comando = true,
            comando = "revadm",
            perm_admin = "staff.permissao",
            webhook = ""
        }
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- ITENS BLOQUEADOS EM BAUS
    -----------------------------------------------------------------------------------------------------------------------------------------
    itens_bloqueados = {
        porta_malas = {
            ["dinheirosujo"] = true
        },
        baus = {
            ["identidade"] = true
        },
        casas = {
            ["identidade"] = true
        }
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- BAUS PARA ORGANIZAÇÕES/FACÇÕES
    -----------------------------------------------------------------------------------------------------------------------------------------
    configuracao_baus = {
        ----------------------------------- LEGAIS-----------------------------------------------------------------------------
        ["Policia-Militar"] = { coords = {  -944.85, -2040.82, 9.41 }, tamanho = 15000, perm = "policia.permissao", webhook = "" },
        ["Policia-Civil"] = { coords = { -929.81, -2054.73, 9.41 }, tamanho = 15000, perm = "policia.permissao", webhook = "" },
        ["Secretaria"] = { coords = { -912.96, -2022.58, 9.41 }, tamanho = 15000, perm = "policia.permissao", webhook = "" },

        ["Paramedico"] = { coords = { -813.47,-1240.93,7.34 }, tamanho = 15000, perm = "paramedico.permissao", webhook = "" },

        ["Bennys"] = { coords = { 822.02, -928.87, 32.4 }, tamanho = 15000, perm = "bennys.permissao", webhook = "" },

        ----------------------------------- ILEGAL------------------------------------------------------------------------------
        ["Grecia"] = { coords = { 799.01, -292.73, 69.47 }, tamanho = 15000, perm = "grecia.permissao", webhook = "" },
        ["Lider-Grecia"] = { coords = { 800.05, -294.72, 69.47 }, tamanho = 15000, perm = "lider-grecia.permissao", webhook = "" },

        ["Beiramar"] = { coords = { 1377.69, -1298.78, 75.63 }, tamanho = 15000, perm = "beiramar.permissao", webhook = "" },
        ["Lider-Beiramar"] = { coords = { 1377.74, -1295.92, 75.64 }, tamanho = 15000, perm = "lider-beiramar.permissao", webhook = "" },

        ["Casino"] = { coords = { 964.5, 7.36, 71.84 }, tamanho = 15000, perm = "casino.permissao", webhook = "" },
        ["Lider-Casino"] = { coords = { 962.48, 10.33, 71.84 }, tamanho = 15000, perm = "lider-casino.permissao", webhook = "" },

        ["Galaxy"] = { coords = { 351.97, 288.4, 91.2 }, tamanho = 15000, perm = "galaxy.permissao", webhook = "" },
        ["Lider-Galaxy"] = { coords = { 356.81, 286.93, 91.19 }, tamanho = 15000, perm = "lider-galaxy.permissao", webhook = "" },

        ["Vilarica"] = { coords = { 2038.69, 480.92, 170.99 }, tamanho = 15000, perm = "vilarica.permissao", webhook = "" },
        ["Lider-Vilarica"] = { coords = { 2037.6, 478.87, 170.98 }, tamanho = 15000, perm = "lider-vilarica.permissao", webhook = "" },

        ["Napoles"] = { coords = { -344.85, -128.12, 39.01 }, tamanho = 15000, perm = "napoles.permissao", webhook = "" },
        ["Lider-Napoles"] = { coords = { -343.6, -122.24, 39.01 }, tamanho = 15000, perm = "lider-napoles.permissao", webhook = "" },

        ["Complexo"] = { coords = { -862.98, -1852.33, 31.3 }, tamanho = 15000, perm = "complexo.permissao", webhook = "" },
        ["Lider-Complexo"] = { coords = { -861.23, -1853.56, 31.3 }, tamanho = 15000, perm = "lider-complexo.permissao", webhook = "" },

        ["Holanda"] = { coords = { 874.29, 1035.95, 283.68 }, tamanho = 15000, perm = "holanda.permissao", webhook = "" },
        ["Lider-Holanda"] = { coords = { 876.44, 1035.98, 283.67 }, tamanho = 15000, perm = "lider-holanda.permissao", webhook = "" },

        ["Bratva"] = { coords = { -2671.31, 1337.45, 140.89 }, tamanho = 15000, perm = "bratva.permissao", webhook = "" },
        ["Lider-Bratva"] = { coords = { -2679.87, 1336.56, 144.26 }, tamanho = 15000, perm = "lider-bratva.permissao", webhook = "" },

        ["Egito"] = { coords = { 1250.45, -224.55, 99.01 }, tamanho = 15000, perm = "egito.permissao", webhook = "" },
        ["Lider-Egito"] = { coords = { 1250.9, -227.36, 99.0 }, tamanho = 15000, perm = "lider-egito.permissao", webhook = "" },

        ["Lakers"] = { coords = { -1870.31, 2059.37, 135.44 }, tamanho = 15000, perm = "lakers.permissao", webhook = "" },
        ["Lider-Lakers"] = { coords = { -1866.86, 2065.61, 135.44 }, tamanho = 15000, perm = "lider-lakers.permissao", webhook = "" },

        ["Elitecar"] = { coords = { 1330.5, -676.12, 75.86 }, tamanho = 15000, perm = "elitecar.permissao", webhook = "" },
        ["Lider-Elitecar"] = { coords = { 1332.5, -676.9, 75.86 }, tamanho = 15000, perm = "lider-elitecar.permissao", webhook = "" },


        
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- LOJAS DE ITENS
    -----------------------------------------------------------------------------------------------------------------------------------------
    lojas_config = {
        ["Departamento"] = {
            mode = "Compra",
            locs = {
                { 25.68,-1346.6,29.5 },
                { 2556.47,382.05,108.63 },
                { 1163.55,-323.02,69.21 },
                { -707.31,-913.75,19.22 },
                { -47.72,-1757.23,29.43 },
                { 373.89,326.86,103.57 },
                { -3242.95,1001.28,12.84 },
                { 1729.3,6415.48,35.04 },
                { 548.0,2670.35,42.16 },
                { 1960.69,3741.34,32.35 },
                { 2677.92,3280.85,55.25 },
                { 1698.5,4924.09,42.07 },
                { -1820.82,793.21,138.12 },
                { 1393.21,3605.26,34.99 },
                { -3040.14,585.44,7.91 },
                { 1166.0,2709.45,38.16 },
                { -549.94,-584.24,34.69 },
            },
            list = {
                ["mochila"] = 10000,
                ["agua"] = 250,
                ["suco"] = 250,
                ["sanduiche"] = 500,
                ["radio"] = 500,
                ["celular"] = 500,
            }
        },
        ["Ferramentas"] = {
            mode = "Compra",
            locs = {
                { -38.8, -1660.8, 29.5 },
            },
            list = {
                ["ponta-britadeira"] = 1000,
                ["repairkit"] = 950,
                ["garrafa-vazia"] = 250,
                ["chavedefenda"] = 500,
            }
        },
        ["BurgerShot"] = {
            mode = "Compra",
            locs = {
                { -584.48, -613.53, 34.69 },
            },
            list = {
                ["xburguer"] = 1500,
                ["xgreen"] = 1500,
                ["sanduiche"] = 1500,
                ["suco"] = 1500,
                ["cola"] = 1500,
                ["sprunk"] = 1500,
            }
        },
        ["CluckinBell"] = {
            mode = "Compra",
            locs = {
                { -584.47, -594.92, 34.69 },
            },
            list = {
                ["suco"] = 1500,
                ["cola"] = 1500,
                ["sprunk"] = 1500,
                ["xburguer"] = 1500,
                ["sanduiche"] = 1500,
            }
        },
        ["Farmácia"] = {
            mode = "Compra",
            locs = {
                { 95.51, -230.39, 54.67 },
                { 318.39, -1076.92, 29.48 },
            },
            list = {
                ["bandagem"] = 300,
                ["adrenalina"] = 10000,
                ["paracetamil"] = 500,
                ["voltarom"] = 500,
                ["trandrylux"] = 500,
                ["dorfrex"] = 500,
                ["buscopom"] = 500,
            }
        },
        ["Arsenal"] = {
            mode = "Compra",
            perm_policia = "policia.permissao",
            locs = {
                { -947.68, -2041.85, 9.41 },
            },
            list = {
                ["wbody|WEAPON_COMBATPISTOL"] = 1,
                ["wbody|WEAPON_STUNGUN"] = 1,
                ["wbody|WEAPON_SMG"] = 1,
                ["wbody|WEAPON_SMG_MK2"] = 1,
                ["wbody|WEAPON_COMBATPDW"] = 1,
                ["wbody|WEAPON_PUMPSHOTGUN_MK2"] = 1,
                ["wbody|WEAPON_CARBINERIFLE_MK2"] = 1,
                ["wbody|WEAPON_SPECIALCARBINE"] = 1,
                ["wammo|WEAPON_BZGAS"] = 1,
                ["wammo|WEAPON_COMBATPISTOL"] = 1,
                ["wammo|WEAPON_SMG"] = 1,
                ["wammo|WEAPON_SMG_MK2"] = 1,
                ["wammo|WEAPON_COMBATPDW"] = 1,
                ["wammo|WEAPON_PUMPSHOTGUN_MK2"] = 1,
                ["wbody|WEAPON_CARBINERIFLE"] = 1,
                ["wammo|WEAPON_SPECIALCARBINE"] = 1,
            }
        },
        ["DigitalDen"] = {
            mode = "Compra",
            locs = {
                { -528.25, -584.2, 34.69 },
            },
            list = {
                ["celular"] = 15000,
            }
        },
        ["AmmuNation"] = {
            mode = "Compra",
            locs = {
                { 1692.62,3759.50,34.70 },
                { 252.89,-49.25,69.94 },
                { 843.28,-1034.02,28.19 },
                { -331.35,6083.45,31.45 },
                { -663.15,-934.92,21.82 },
                { -1305.18,-393.48,36.69 },
                { -1118.80,2698.22,18.55 },
                { 2568.83,293.89,108.73 },
                { -3172.68,1087.10,20.83 },
                { 21.32,-1106.44,29.79 },
                { 811.19,-2157.67,29.61 },
                { -543.51, -586.1, 34.69 },
            },
            list = {
                ["wbody|GADGET_PARACHUTE"] = 1000,
                ["wbody|WEAPON_KNIFE"] = 3500,
                ["wbody|WEAPON_BAT"] = 3500,
                ["wbody|WEAPON_BATTLEAXE"] = 3500,
                ["wbody|WEAPON_BOTTLE"] = 3500,
                ["wbody|WEAPON_CROWBAR"] = 3500,
                ["wbody|WEAPON_DAGGER"] = 3500,
                ["wbody|WEAPON_GOLFCLUB"] = 3500,
                ["wbody|WEAPON_HAMMER"] = 3500,
                ["wbody|WEAPON_MACHETE"] = 3500,
                ["wbody|WEAPON_SWITCHBLADE"] = 3500,
            }
        },
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- CRAFT DE ITENS
    -----------------------------------------------------------------------------------------------------------------------------------------
    craft_config = {
        ["Egito"] = {
            perm = "egito.permissao",
            locs = {
                { 1253.66, -227.34, 98.99 }
            },
            list = {
                ["wammo|WEAPON_MICROSMG"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_SPECIALCARBINE_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_PISTOL_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_SNSPISTOL_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_SMG_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_ASSAULTSMG"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_SAWNOFFSHOTGUN"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_ASSAULTRIFLE_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_COMPACTRIFLE"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_MACHINEPISTOL"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["roupas"] = { amount = 1, require = { ["couro"] = 10, ["nailon"] = 10 } },
                ["capuz"] = { amount = 1, require = { ["couro"] = 10, ["nailon"] = 10 } },
            }
        },
        ["Lakers"] = {
            perm = "lakers.permissao",
            locs = {
                { -1866.29, 2061.19, 135.44 }
            },
            list = {
                ["wammo|WEAPON_MICROSMG"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_SPECIALCARBINE_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_PISTOL_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_SNSPISTOL_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_SMG_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_ASSAULTSMG"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_SAWNOFFSHOTGUN"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_ASSAULTRIFLE_MK2"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_COMPACTRIFLE"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["wammo|WEAPON_MACHINEPISTOL"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
                ["roupas"] = { amount = 1, require = { ["couro"] = 10, ["nailon"] = 10 } },
                ["capuz"] = { amount = 1, require = { ["couro"] = 10, ["nailon"] = 10 } },
            }
        },
        ["Elitecar"] = {
            perm = "elitecar.permissao",
            locs = {
                { 1331.13, -685.44, 75.86 }
            },
            list = {
                ["lockpick"] = { amount = 1, require = { ["placasdeaco"] = 15, ["molas"] = 15 } },
                ["repairkit"] = { amount = 1, require = { ["placasdeaco"] = 15, ["caixa-vazia"] = 15, ["furadeira"] = 15, ["serra"] = 15 } },
                -- ["ticketcorrida"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
            }
        },
        ["Napoles"] = {
            perm = "napoles.permissao",
            locs = {
                { -345.47, -131.01, 39.01 }
            },
            list = {
                ["lockpick"] = { amount = 1, require = { ["placasdeaco"] = 15, ["molas"] = 15 } },
                ["repairkit"] = { amount = 1, require = { ["placasdeaco"] = 15, ["caixa-vazia"] = 15, ["furadeira"] = 15, ["serra"] = 15 } },
                -- ["ticketcorrida"] = { amount = 100, require = { ["polvora"] = 100, ["capsulas"] = 100 } },
            }
        },
        ["Grecia"] = {
            perm = "grecia.permissao",
            locs = {
                { 803.28, -293.72, 69.47 }
            },
            list = {
                ["metanfetamina"] = { amount = 20, require = { ["pseudoefedrina"] = 20, ["calcio-po"] = 20, ["plastico"] = 20 } },
                ["radio"] = { amount = 1, require = { ["plastico"] = 15, ["eletronicos"] = 15, ["baterias"] = 5, ["antena"] = 5 } },
                ["celular"] = { amount = 1, require = { ["plastico"] = 15, ["eletronicos"] = 15, ["baterias"] = 5, ["antena"] = 5 } },
                ["colete"] = { amount = 1, require = { ["nailon"] = 15, ["couro"] = 15, ["placasdeaco"] = 5 } },
            }
        },
        ["Complexo"] = {
            perm = "complexo.permissao",
            locs = {
                { -861.47, -1844.37, 31.3 }
            },
            list = {
                ["maconha"] = { amount = 20, require = { ["folhas-cannabis"] = 20, ["adubo"] = 20, ["plastico"] = 20 } },
                ["radio"] = { amount = 1, require = { ["plastico"] = 15, ["eletronicos"] = 15, ["baterias"] = 5, ["antena"] = 5 } },
                ["celular"] = { amount = 1, require = { ["plastico"] = 15, ["eletronicos"] = 15, ["baterias"] = 5, ["antena"] = 5 } },
                ["colete"] = { amount = 1, require = { ["nailon"] = 15, ["couro"] = 15, ["placasdeaco"] = 5 } },
            }
        },
        ["Beiramar"] = {
            perm = "beiramar.permissao",
            locs = {
                { 1380.26, -1298.07, 75.63 }
            },
            list = {
                ["cocaina"] = { amount = 20, require = { ["folhas-coca"] = 20, ["pasta-base"] = 20, ["plastico"] = 20 } },
                ["radio"] = { amount = 1, require = { ["plastico"] = 15, ["eletronicos"] = 15, ["baterias"] = 5, ["antena"] = 5 } },
                ["celular"] = { amount = 1, require = { ["plastico"] = 15, ["eletronicos"] = 15, ["baterias"] = 5, ["antena"] = 5 } },
                ["colete"] = { amount = 1, require = { ["nailon"] = 15, ["couro"] = 15, ["placasdeaco"] = 5 } },
            }
        },
        ["Vilarica"] = {
            perm = "vilarica.permissao",
            locs = {
                { 2040.8, 477.51, 170.98 }
            },
            list = {
                ["lsd"] = { amount = 20, require = { ["ergolina"] = 20, ["calcio-po"] = 20, ["plastico"] = 20 } },
                ["radio"] = { amount = 1, require = { ["plastico"] = 15, ["eletronicos"] = 15, ["baterias"] = 5, ["antena"] = 5 } },
                ["celular"] = { amount = 1, require = { ["plastico"] = 15, ["eletronicos"] = 15, ["baterias"] = 5, ["antena"] = 5 } },
                ["colete"] = { amount = 1, require = { ["nailon"] = 15, ["couro"] = 15, ["placasdeaco"] = 5 } },
            }
        },
        ["Holanda"] = {
            perm = "holanda.permissao",
            locs = {
                { 878.21, 1033.82, 283.68 }
            },
            list = {
                ["wbody|WEAPON_MICROSMG"] = { amount = 1, require = { ["placa-metal"] = 25, ["molas"] = 255, ["gatilho"] = 35, ["corpo-uzi"] = 50  } },
                ["wbody|WEAPON_SPECIALCARBINE_MK2"] = { amount = 1, require = { ["placa-metal"] = 65, ["molas"] = 40, ["gatilho"] = 40, ["corpo-g36c"] = 65  } },
                ["wbody|WEAPON_PISTOL_MK2"] = { amount = 1, require = { ["placa-metal"] = 20, ["molas"] = 20, ["gatilho"] = 20, ["corpo-fiveseven"] = 20  } },
                ["wbody|WEAPON_SNSPISTOL_MK2"] = { amount = 1, require = { ["placa-metal"] = 4, ["molas"] = 40, ["gatilho"] = 30  } },
                ["wbody|WEAPON_SMG_MK2"] = { amount = 1, require = { ["placa-metal"] = 25, ["molas"] = 25, ["gatilho"] = 25, ["corpo-mp5x"] = 50  } },
                ["wbody|WEAPON_ASSAULTSMG"] = { amount = 1, require = { ["placa-metal"] = 25, ["molas"] = 25, ["gatilho"] = 25, ["corpo-mtar"] = 50  } },
                ["wbody|WEAPON_SAWNOFFSHOTGUN"] = { amount = 1, require = { ["placa-metal"] = 30, ["molas"] = 30, ["gatilho"] = 30, ["corpo-doze-canocurto"] = 60  } },
                ["wbody|WEAPON_ASSAULTRIFLE_MK2"] = { amount = 1, require = { ["placa-metal"] = 65, ["molas"] = 40, ["gatilho"] = 40, ["corpo-ak47"] = 65  } },
                ["wbody|WEAPON_COMPACTRIFLE"] = { amount = 1, require = { ["placa-metal"] = 40, ["molas"] = 40, ["gatilho"] = 40, ["corpo-aks74u"] = 65  } },
                ["wbody|WEAPON_MACHINEPISTOL"] = { amount = 1, require = { ["placa-metal"] = 25, ["molas"] = 25, ["gatilho"] = 35, ["corpo-tec9"] = 50  } },
                ["c4"] = { amount = 1, require = { ["fitaisolante"] = 7, ["polvora"] = 5, ["plastico"] = 5, ["eletronicos"] = 5 } },
                ["energetico"] = { amount = 1, require = { ["cafeina"] = 7, ["agua"] = 5 } },
            }
        },
        ["Bratva"] = {
            perm = "bratva.permissao",
            locs = {
                { -2675.42, 1326.34, 140.89 }
            },
            list = {
                ["wbody|WEAPON_MICROSMG"] = { amount = 1, require = { ["placa-metal"] = 25, ["molas"] = 255, ["gatilho"] = 35, ["corpo-uzi"] = 50  } },
                ["wbody|WEAPON_SPECIALCARBINE_MK2"] = { amount = 1, require = { ["placa-metal"] = 65, ["molas"] = 40, ["gatilho"] = 40, ["corpo-g36c"] = 65  } },
                ["wbody|WEAPON_PISTOL_MK2"] = { amount = 1, require = { ["placa-metal"] = 20, ["molas"] = 20, ["gatilho"] = 20, ["corpo-fiveseven"] = 20  } },
                ["wbody|WEAPON_SNSPISTOL_MK2"] = { amount = 1, require = { ["placa-metal"] = 4, ["molas"] = 40, ["gatilho"] = 30  } },
                ["wbody|WEAPON_SMG_MK2"] = { amount = 1, require = { ["placa-metal"] = 25, ["molas"] = 25, ["gatilho"] = 25, ["corpo-mp5x"] = 50  } },
                ["wbody|WEAPON_ASSAULTSMG"] = { amount = 1, require = { ["placa-metal"] = 25, ["molas"] = 25, ["gatilho"] = 25, ["corpo-mtar"] = 50  } },
                ["wbody|WEAPON_SAWNOFFSHOTGUN"] = { amount = 1, require = { ["placa-metal"] = 30, ["molas"] = 30, ["gatilho"] = 30, ["corpo-doze-canocurto"] = 60  } },
                ["wbody|WEAPON_ASSAULTRIFLE_MK2"] = { amount = 1, require = { ["placa-metal"] = 65, ["molas"] = 40, ["gatilho"] = 40, ["corpo-ak47"] = 65  } },
                ["wbody|WEAPON_COMPACTRIFLE"] = { amount = 1, require = { ["placa-metal"] = 40, ["molas"] = 40, ["gatilho"] = 40, ["corpo-aks74u"] = 65  } },
                ["wbody|WEAPON_MACHINEPISTOL"] = { amount = 1, require = { ["placa-metal"] = 25, ["molas"] = 25, ["gatilho"] = 35, ["corpo-tec9"] = 50  } },
                ["energetico"] = { amount = 1, require = { ["cafeina"] = 7, ["agua"] = 5 } },
                ["c4"] = { amount = 1, require = { ["fitaisolante"] = 7, ["polvora"] = 5, ["plastico"] = 5, ["eletronicos"] = 5 } },
            }
        },
        ["Galaxy"] = {
            perm = "galaxy.permissao",
            locs = {
                { 389.38, 272.7, 95.0 }
            },
            list = {
                ["algemas"] = { amount = 1, require = { ["placasdeaco"] = 7, ["molas"] = 5 } },
                ["cordas"] = { amount = 1, require = { ["fibradearamida"] = 7, ["nailon"] = 5 } },
                ["keycard"] = { amount = 1, require = { ["tinta "] = 7, ["plastico"] = 5 } },
                ["pendrive"] = { amount = 1, require = { ["eletronicos"] = 7, ["plastico"] = 5 } },
            }
        },
        ["Cassino"] = {
            perm = "casino.permissao",
            locs = {
                { 973.83, 12.8, 71.84 }
            },
            list = {
                ["algemas"] = { amount = 1, require = { ["placasdeaco"] = 7, ["molas"] = 5 } },
                ["cordas"] = { amount = 1, require = { ["fibradearamida"] = 7, ["nailon"] = 5 } },
                ["keycard"] = { amount = 1, require = { ["tinta "] = 7, ["plastico"] = 5 } },
                ["pendrive"] = { amount = 1, require = { ["eletronicos"] = 7, ["plastico"] = 5 } },
            }
        }
    },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -- CASAS
    -----------------------------------------------------------------------------------------------------------------------------------------
    casas_localizacoes = {
    -----------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------FORTHILLS-----------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["FH01"] = {
            ["enter"] = { -866.68,457.38,88.28 },
            ["exit"] = { -868.38,464.75,73.31 },
            ["vault"] = { -876.09,481.92,72.81 }
        },
        ["FH02"] = {
            ["enter"] = { -884.29,517.72,92.44 },
            ["exit"] = { -894.57,491.41,76.14 },
            ["vault"] = { -878.30,500.87,75.64 }
        },
        ["FH03"] = {
            ["enter"] = { -842.84,466.65,87.59 },
            ["exit"] = { -828.34,463.77,79.49 },
            ["vault"] = { -811.00,471.09,78.99 }
        },
        ["FH04"] = {
            ["enter"] = { -848.68,508.62,90.81 },
            ["exit"] = { -848.24,519.68,82.76 },
            ["vault"] = { -838.68,503.47,82.27 }
        },
        ["FH05"] = {
            ["enter"] = { -873.57,562.67,96.61 },
            ["exit"] = { -856.53,566.61,83.67 },
            ["vault"] = { -871.83,577.57,83.18 }
        },
        ["FH06"] = {
            ["enter"] = { -904.55,588.12,101.19 },
            ["exit"] = { -884.15,603.39,93.80 },
            ["vault"] = { -902.32,608.30,93.30 }
        },
        ["FH07"] = {
            ["enter"] = { -958.04,604.24,101.55 },
            ["exit"] = { -932.55,634.75,97.75 },
            ["vault"] = { -951.33,635.89,97.25 }
        },
        ["FH08"] = {
            ["enter"] = { -907.63,544.89,100.39 },
            ["exit"] = { -912.08,529.13,80.97 },
            ["vault"] = { -902.74,545.47,80.47 }
        },
        ["FH09"] = {
            ["enter"] = { -1022.54,586.93,103.42 },
            ["exit"] = { -1029.37,567.66,87.99 },
            ["vault"] = { -1011.25,572.75,87.49 }
        },
        ["FH10"] = {
            ["enter"] = { -1090.14,548.74,103.63 },
            ["exit"] = { -1066.45,555.39,86.57 },
            ["vault"] = { -1079.83,568.63,86.07 }
        },
        ["FH11"] = {
            ["enter"] = { -950.07,465.14,80.80 },
            ["exit"] = { -930.56,469.37,74.62 },
            ["vault"] = { -941.58,484.63,74.12 }
        },
        ["FH12"] = {
            ["enter"] = { -967.05,510.58,82.06 },
            ["exit"] = { -953.19,527.85,74.11 },
            ["vault"] = { -971.06,533.74,73.62 }
        },
        ["FH13"] = {
            ["enter"] = { -997.09,517.92,83.57 },
            ["exit"] = { -989.80,525.66,72.72 },
            ["vault"] = { -987.15,544.30,72.22 }
        },
        ["FH14"] = {
            ["enter"] = { -1040.16,508.21,84.38 },
            ["exit"] = { -1054.04,534.84,71.21 },
            ["vault"] = { -1064.92,519.47,70.71 }
        },
        ["FH15"] = {
            ["enter"] = { -1087.44,479.26,81.32 },
            ["exit"] = { -1067.10,473.60,71.79 },
            ["vault"] = { -1061.39,491.54,71.29 }
        },
        ["FH16"] = {
            ["enter"] = { -1019.15,718.67,163.99 },
            ["exit"] = { -1017.60,740.45,155.49 },
            ["vault"] = { -1014.85,721.82,154.99 }
        },
        ["FH17"] = {
            ["enter"] = { -1052.29,432.10,77.06 },
            ["exit"] = { -1035.01,429.99,66.73 },
            ["vault"] = { -1043.52,446.78,66.23 }
        },
        ["FH18"] = {
            ["enter"] = { -1009.56,479.16,79.59 },
            ["exit"] = { -1011.22,460.49,68.84 },
            ["vault"] = { -1006.72,478.76,68.34 }
        },
        ["FH19"] = {
            ["enter"] = { -968.83,436.67,80.76 },
            ["exit"] = { -965.87,437.78,70.18 },
            ["vault"] = { -976.06,453.60,69.68 }
        },
        ["FH20"] = {
            ["enter"] = { -1107.80,594.46,104.45 },
            ["exit"] = { -1115.30,603.96,95.35 },
            ["vault"] = { -1128.46,590.50,94.85 }
        },
        ["FH21"] = {
            ["enter"] = { -824.87,422.11,92.12 },
            ["exit"] = { -814.49,419.06,81.88 },
            ["vault"] = { -832.25,412.83,81.38 }
        },
        ["FH22"] = {
            ["enter"] = { -762.14,430.86,100.19 },
            ["exit"] = { -760.33,407.34,87.16 },
            ["vault"] = { -744.92,418.15,86.66 }
        },
        ["FH23"] = {
            ["enter"] = { -717.86,448.64,106.90 },
            ["exit"] = { -718.91,438.17,98.52 },
            ["vault"] = { -704.50,450.28,98.02 }
        },
        ["FH24"] = {
            ["enter"] = { -721.33,490.39,109.38 },
            ["exit"] = { -731.10,508.84,101.76 },
            ["vault"] = { -745.51,496.72,100.36 }
        },
        ["FH25"] = {
            ["enter"] = { -784.66,459.69,100.38 },
            ["exit"] = { -765.97,478.65,91.87 },
            ["vault"] = { -779.86,491.35,91.38 }
        },
        ["FH26"] = {
            ["enter"] = { -679.11,512.01,113.52 },
            ["exit"] = { -680.98,523.37,100.84 },
            ["vault"] = { -691.40,539.04,100.34 }
        },
        ["FH27"] = {
            ["enter"] = { -667.35,471.80,114.13 },
            ["exit"] = { -676.09,470.54,99.41 },
            ["vault"] = { -666.24,454.49,99.02 }
        },
        ["FH28"] = {
            ["enter"] = { -641.00,520.53,109.88 },
            ["exit"] = { -640.76,519.56,100.74 },
            ["vault"] = { -623.90,527.92,100.24 }
        },
        ["FH29"] = {
            ["enter"] = { -580.35,492.21,108.90 },
            ["exit"] = { -570.30,476.27,99.96 },
            ["vault"] = { -578.28,493.32,99.46 }
        },
        ["FH30"] = {
            ["enter"] = { -622.69,488.89,108.87 },
            ["exit"] = { -624.58,469.88,97.81 },
            ["vault"] = { -607.67,478.15,97.31 }
        },
        ["FH31"] = {
            ["enter"] = { -595.59,530.24,107.75 },
            ["exit"] = { -614.29,553.28,101.92 },
            ["vault"] = { -603.81,537.65,100.52 }
        },
        ["FH32"] = {
            ["enter"] = { -561.10,402.64,101.80 },
            ["exit"] = { -552.73,386.80,82.86 },
            ["vault"] = { -563.82,402.01,82.36 }
        },
        ["FH33"] = {
            ["enter"] = { -595.50,393.07,101.88 },
            ["exit"] = { -583.31,376.16,80.29 },
            ["vault"] = { -589.43,393.96,79.79 }
        },
        ["FH34"] = {
            ["enter"] = { -500.05,398.29,98.27 },
            ["exit"] = { -482.06,360.78,93.38 },
            ["vault"] = { -477.03,378.92,92.88 }
        },
        ["FH35"] = {
            ["enter"] = { -469.47,329.39,104.74 },
            ["exit"] = { -472.27,323.28,83.78 },
            ["vault"] = { -469.14,341.84,83.28 }
        },
        ["FH36"] = {
            ["enter"] = { -443.98,342.88,105.62 },
            ["exit"] = { -426.24,323.96,82.83 },
            ["vault"] = { -435.59,340.29,82.34 }
        },
        ["FH37"] = {
            ["enter"] = { -409.57,341.27,108.90 },
            ["exit"] = { -407.07,324.15,95.58 },
            ["vault"] = { -388.99,329.39,95.08 }
        },
        ["FH38"] = {
            ["enter"] = { -327.78,369.69,110.00 },
            ["exit"] = { -330.08,348.45,99.14 },
            ["vault"] = { -314.70,359.30,98.64 }
        },
        ["FH39"] = {
            ["enter"] = { -298.07,380.34,112.09 },
            ["exit"] = { -296.69,365.93,102.63 },
            ["vault"] = { -286.50,350.11,102.13 }
        },
        ["FH40"] = {
            ["enter"] = { -239.06,381.74,112.62 },
            ["exit"] = { -246.52,387.60,100.54 },
            ["vault"] = { -262.55,377.72,100.04 }
        },
        ["FH41"] = {
            ["enter"] = { -213.78,399.61,111.30 },
            ["exit"] = { -208.00,381.73,99.87 },
            ["vault"] = { -191.88,391.44,99.37 }
        },
        ["FH42"] = {
            ["enter"] = { -166.43,423.89,111.80 },
            ["exit"] = { -168.64,401.31,99.24 },
            ["vault"] = { -152.44,410.88,98.74 }
        },
        ["FH43"] = {
            ["enter"] = { -371.45,407.55,110.49 },
            ["exit"] = { -352.38,403.21,101.30 },
            ["vault"] = { -337.34,413.97,101.19 }
        },
        ["FH44"] = {
            ["enter"] = { -304.78,431.12,110.48 },
            ["exit"] = { -310.78,411.44,101.16 },
            ["vault"] = { -293.92,419.81,100.66 }
        },
        ["FH45"] = {
            ["enter"] = { -450.91,395.23,104.77 },
            ["exit"] = { -455.80,385.71,91.60 },
            ["vault"] = { -451.03,367.50,91.10 }
        },
        ["FH46"] = {
            ["enter"] = { -517.08,433.57,97.80 },
            ["exit"] = { -513.50,435.92,88.39 },
            ["vault"] = { -497.25,426.42,87.89 }
        },
        ["FH47"] = {
            ["enter"] = { -532.76,464.69,103.19 },
            ["exit"] = { -518.77,479.86,92.45 },
            ["vault"] = { -536.73,485.50,91.95 }
        },
        ["FH48"] = {
            ["enter"] = { -526.60,517.00,112.94 },
            ["exit"] = { -515.31,513.65,95.93 },
            ["vault"] = { -531.62,522.82,95.33 }
        },
        ["FH49"] = {
            ["enter"] = { -520.69,594.17,120.83 },
            ["exit"] = { -538.86,576.66,107.27 },
            ["vault"] = { -521.77,584.69,106.67 }
        },
        ["FH50"] = {
            ["enter"] = { -474.30,585.86,128.68 },
            ["exit"] = { -471.25,599.92,118.97 },
            ["vault"] = { -465.85,581.89,117.57 }
        },
        ["FH51"] = {
            ["enter"] = { -500.70,551.92,120.60 },
            ["exit"] = { -491.24,525.36,101.12 },
            ["vault"] = { -489.12,543.72,100.91 }
        },
        ["FH52"] = {
            ["enter"] = { -459.33,537.00,121.46 },
            ["exit"] = { -469.26,516.75,106.46 },
            ["vault"] = { -451.02,519.68,106.24 }
        },
        ["FH53"] = {
            ["enter"] = { -426.12,535.56,122.17 },
            ["exit"] = { -433.23,517.34,107.44 },
            ["vault"] = { -414.81,515.89,107.23 }
        },
        ["FH54"] = {
            ["enter"] = { -386.59,504.49,120.41 },
            ["exit"] = { -384.97,502.68,109.93 },
            ["vault"] = { -402.92,507.08,109.72 }
        },
        ["FH55"] = {
            ["enter"] = { -354.84,470.02,112.51 },
            ["exit"] = { -372.18,462.04,105.75 },
            ["vault"] = { -362.70,446.18,105.54 }
        },
        ["FH56"] = {
            ["enter"] = { -406.38,567.59,124.60 },
            ["exit"] = { -401.39,587.34,116.34 },
            ["vault"] = { -419.27,591.99,116.13 }
        },
        ["FH57"] = {
            ["enter"] = { -378.53,548.21,123.85 },
            ["exit"] = { -382.18,541.51,115.07 },
            ["vault"] = { -365.21,534.19,114.86 }
        },
        ["FH58"] = {
            ["enter"] = { -349.03,515.23,120.64 },
            ["exit"] = { -350.88,513.60,111.53 },
            ["vault"] = { -334.70,504.68,111.32 }
        },
        ["FH59"] = {
            ["enter"] = { -311.84,474.95,111.82 },
            ["exit"] = { -293.84,482.83,100.24 },
            ["vault"] = { -307.02,469.89,100.02 }
        },
        ["FH60"] = {
            ["enter"] = { -615.57,398.25,101.62 },
            ["exit"] = { -630.30,382.60,82.35 },
            ["vault"] = { -624.95,364.91,82.14 }
        },
        ["FH61"] = {
            ["enter"] = { -1193.09,564.02,100.33 },
            ["exit"] = { -1198.97,583.38,89.55 },
            ["vault"] = { -1216.12,576.51,89.33 }
        },
        ["FH62"] = {
            ["enter"] = { -1122.84,486.31,82.35 },
            ["exit"] = { -1108.62,502.73,71.47 },
            ["vault"] = { -1127.01,500.90,71.26 }
        },
        ["FH63"] = {
            ["enter"] = { -1158.90,481.57,86.09 },
            ["exit"] = { -1156.77,498.95,77.39 },
            ["vault"] = { -1174.14,492.66,77.18 }
        },
        ["FH64"] = {
            ["enter"] = { -1215.60,457.89,92.06 },
            ["exit"] = { -1217.93,457.65,72.24 },
            ["vault"] = { -1235.21,451.11,72.03 }
        },
        ["FH65"] = {
            ["enter"] = { -1174.63,440.13,86.84 },
            ["exit"] = { -1158.45,434.28,74.36 },
            ["vault"] = { -1161.46,452.51,74.15 }
        },
        ["FH66"] = {
            ["enter"] = { -1094.10,427.26,75.88 },
            ["exit"] = { -1108.65,433.34,60.51 },
            ["vault"] = { -1105.68,415.11,60.29 }
        },
        ["FH67"] = {
            ["enter"] = { -1308.17,449.37,100.97 },
            ["exit"] = { -1323.28,433.48,69.96 },
            ["vault"] = { -1317.93,415.80,69.75 }
        },
        ["FH68"] = {
            ["enter"] = { -1371.50,444.00,105.85 },
            ["exit"] = { -1367.32,428.37,90.70 },
            ["vault"] = { -1349.01,430.84,90.49 }
        },
        ["FH69"] = {
            ["enter"] = { -1413.47,462.12,109.20 },
            ["exit"] = { -1412.72,438.32,101.06 },
            ["vault"] = { -1411.50,456.76,100.85 }
        },
        ["FH70"] = {
            ["enter"] = { -1339.42,471.18,106.40 },
            ["exit"] = { -1345.87,490.86,91.77 },
            ["vault"] = { -1340.52,473.18,91.56 }
        },
        ["FH71"] = {
            ["enter"] = { -1500.65,523.11,118.27 },
            ["exit"] = { -1504.79,545.48,110.48 },
            ["vault"] = { -1517.91,532.48,110.27 }
        },
        ["FH72"] = {
            ["enter"] = { -1452.76,545.39,120.79 },
            ["exit"] = { -1461.93,558.76,113.24 },
            ["vault"] = { -1462.07,540.29,113.03 }
        },
        ["FH73"] = {
            ["enter"] = { -1404.78,561.71,125.40 },
            ["exit"] = { -1409.54,558.81,113.38 },
            ["vault"] = { -1391.46,562.59,113.17 }
        },
        ["FH74"] = {
            ["enter"] = { -1364.45,569.85,134.97 },
            ["exit"] = { -1377.31,583.53,120.72 },
            ["vault"] = { -1380.21,565.28,120.51 }
        },
        ["FH75"] = {
            ["enter"] = { -1367.34,610.88,133.88 },
            ["exit"] = { -1369.60,618.19,120.99 },
            ["vault"] = { -1385.92,609.54,120.78 }
        },
        ["FH76"] = {
            ["enter"] = { -1291.95,650.23,141.50 },
            ["exit"] = { -1298.26,668.83,128.39 },
            ["vault"] = { -1313.74,658.75,128.18 }
        },
        ["FH77"] = {
            ["enter"] = { -1241.25,674.48,142.81 },
            ["exit"] = { -1268.79,687.77,138.62 },
            ["vault"] = { -1255.92,674.52,138.41 }
        },
        ["FH78"] = {
            ["enter"] = { -1218.49,665.31,144.53 },
            ["exit"] = { -1193.60,658.55,121.88 },
            ["vault"] = { -1209.24,668.38,121.67 }
        },
        ["FH79"] = {
            ["enter"] = { -1196.68,693.24,147.42 },
            ["exit"] = { -1181.16,689.61,132.13 },
            ["vault"] = { -1199.28,693.24,131.92 }
        },
        ["FH80"] = {
            ["enter"] = { -498.03,683.36,151.85 },
            ["exit"] = { -508.49,693.42,139.07 },
            ["vault"] = { -504.45,675.39,138.85 }
        },
        ["FH81"] = {
            ["enter"] = { -446.08,686.36,153.11 },
            ["exit"] = { -461.50,708.77,143.88 },
            ["vault"] = { -465.34,690.70,143.67 }
        },
        ["FH82"] = {
            ["enter"] = { -564.69,684.28,146.41 },
            ["exit"] = { -570.29,696.80,137.07 },
            ["vault"] = { -552.32,692.51,136.85 }
        },
        ["FH83"] = {
            ["enter"] = { -533.60,709.54,153.15 },
            ["exit"] = { -535.38,733.28,147.18 },
            ["vault"] = { -517.55,728.45,146.97 }
        },
        ["FH84"] = {
            ["enter"] = { -352.99,668.33,169.07 },
            ["exit"] = { -350.30,688.33,163.04 },
            ["vault"] = { -342.23,671.71,162.83 }
        },
        ["FH85"] = {
            ["enter"] = { -495.46,738.48,163.02 },
            ["exit"] = { -497.84,764.10,156.14 },
            ["vault"] = { -515.82,768.37,155.93 }
        },
        ["FH86"] = {
            ["enter"] = { -494.04,796.09,184.34 },
            ["exit"] = { -504.65,783.06,167.15 },
            ["vault"] = { -486.99,788.51,166.94 }
        },
        ["FH87"] = {
            ["enter"] = { -599.80,807.41,191.37 },
            ["exit"] = { -599.91,816.90,182.54 },
            ["vault"] = { -587.78,802.97,182.33 }
        },
        ["FH88"] = {
            ["enter"] = { -6.51,408.97,120.28 },
            ["exit"] = { -11.38,412.55,109.83 },
            ["vault"] = { -00.70,397.47,109.62 }
        },
        ["FH89"] = {
            ["enter"] = { 39.91,361.52,116.04 },
            ["exit"] = { 38.04,376.05,107.79 },
            ["vault"] = { 54.86,368.41,107.58 }
        },
        ["FH90"] = {
            ["enter"] = { -1130.87,784.45,163.88 },
            ["exit"] = { -1141.39,793.11,155.15 },
            ["vault"] = { -1124.29,786.12,154.94 }
        },
        ["FH91"] = {
            ["enter"] = { -962.66,814.27,177.75 },
            ["exit"] = { -973.62,822.82,167.69 },
            ["vault"] = { -967.40,805.42,167.48 }
        },
        ["FH92"] = {
            ["enter"] = { -931.92,809.034,184.78 },
            ["exit"] = { -936.52,822.25,177.01 },
            ["vault"] = { -930.09,804.93,176.80 }
        },
        ["FH93"] = {
            ["enter"] = { -998.23,768.61,171.58 },
            ["exit"] = { -998.34,770.35,148.35 },
            ["vault"] = { -1008.46,785.81,148.14 }
        },
        ["FH94"] = {
            ["enter"] = { -824.03,805.96,202.78 },
            ["exit"] = { -822.38,790.97,189.19 },
            ["vault"] = { -807.21,801.51,188.98 }
        },
        ["FH95"] = {
            ["enter"] = { -109.98,502.06,143.42 },
            ["exit"] = { -110.58,508.58,121.66 },
            ["vault"] = { -128.98,506.94,121.45 }
        },
        ["FH96"] = {
            ["enter"] = { -66.66,489.99,144.88 },
            ["exit"] = { -65.11,489.06,127.05 },
            ["vault"] = { -83.52,490.52,126.83 }
        },
        ["FH97"] = {
            ["enter"] = { 42.96,468.81,148.09 },
            ["exit"] = { 36.55,490.17,138.13 },
            ["vault"] = { 39.74,471.98,137.92 }
        },
        ["FH98"] = {
            ["enter"] = { 80.02,486.26,148.20 },
            ["exit"] = { 78.26,504.69,139.75 },
            ["vault"] = { 64.60,492.25,139.53 }
        },
        ["FH99"] = {
            ["enter"] = { 119.91,494.04,147.34 },
            ["exit"] = { 122.70,513.47,138.10 },
            ["vault"] = { 105.95,505.69,137.89 }
        },
        ["FH100"] = {
            ["enter"] = { -72.86,428.46,113.03 },
            ["exit"] = { -103.24,434.91,103.59 },
            ["vault"] = { -84.77,434.73,103.38 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------LUXURY--------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------	
        ["LX01"] = {
            ["enter"] = { -842.22,-25.13,40.39 },
            ["exit"] = { -850.84,-12.92,34.01 }, 
            ["vault"] = { -848.49,-21.07,34.01 }
        },
        ["LX02"] = {
            ["enter"] = { -896.48,-5.14,43.79 },
            ["exit"] = { -916.17,-18.41,35.74 },
            ["vault"] = { -910.73,-12.16,35.77 }
        },
        ["LX03"] = {
            ["enter"] = { -888.44,42.44,49.14 },
            ["exit"] = { -900.28,36.07,42.91 },
            ["vault"] = { -898.03,44.22,42.92 }
        },
        ["LX04"] = {
            ["enter"] = { -971.41,122.07,57.04 },
            ["exit"] = { -984.70,129.26,46.45 },
            ["vault"] = { -978.42,123.85,46.48 }
        },
        ["LX05"] = {
            ["enter"] = { -1896.39,642.61,130.20 },
            ["exit"] = { -1896.34,650.36,121.16 },
            ["vault"] = { -1889.08,646.38,121.19 }
        },
        ["LX06"] = {
            ["enter"] = { -998.29,157.56,62.31 },
            ["exit"] = { -1007.65,166.98,50.05 },
            ["vault"] = { -1002.98,160.13,50.06 }
        },
        ["LX07"] = {
            ["enter"] = { -1038.57,222.41,64.37 },
            ["exit"] = { -1052.44,228.87,58.63 },
            ["vault"] = { -1044.42,230.95,58.66 }
        },
        ["LX08"] = {
            ["enter"] = { -949.43,196.57,67.39 },
            ["exit"] = { -948.92,194.35,61.81 },
            ["vault"] = { -948.93,202.63,61.84 }
        },
        ["LX09"] = {
            ["enter"] = { -903.10,191.68,69.44 },
            ["exit"] = { -899.17,173.96,61.13 },
            ["vault"] = { -901.62,181.96,61.79 }
        },
        ["LX10"] = {
            ["enter"] = { -913.72,108.30,55.51 },
            ["exit"] = { -916.07,118.40,48.54 },
            ["vault"] = { -907.89,119.73,48.56 }
        },
        ["LX11"] = {
            ["enter"] = { -930.20,19.26,48.52 },
            ["exit"] = { -947.77,20.11,42.03 },
            ["vault"] = { -942.29,26.32,42.06 }
        },
        ["LX12"] = {
            ["enter"] = { -830.80,115.13,55.83 },
            ["exit"] = { -837.24,116.07,48.74 },
            ["vault"] = { -829.36,118.62,48.77 }
        },
        ["LX13"] = {
            ["enter"] = { -1048.07,312.88,66.90 },
            ["exit"] = { -1051.65,304.05,60.56 },
            ["vault"] = { -1044.81,308.72,60.59 }
        },
        ["LX14"] = {
            ["enter"] = { -819.72,268.16,86.39 },
            ["exit"] = { -836.18,271.86,74.29 },
            ["vault"] = { -827.86,272.10,74.30 }
        },
        ["LX15"] = {
            ["enter"] = { -876.63,305.95,84.14 },
            ["exit"] = { -891.67,312.83,77.92 },
            ["vault"] = { -883.81,310.22,77.95 }
        },
        ["LX16"] = {
            ["enter"] = { -881.48,363.73,85.36 },
            ["exit"] = { -880.14,350.76,78.81 },
            ["vault"] = { -882.75,358.62,78.83 }
        },
        ["LX17"] = {
            ["enter"] = { -1026.13,360.53,71.36 },
            ["exit"] = { -1041.33,351.27,63.76 },
            ["vault"] = { -1040.74,359.54,63.79 }
        },
        ["LX18"] = {
            ["enter"] = { -1539.92,421.50,110.01 },
            ["exit"] = { -1563.03,411.75,101.25 },
            ["vault"] = { -1555.30,415.71,101.25 }
        },
        ["LX19"] = {
            ["enter"] = { -1189.94,291.96,69.89 },
            ["exit"] = { -1202.28,290.88,63.33 },
            ["vault"] = { -1195.28,295.31,63.36 }
        },
        ["LX20"] = {
            ["enter"] = { -1135.62,375.86,71.29 },
            ["exit"] = { -1145.76,375.91,65.79 },
            ["vault"] = { -1137.80,373.63,65.81 }
        },
        ["LX21"] = {
            ["enter"] = { -1467.65,34.79,54.54 },
            ["exit"] = { -1483.52,33.11,46.69 },
            ["vault"] = { -1475.27,33.82,46.72 }
        },
        ["LX22"] = {
            ["enter"] = { -1465.16,-34.49,55.05 },
            ["exit"] = { -1483.05,-28.22,50.05 },
            ["vault"] = { -1476.29,-33.01,50.08 }
        },
        ["LX23"] = {
            ["enter"] = { -1515.37,23.78,56.82 },
            ["exit"] = { -1538.14,16.82,50.99 },
            ["vault"] = { -1529.88,17.45,51.02 }
        },
        ["LX24"] = {
            ["enter"] = { -1549.43,-90.31,54.92 },
            ["exit"] = { -1558.27,-92.66,47.84 },
            ["vault"] = { -1555.95,-100.62,47.86 }
        },
        ["LX25"] = {
            ["enter"] = { -1580.37,-33.93,57.56 },
            ["exit"] = { -1586.84,-21.06,52.79 },
            ["vault"] = { -1584.67,-29.05,52.81 }
        },
        ["LX26"] = {
            ["enter"] = { -1570.66,22.33,59.55 },
            ["exit"] = { -1591.26,22.59,54.82 },
            ["vault"] = { -1582.99,23.13,54.85 }
        },
        ["LX27"] = {
            ["enter"] = { -1629.95,36.41,62.93 },
            ["exit"] = { -1647.38,32.65,58.86 },
            ["vault"] = { -1639.21,31.26,58.88 }
        },
        ["LX28"] = {
            ["enter"] = { -1899.02,132.57,81.98 },
            ["exit"] = { -1908.23,138.48,75.62 },
            ["vault"] = { -1901.82,133.22,75.65 }
        },
        ["LX29"] = {
            ["enter"] = { -1931.75,163.07,84.65 },
            ["exit"] = { -1951.95,175.64,78.79 },
            ["vault"] = { -1945.43,70.52,78.82 }
        },
        ["LX30"] = {
            ["enter"] = { -1961.19,212.07,86.80 },
            ["exit"] = { -1961.06,190.96,81.51 },
            ["vault"] = { -1966.29,197.37,81.53 }
        },
        ["LX31"] = {
            ["enter"] = { -1970.28,246.14,87.81 },
            ["exit"] = { -1974.44,233.68,80.00 },
            ["vault"] = { -1979.07,240.55,80.03 }
        },
        ["LX32"] = {
            ["enter"] = { -1995.18,300.35,91.96 },
            ["exit"] = { -2017.13,301.24,84.31 },
            ["vault"] = { -2010.04,305.53,84.34 }
        },
        ["LX33"] = {
            ["enter"] = { -2009.04,367.39,94.81 },
            ["exit"] = { -1999.87,385.49,89.59 },
            ["vault"] = { -2007.81,383.12,89.62 }
        },
        ["LX34"] = {
            ["enter"] = { -2011.15,445.20,103.01 },
            ["exit"] = { -2022.77,462.62,96.76 },
            ["vault"] = { -2018.26,455.67,96.78 }
        },
        ["LX35"] = {
            ["enter"] = { -2014.85,499.98,107.17 },
            ["exit"] = { -2028.72,485.17,103.40 },
            ["vault"] = { -2028.75,493.45,103.43 }
        },
        ["LX36"] = {
            ["enter"] = { -1873.75,201.73,84.29 },
            ["exit"] = { -1866.55,193.32,75.24 },
            ["vault"] = { -1861.40,199.80,75.27 }
        },
        ["LX37"] = {
            ["enter"] = { -1905.64,253.00,86.45 },
            ["exit"] = { -1902.53,262.61,81.44 },
            ["vault"] = { -1896.66,256.62,82.11 }
        },
        ["LX38"] = {
            ["enter"] = { -1923.13,298.23,89.28 },
            ["exit"] = { -1918.06,308.11,82.64 },
            ["vault"] = { -1913.80,300.87,82.64 }
        },
        ["LX39"] = {
            ["enter"] = { -1931.74,362.46,93.78 },
            ["exit"] = { -1924.76,372.59,89.27 },
            ["vault"] = { -1921.04,365.06,89.28 }
        },
        ["LX40"] = {
            ["enter"] = { -1940.65,387.56,96.50 },
            ["exit"] = { -1934.89,384.85,89.42 },
            ["vault"] = { -1938.61,392.39,89.43 }
        },
        ["LX41"] = {
            ["enter"] = { -1942.79,449.69,102.92 },
            ["exit"] = { -1934.60,430.92,94.48 },
            ["vault"] = { -1938.36,438.40,94.49 }
        },
        ["LX42"] = {
            ["enter"] = { -1838.43,314.47,91.11 },
            ["exit"] = { -1857.61,303.66,80.33 },
            ["vault"] = { -1850.50,308.14,80.33 }
        },
        ["LX43"] = {
            ["enter"] = { -1808.04,333.11,89.56 },
            ["exit"] = { -1810.26,323.99,83.08 },
            ["vault"] = { -1804.35,329.97,83.08 }
        },
        ["LX44"] = {
            ["enter"] = { -1733.15,379.03,89.72 },
            ["exit"] = { -1714.36,379.83,84.05 },
            ["vault"] = { -1720.13,373.72,84.05 }
        },
        ["LX45"] = {
            ["enter"] = { -1673.26,385.62,89.34 },
            ["exit"] = { -1688.87,386.00,78.08 },
            ["vault"] = { -1680.56,387.24,78.09 }
        },
        ["LX46"] = {
            ["enter"] = { -1804.83,436.42,128.81 },
            ["exit"] = { -1817.51,434.32,112.80 },
            ["vault"] = { -1809.55,437.01,112.80 }
        },
        ["LX47"] = {
            ["enter"] = { -1996.35,591.42,118.09 },
            ["exit"] = { -2005.72,586.68,112.53 },
            ["vault"] = { -2006.43,595.05,112.53 }
        },
        ["LX48"] = {
            ["enter"] = { -1938.35,551.09,114.82 },
            ["exit"] = { -1938.28,529.58,99.54 },
            ["vault"] = { -1937.83,537.98,99.54 }
        },
        ["LX49"] = {
            ["enter"] = { -1929.00,595.34,122.28 },
            ["exit"] = { -1929.75,578.35,106.04 },
            ["vault"] = { -1929.65,586.76,106.04 }
        },
        ["LX50"] = {
            ["enter"] = { -1974.63,631.13,122.68 },
            ["exit"] = { -1987.54,625.64,116.42 },
            ["vault"] = { -1986.54,633.98,116.43 }
        },
        ["LX51"] = {
            ["enter"] = { -151.75,910.64,235.65 },
            ["exit"] = { -146.30,892.68,225.79 },
            ["vault"] = { -153.88,896.32,225.79 }
        },
        ["LX52"] = {
            ["enter"] = { -181.14,961.65,237.74 },
            ["exit"] = { -180.50,976.54,222.43 },
            ["vault"] = { -183.24,984.48,222.43 }
        },
        ["LX53"] = {
            ["enter"] = { -113.02,986.15,235.75 },
            ["exit"] = { -111.04,990.54,228.28 },
            ["vault"] = { -104.29,995.55,228.28 }
        },
        ["LX54"] = {
            ["enter"] = { -85.66,834.74,235.92 },
            ["exit"] = { -91.18,828.76,220.92 },
            ["vault"] = { -83.71,832.62,220.93 }
        },
        ["LX55"] = {
            ["enter"] = { 228.63,765.66,204.96 },
            ["exit"] = { 225.32,748.34,194.51 },
            ["vault"] = { 227.21,756.53,194.51 }
        },
        ["LX56"] = {
            ["enter"] = { 232.20,672.14,189.97 },
            ["exit"] = { 227.16,640.85,181.16 },
            ["vault"] = { 226.79,649.24,181.16 }
        },
        ["LX57"] = {
            ["enter"] = { 150.86,556.29,183.73 },
            ["exit"] = { 154.17,560.39,174.08 },
            ["vault"] = { 161.56,564.40,174.08 }
        },
        ["LX58"] = {
            ["enter"] = { 84.91,561.92,182.73 },
            ["exit"] = { 71.39,553.94,167.38 },
            ["vault"] = { 79.27,556.88,167.38 }
        },
        ["LX59"] = {
            ["enter"] = { 46.05,555.92,180.08 },
            ["exit"] = { 34.60,545.05,166.61 },
            ["vault"] = { 40.71,550.81,166.61 }
        },
        ["LX60"] = {
            ["enter"] = { -126.52,588.27,204.70 },
            ["exit"] = { -137.33,586.79,185.54 },
            ["vault"] = { -129.16,586.68,185.55 }
        },
        ["LX61"] = {
            ["enter"] = { -189.34,617.50,199.66 },
            ["exit"] = { -181.03,612.23,192.39 },
            ["vault"] = { -183.72,620.19,192.39 }
        },
        ["LX62"] = {
            ["enter"] = { -185.43,591.21,197.82 },
            ["exit"] = { -197.74,580.62,177.84 },
            ["vault"] = { -189.77,583.28,177.84 }
        },
        ["LX63"] = {
            ["enter"] = { -232.50,588.18,190.53 },
            ["exit"] = { -248.89,582.69,179.17 },
            ["vault"] = { -240.89,585.25,179.17 }
        },
        ["LX64"] = {
            ["enter"] = { -293.35,600.83,181.57 },
            ["exit"] = { -298.13,585.55,165.64 },
            ["vault"] = { -290.09,587.98,165.65 }
        },
        ["LX65"] = {
            ["enter"] = { -245.81,620.88,187.81 },
            ["exit"] = { -233.36,624.12,176.03 },
            ["vault"] = { -241.72,623.29,176.03 }
        },
        ["LX66"] = {
            ["enter"] = { -340.52,625.71,171.35 },
            ["exit"] = { -315.12,608.58,161.10 },
            ["vault"] = { -323.47,609.52,161.11 }
        },
        ["LX67"] = {
            ["enter"] = { 325.01,537.22,153.86 },
            ["exit"] = { 306.16,533.95,143.67 },
            ["vault"] = { 303.36,541.88,143.67 }
        },
        ["LX68"] = {
            ["enter"] = { 315.82,502.03,153.17 },
            ["exit"] = { 310.81,486.42,141.37 },
            ["vault"] = { 306.17,493.43,141.38 }
        },
        ["LX69"] = {
            ["enter"] = { 331.62,465.69,151.22 },
            ["exit"] = { 325.34,453.71,136.37 },
            ["vault"] = { 320.01,460.21,136.37 }
        },
        ["LX70"] = {
            ["enter"] = { 223.38,514.41,140.76 },
            ["exit"] = { 203.74,484.49,125.05 },
            ["vault"] = { 207.29,492.11,125.06 }
        },	
    -----------------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------SAMIR-------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["LS01"] = {
            ["enter"] = { 1301.10,-573.77,71.73 },
            ["exit"] = { 1296.07,-596.39,67.83 },
            ["vault"] = { 1306.00,-586.12,67.83 }
        },
        ["LS02"] = {
            ["enter"] = { 1323.42,-583.00,73.24 },
            ["exit"] = { 1314.50,-601.42,67.83 },
            ["vault"] = { 1324.47,-590.93,67.83 }
        },
        ["LS03"] = {
            ["enter"] = { 1341.61,-597.28,74.70 },
            ["exit"] = { 1330.62,-615.92,67.83 },
            ["vault"] = { 1342.79,-607.48,67.83 }
        },
        ["LS04"] = {
            ["enter"] = { 1367.20,-606.17,74.71 },
            ["exit"] = { 1367.08,-626.54,67.83 },
            ["vault"] = { 1371.83,-612.82,67.83 }
        },
        ["LS05"] = {
            ["enter"] = { 1385.96,-593.34,74.48 },
            ["exit"] = { 1381.58,-593.49,67.83 },
            ["vault"] = { 1389.48,-605.75,67.83 }
        },
        ["LS06"] = {
            ["enter"] = { 1388.90,-569.55,74.49 },
            ["exit"] = { 1386.65,-573.91,67.83 },
            ["vault"] = { 1401.00,-572.46,67.83 }
        },
        ["LS07"] = {
            ["enter"] = { 1373.31,-555.68,74.68 },
            ["exit"] = { 1370.80,-561.38,67.83 },
            ["vault"] = { 1380.48,-550.63,67.83 }
        },
        ["LS08"] = {
            ["enter"] = { 1348.21,-546.84,73.89 },
            ["exit"] = { 1351.11,-548.76,67.83 },
            ["vault"] = { 1360.80,-537.99,67.83 }
        },
        ["LS09"] = {
            ["enter"] = { 1328.52,-535.96,72.44 },
            ["exit"] = { 1328.96,-541.72,67.83 },
            ["vault"] = { 1338.18,-530.07,67.83 }
        },
        ["LS10"] = {
            ["enter"] = { 1303.12,-527.50,71.46 },
            ["exit"] = { 1306.52,-529.91,67.83 },
            ["vault"] = { 1315.74,-518.54,67.83 }
        },
        ["LS11"] = {
            ["enter"] = { 1250.99,-515.52,69.34 },
            ["exit"] = { 1254.51,-509.48,61.45 },
            ["vault"] = { 1249.33,-511.57,63.45 }
        },
        ["LS12"] = {
            ["enter"] = { 1251.52,-494.13,69.90 },
            ["exit"] = { 1257.94,-494.23,61.44 },
            ["vault"] = { 1252.85,-496.17,63.44 }
        },
        ["LS13"] = {
            ["enter"] = { 1259.47,-480.16,70.18 },
            ["exit"] = { 1261.96,-481.40,63.39 },
            ["vault"] = { 1252.02,-481.22,63.39 }
        },
        ["LS14"] = {
            ["enter"] = { 1265.66,-458.08,70.51 },
            ["exit"] = { 1265.59,-460.31,64.60 },
            ["vault"] = { 1255.13,-462.91,64.60 }
        },
        ["LS15"] = {
            ["enter"] = { 1262.36,-429.88,70.01 },
            ["exit"] = { 1265.07,-422.73,62.20 },
            ["vault"] = { 1262.06,-427.60,64.20 }
        },
        ["LS16"] = {
            ["enter"] = { 1241.33,-566.37,69.65 },
            ["exit"] = { 1244.29,-572.66,64.36 },
            ["vault"] = { 1233.92,-575.26,64.36 }
        },
        ["LS17"] = {
            ["enter"] = { 1240.59,-601.57,69.78 },
            ["exit"] = { 1226.99,-600.31,60.11 },
            ["vault"] = { 1231.37,-596.64,62.05 }
        },
        ["LS18"] = {
            ["enter"] = { 1250.85,-620.87,69.57 },
            ["exit"] = { 1253.39,-616.36,65.11 },
            ["vault"] = { 1245.25,-623.59,65.11 }
        },
        ["LS19"] = {
            ["enter"] = { 1265.46,-648.34,67.92 },
            ["exit"] = { 1265.82,-649.84,63.33 },
            ["vault"] = { 1257.50,-656.88,63.33 }
        },
        ["LS20"] = {
            ["enter"] = { 1270.94,-683.62,66.03 },
            ["exit"] = { 1269.70,-684.21,61.55 },
            ["vault"] = { 1259.67,-688.26,61.55 }
        },
        ["LS21"] = {
            ["enter"] = { 1264.73,-702.84,64.91 },
            ["exit"] = { 1269.10,-706.70,55.99 },
            ["vault"] = { 1263.52,-707.39,57.99 }
        },
        ["LS22"] = {
            ["enter"] = { 1229.60,-725.43,60.95 },
            ["exit"] = { 1224.19,-716.99,57.01 },
            ["vault"] = { 1234.41,-713.30,57.01 }
        },
        ["LS23"] = {
            ["enter"] = { 1222.90,-697.02,60.80 },
            ["exit"] = { 1218.31,-696.85,53.22 },
            ["vault"] = { 1222.20,-692.72,55.22 }
        },
        ["LS24"] = {
            ["enter"] = { 1221.36,-669.07,63.49 },
            ["exit"] = { 1229.69,-670.46,57.50 },
            ["vault"] = { 1220.07,-675.53,57.50 }
        },
        ["LS25"] = {
            ["enter"] = { 1207.25,-620.35,66.43 },
            ["exit"] = { 1220.80,-612.60,59.26 },
            ["vault"] = { 1216.32,-616.02,61.26 }
        },
        ["LS26"] = {
            ["enter"] = { 1203.63,-598.60,68.06 },
            ["exit"] = { 1203.69,-597.81,63.48 },
            ["vault"] = { 1214.03,-594.72,63.48 }
        },
        ["LS27"] = {
            ["enter"] = { 1201.08,-575.57,69.13 },
            ["exit"] = { 1199.99,-576.08,63.45 },
            ["vault"] = { 1210.41,-573.24,63.45 }
        },
        ["LS28"] = {
            ["enter"] = { 1204.88,-557.77,69.61 },
            ["exit"] = { 1214.50,-551.89,60.55 },
            ["vault"] = { 1209.86,-554.96,62.55 }
        },
        ["LS29"] = {
            ["enter"] = { 1090.51,-484.36,65.66 },
            ["exit"] = { 1091.37,-485.94,59.26 },
            ["vault"] = { 1102.28,-485.39,59.26 }
        },
        ["LS30"] = {
            ["enter"] = { 1098.63,-464.48,67.31 },
            ["exit"] = { 1099.21,-463.06,59.51 },
            ["vault"] = { 1109.27,-462.97,59.51 }
        },
        ["LS31"] = {
            ["enter"] = { 1101.05,-411.33,67.55 },
            ["exit"] = { 1104.49,-410.39,62.35 },
            ["vault"] = { 1115.20,-408.79,62.35 }
        },
        ["LS32"] = {
            ["enter"] = { 1114.38,-391.38,68.94 },
            ["exit"] = { 1104.76,-392.49,59.80 },
            ["vault"] = { 1110.08,-391.10,61.80 }
        },
        ["LS33"] = {
            ["enter"] = { 1060.43,-378.14,68.23 },
            ["exit"] = { 1066.02,-379.71,60.44 },
            ["vault"] = { 1060.41,-378.17,62.44 }
        },
        ["LS34"] = {
            ["enter"] = { 1029.29,-408.86,65.94 },
            ["exit"] = { 1031.51,-410.67,58.54 },
            ["vault"] = { 1025.87,-409.23,60.54 }
        },
        ["LS35"] = {
            ["enter"] = { 1010.44,-423.44,65.35 },
            ["exit"] = { 1016.26,-423.39,57.46 },
            ["vault"] = { 1010.64,-421.84,59.46 }
        },
        ["LS36"] = {
            ["enter"] = { 987.87,-433.53,63.89 },
            ["exit"] = { 988.57,-436.95,59.84 },
            ["vault"] = { 980.17,-430.30,59.84 }
        },
        ["LS37"] = {
            ["enter"] = { 967.25,-451.73,62.79 },
            ["exit"] = { 971.70,-451.79,53.24 },
            ["vault"] = { 966.31,-449.88,55.24 }
        },
        ["LS38"] = {
            ["enter"] = { 943.88,-463.57,61.39 },
            ["exit"] = { 946.51,-466.18,56.89 },
            ["vault"] = { 938.48,-458.90,56.89 }
        },
        ["LS39"] = {
            ["enter"] = { 921.87,-477.82,61.08 },
            ["exit"] = { 931.80,-480.51,52.23 },
            ["vault"] = { 926.47,-477.78,54.23 }
        },	
        ["LS40"] = {
            ["enter"] = { 906.27,-489.38,59.43 },
            ["exit"] = { 904.28,-488.98,54.97 },
            ["vault"] = { 897.35,-480.70,54.97 }
        },
        ["LS41"] = {
            ["enter"] = { 878.45,-497.93,58.09 },
            ["exit"] = { 875.64,-486.15,49.84 },
            ["vault"] = { 875.35,-491.92,51.84 }
        },
        ["LS42"] = {
            ["enter"] = { 862.31,-509.49,57.32 },
            ["exit"] = { 865.09,-511.57,47.26 },
            ["vault"] = { 859.27,-510.99,49.26 }
        },
        ["LS43"] = {
            ["enter"] = { 850.24,-532.63,57.92 },
            ["exit"] = { 851.81,-527.50,50.09 },
            ["vault"] = { 846.98,-530.64,52.09 }
        },
        ["LS44"] = {
            ["enter"] = { 844.13,-563.01,57.83 },
            ["exit"] = { 847.16,-553.66,50.73 },
            ["vault"] = { 843.08,-557.65,52.73 }
        },
        ["LS45"] = {
            ["enter"] = { 861.70,-583.44,58.15 },
            ["exit"] = { 860.09,-577.50,50.72 },
            ["vault"] = { 859.29,-583.05,52.71 }
        },
        ["LS46"] = {
            ["enter"] = { 886.72,-608.16,58.44 },
            ["exit"] = { 884.43,-597.42,49.93 },
            ["vault"] = { 883.61,-603.02,51.93 }
        },
        ["LS47"] = {
            ["enter"] = { 902.95,-615.46,58.45 },
            ["exit"] = { 904.07,-617.94,53.75 },
            ["vault"] = { 899.20,-627.59,53.75 }
        },
        ["LS48"] = {
            ["enter"] = { 929.46,-639.10,58.24 },
            ["exit"] = { 926.28,-633.35,49.81 },
            ["vault"] = { 925.62,-639.26,51.81 }
        },
        ["LS49"] = {
            ["enter"] = { 943.50,-653.43,58.42 },
            ["exit"] = { 943.49,-647.01,50.40 },
            ["vault"] = { 942.07,-652.70,52.40 }
        },
        ["LS50"] = {
            ["enter"] = { 960.03,-669.96,58.44 },
            ["exit"] = { 959.29,-670.33,53.38 },
            ["vault"] = { 951.42,-677.81,53.38 }
        },
        ["LS51"] = {
            ["enter"] = { 970.77,-701.45,58.48 },
            ["exit"] = { 969.25,-695.04,50.71 },
            ["vault"] = { 968.11,-700.83,52.71 }
        },
        ["LS52"] = {
            ["enter"] = { 979.05,-716.23,58.22 },
            ["exit"] = { 979.93,-711.34,50.07 },
            ["vault"] = { 978.68,-717.10,52.07 }
        },
        ["LS53"] = {
            ["enter"] = { 996.83,-729.56,57.81 },
            ["exit"] = { 994.74,-723.86,48.97 },
            ["vault"] = { 993.24,-729.30,50.97 }
        },
        ["LS54"] = {
            ["enter"] = { 980.18,-627.66,59.23 },
            ["exit"] = { 981.78,-626.80,54.26 },
            ["vault"] = { 988.41,-618.47,54.26 }
        },
        ["LS55"] = {
            ["enter"] = { 964.29,-596.19,59.90 },
            ["exit"] = { 960.94,-593.21,54.54 },
            ["vault"] = { 968.59,-600.66,54.54 }
        },
        ["LS56"] = {
            ["enter"] = { 976.65,-580.66,59.85 },
            ["exit"] = { 979.32,-576.72,54.83 },
            ["vault"] = { 987.01,-584.26,54.83 }
        },
        ["LS57"] = {
            ["enter"] = { 1009.69,-572.47,60.59 },
            ["exit"] = { 1012.84,-567.77,52.07 },
            ["vault"] = { 1007.54,-570.19,54.07 }
        },
        ["LS58"] = {
            ["enter"] = { 930.79,-245.09,69.00 },
            ["exit"] = { 931.64,-243.23,63.34 },
            ["vault"] = { 935.56,-234.11,63.34 }
        },
        ["LS59"] = {
            ["enter"] = { 999.65,-593.96,59.63 },
            ["exit"] = { 1004.57,-591.18,52.53 },
            ["vault"] = { 999.30,-593.80,54.53 }
        },
        ["LS60"] = {
            ["enter"] = { 919.72,-569.63,58.36 },
            ["exit"] = { 918.96,-568.70,53.05 },
            ["vault"] = { 911.95,-560.46,53.05 }
        },
        ["LS61"] = {
            ["enter"] = { 965.65,-542.59,59.35 },
            ["exit"] = { 967.98,-543.48,51.58 },
            ["vault"] = { 962.57,-541.31,53.58 }
        },
        ["LS62"] = {
            ["enter"] = { 987.84,-525.75,60.69 },
            ["exit"] = { 993.46,-530.04,52.56 },
            ["vault"] = { 987.99,-528.07,54.56 }
        },
        ["LS63"] = {
            ["enter"] = { 1006.02,-511.29,60.83 },
            ["exit"] = { 1009.03,-514.41,56.03 },
            ["vault"] = { 1001.85,-506.23,56.03 }
        },
        ["LS64"] = {
            ["enter"] = { 1046.15,-497.75,64.07 },
            ["exit"] = { 1044.53,-497.78,56.69 },
            ["vault"] = { 1034.35,-497.94,56.69 }
        },
        ["LS65"] = {
            ["enter"] = { 1051.86,-470.52,63.89 },
            ["exit"] = { 1054.51,-470.26,56.33 },
            ["vault"] = { 1049.28,-472.96,58.33 }
        },
        ["LS66"] = {
            ["enter"] = { 1056.21,-449.00,66.25 },
            ["exit"] = { 1058.89,-446.12,58.39 },
            ["vault"] = { 1053.86,-448.95,60.39 }
        },
        ["LS67"] = {
            ["enter"] = { 1014.60,-469.32,64.50 },
            ["exit"] = { 1007.59,-466.36,56.08 },
            ["vault"] = { 1012.96,-468.02,58.09 }
        },
        ["LS68"] = {
            ["enter"] = { 970.51,-502.46,62.14 },
            ["exit"] = { 966.14,-500.83,53.08 },
            ["vault"] = { 971.38,-503.38,55.08 }
        },
        ["LS69"] = {
            ["enter"] = { 945.90,-518.75,60.62 },
            ["exit"] = { 940.19,-516.83,53.12 },
            ["vault"] = { 945.55,-519.16,55.12 }
        },
        ["LS70"] = {
            ["enter"] = { 924.42,-526.02,59.79 },
            ["exit"] = { 918.65,-522.98,52.05 },
            ["vault"] = { 923.87,-525.70,54.05 }
        },
        ["LS71"] = {
            ["enter"] = { 893.16,-540.62,58.50 },
            ["exit"] = { 891.62,-543.06,53.94 },
            ["vault"] = { 899.73,-535.92,53.94 }
        },
        ["LS72"] = {
            ["enter"] = { 1099.52,-437.99,67.60 },
            ["exit"] = { 1099.43,-441.7,61.45 },
            ["vault"] = { 1109.46,-441.08,61.45 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------BOLLINI------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------	
        ["BL01"] = {
            ["enter"] = { 320.09,-2100.91,18.24 },
            ["exit"] = { 318.70,-2103.81,13.25 },
            ["vault"] = { 321.04,-2107.57,13.25 }
        },
        ["BL02"] = {
            ["enter"] = { 321.77,-2100.12,18.24 },
            ["exit"] = { 324.27,-2100.09,13.13 },
            ["vault"] = { 326.53,-2104.18,13.13 }
        },
        ["BL03"] = {
            ["enter"] = { 329.93,-2095.28,18.24 },
            ["exit"] = { 330.18,-2097.19,5.66 },
            ["vault"] = { 332.49,-2100.68,5.66 }
        },
        ["BL04"] = {
            ["enter"] = { 334.31,-2092.83,18.24 },
            ["exit"] = { 336.45,-2092.41,13.51 },
            ["vault"] = { 339.12,-2096.52,13.51 }
        },
        ["BL05"] = {
            ["enter"] = { 301.20,-2076.28,17.70 },
            ["exit"] = { 299.50,-2076.57,13.17 },
            ["vault"] = { 294.86,-2078.08,13.17 }
        },
        ["BL06"] = {
            ["enter"] = { 302.69,-2080.27,17.70 },
            ["exit"] = { 301.78,-2083.11,13.09 },
            ["vault"] = { 297.30,-2084.80,13.09 }
        },
        ["BL07"] = {
            ["enter"] = { 304.94,-2086.69,17.70 },
            ["exit"] = { 304.24,-2090.02,13.43 },
            ["vault"] = { 299.76,-2091.75,13.43 }
        },
        ["BL08"] = {
            ["enter"] = { 317.01,-2043.61,20.93 },
            ["exit"] = { 319.10,-2046.02,17.37 },
            ["vault"] = { 315.98,-2049.67,17.37 }
        },
        ["BL09"] = {
            ["enter"] = { 324.41,-2049.79,20.93 },
            ["exit"] = { 324.41,-2050.61,17.68 },
            ["vault"] = { 321.12,-2054.41,17.68 }
        },
        ["BL10"] = {
            ["enter"] = { 325.85,-2051.00,20.93 },
            ["exit"] = { 330.00,-2055.48,18.01 },
            ["vault"] = { 326.89,-2059.12,18.01 }
        },
        ["BL11"] = {
            ["enter"] = { 341.71,-2064.42,20.93 },
            ["exit"] = { 335.71,-2060.45,16.54 },
            ["vault"] = { 332.53,-2064.21,16.54 }
        },
        ["BL12"] = {
            ["enter"] = { 345.29,-2067.42,20.93 },
            ["exit"] = { 341.68,-2065.63,17.48 },
            ["vault"] = { 338.63,-2069.29,17.48 }
        },
        ["BL13"] = {
            ["enter"] = { 356.82,-2074.60,21.88 },
            ["exit"] = { 357.09,-2077.77,18.35 },
            ["vault"] = { 360.91,-2080.75,18.35 }
        },
        ["BL14"] = {
            ["enter"] = { 357.88,-2073.32,21.74 },
            ["exit"] = { 361.85,-2071.86,18.27 },
            ["vault"] = { 365.66,-2075.02,18.27 }
        },
        ["BL15"] = {
            ["enter"] = { 365.14,-2064.67,21.88 },
            ["exit"] = { 366.75,-2065.78,18.54 },
            ["vault"] = { 370.46,-2068.83,18.54 }
        },
        ["BL16"] = {
            ["enter"] = { 371.29,-2057.33,21.74 },
            ["exit"] = { 371.74,-2059.59,18.84 },
            ["vault"] = { 375.44,-2062.67,18.84 }
        },
        ["BL17"] = {
            ["enter"] = { 372.50,-2055.89,21.88 },
            ["exit"] = { 376.57,-2053.60,18.38 },
            ["vault"] = { 380.31,-2056.62,18.38 }
        },
        ["BL18"] = {
            ["enter"] = { 336.14,-2021.69,22.49 },
            ["exit"] = { 337.15,-2020.06,18.86 },
            ["vault"] = { 340.25,-2016.39,18.86 }
        },
        ["BL19"] = {
            ["enter"] = { 343.35,-2027.71,22.35 },
            ["exit"] = { 343.12,-2024.88,18.13 },
            ["vault"] = { 346.08,-2021.12,18.13 }
        },
        ["BL20"] = {
            ["enter"] = { 344.74,-2028.89,22.35 },
            ["exit"] = { 349.23,-2029.81,19.13 },
            ["vault"] = { 352.36,-2025.88,19.13 }
        },
        ["BL21"] = {
            ["enter"] = { 353.54,-2036.26,22.35 },
            ["exit"] = { 355.06,-2034.52,18.30 },
            ["vault"] = { 358.13,-2030.56,18.30 }
        },
        ["BL22"] = {
            ["enter"] = { 360.88,-2042.34,22.35 },
            ["exit"] = { 361.50,-2039.71,18.64 },
            ["vault"] = { 364.55,-2035.87,18.64 }
        },
        ["BL23"] = {
            ["enter"] = { 383.12,-2037.89,23.40 },
            ["exit"] = { 384.44,-2040.72,19.42 },
            ["vault"] = { 388.85,-2042.65,19.42 }
        },
        ["BL24"] = {
            ["enter"] = { 383.93,-2035.98,23.40 },
            ["exit"] = { 387.39,-2034.09,19.83 },
            ["vault"] = { 391.72,-2035.91,19.83 }
        },
        ["BL25"] = {
            ["enter"] = { 388.74,-2025.84,23.54 },
            ["exit"] = { 390.62,-2026.78,20.50 },
            ["vault"] = { 395.24,-2028.82,20.50 }
        },
        ["BL26"] = {
            ["enter"] = { 392.64,-2017.31,23.54 },
            ["exit"] = { 393.94,-2019.34,20.41 },
            ["vault"] = { 398.41,-2021.37,20.41 }
        },
        ["BL27"] = {
            ["enter"] = { 393.46,-2015.53,23.40 },
            ["exit"] = { 397.14,-2012.20,19.93 },
            ["vault"] = { 401.55,-2014.12,19.93 }
        },
        ["BL28"] = {
            ["enter"] = { 383.87,-2006.43,24.24 },
            ["exit"] = { 383.54,-2004.27,20.61 },
            ["vault"] = { 385.04,-1999.82,20.61 }
        },
        ["BL29"] = {
            ["enter"] = { 377.25,-2004.02,24.38 },
            ["exit"] = { 376.30,-2001.84,20.78 },
            ["vault"] = { 377.79,-1997.28,20.78 }
        },
        ["BL30"] = {
            ["enter"] = { 367.18,-2000.52,24.24 },
            ["exit"] = { 369.18,-1999.45,20.30 },
            ["vault"] = { 370.69,-1994.89,20.30 }
        },
        ["BL31"] = {
            ["enter"] = { 363.32,-1998.95,24.24 },
            ["exit"] = { 362.24,-1997.31,20.44 },
            ["vault"] = { 363.74,-1992.77,20.44 }
        },
        ["BL32"] = {
            ["enter"] = { 356.77,-1996.57,24.24 },
            ["exit"] = { 355.41,-1994.84,20.13 },
            ["vault"] = { 356.87,-1990.20,20.13 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------LOSVAGOS------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["LV01"] = {
            ["enter"] = { 250.33,-1934.86,24.70 },
            ["exit"] = { 251.15,-1938.79,20.09 },
            ["vault"] = { 259.20,-1943.80,20.09 }
        },
        ["LV02"] = {
            ["enter"] = { 258.10,-1927.30,25.45 },
            ["exit"] = { 260.83,-1927.45,20.07 },
            ["vault"] = { 269.16,-1932.33,20.07 }
        },
        ["LV03"] = {
            ["enter"] = { 269.89,-1916.96,26.19 },
            ["exit"] = { 268.96,-1913.72,21.16 },
            ["vault"] = { 277.48,-1918.61,21.16 }
        },
        ["LV04"] = {
            ["enter"] = { 282.65,-1899.23,27.27 },
            ["exit"] = { 282.63,-1900.07,21.49 },
            ["vault"] = { 291.26,-1904.90,21.49 }
        },
        ["LV05"] = {
            ["enter"] = { 319.75,-1853.70,27.52 },
            ["exit"] = { 321.04,-1856.02,20.03 },
            ["vault"] = { 328.98,-1861.53,20.03 }
        },
        ["LV06"] = {
            ["enter"] = { 328.72,-1845.32,27.75 },
            ["exit"] = { 330.43,-1845.13,23.61 },
            ["vault"] = { 338.26,-1850.66,23.61 }
        },
        ["LV07"] = {
            ["enter"] = { 339.12,-1829.16,28.34 },
            ["exit"] = { 340.01,-1830.61,23.61 },
            ["vault"] = { 347.77,-1836.39,23.61 }
        },
        ["LV08"] = {
            ["enter"] = { 348.77,-1820.57,28.90 },
            ["exit"] = { 354.4,-1817.34,23.61 },
            ["vault"] = { 363.05,-1822.58,23.61 }
        },
        ["LV09"] = {
            ["enter"] = { 405.57,-1751.56,29.72 },
            ["exit"] = { 405.49,-1752.67,23.61 },
            ["vault"] = { 413.86,-1757.63,23.61 }
        },
        ["LV10"] = {
            ["enter"] = { 418.78,-1735.64,29.61 },
            ["exit"] = { 419.0,-1737.46,23.61 },
            ["vault"] = { 427.35,-1742.53,23.61 }
        },
        ["LV11"] = {
            ["enter"] = { 431.00,-1725.45,29.61 },
            ["exit"] = { 433.95,-1723.03,23.61 },
            ["vault"] = { 442.77,-1727.83,23.61 }
        },
        ["LV12"] = {
            ["enter"] = { 443.29,-1707.26,29.71 },
            ["exit"] = { 441.84,-1708.53,23.61 },
            ["vault"] = { 450.42,-1713.19,23.61 }
        },
        ["LV13"] = {
            ["enter"] = { 500.74,-1697.61,29.79 },
            ["exit"] = { 498.46,-1694.84,23.61 },
            ["vault"] = { 489.78,-1690.36,23.61 }
        },
        ["LV14"] = {
            ["enter"] = { 490.04,-1714.32,29.71 },
            ["exit"] = { 489.61,-1712.01,23.61 },
            ["vault"] = { 480.18,-1709.82,23.61 }
        },
        ["LV15"] = {
            ["enter"] = { 479.75,-1736.45,29.16 },
            ["exit"] = { 476.61,-1736.32,23.61 },
            ["vault"] = { 467.08,-1734.85,23.61 }
        },
        ["LV16"] = {
            ["enter"] = { 474.82,-1757.67,29.10 },
            ["exit"] = { 474.08,-1755.61,23.67 },
            ["vault"] = { 464.04,-1754.46,23.67 }
        },
        ["LV17"] = {
            ["enter"] = { 472.25,-1775.21,29.08 },
            ["exit"] = { 469.79,-1767.92,24.57 },
            ["vault"] = { 479.35,-1766.37,24.57 }
        },
        ["LV18"] = {
            ["enter"] = { 513.96,-1780.98,28.92 },
            ["exit"] = { 515.17,-1776.54,23.61 },
            ["vault"] = { 524.61,-1775.14,23.61 }
        },
        ["LV19"] = {
            ["enter"] = { 512.02,-1790.66,28.92 },
            ["exit"] = { 515.26,-1793.81,23.61 },
            ["vault"] = { 524.79,-1792.52,23.61 }
        },
        ["LV20"] = {
            ["enter"] = { 500.99,-1812.79,28.90 },
            ["exit"] = { 504.04,-1811.14,23.61 },
            ["vault"] = { 512.50,-1815.96,23.61 }
        },
        ["LV21"] = {
            ["enter"] = { 495.53,-1822.53,28.87 },
            ["exit"] = { 494.09,-1825.17,23.61 },
            ["vault"] = { 502.64,-1830.44,23.61 }
        },
        ["LV22"] = {
            ["enter"] = { 440.32,-1830.07,28.37 },
            ["exit"] = { 438.18,-1827.00,23.82 },
            ["vault"] = { 430.41,-1821.38,23.82 }
        },
        ["LV23"] = {
            ["enter"] = { 427.74,-1841.80,28.47 },
            ["exit"] = { 426.24,-1841.78,23.23 },
            ["vault"] = { 418.14,-1836.32,23.23 }
        },
        ["LV24"] = {
            ["enter"] = { 412.90,-1856.19,27.33 },
            ["exit"] = { 413.0,-1855.16,23.23 },
            ["vault"] = { 404.94,-1849.71,23.23 }
        },
        ["LV25"] = {
            ["enter"] = { 399.52,-1865.0,26.72 },
            ["exit"] = { 399.8,-1866.41,21.03 },
            ["vault"] = { 391.69,-1861.11,21.03 }
        },
        ["LV26"] = {
            ["enter"] = { 385.70,-1881.97,26.04 },
            ["exit"] = { 384.2,-1881.07,21.03 },
            ["vault"] = { 376.35,-1875.36,21.03 }
        },
        ["LV27"] = {
            ["enter"] = { 368.33,-1895.85,25.18 },
            ["exit"] = { 366.6,-1898.76,20.77 },
            ["vault"] = { 358.63,-1893.21,20.77 }
        },
        ["LV28"] = {
            ["enter"] = { 324.12,-1937.95,25.02 },
            ["exit"] = { 322.42,-1935.72,20.03 },
            ["vault"] = { 314.19,-1930.16,20.03 }
        },
        ["LV29"] = {
            ["enter"] = { 312.47,-1956.38,24.63 },
            ["exit"] = { 308.68,-1957.0,16.95 },
            ["vault"] = { 299.99,-1952.11,16.95 }
        },
        ["LV30"] = {
            ["enter"] = { 296.15,-1972.16,22.91 },
            ["exit"] = { 297.93,-1967.7,16.95 },
            ["vault"] = { 290.09,-1962.03,16.95 }
        },
        ["LV31"] = {
            ["enter"] = { 291.29,-1980.71,21.61 },
            ["exit"] = { 287.68,-1983.7,15.81 },
            ["vault"] = { 279.25,-1978.91,15.81 }
        },
        ["LV32"] = {
            ["enter"] = { 280.08,-1993.49,20.81 },
            ["exit"] = { 281.13,-1993.85,15.81 },
            ["vault"] = { 272.53,-1988.94,15.81 }
        },
        ["LV33"] = {
            ["enter"] = { 257.00,-2023.77,19.28 },
            ["exit"] = { 257.21,-2019.41,12.80 },
            ["vault"] = { 248.62,-2014.90,12.80 }
        },
        ["LV34"] = {
            ["enter"] = { 251.20,-2030.03,18.71 },
            ["exit"] = { 247.15,-2032.32,12.80 },
            ["vault"] = { 238.69,-2027.45,12.80 }
        },
        ["LV35"] = {
            ["enter"] = { 236.52,-2046.11,18.38 },
            ["exit"] = { 235.98,-2046.09,12.80 },
            ["vault"] = { 227.52,-2041.52,12.80 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------KRONDORS------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------	
        ["KR01"] = {
            ["enter"] = { 114.20,-1961.19,21.33 },
            ["exit"] = { 112.88,-1960.95,15.77 },
            ["vault"] = { 118.96,-1967.93,15.77 }
        },
        ["KR02"] = {
            ["enter"] = { 72.19,-1938.75,21.36 },
            ["exit"] = { 69.74,-1937.62,16.73 },
            ["vault"] = { 66.25,-1946.20,16.73 }
        },
        ["KR03"] = {
            ["enter"] = { 23.38,-1896.55,22.96 },
            ["exit"] = { 22.70,-1894.62,16.98 },
            ["vault"] = { 19.85,-1903.55,16.98 }
        },
        ["KR04"] = {
            ["enter"] = { 100.92,-1912.19,21.40 },
            ["exit"] = { 103.08,-1913.19,16.09 },
            ["vault"] = { 103.56,-1903.89,16.09 }
        },
        ["KR05"] = {
            ["enter"] = { 104.06,-1885.34,24.31 },
            ["exit"] = { 102.46,-1885.97,18.07 },
            ["vault"] = { 99.65,-1894.84,18.07 }
        },
        ["KR06"] = {
            ["enter"] = { 148.71,-1904.46,23.53 },
            ["exit"] = { 147.46,-1902.06,17.63 },
            ["vault"] = { 147.22,-1911.48,17.63 }
        },
        ["KR07"] = {
            ["enter"] = { 165.13,-1944.99,20.23 },
            ["exit"] = { 165.11,-1943.33,15.29 },
            ["vault"] = { 156.28,-1940.51,15.29 }
        },
        ["KR08"] = {
            ["enter"] = { 149.06,-1960.43,19.45 },
            ["exit"] = { 150.01,-1958.96,14.05 },
            ["vault"] = { 141.54,-1955.16,14.05 }
        },
        ["KR09"] = {
            ["enter"] = { 54.45,-1873.19,22.80 },
            ["exit"] = { 56.04,-1873.39,17.22 },
            ["vault"] = { 59.50,-1864.85,17.22 }
        },
        ["KR10"] = {
            ["enter"] = { 45.97,-1864.21,23.27 },
            ["exit"] = { -39.11,-1792.20,22.43 },
            ["vault"] = { -35.63,-1783.51,22.43 }
        },
        ["KR11"] = {
            ["enter"] = { -41.98,-1792.16,27.82 },
            ["exit"] = { -39.11,-1792.20,22.43 },
            ["vault"] = { -35.63,-1783.51,22.43 }
        },
        ["KR12"] = {
            ["enter"] = { -50.47,-1783.21,28.30 },
            ["exit"] = { -50.40,-1782.89,23.24 },
            ["vault"] = { -46.97,-1774.30,23.24 }
        },
        ["KR13"] = {
            ["enter"] = { 150.10,-1864.80,24.59 },
            ["exit"] = { 151.66,-1864.34,18.72 },
            ["vault"] = { 151.86,-1854.92,18.72 }
        },
        ["KR14"] = {
            ["enter"] = { 192.41,-1883.40,25.05 },
            ["exit"] = { 192.88,-1887.45,20.23 },
            ["vault"] = { 193.54,-1878.13,20.23 }
        },
        ["KR15"] = {
            ["enter"] = { 250.06,-1730.82,29.66 },
            ["exit"] = { 249.47,-1731.45,23.82 },
            ["vault"] = { 258.42,-1734.31,23.82 }
        },
        ["KR16"] = {
            ["enter"] = { 282.07,-1694.70,29.64 },
            ["exit"] = { 279.53,-1695.19,23.81 },
            ["vault"] = { 288.53,-1697.76,23.81 }
        },
        ["KR17"] = {
            ["enter"] = { 300.00,-1783.76,28.43 },
            ["exit"] = { 301.51,-1767.42,23.99 },
            ["vault"] = { 310.07,-1771.08,23.99 }
        },
        ["KR18"] = {
            ["enter"] = { 320.69,-1759.84,29.63 },
            ["exit"] = { 322.40,-1759.72,23.91 },
            ["vault"] = { 313.36,-1757.07,23.91 }
        },
        ["KR19"] = {
            ["enter"] = { 152.90,-1823.49,27.86 },
            ["exit"] = { 150.35,-1824.12,20.55 },
            ["vault"] = { 159.29,-1826.96,20.55 }
        },
        ["KR20"] = {
            ["enter"] = { 85.58,-1959.62,21.12 },
            ["exit"] = { 83.53,-1953.58,13.02 },
            ["vault"] = { 78.53,-1960.03,15.02 }
        },
        ["KR21"] = {
            ["enter"] = { 76.80,-1948.28,21.17 },
            ["exit"] = { 72.18,-1945.76,13.12 },
            ["vault"] = { 67.11,-1952.22,15.12 }
        },
        ["KR22"] = {
            ["enter"] = { 56.50,-1922.66,21.91 },
            ["exit"] = { 52.99,-1917.23,14.55 },
            ["vault"] = { 47.92,-1923.57,16.55 }
        },
        ["KR23"] = {
            ["enter"] = { 38.93,-1911.67,21.95 },
            ["exit"] = { 38.50,-1907.24,13.58 },
            ["vault"] = { 33.32,-1913.69,15.58 }
        },
        ["KR24"] = {
            ["enter"] = { -4.81,-1872.16,24.15 },
            ["exit"] = { 0.41,-1877.35,15.60 },
            ["vault"] = { -4.46,-1883.69,17.60 }
        },
        ["KR25"] = {
            ["enter"] = { 5.15,-1884.32,23.69 },
            ["exit"] = { -9.10,-1867.59,15.66 },
            ["vault"] = { -13.73,-1874.12,17.66 }
        },
        ["KR26"] = {
            ["enter"] = { -20.46,-1858.87,25.40 },
            ["exit"] = { -24.66,-1853.40,17.21 },
            ["vault"] = { -29.74,-1859.65,19.21 }
        },
        ["KR27"] = {
            ["enter"] = { -34.29,-1847.22,26.19 },
            ["exit"] = { -36.92,-1843.62,17.31 },
            ["vault"] = { -41.95,-1850.02,19.31 }
        },
        ["KR28"] = {
            ["enter"] = { 126.78,-1929.97,21.38 },
            ["exit"] = { 128.41,-1933.74,12.77 },
            ["vault"] = { 135.44,-1929.40,14.77 }
        },
        ["KR29"] = {
            ["enter"] = { 118.30,-1920.93,21.32 },
            ["exit"] = { 120.13,-1925.11,12.44 },
            ["vault"] = { 124.77,-1918.48,14.44 }
        },
        ["KR30"] = {
            ["enter"] = { 115.40,-1887.79,23.92 },
            ["exit"] = { 124.55,-1892.81,15.10 },
            ["vault"] = { 121.40,-1900.29,17.10 }
        },
        ["KR31"] = {
            ["enter"] = { 179.17,-1923.90,21.37 },
            ["exit"] = { 183.96,-1921.35,12.83 },
            ["vault"] = { 177.41,-1916.71,14.83 }
        },
        ["KR32"] = {
            ["enter"] = { 144.16,-1968.98,18.85 },
            ["exit"] = { 148.62,-1968.07,12.22 },
            ["vault"] = { 141.93,-1963.67,14.22 }
        },
        ["KR33"] = {
            ["enter"] = { 29.74,-1854.86,24.06 },
            ["exit"] = { 30.48,-1859.39,13.45 },
            ["vault"] = { 35.78,-1853.39,15.45 }
        },
        ["KR34"] = {
            ["enter"] = { 21.27,-1844.70,24.60 },
            ["exit"] = { 20.48,-1849.82,15.33 },
            ["vault"] = { 25.50,-1843.58,17.33 }
        },
        ["KR35"] = {
            ["enter"] = { 171.54,-1871.52,24.40 },
            ["exit"] = { 175.51,-1875.13,14.92 },
            ["vault"] = { 178.24,-1867.45,16.92 }
        },
        ["KR36"] = {
            ["enter"] = { 208.54,-1895.23,24.81 },
            ["exit"] = { 209.35,-1899.69,16.56 },
            ["vault"] = { 214.57,-1893.42,18.56 }
        },
        ["KR37"] = {
            ["enter"] = { 304.59,-1775.41,29.10 },
            ["exit"] = { 303.49,-1781.65,19.05 },
            ["vault"] = { 296.96,-1776.73,21.05 }
        },
        ["KR38"] = {
            ["enter"] = { 288.67,-1792.48,28.08 },
            ["exit"] = { 292.42,-1791.51,17.55 },
            ["vault"] = { 286.08,-1786.49,19.55 }
        },
        ["KR39"] = {
            ["enter"] = { 332.96,-1740.90,29.73 },
            ["exit"] = { 336.18,-1739.38,21.15 },
            ["vault"] = { 329.71,-1734.25,23.15 }
        },
        ["KR40"] = {
            ["enter"] = { 257.47,-1722.74,29.65 },
            ["exit"] = { 254.60,-1725.70,20.63 },
            ["vault"] = { 260.85,-1730.64,22.63 }
        },
        ["KR41"] = {
            ["enter"] = { 269.65,-1712.85,29.66 },
            ["exit"] = { 265.22,-1713.10,20.66 },
            ["vault"] = { 271.46,-1718.28,22.66 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------GROOVEMOTEL--------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["GR01"] = {
            ["enter"] = { -216.70,-1674.03,34.46 },
            ["exit"] = { -213.47,-1675.41,25.03 },
            ["vault"] = { -213.46,-1679.75,25.03 }
        },
        ["GR02"] = {
            ["enter"] = { -224.32,-1674.12,34.46 },
            ["exit"] = { -223.51,-1677.17,25.03 },
            ["vault"] = { -223.27,-1681.25,25.03 }
        },
        ["GR03"] = {
            ["enter"] = { -224.77,-1666.44,34.46 },
            ["exit"] = { -223.69,-1669.31,25.03 },
            ["vault"] = { -228.43,-1669.34,25.03 }
        },
        ["GR04"] = {
            ["enter"] = { -225.05,-1649.08,35.26 },
            ["exit"] = { -223.83,-1650.88,25.03 },
            ["vault"] = { -228.62,-1651.00,25.03 }
        },
        ["GR05"] = {
            ["enter"] = { -216.39,-1648.69,34.46 },
            ["exit"] = { -215.46,-1650.26,25.03 },
            ["vault"] = { -215.57,-1645.78,25.03 }
        },
        ["GR06"] = {
            ["enter"] = { -212.20,-1660.76,34.46 },
            ["exit"] = { -211.60,-1656.70,20.12 },
            ["vault"] = { -206.78,-1656.69,20.12 }
        },
        ["GR07"] = {
            ["enter"] = { -212.47,-1668.00,34.46 },
            ["exit"] = { -211.48,-1669.99,20.12 },
            ["vault"] = { -206.62,-1669.84,20.12 }
        },
        ["GR08"] = {
            ["enter"] = { -216.58,-1674.39,37.63 },
            ["exit"] = { -208.40,-1688.72,25.04 },
            ["vault"] = { -208.34,-1693.31,25.04 }
        },
        ["GR09"] = {
            ["enter"] = { -224.21,-1674.42,37.63 },
            ["exit"] = { -222.26,-1687.65,25.04 },
            ["vault"] = { -221.95,-1691.84,25.04 }
        },
        ["GR10"] = {
            ["enter"] = { -224.95,-1666.36,37.63 },
            ["exit"] = { -230.87,-1666.99,27.67 },
            ["vault"] = { -235.75,-1667.00,27.67 }
        },
        ["GR11"] = {
            ["enter"] = { -224.90,-1654.06,37.63 },
            ["exit"] = { -230.91,-1650.85,29.33 },
            ["vault"] = { -235.64,-1650.82,29.33 }
        },
        ["GR12"] = {
            ["enter"] = { -224.10,-1648.57,38.44 },
            ["exit"] = { -228.57,-1641.05,25.04 },
            ["vault"] = { -228.69,-1636.22,25.04 }
        },
        ["GR13"] = {
            ["enter"] = { -216.62,-1648.51,37.63 },
            ["exit"] = { -216.01,-1640.91,25.04 },
            ["vault"] = { -216.21,-1636.38,25.04 }
        },
        ["GR14"] = {
            ["enter"] = { -212.40,-1660.81,37.63 },
            ["exit"] = { -203.76,-1656.86,25.04 },
            ["vault"] = { -198.80,-1656.64,25.04 }
        },
        ["GR15"] = {
            ["enter"] = { -212.19,-1668.16,37.63 },
            ["exit"] = { -203.76,-1669.88,25.04 },
            ["vault"] = { -198.86,-1669.85,25.04 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------ALLSUELLMOTEL------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------	
        ["AS01"] = {
            ["enter"] = { -208.94,-1600.58,34.86 },
            ["exit"] = { -206.94,-1595.35,24.07 },
            ["vault"] = { -202.59,-1596.18,24.07 }
        },
        ["AS02"] = {
            ["enter"] = { -210.10,-1606.94,34.86 },
            ["exit"] = { -209.77,-1606.51,24.07 },
            ["vault"] = { -205.50,-1607.64,24.07 }
        },
        ["AS03"] = {
            ["enter"] = { -212.06,-1617.16,34.86 },
            ["exit"] = { -207.57,-1617.24,24.07 },
            ["vault"] = { -202.90,-1618.27,24.07 }
        },
        ["AS04"] = {
            ["enter"] = { -213.24,-1618.07,34.86 },
            ["exit"] = { -213.33,-1621.50,24.07 },
            ["vault"] = { -214.17,-1626.34,24.07 }
        },
        ["AS05"] = {
            ["enter"] = { -222.93,-1617.39,34.86 },
            ["exit"] = { -230.94,-1615.53,24.07 },
            ["vault"] = { -226.16,-1615.33,24.07 }
        },
        ["AS06"] = {
            ["enter"] = { -223.06,-1601.18,34.88 },
            ["exit"] = { -224.53,-1601.16,24.07 },
            ["vault"] = { -229.26,-1601.34,24.07 }
        },
        ["AS07"] = {
            ["enter"] = { -223.12,-1585.80,34.86 },
            ["exit"] = { -224.73,-1587.10,24.07 },
            ["vault"] = { -229.51,-1587.13,24.07 }
        },
        ["AS08"] = {
            ["enter"] = { -219.23,-1579.95,34.86 },
            ["exit"] = { -220.44,-1579.73,24.07 },
            ["vault"] = { -224.17,-1576.81,24.07 }
        },
        ["AS09"] = {
            ["enter"] = { -215.73,-1576.33,34.86 },
            ["exit"] = { -213.92,-1574.70,24.07 },
            ["vault"] = { -210.94,-1571.16,24.07 }
        },
        ["AS10"] = {
            ["enter"] = { -205.59,-1585.50,34.86 },
            ["exit"] = { -204.51,-1585.51,24.07 },
            ["vault"] = { -200.07,-1586.61,24.07 }
        },
        ["AS12"] = {
            ["enter"] = { -205.69,-1585.57,38.05 },
            ["exit"] = { -204.58,-1585.40,29.33 },
            ["vault"] = { -200.05,-1586.56,29.33 }
        },
        ["AS13"] = {
            ["enter"] = { -215.67,-1576.41,38.05 },
            ["exit"] = { -213.77,-1574.56,29.32 },
            ["vault"] = { -210.86,-1571.02,29.32 }
        },
        ["AS14"] = {
            ["enter"] = { -219.35,-1580.01,38.05 },
            ["exit"] = { -220.64,-1579.50,29.32 },
            ["vault"] = { -223.78,-1576.81,29.32 }
        },
        ["AS15"] = {
            ["enter"] = { -223.10,-1585.73,38.05 },
            ["exit"] = { -224.73,-1587.13,29.07 },
            ["vault"] = { -229.44,-1587.13,29.07 }
        },
        ["AS16"] = {
            ["enter"] = { -223.07,-1601.21,38.05 },
            ["exit"] = { -224.52,-1601.07,29.06 },
            ["vault"] = { -229.30,-1601.33,29.07 }
        },
        ["AS17"] = {
            ["enter"] = { -223.04,-1617.58,38.05 },
            ["exit"] = { -223.79,-1617.24,29.07 },
            ["vault"] = { -228.39,-1617.35,29.07 }
        },
        ["AS18"] = {
            ["enter"] = { -213.38,-1618.15,38.05 },
            ["exit"] = { -213.36,-1621.49,29.07 },
            ["vault"] = { -214.22,-1626.09,29.07 }
        },
        ["AS19"] = {
            ["enter"] = { -212.10,-1617.38,38.05 },
            ["exit"] = { -207.85,-1616.84,29.06 },
            ["vault"] = { -203.43,-1618.13,29.07 }
        },
        ["AS20"] = {
            ["enter"] = { -210.03,-1607.10,38.04 },
            ["exit"] = { -209.85,-1606.27,29.07 },
            ["vault"] = { -205.23,-1607.65,29.07 }
        },
        ["AS21"] = {
            ["enter"] = { -208.71,-1600.51,38.04 },
            ["exit"] = { -207.17,-1595.69,29.10 },
            ["vault"] = { -202.36,-1596.52,29.09 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------PINKCAGEMOTEL-----------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------	
        ["PC01"] = {
            ["enter"] = { 312.88,-218.36,54.22 },
            ["exit"] = { 321.49,-195.42,48.50 },
            ["vault"] = { 323.05,-191.38,48.50 }
        },
        ["PC02"] = {
            ["enter"] = { 310.87,-217.76,54.22 },
            ["exit"] = { 315.97,-193.38,48.50 },
            ["vault"] = { 317.58,-189.27,48.50 }
        },
        ["PC03"] = {
            ["enter"] = { 307.27,-216.54,54.22 },
            ["exit"] = { 311.90,-197.57,48.50 },
            ["vault"] = { 307.95,-195.99,48.50 }
        },
        ["PC04"] = {
            ["enter"] = { 307.50,-213.30,54.22 },
            ["exit"] = { 309.80,-202.89,48.50 },
            ["vault"] = { 305.86,-201.16,48.50 }
        },
        ["PC05"] = {
            ["enter"] = { 309.77,-207.99,54.22 },
            ["exit"] = { 308.07,-208.11,48.50 },
            ["vault"] = { 303.89,-206.44,48.50 }
        },
        ["PC06"] = {
            ["enter"] = { 311.58,-203.49,54.22 },
            ["exit"] = { 306.08,-213.45,48.50 },
            ["vault"] = { 302.04,-211.78,48.50 }
        },
        ["PC07"] = {
            ["enter"] = { 313.61,-198.32,54.22 },
            ["exit"] = { 303.96,-218.55,48.50 },
            ["vault"] = { 300.07,-217.21,48.50 }
        },
        ["PC08"] = {
            ["enter"] = { 315.75,-194.90,54.22 },
            ["exit"] = { 302.33,-223.95,48.50 },
            ["vault"] = { 297.95,-222.50,48.50 }
        },
        ["PC09"] = {
            ["enter"] = { 319.28,-196.46,54.22 },
            ["exit"] = { 312.01,-225.73,48.50 },
            ["vault"] = { 307.78,-224.18,48.50 }
        },
        ["PC10"] = {
            ["enter"] = { 321.34,-197.13,54.22 },
            ["exit"] = { 320.45,-229.27,48.50 },
            ["vault"] = { 316.27,-227.76,48.50 }
        },
        ["PC11"] = {
            ["enter"] = { 312.96,-218.76,58.01 },
            ["exit"] = { 329.99,-226.98,48.50 },
            ["vault"] = { 328.35,-231.27,48.50 }
        },
        ["PC12"] = {
            ["enter"] = { 310.94,-217.95,58.01 },
            ["exit"] = { 336.65,-229.64,48.50 },
            ["vault"] = { 335.02,-233.93,48.50 }
        },
        ["PC13"] = {
            ["enter"] = { 307.24,-216.41,58.01 },
            ["exit"] = { 338.45,-223.90,48.50 },
            ["vault"] = { 342.82,-225.60,48.50 }
        },
        ["PC14"] = {
            ["enter"] = { 307.79,-213.45,58.01 },
            ["exit"] = { 341.05,-217.59,48.50 },
            ["vault"] = { 345.58,-219.12,48.50 }
        },
        ["PC15"] = {
            ["enter"] = { 309.59,-208.10,58.01 },
            ["exit"] = { 343.37,-211.42,48.50 },
            ["vault"] = { 347.53,-212.98,48.50 }
        },
        ["PC16"] = {
            ["enter"] = { 311.35,-203.39,58.01 },
            ["exit"] = { 345.31,-205.44,48.50 },
            ["vault"] = { 349.61,-206.96,48.50 }
        },
        ["PC17"] = {
            ["enter"] = { 313.59,-198.14,58.01 },
            ["exit"] = { 347.38,-198.91,48.50 },
            ["vault"] = { 351.82,-200.47,48.50 }
        },
        ["PC18"] = {
            ["enter"] = { 315.75,-194.84,58.01 },
            ["exit"] = { 324.33,-173.70,70.36 },
            ["vault"] = { 319.94,-172.31,70.36 }
        },
        ["PC19"] = {
            ["enter"] = { 319.46,-196.27,58.01 },
            ["exit"] = { 311.31,-169.10,66.36 },
            ["vault"] = { 307.08,-167.10,66.36 }
        },
        ["PC20"] = {
            ["enter"] = { 321.33,-197.06,58.01 },
            ["exit"] = { 300.42,-164.04,70.36 },
            ["vault"] = { 295.90,-162.23,70.36 }
        },
        ["PC21"] = {
            ["enter"] = { 329.36,-224.93,54.22 },
            ["exit"] = { 302.25,-158.34,70.36 },
            ["vault"] = { 298.21,-156.88,70.36 }
        },
        ["PC22"] = {
            ["enter"] = { 331.43,-225.68,54.22 },
            ["exit"] = { 304.47,-152.92,70.36 },
            ["vault"] = { 300.29,-151.37,70.36 }
        },
        ["PC23"] = {
            ["enter"] = { 334.86,-227.26,54.22 },
            ["exit"] = { 301.70,-137.21,70.36 },
            ["vault"] = { 297.14,-135.56,70.36 }
        },
        ["PC24"] = {
            ["enter"] = { 336.99,-224.65,54.22 },
            ["exit"] = { 304.39,-129.95,70.36 },
            ["vault"] = { 299.95,-128.48,70.36 }
        },
        ["PC25"] = {
            ["enter"] = { 338.93,-219.46,54.22 },
            ["exit"] = { 313.36,-162.31,66.36 },
            ["vault"] = { 309.31,-160.88,66.36 }
        },
        ["PC26"] = {
            ["enter"] = { 340.81,-214.83,54.22 },
            ["exit"] = { 315.56,-156.51,70.36 },
            ["vault"] = { 311.60,-154.92,70.36 }
        },
        ["PC27"] = {
            ["enter"] = { 342.61,-209.53,54.22 },
            ["exit"] = { 326.16,-167.58,70.36 },
            ["vault"] = { 322.13,-165.93,70.36 }
        },
        ["PC28"] = {
            ["enter"] = { 344.64,-205.05,54.22 },
            ["exit"] = { 328.43,-161.52,70.36 },
            ["vault"] = { 324.29,-160.06,70.36 }
        },
        ["PC29"] = {
            ["enter"] = { 346.67,-199.78,54.22 },
            ["exit"] = { 340.71,-179.24,70.36 },
            ["vault"] = { 336.72,-177.74,70.36 }
        },
        ["PC30"] = {
            ["enter"] = { 329.41,-225.09,58.01 },
            ["exit"] = { 342.70,-173.61,70.36 },
            ["vault"] = { 338.61,-172.04,70.36 }
        },
        ["PC31"] = {
            ["enter"] = { 331.46,-225.88,58.01 },
            ["exit"] = { 346.82,-168.80,70.36 },
            ["vault"] = { 342.62,-167.11,70.36 }
        },
        ["PC32"] = {
            ["enter"] = { 334.99,-227.21,58.01 },
            ["exit"] = { 350.88,-183.23,54.20 },
            ["vault"] = { 346.84,-181.70,54.20 }
        },
        ["PC33"] = {
            ["enter"] = { 337.04,-224.78,58.01 },
            ["exit"] = { 353.20,-177.81,70.36 },
            ["vault"] = { 349.00,-176.09,70.36 }
        },
        ["PC34"] = {
            ["enter"] = { 339.01,-219.49,58.01 },
            ["exit"] = { 355.57,-172.08,70.36 },
            ["vault"] = { 351.66,-170.45,70.36 }
        },
        ["PC35"] = {
            ["enter"] = { 340.73,-214.79,58.01 },
            ["exit"] = { 349.31,-162.31,70.36 },
            ["vault"] = { 345.18,-160.84,70.36 }
        },
        ["PC36"] = {
            ["enter"] = { 342.70,-209.69,58.01 },
            ["exit"] = { 348.66,-154.19,70.36 },
            ["vault"] = { 344.70,-152.88,70.36 }
        },
        ["PC37"] = {
            ["enter"] = { 344.50,-205.03,58.01 },
            ["exit"] = { 358.96,-166.06,70.36 },
            ["vault"] = { 354.43,-164.47,70.36 }
        },
        ["PC38"] = {
            ["enter"] = { 346.62,-199.76,58.01 },
            ["exit"] = { 360.24,-158.03,70.36 },
            ["vault"] = { 356.12,-156.39,70.36 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------PALETOMOTEL------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------	
        ["PL01"] = {
            ["enter"] = { -111.15,6322.90,31.57 },
            ["exit"] = { -87.95,6361.65,16.00 },
            ["vault"] = { -91.40,6364.98,16.00 }
        },
        ["PL02"] = {
            ["enter"] = { -114.31,6326.05,31.57 },
            ["exit"] = { -87.91,6361.59,11.00 },
            ["vault"] = { -91.45,6364.99,11.00 }
        },
        ["PL03"] = {
            ["enter"] = { -120.24,6327.25,31.57 },
            ["exit"] = { -94.73,6354.60,16.00 },
            ["vault"] = { -98.29,6357.90,16.00 }
        },
        ["PL04"] = {
            ["enter"] = { -111.11,6322.87,35.50 },
            ["exit"] = { -94.69,6354.51,11.00 },
            ["vault"] = { -98.22,6357.90,11.00 }
        },
        ["PL05"] = {
            ["enter"] = { -114.30,6326.04,35.50 },
            ["exit"] = { -101.76,6347.31,16.00 },
            ["vault"] = { -105.35,6350.72,16.00 }
        },
        ["PL06"] = {
            ["enter"] = { -120.26,6327.23,35.50 },
            ["exit"] = { -101.76,6347.28,11.00 },
            ["vault"] = { -105.35,6350.70,11.00 }
        },
        ["PL07"] = {
            ["enter"] = { -103.43,6330.66,31.57 },
            ["exit"] = { -107.99,6340.91,16.00 },
            ["vault"] = { -111.53,6344.37,16.00 }
        },
        ["PL08"] = {
            ["enter"] = { -106.70,6333.93,31.57 },
            ["exit"] = { -107.99,6340.91,11.00 },
            ["vault"] = { -111.53,6344.37,11.00 }
        },
        ["PL09"] = {
            ["enter"] = { -107.61,6339.86,31.57 },
            ["exit"] = { -114.15,6334.62,16.00 },
            ["vault"] = { -117.73,6338.02,16.00 }
        },
        ["PL11"] = {
            ["enter"] = { -98.96,6348.53,31.57 },
            ["exit"] = { -114.15,6334.62,11.00 },
            ["vault"] = { -117.73,6338.02,11.00 }
        },
        ["PL12"] = {
            ["enter"] = { -93.54,6353.90,31.57 },
            ["exit"] = { -120.62,6328.02,16.00 },
            ["vault"] = { -124.23,6331.42,16.00 }
        },
        ["PL13"] = {
            ["enter"] = { -90.26,6357.22,31.57 },
            ["exit"] = { -120.62,6328.02,11.00 },
            ["vault"] = { -124.23,6331.42,11.00 }
        },
        ["PL14"] = {
            ["enter"] = { -84.83,6362.56,31.57 },
            ["exit"] = { -126.64,6321.85,16.00 },
            ["vault"] = { -130.21,6325.28,16.00 }
        },
        ["PL15"] = {
            ["enter"] = { -103.39,6330.68,35.50 },
            ["exit"] = { -126.64,6321.85,11.00 },
            ["vault"] = { -130.21,6325.28,11.00 }
        },
        ["PL16"] = {
            ["enter"] = { -106.65,6333.97,35.50 },
            ["exit"] = { -132.75,6315.61,16.00 },
            ["vault"] = { -136.34,6319.01,16.00 }
        },
        ["PL17"] = {
            ["enter"] = { -107.63,6339.85,35.50 },
            ["exit"] = { -132.75,6315.61,11.00 },
            ["vault"] = { -136.34,6319.01,11.00 }
        },
        ["PL18"] = {
            ["enter"] = { -102.21,6345.27,35.50 },
            ["exit"] = { -138.95,6309.41,16.00 },
            ["vault"] = { -142.52,6312.75,16.00 }
        },
        ["PL19"] = {
            ["enter"] = { -98.94,6348.54,35.50 },
            ["exit"] = { -138.95,6309.41,11.00 },
            ["vault"] = { -142.52,6312.75,11.00 }
        },
        ["PL20"] = {
            ["enter"] = { -93.52,6353.94,35.50 },
            ["exit"] = { -144.92,6303.16,16.00 },
            ["vault"] = { -148.51,6306.57,16.00 }
        },
        ["PL21"] = {
            ["enter"] = { -90.25,6357.18,35.50 },
            ["exit"] = { -144.92,6303.16,11.00 },
            ["vault"] = { -148.51,6306.57,11.00 }
        },
        ["PL22"] = {
            ["enter"] = { -84.88,6362.61,35.50 },
            ["exit"] = { -151.18,6296.80,16.00 },
            ["vault"] = { -154.77,6300.20,16.00 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------PALETOBAY-------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["PB01"] = {
            ["enter"] = { -442.29,6197.89,29.56 },
            ["exit"] = { -450.69,6199.0,15.84 },
            ["vault"] = { -464.92,6203.8,15.84 }
        },
        ["PB02"] = {
            ["enter"] = { -374.56,6190.99,31.73 },
            ["exit"] = { -370.27,6189.46,15.84 },
            ["vault"] = { -376.27,6202.92,15.84 }
        },
        ["PB03"] = {
            ["enter"] = { -356.61,6207.16,31.85 },
            ["exit"] = { -353.69,6205.27,15.84 },
            ["vault"] = { -359.84,6218.67,15.84 }
        },
        ["PB04"] = {
            ["enter"] = { -347.22,6225.07,31.89 },
            ["exit"] = { -340.39,6223.84,15.84 },
            ["vault"] = { -346.2,6237.38,15.84 }
        },
        ["PB05"] = {
            ["enter"] = { -379.82,6253.01,31.86 },
            ["exit"] = { -376.93,6258.18,15.84 },
            ["vault"] = { -390.26,6252.49,15.84 }
        },
        ["PB06"] = {
            ["enter"] = { -360.13,6260.73,31.91 },
            ["exit"] = { -356.42,6275.45,15.84 },
            ["vault"] = { -369.86,6269.61,15.84 }
        },
        ["PB07"] = {
            ["enter"] = { -437.79,6272.66,30.07 },
            ["exit"] = { -430.98,6264.44,14.53 },
            ["vault"] = { -442.35,6273.95,14.53 }
        },
        ["PB08"] = {
            ["enter"] = { -406.99,6313.96,28.95 },
            ["exit"] = { -401.64,6312.73,15.84 },
            ["vault"] = { -406.6,6326.68,15.84 }
        },
        ["PB09"] = {
            ["enter"] = { -359.36,6334.30,29.85 },
            ["exit"] = { -356.89,6335.78,15.26 },
            ["vault"] = { -361.81,6349.82,15.26 }
        },
        ["PB10"] = {
            ["enter"] = { -332.87,6302.55,33.09 },
            ["exit"] = { -335.43,6302.96,15.84 },
            ["vault"] = { -329.64,6289.58,15.84 }
        },
        ["PB11"] = {
            ["enter"] = { -302.59,6327.41,32.89 },
            ["exit"] = { -308.9,6326.96,15.84 },
            ["vault"] = { -303.06,6313.26,15.84 }
        },
        ["PB12"] = {
            ["enter"] = { -280.75,6351.00,32.61 },
            ["exit"] = { -283.91,6352.73,15.84 },
            ["vault"] = { -277.78,6339.26,15.84 }
        },
        ["PB13"] = {
            ["enter"] = { -248.23,6370.32,31.85 },
            ["exit"] = { -251.23,6368.87,15.84 },
            ["vault"] = { -244.97,6355.28,15.84 }
        },
        ["PB14"] = {
            ["enter"] = { -272.34,6400.45,31.51 },
            ["exit"] = { -266.54,6393.59,15.84 },
            ["vault"] = { -268.63,6407.97,15.84 }
        },
        ["PB15"] = {
            ["enter"] = { -227.29,6377.57,31.76 },
            ["exit"] = { -232.44,6379.06,15.84 },
            ["vault"] = { -226.55,6365.76,15.84 }
        },
        ["PB16"] = {
            ["enter"] = { -246.34,6414.13,31.47 },
            ["exit"] = { -235.25,6412.2,15.84 },
            ["vault"] = { -239.78,6426.01,15.84 }
        },
        ["PB17"] = {
            ["enter"] = { -213.88,6396.34,33.09 },
            ["exit"] = { -216.5,6397.24,15.84 },
            ["vault"] = { -210.56,6383.93,15.84 }
        },
        ["PB18"] = {
            ["enter"] = { -214.75,6444.67,31.32 },
            ["exit"] = { -214.15,6456.32,15.84 },
            ["vault"] = { -227.22,6449.76,15.84 }
        },
        ["PB19"] = {
            ["enter"] = { -188.95,6409.66,32.30 },
            ["exit"] = { -195.41,6410.79,15.84 },
            ["vault"] = { -189.24,6397.29,15.84 }
        },
        ["PB20"] = {
            ["enter"] = { -130.48,6551.63,29.53 },
            ["exit"] = { -127.01,6555.24,4.25 },
            ["vault"] = { -132.75,6568.85,4.25 }
        },
        ["PB21"] = {
            ["enter"] = { -105.55,6528.94,30.17 },
            ["exit"] = { -113.09,6533.3,15.84 },
            ["vault"] = { -107.04,6519.88,15.84 }
        },
        ["PB22"] = {
            ["enter"] = { -44.49,6582.28,32.18 },
            ["exit"] = { -49.93,6582.87,15.84 },
            ["vault"] = { -44.03,6569.44,15.84 }
        },
        ["PB23"] = {
            ["enter"] = { -15.07,6557.62,33.25 },
            ["exit"] = { -14.1,6559.9,15.84 },
            ["vault"] = { -27.56,6554.19,15.84 }
        },
        ["PB24"] = {
            ["enter"] = { 4.35,6568.17,33.08 },
            ["exit"] = { -1.89,6564.53,15.84 },
            ["vault"] = { 11.49,6570.42,15.84 }
        },
        ["PB25"] = {
            ["enter"] = { -26.75,6597.54,31.87 },
            ["exit"] = { -29.44,6597.78,15.84 },
            ["vault"] = { -25.14,6583.81,15.84 }
        },
        ["PB26"] = {
            ["enter"] = { -41.25,6637.17,31.09 },
            ["exit"] = { -39.93,6635.42,11.42 },
            ["vault"] = { -44.16,6649.59,11.42 }
        },
        ["PB27"] = {
            ["enter"] = { -9.24,6653.67,31.27 },
            ["exit"] = { -10.38,6651.38,15.84 },
            ["vault"] = { -11.17,6666.12,15.84 }
        },
        ["PB28"] = {
            ["enter"] = { 1.45,6613.03,31.88 },
            ["exit"] = { -3.47,6619.59,15.84 },
            ["vault"] = { -1.26,6605.11,15.84 }
        },
        ["PB29"] = {
            ["enter"] = { 31.19,6596.54,32.83 },
            ["exit"] = { 35.7,6592.37,15.84 },
            ["vault"] = { 29.87,6605.78,15.84 }
        },
        ["PB30"] = {
            ["enter"] = { 35.33,6662.84,32.20 },
            ["exit"] = { 34.29,6660.44,15.84 },
            ["vault"] = { 43.22,6672.19,15.84 }
        },
        ["PB31"] = {
            ["enter"] = { 56.6,6646.33,32.28 },
            ["exit"] = { 59.67,6645.05,15.84 },
            ["vault"] = { 71.60,6653.69,15.84 }
        },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------MANSAO------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------	
        ["MS01"] = {
            ["enter"] = { 8.38,539.75,176.02 },
            ["exit"] = { 7.78,538.15,176.02 },
            ["vault"] = { -2.14,525.52,170.63 }
        },
        ["MS02"] = {
            ["enter"] = { -817.52,177.85,72.22 },
            ["exit"] = { -815.48,178.65,72.15 },
            ["vault"] = { -808.45,175.22,76.74 }
        },
        ["MS03"] = {
            ["enter"] = { -658.53,886.48,229.24 },
            ["exit"] = { -657.70,882.39,209.50 },
            ["vault"] = { -658.24,878.64,201.87 }
        },
        ["MS04"] = {
            ["enter"] = { -2588.00,1911.17,167.49 },
            ["exit"] = { -2590.66,1895.59,144.68 },
            ["vault"] = { -2591.09,1891.69,137.06 }
        },
        ["MS05"] = {
            ["enter"] = { -3017.75,746.25,27.58 },
            ["exit"] = { -3011.98,748.01,14.56 },
            ["vault"] = { -3008.41,748.51,6.94 }
        },
        ["MS06"] = {
            ["enter"] = { -2997.24,722.62,28.49 },
            ["exit"] = { -2994.21,719.91,14.56 },
            ["vault"] = { -2990.56,720.21,6.94 }
        },
        ["MS07"] = {
            ["enter"] = { -2994.75,682.48,25.04 },
            ["exit"] = { -2986.76,684.90,14.56 },
            ["vault"] = { -2982.99,684.61,6.94 }
        },
        ["MS08"] = {
            ["enter"] = { -2972.77,642.43,25.98 },
            ["exit"] = { -2971.90,647.23,14.56 },
            ["vault"] = { -2961.97,653.79,10.74 }
        },
        ["MS09"] = {
            ["enter"] = { -1901.41,-586.29,11.88 },
            ["exit"] = { -1893.87,-573.56,6.54 },
            ["vault"] = { -1897.13,-576.12,-1.07 }
        },	
    },
    casas_config = {
    -----------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------FORTHILLS-----------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["FH01"] = { 5000000,2,1000 },
        ["FH02"] = { 5000000,2,1000 },
        ["FH03"] = { 5000000,2,1000 },
        ["FH04"] = { 5000000,2,1000 },
        ["FH05"] = { 5000000,2,1000 },
        ["FH06"] = { 5000000,2,1000 },
        ["FH07"] = { 5000000,2,1000 },
        ["FH08"] = { 5000000,2,1000 },
        ["FH09"] = { 5000000,2,1000 },
        ["FH10"] = { 5000000,2,1000 },
        ["FH11"] = { 5000000,2,1000 },
        ["FH12"] = { 5000000,2,1000 },
        ["FH13"] = { 5000000,2,1000 },
        ["FH14"] = { 5000000,2,1000 },
        ["FH15"] = { 5000000,2,1000 },
        ["FH16"] = { 5000000,2,1000 },
        ["FH17"] = { 5000000,2,1000 },
        ["FH18"] = { 5000000,2,1000 },
        ["FH19"] = { 5000000,2,1000 },
        ["FH20"] = { 5000000,2,1000 },
        ["FH21"] = { 5000000,2,1000 },
        ["FH22"] = { 5000000,2,1000 },
        ["FH23"] = { 5000000,2,1000 },
        ["FH24"] = { 5000000,2,1000 },
        ["FH25"] = { 5000000,2,1000 },
        ["FH26"] = { 5000000,2,1000 },
        ["FH27"] = { 5000000,2,1000 },
        ["FH28"] = { 5000000,2,1000 },
        ["FH29"] = { 5000000,2,1000 },
        ["FH30"] = { 5000000,2,1000 },
        ["FH31"] = { 5000000,2,1000 },
        ["FH32"] = { 5000000,2,1000 },
        ["FH33"] = { 5000000,2,1000 },
        ["FH34"] = { 5000000,2,1000 },
        ["FH35"] = { 5000000,2,1000 },
        ["FH36"] = { 5000000,2,1000 },
        ["FH37"] = { 5000000,2,1000 },
        ["FH38"] = { 5000000,2,1000 },
        ["FH39"] = { 5000000,2,1000 },
        ["FH40"] = { 5000000,2,1000 },
        ["FH41"] = { 5000000,2,1000 },
        ["FH42"] = { 5000000,2,1000 },
        ["FH43"] = { 5000000,2,1000 },
        ["FH44"] = { 5000000,2,1000 },
        ["FH45"] = { 5000000,2,1000 },
        ["FH46"] = { 5000000,2,1000 },
        ["FH47"] = { 5000000,2,1000 },
        ["FH48"] = { 5000000,2,1000 },
        ["FH49"] = { 5000000,2,1000 },
        ["FH50"] = { 5000000,2,1000 },
        ["FH51"] = { 5000000,2,1000 },
        ["FH52"] = { 5000000,2,1000 },
        ["FH53"] = { 5000000,2,1000 },
        ["FH54"] = { 5000000,2,1000 },
        ["FH55"] = { 5000000,2,1000 },
        ["FH56"] = { 5000000,2,1000 },
        ["FH57"] = { 5000000,2,1000 },
        ["FH58"] = { 5000000,2,1000 },
        ["FH59"] = { 5000000,2,1000 },
        ["FH60"] = { 5000000,2,1000 },
        ["FH61"] = { 5000000,2,1000 },
        ["FH62"] = { 5000000,2,1000 },
        ["FH63"] = { 5000000,2,1000 },
        ["FH64"] = { 5000000,2,1000 },
        ["FH65"] = { 5000000,2,1000 },
        ["FH66"] = { 5000000,2,1000 },
        ["FH67"] = { 5000000,2,1000 },
        ["FH68"] = { 5000000,2,1000 },
        ["FH69"] = { 5000000,2,1000 },
        ["FH70"] = { 5000000,2,1000 },
        ["FH71"] = { 5000000,2,1000 },
        ["FH72"] = { 5000000,2,1000 },
        ["FH73"] = { 5000000,2,1000 },
        ["FH74"] = { 5000000,2,1000 },
        ["FH75"] = { 5000000,2,1000 },
        ["FH76"] = { 5000000,2,1000 },
        ["FH77"] = { 5000000,2,1000 },
        ["FH78"] = { 5000000,2,1000 },
        ["FH79"] = { 5000000,2,1000 },
        ["FH80"] = { 5000000,2,1000 },
        ["FH81"] = { 5000000,2,1000 },
        ["FH82"] = { 5000000,2,1000 },
        ["FH83"] = { 5000000,2,1000 },
        ["FH84"] = { 5000000,2,1000 },
        ["FH85"] = { 5000000,2,1000 },
        ["FH86"] = { 5000000,2,1000 },
        ["FH87"] = { 5000000,2,1000 },
        ["FH88"] = { 5000000,2,1000 },
        ["FH89"] = { 5000000,2,1000 },
        ["FH90"] = { 5000000,2,1000 },
        ["FH91"] = { 5000000,2,1000 },
        ["FH92"] = { 5000000,2,1000 },
        ["FH93"] = { 5000000,2,1000 },
        ["FH94"] = { 5000000,2,1000 },
        ["FH95"] = { 5000000,2,1000 },
        ["FH96"] = { 5000000,2,1000 },
        ["FH97"] = { 5000000,2,1000 },
        ["FH98"] = { 5000000,2,1000 },
        ["FH99"] = { 5000000,2,1000 },
        ["FH100"] = { 5000000,2,1000 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------LUXURY--------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["LX02"] = { 7000000,2,1000 },
        ["LX01"] = { 7000000,2,1000 },
        ["LX03"] = { 7000000,2,1000 },
        ["LX04"] = { 7000000,2,1000 },
        ["LX05"] = { 7000000,2,1000 },
        ["LX06"] = { 7000000,2,1000 },
        ["LX07"] = { 7000000,2,1000 },
        ["LX08"] = { 7000000,2,1000 },
        ["LX09"] = { 7000000,2,1000 },
        ["LX10"] = { 7000000,2,1000 },
        ["LX11"] = { 7000000,2,1000 },
        ["LX12"] = { 7000000,2,1000 },
        ["LX13"] = { 7000000,2,1000 },
        ["LX14"] = { 7000000,2,1000 },
        ["LX15"] = { 7000000,2,1000 },
        ["LX16"] = { 7000000,2,1000 },
        ["LX17"] = { 7000000,2,1000 },
        ["LX18"] = { 7000000,2,1000 },
        ["LX19"] = { 7000000,2,1000 },
        ["LX20"] = { 7000000,2,1000 },
        ["LX21"] = { 7000000,2,1000 },
        ["LX22"] = { 7000000,2,1000 },
        ["LX23"] = { 7000000,2,1000 },
        ["LX24"] = { 7000000,2,1000 },
        ["LX25"] = { 7000000,2,1000 },
        ["LX26"] = { 7000000,2,1000 },
        ["LX27"] = { 7000000,2,1000 },
        ["LX28"] = { 7000000,2,1000 },
        ["LX29"] = { 7000000,2,1000 },
        ["LX30"] = { 7000000,2,1000 },
        ["LX31"] = { 7000000,2,1000 },
        ["LX32"] = { 7000000,2,1000 },
        ["LX33"] = { 7000000,2,1000 },
        ["LX34"] = { 7000000,2,1000 },
        ["LX35"] = { 7000000,2,1000 },
        ["LX36"] = { 7000000,2,1000 },
        ["LX37"] = { 7000000,2,1000 },
        ["LX38"] = { 7000000,2,1000 },
        ["LX39"] = { 7000000,2,1000 },
        ["LX40"] = { 7000000,2,1000 },
        ["LX41"] = { 7000000,2,1000 },
        ["LX42"] = { 7000000,2,1000 },
        ["LX43"] = { 7000000,2,1000 },
        ["LX44"] = { 7000000,2,1000 },
        ["LX45"] = { 7000000,2,1000 },
        ["LX46"] = { 7000000,2,1000 },
        ["LX47"] = { 7000000,2,1000 },
        ["LX48"] = { 7000000,2,1000 },
        ["LX49"] = { 7000000,2,1000 },
        ["LX50"] = { 7000000,2,1000 },
        ["LX51"] = { 7000000,2,1000 },
        ["LX52"] = { 7000000,2,1000 },
        ["LX53"] = { 7000000,2,1000 },
        ["LX54"] = { 7000000,2,1000 },
        ["LX55"] = { 7000000,2,1000 },
        ["LX56"] = { 7000000,2,1000 },
        ["LX57"] = { 7000000,2,1000 },
        ["LX58"] = { 7000000,2,1000 },
        ["LX59"] = { 7000000,2,1000 },
        ["LX60"] = { 7000000,2,1000 },
        ["LX61"] = { 7000000,2,1000 },
        ["LX62"] = { 7000000,2,1000 },
        ["LX63"] = { 7000000,2,1000 },
        ["LX64"] = { 7000000,2,1000 },
        ["LX65"] = { 7000000,2,1000 },
        ["LX66"] = { 7000000,2,1000 },
        ["LX67"] = { 7000000,2,1000 },
        ["LX68"] = { 7000000,2,1000 },
        ["LX69"] = { 7000000,2,1000 },
        ["LX70"] = { 7000000,2,1000 },	
    -----------------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------SAMIR-------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["LS01"] = { 200000,2,200 },
        ["LS02"] = { 200000,2,200 },
        ["LS03"] = { 200000,2,200 },
        ["LS04"] = { 200000,2,200 },
        ["LS05"] = { 200000,2,200 },
        ["LS06"] = { 200000,2,200 },
        ["LS07"] = { 200000,2,200 },
        ["LS08"] = { 200000,2,200 },
        ["LS09"] = { 200000,2,200 },
        ["LS10"] = { 200000,2,200 },
        ["LS11"] = { 200000,2,200 },
        ["LS12"] = { 200000,2,200 },
        ["LS13"] = { 200000,2,200 },
        ["LS14"] = { 200000,2,200 },
        ["LS15"] = { 200000,2,200 },
        ["LS16"] = { 200000,2,200 },
        ["LS17"] = { 200000,2,200 },
        ["LS18"] = { 200000,2,200 },
        ["LS19"] = { 200000,2,200 },
        ["LS20"] = { 200000,2,200 },
        ["LS21"] = { 200000,2,200 },
        ["LS22"] = { 200000,2,200 },
        ["LS23"] = { 200000,2,200 },
        ["LS24"] = { 200000,2,200 },
        ["LS25"] = { 200000,2,200 },
        ["LS26"] = { 200000,2,200 },
        ["LS27"] = { 200000,2,200 },
        ["LS28"] = { 200000,2,200 },
        ["LS29"] = { 200000,2,200 },
        ["LS30"] = { 200000,2,200 },
        ["LS31"] = { 200000,2,200 },
        ["LS32"] = { 200000,2,200 },
        ["LS33"] = { 200000,2,200 },
        ["LS34"] = { 200000,2,200 },
        ["LS35"] = { 200000,2,200 },
        ["LS36"] = { 200000,2,200 },
        ["LS37"] = { 200000,2,200 },
        ["LS38"] = { 200000,2,200 },
        ["LS39"] = { 200000,2,200 },
        ["LS40"] = { 200000,2,200 },
        ["LS41"] = { 200000,2,200 },
        ["LS42"] = { 200000,2,200 },
        ["LS43"] = { 200000,2,200 },
        ["LS44"] = { 200000,2,200 },
        ["LS45"] = { 200000,2,200 },
        ["LS46"] = { 200000,2,200 },
        ["LS47"] = { 200000,2,200 },
        ["LS48"] = { 200000,2,200 },
        ["LS49"] = { 200000,2,200 },
        ["LS50"] = { 200000,2,200 },
        ["LS51"] = { 200000,2,200 },
        ["LS52"] = { 200000,2,200 },
        ["LS53"] = { 200000,2,200 },
        ["LS54"] = { 200000,2,200 },
        ["LS55"] = { 200000,2,200 },
        ["LS56"] = { 200000,2,200 },
        ["LS57"] = { 200000,2,200 },
        ["LS58"] = { 200000,2,200 },
        ["LS59"] = { 200000,2,200 },
        ["LS60"] = { 200000,2,200 },
        ["LS61"] = { 200000,2,200 },
        ["LS62"] = { 200000,2,200 },
        ["LS63"] = { 200000,2,200 },
        ["LS64"] = { 200000,2,200 },
        ["LS65"] = { 200000,2,200 },
        ["LS66"] = { 200000,2,200 },
        ["LS67"] = { 200000,2,200 },
        ["LS68"] = { 200000,2,200 },
        ["LS69"] = { 200000,2,200 },
        ["LS70"] = { 200000,2,200 },
        ["LS71"] = { 200000,2,200 },
        ["LS72"] = { 200000,2,200 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------BOLLINI------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["BL01"] = { 200000,2,200 },
        ["BL02"] = { 200000,2,200 },
        ["BL03"] = { 200000,2,200 },
        ["BL04"] = { 200000,2,200 },
        ["BL05"] = { 200000,2,200 },
        ["BL06"] = { 200000,2,200 },
        ["BL07"] = { 200000,2,200 },
        ["BL08"] = { 200000,2,200 },
        ["BL09"] = { 200000,2,200 },
        ["BL10"] = { 200000,2,200 },
        ["BL11"] = { 200000,2,200 },
        ["BL12"] = { 200000,2,200 },
        ["BL13"] = { 200000,2,200 },
        ["BL14"] = { 200000,2,200 },
        ["BL15"] = { 200000,2,200 },
        ["BL16"] = { 200000,2,200 },
        ["BL17"] = { 200000,2,200 },
        ["BL18"] = { 200000,2,200 },
        ["BL19"] = { 200000,2,200 },
        ["BL20"] = { 200000,2,200 },
        ["BL21"] = { 200000,2,200 },
        ["BL22"] = { 200000,2,200 },
        ["BL23"] = { 200000,2,200 },
        ["BL24"] = { 200000,2,200 },
        ["BL25"] = { 200000,2,200 },
        ["BL26"] = { 200000,2,200 },
        ["BL27"] = { 200000,2,200 },
        ["BL28"] = { 200000,2,200 },
        ["BL29"] = { 200000,2,200 },
        ["BL30"] = { 200000,2,200 },
        ["BL31"] = { 200000,2,200 },
        ["BL32"] = { 200000,2,200 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------LOSVAGOS------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["LV01"] = { 300000,2,250 },
        ["LV02"] = { 300000,2,250 },
        ["LV03"] = { 300000,2,250 },
        ["LV04"] = { 300000,2,250 },
        ["LV05"] = { 300000,2,250 },
        ["LV06"] = { 300000,2,250 },
        ["LV07"] = { 300000,2,250 },
        ["LV08"] = { 300000,2,250 },
        ["LV09"] = { 300000,2,250 },
        ["LV10"] = { 300000,2,250 },
        ["LV11"] = { 300000,2,250 },
        ["LV12"] = { 300000,2,250 },
        ["LV13"] = { 300000,2,250 },
        ["LV14"] = { 300000,2,250 },
        ["LV15"] = { 300000,2,250 },
        ["LV16"] = { 300000,2,250 },
        ["LV17"] = { 300000,2,250 },
        ["LV18"] = { 300000,2,250 },
        ["LV19"] = { 300000,2,250 },
        ["LV20"] = { 300000,2,250 },
        ["LV21"] = { 300000,2,250 },
        ["LV22"] = { 300000,2,250 },
        ["LV23"] = { 300000,2,250 },
        ["LV24"] = { 300000,2,250 },
        ["LV25"] = { 300000,2,250 },
        ["LV26"] = { 300000,2,250 },
        ["LV27"] = { 300000,2,250 },
        ["LV28"] = { 300000,2,250 },
        ["LV29"] = { 300000,2,250 },
        ["LV30"] = { 300000,2,250 },
        ["LV31"] = { 300000,2,250 },
        ["LV32"] = { 300000,2,250 },
        ["LV33"] = { 300000,2,250 },
        ["LV34"] = { 300000,2,250 },
        ["LV35"] = { 300000,2,250 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------KRONDORS------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["KR01"] = { 200000,2,200 },
        ["KR02"] = { 200000,2,200 },
        ["KR03"] = { 200000,2,200 },
        ["KR04"] = { 200000,2,200 },
        ["KR05"] = { 200000,2,200 },
        ["KR06"] = { 200000,2,200 },
        ["KR07"] = { 200000,2,200 },
        ["KR08"] = { 200000,2,200 },
        ["KR09"] = { 200000,2,200 },
        ["KR10"] = { 200000,2,200 },
        ["KR11"] = { 200000,2,200 },
        ["KR12"] = { 200000,2,200 },
        ["KR13"] = { 200000,2,200 },
        ["KR14"] = { 200000,2,200 },
        ["KR15"] = { 200000,2,200 },
        ["KR16"] = { 200000,2,200 },
        ["KR17"] = { 200000,2,200 },
        ["KR18"] = { 200000,2,200 },
        ["KR19"] = { 200000,2,200 },
        ["KR20"] = { 200000,2,200 },
        ["KR21"] = { 200000,2,200 },
        ["KR22"] = { 200000,2,200 },
        ["KR23"] = { 200000,2,200 },
        ["KR24"] = { 200000,2,200 },
        ["KR25"] = { 200000,2,200 },
        ["KR26"] = { 200000,2,200 },
        ["KR27"] = { 200000,2,200 },
        ["KR28"] = { 200000,2,200 },
        ["KR29"] = { 200000,2,200 },
        ["KR30"] = { 200000,2,200 },
        ["KR31"] = { 200000,2,200 },
        ["KR32"] = { 200000,2,200 },
        ["KR33"] = { 200000,2,200 },
        ["KR34"] = { 200000,2,200 },
        ["KR35"] = { 200000,2,200 },
        ["KR36"] = { 200000,2,200 },
        ["KR37"] = { 200000,2,200 },
        ["KR38"] = { 200000,2,200 },
        ["KR39"] = { 200000,2,200 },
        ["KR40"] = { 200000,2,200 },
        ["KR41"] = { 200000,2,200 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------GROOVEMOTEL--------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["GR01"] = { 200000,2,200 },
        ["GR02"] = { 200000,2,200 },
        ["GR03"] = { 200000,2,200 },
        ["GR04"] = { 200000,2,200 },
        ["GR05"] = { 200000,2,200 },
        ["GR06"] = { 200000,2,200 },
        ["GR07"] = { 200000,2,200 },
        ["GR08"] = { 200000,2,200 },
        ["GR09"] = { 200000,2,200 },
        ["GR10"] = { 200000,2,200 },
        ["GR11"] = { 200000,2,200 },
        ["GR12"] = { 200000,2,200 },
        ["GR13"] = { 200000,2,200 },
        ["GR14"] = { 200000,2,200 },
        ["GR15"] = { 200000,2,200 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ----------------------------------------------------------ALLSUELLMOTEL------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["AS01"] = { 200000,2,200 },
        ["AS02"] = { 200000,2,200 },
        ["AS03"] = { 200000,2,200 },
        ["AS04"] = { 200000,2,200 },
        ["AS05"] = { 200000,2,200 },
        ["AS06"] = { 200000,2,200 },
        ["AS07"] = { 200000,2,200 },
        ["AS08"] = { 200000,2,200 },
        ["AS09"] = { 200000,2,200 },
        ["AS10"] = { 200000,2,200 },
        ["AS12"] = { 200000,2,200 },
        ["AS13"] = { 200000,2,200 },
        ["AS14"] = { 200000,2,200 },
        ["AS15"] = { 200000,2,200 },
        ["AS16"] = { 200000,2,200 },
        ["AS17"] = { 200000,2,200 },
        ["AS18"] = { 200000,2,200 },
        ["AS19"] = { 200000,2,200 },
        ["AS20"] = { 200000,2,200 },
        ["AS21"] = { 200000,2,200 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------PINKCAGEMOTEL-----------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["PC01"] = { 140000,2,150 },
        ["PC02"] = { 140000,2,150 },
        ["PC03"] = { 140000,2,150 },
        ["PC04"] = { 140000,2,150 },
        ["PC05"] = { 140000,2,150 },
        ["PC06"] = { 140000,2,150 },
        ["PC07"] = { 140000,2,150 },
        ["PC08"] = { 140000,2,150 },
        ["PC09"] = { 140000,2,150 },
        ["PC10"] = { 140000,2,150 },
        ["PC11"] = { 140000,2,150 },
        ["PC12"] = { 140000,2,150 },
        ["PC13"] = { 140000,2,150 },
        ["PC14"] = { 140000,2,150 },
        ["PC15"] = { 140000,2,150 },
        ["PC16"] = { 140000,2,150 },
        ["PC17"] = { 140000,2,150 },
        ["PC18"] = { 140000,2,150 },
        ["PC19"] = { 140000,2,150 },
        ["PC20"] = { 140000,2,150 },
        ["PC21"] = { 140000,2,150 },
        ["PC22"] = { 140000,2,150 },
        ["PC23"] = { 140000,2,150 },
        ["PC24"] = { 140000,2,150 },
        ["PC25"] = { 140000,2,150 },
        ["PC26"] = { 140000,2,150 },
        ["PC27"] = { 140000,2,150 },
        ["PC28"] = { 140000,2,150 },
        ["PC29"] = { 140000,2,150 },
        ["PC30"] = { 140000,2,150 },
        ["PC31"] = { 140000,2,150 },
        ["PC32"] = { 140000,2,150 },
        ["PC33"] = { 140000,2,150 },
        ["PC34"] = { 140000,2,150 },
        ["PC35"] = { 140000,2,150 },
        ["PC36"] = { 140000,2,150 },
        ["PC37"] = { 140000,2,150 },
        ["PC38"] = { 140000,2,150 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    ------------------------------------------------------------PALETOMOTEL------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["PL01"] = { 140000,2,150 },
        ["PL02"] = { 140000,2,150 },
        ["PL03"] = { 140000,2,150 },
        ["PL04"] = { 140000,2,150 },
        ["PL05"] = { 140000,2,150 },
        ["PL06"] = { 140000,2,150 },
        ["PL07"] = { 140000,2,150 },
        ["PL08"] = { 140000,2,150 },
        ["PL09"] = { 140000,2,150 },
        ["PL11"] = { 140000,2,150 },
        ["PL12"] = { 140000,2,150 },
        ["PL13"] = { 140000,2,150 },
        ["PL14"] = { 140000,2,150 },
        ["PL15"] = { 140000,2,150 },
        ["PL16"] = { 140000,2,150 },
        ["PL17"] = { 140000,2,150 },
        ["PL18"] = { 140000,2,150 },
        ["PL19"] = { 140000,2,150 },
        ["PL20"] = { 140000,2,150 },
        ["PL21"] = { 140000,2,150 },
        ["PL22"] = { 140000,2,150 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------PALETOBAY-------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["PB01"] = { 300000,2,250 },
        ["PB02"] = { 300000,2,250 },
        ["PB03"] = { 300000,2,250 },
        ["PB04"] = { 300000,2,250 },
        ["PB05"] = { 300000,2,250 },
        ["PB06"] = { 300000,2,250 },
        ["PB07"] = { 300000,2,250 },
        ["PB08"] = { 300000,2,250 },
        ["PB09"] = { 300000,2,250 },
        ["PB10"] = { 300000,2,250 },
        ["PB11"] = { 300000,2,250 },
        ["PB12"] = { 300000,2,250 },
        ["PB13"] = { 300000,2,250 },
        ["PB14"] = { 300000,2,250 },
        ["PB15"] = { 300000,2,250 },
        ["PB16"] = { 300000,2,250 },
        ["PB17"] = { 300000,2,250 },
        ["PB18"] = { 300000,2,250 },
        ["PB19"] = { 300000,2,250 },
        ["PB20"] = { 300000,2,250 },
        ["PB21"] = { 300000,2,250 },
        ["PB22"] = { 300000,2,250 },
        ["PB23"] = { 300000,2,250 },
        ["PB24"] = { 300000,2,250 },
        ["PB25"] = { 300000,2,250 },
        ["PB26"] = { 300000,2,250 },
        ["PB27"] = { 300000,2,250 },
        ["PB28"] = { 300000,2,250 },
        ["PB29"] = { 300000,2,250 },
        ["PB30"] = { 300000,2,250 },
        ["PB31"] = { 300000,2,250 },
    -----------------------------------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------MANSAO------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
        ["MS01"] = { 99999999,2,1500 },
        ["MS02"] = { 99999999,2,1500 },
        ["MS03"] = { 99999999,10,1500 },
        ["MS04"] = { 99999999,5,1500 },
        ["MS05"] = { 99999999,2,1500 },
        ["MS06"] = { 99999999,2,1500 },
        ["MS07"] = { 99999999,2,1500 },
        ["MS08"] = { 99999999,2,1500 },
        ["MS09"] = { 99999999,2,1500 },
    }
}

return config