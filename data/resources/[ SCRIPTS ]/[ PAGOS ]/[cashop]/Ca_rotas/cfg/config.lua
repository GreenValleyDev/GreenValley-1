local config = {}

config.rotas = {
---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA Complexo
---------------------------------------------------------------------------------------------------------------------------------------
	['Complexo'] = { -- Nome da rota que vai aparecer no mapa
        ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
            ['folhas-cannabis'] = math.random(3,4),
            ['adubo'] = math.random(3,4),
            ['eletronicos'] = math.random(3,4),
            ['couro'] = math.random(3,4),
            ['nailon'] = math.random(3,4),
            ['baterias'] = math.random(3,4),
            ['placasdeaco'] = math.random(3,4),
            ['antena'] = math.random(3,4),
        },
        ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
            ["complexo.permissao"] = vector3(-872.13, -1828.07, 28.94),
        },
        ['coords'] = { -- Coordenadas das rotas
        vector3( -1502.94,1521.14,115.29 ),	 
        vector3( -324.75,2818.37,59.45 ),
        vector3( 464.21,3564.66, 33.45 ), 
        vector3( 1858.02,3854.0,33.09 ),  
        vector3( 2178.92,3496.68,45.86 ), 
        vector3( 1387.72,3615.37,38.93 ), 
        vector3( 1183.36,3265.75,39.33 ), 
        vector3( 94.98,3750.25,40.73 ),  
        vector3( -513.84,4946.83,147.3 ),   
        vector3( -666.77,5831.32,17.34 ),  
        vector3( -184.61,6541.51,11.1 ), 
        vector3( 252.16,358.35,105.74 ),
        vector3( 529.03,-1921.38,28.92 ), 
        vector3( 1355.07,-1690.53,60.5 ), 
        vector3( 908.02,-2201.94,32.29 ),
        }
    },
---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA Beiramar
---------------------------------------------------------------------------------------------------------------------------------------
	['Beiramar'] = { -- Nome da rota que vai aparecer no mapa
        ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
            ['pasta-base'] = math.random(3,4),
            ['folhas-coca'] = math.random(3,4),
            ['eletronicos'] = math.random(3,4),
            ['couro'] = math.random(3,4),
            ['nailon'] = math.random(3,4),
            ['baterias'] = math.random(3,4),
            ['placasdeaco'] = math.random(3,4),
            ['antena'] = math.random(3,4),
        },
        ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
            ["beiramar.permissao"] = vector3(1380.61, -1294.76, 72.69),
        },
        ['coords'] = { -- Coordenadas das rotas
        vector3( 2545.11, 2591.99, 37.96 ), --1
        vector3( 1759.68, 3327.05, 41.39 ), --2
        vector3( 1202.09, 2654.49, 37.86 ),  --3
        vector3( 550.43, 2656.5, 42.22 ),  --4
        vector3( 58.96, 2795.1, 57.88 ),   --5
        vector3( -46.52, 1946.98, 190.57 ),   --6
        vector3( 372.75, 341.31, 103.24 ),   --7
        vector3( -6.36, -74.55, 61.68 ),   --8
        vector3( -511.54, -41.02, 44.52 ),   --9
        vector3( 227.23, -283.94, 49.73 ),   --10
        vector3( 222.32, -595.78, 43.88 ),   --11
        vector3( 3.86, -706.88, 45.98 ),   --12
        vector3( 1569.11, 920.52, 77.78 ),   --13
        vector3( 1531.85, 1728.15, 109.93 ),   --14
        vector3( 1282.18, 1887.59, 83.69 ),   --15
        vector3( 1536.39, 2221.88, 77.43 ),  --16
        vector3( 1981.32, 3059.3, 47.19 ),  --17
        vector3( 2670.59, 3286.37, 55.25 ),  --18
        vector3( 2632.03, 2935.44, 40.43 ),  --19
        }
    },
---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA Grecia 
---------------------------------------------------------------------------------------------------------------------------------------
	['Grecia'] = { -- Nome da rota que vai aparecer no mapa
        ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
            ['pseudoefedrina'] = math.random(3,4),
            ['calcio-po'] = math.random(3,4),
            ['eletronicos'] = math.random(3,4),
            ['couro'] = math.random(3,4),
            ['nailon'] = math.random(3,4),
            ['baterias'] = math.random(3,4),
            ['placasdeaco'] = math.random(3,4),
            ['antena'] = math.random(3,4),
        },
        ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
            ["grecia.permissao"] = vector3(813.06, -286.63, 66.47),
        },
        ['coords'] = { -- Coordenadas das rotas
        vector3( 1185.23, -1394.79, 35.13 ),   --1
        vector3( 779.17, -1263.38, 26.4 ),    --2
        vector3( 807.44, -1073.59, 28.93 ),    --3
        vector3( 759.23, -694.33, 28.81 ),     --4
        vector3( 548.5, -191.16, 54.49 ),    --5
        vector3( 315.5, -128.21, 69.98 ),     --6
        vector3( 201.72, -238.75, 53.98 ),    --7
        vector3( -51.25, -398.1, 38.13 ),     --8
        vector3( -501.23, -693.57, 33.22 ),   --9
        vector3( -702.81, -916.94, 19.22 ),    --10
        vector3( -544.27, -1227.35, 18.46 ),    --11
        vector3( -72.48, -1821.43, 26.95 ),     --12
        vector3( -72.48, -1821.43, 26.95 ),     --13
        vector3( 137.89, -1695.68, 29.3 ),    --14
        vector3( 415.28, -2073.06, 21.47 ),   --15
        vector3( 798.13, -2135.92, 29.53 ),    --16
        vector3( 939.16, -2127.31, 30.51 ),   --17
        vector3( 1163.3, -1637.45, 36.97 ),    --18
        vector3( 1437.57, -1491.88, 63.63 ),    --19
        }
    },
---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA VilaRica
---------------------------------------------------------------------------------------------------------------------------------------
	['Lsd'] = { -- Nome da rota que vai aparecer no mapa
        ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
            ['ergolina'] = math.random(3,4),
            ['calcio-po'] = math.random(3,4),
            ['eletronicos'] = math.random(3,4),
            ['couro'] = math.random(3,4),
            ['nailon'] = math.random(3,4),
            ['baterias'] = math.random(3,4),
            ['antena'] = math.random(3,4),
            ['placasdeaco'] = math.random(3,4),
        },
        ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
            ["vilarica.permissao"] = vector3(2041.54, 480.93, 168.04),
        },
        ['coords'] = { -- Coordenadas das rotas
        vector3( -425.14, 1224.71, 325.76 ), --1
        vector3( -557.19, 199.77, 75.35 ), --2
        vector3( -634.44, 105.69, 57.67 ),  --3
        vector3( -536.41, -45.34, 42.56 ),  --4
        vector3( -808.63, -187.12, 37.48 ),   --5
        vector3( -1278.97, -287.56, 37.97 ),   --6
        vector3( -1471.93, -331.04, 44.82 ),   --7
        vector3( -1383.16, -639.94, 28.68 ),   --8
        vector3( -1221.6, -1095.6, 8.13 ),   --9
        vector3( 540.39, -196.68, 54.5 ),   --10
        vector3( 325.05, -229.7, 54.23 ),   --11
        vector3( 126.5, -126.31, 54.84 ),   --12
        vector3( 68.06, 179.18, 106.62 ),   --13
        vector3( 367.21, 351.25, 103.33 ),   --14
        vector3( 572.4, 114.12, 98.05 ),   --15
        vector3( 1043.24, 691.49, 158.83 ),  --16
        vector3( 285.0, 960.34, 211.13 ),  --17
        vector3( -350.13, 1286.97, 335.19 ),  --18
        }
    },
---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA Holanda
---------------------------------------------------------------------------------------------------------------------------------------
	['Holanda'] = { -- Nome da rota que vai aparecer no mapa
       ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
            ['placa-metal'] = math.random(3,4),
            ['molas'] = math.random(3,4),
            ['gatilho'] = math.random(3,4),
            ['corpo-aks74u'] = math.random(3,4),
            ['corpo-uzi'] = math.random(3,4),
            ['corpo-mp5x'] = math.random(3,4),
            ['corpo-mtar'] = math.random(3,4),
            ['corpo-doze-canocurto'] = math.random(3,4),
            ['corpo-ak47'] = math.random(3,4),
            ['corpo-g36'] = math.random(3,4),
            ['corpo-fiveseven'] = math.random(3,4),
            ['corpo-tec9'] = math.random(3,4),
            ['eletronicos'] = math.random(3,4),
            ['fitaisolante'] = math.random(3,4),
            ['polvora'] = math.random(3,4),
       },
       ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
           ["holanda.permissao"] = vector3(882.87,1018.67,280.67),
       },
       ['coords'] = { -- Coordenadas das rotas
       vector3( -3068.87,  3328.0, 8.8 ), 
       vector3( 439.38,  3561.53, 33.24 ), 
       vector3( 1601.67,  3562.69, 35.37 ), 
       vector3( 1310.24,  4386.92, 41.23 ), 
       vector3( 1943.85,  4647.04, 40.63 ), 
       vector3( 1736.61,  6423.25, 34.39 ), 
       vector3( -758.16,  5600.44, 33.83 ), 
       vector3( 264.26,  3096.01, 42.79 ), 
       vector3( 2867.29,  1506.66, 24.57 ), 
       vector3( 2544.2,  377.0, 108.62 ), 
       vector3( 2505.42,  -333.5, 93.0 ), 
       vector3( 1126.87,  -1302.52, 34.73 ),
       }
    },

---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA Bratva
---------------------------------------------------------------------------------------------------------------------------------------
	['Bratva'] = { -- Nome da rota que vai aparecer no mapa
    ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
         ['placa-metal'] = math.random(3,4),
         ['molas'] = math.random(3,4),
         ['gatilho'] = math.random(3,4),
         ['corpo-aks74u'] = math.random(3,4),
         ['corpo-uzi'] = math.random(3,4),
         ['corpo-mp5x'] = math.random(3,4),
         ['corpo-mtar'] = math.random(3,4),
         ['corpo-doze-canocurto'] = math.random(3,4),
         ['corpo-ak47'] = math.random(3,4),
         ['corpo-g36'] = math.random(3,4),
         ['corpo-fiveseven'] = math.random(3,4),
         ['corpo-tec9'] = math.random(3,4),
         ['eletronicos'] = math.random(3,4),
         ['fitaisolante'] = math.random(3,4),
         ['polvora'] = math.random(3,4),
    },
    ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
        ["bratva.permissao"] = vector3(-2680.23, 1333.4, 144.26),
    },
    ['coords'] = { -- Coordenadas das rotas
    vector3( -3068.87,  3328.0, 8.8 ), 
    vector3( 439.38,  3561.53, 33.24 ), 
    vector3( 1601.67,  3562.69, 35.37 ), 
    vector3( 1310.24,  4386.92, 41.23 ), 
    vector3( 1943.85,  4647.04, 40.63 ), 
    vector3( 1736.61,  6423.25, 34.39 ), 
    vector3( -758.16,  5600.44, 33.83 ), 
    vector3( 264.26,  3096.01, 42.79 ), 
    vector3( 2867.29,  1506.66, 24.57 ), 
    vector3( 2544.2,  377.0, 108.62 ), 
    vector3( 2505.42,  -333.5, 93.0 ), 
    vector3( 1126.87,  -1302.52, 34.73 ),
    }
 },


---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA Lakers
---------------------------------------------------------------------------------------------------------------------------------------
    ['Lakers'] = { -- Nome da rota que vai aparecer no mapa
    ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
        ['capsulas'] = math.random(7,9),
        ['polvora'] = math.random(7,9),
        ['nailon'] = math.random(7,9),
        ['couro'] = math.random(7,9),
    },
    ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
        ["lakers.permissao"] = vector3(-1871.26, 2057.12, 135.47),
    },
    ['coords'] = { -- Coordenadas das rotas
    vector3( 896.19, -144.83, 76.79 ), --1
    vector3( 638.24, 1.76, 82.79 ), --2
    vector3( 286.99, 136.81, 104.3 ),  --3
    vector3( -133.42, 215.28, 98.33 ),  --4
    vector3( -166.75, 157.38, 77.66 ),   --5
    vector3( -333.17, 101.58, 71.22 ),   --6
    vector3( -448.54, -77.58, 41.29 ),   --7
    vector3( -1334.93, -338.2, 36.69 ),   --8
    vector3( -1285.5, -567.09, 31.72 ),   --9
    vector3( -657.77, -679.29, 31.48 ),   --10
    vector3( -718.58, -1119.97, 10.83 ),   --11
    vector3( 126.5, -126.31, 54.84 ),   --12
    vector3( -886.03, -1233.31, 5.66 ),   --13
    vector3( -752.18, -1325.17, 9.6 ),   --14
    vector3( -544.35, -1227.65, 18.46 ),   --15
    vector3( -319.9, -1389.73, 36.51 ),  --16
    vector3( -223.05, -1601.21, 34.89 ),  --17
    vector3( 1249.24, -350.4, 69.21 ),  --18
    }
},
---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA CandLove
---------------------------------------------------------------------------------------------------------------------------------------
	['CandLove'] = { -- Nome da rota que vai aparecer no mapa
    ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
        ['capsulas'] = math.random(7,9),
        ['polvora'] = math.random(7,9),
        ['nailon'] = math.random(7,9),
        ['couro'] = math.random(7,9),
    },
    ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
        ["egito.permissao"] = vector3(1248.61,-228.6,95.95),
    },
    ['coords'] = { -- Coordenadas das rotas
    vector3( 896.19, -144.83, 76.79 ), --1
    vector3( 638.24, 1.76, 82.79 ), --2
    vector3( 286.99, 136.81, 104.3 ),  --3
    vector3( -133.42, 215.28, 98.33 ),  --4
    vector3( -166.75, 157.38, 77.66 ),   --5
    vector3( -333.17, 101.58, 71.22 ),   --6
    vector3( -448.54, -77.58, 41.29 ),   --7
    vector3( -1334.93, -338.2, 36.69 ),   --8
    vector3( -1285.5, -567.09, 31.72 ),   --9
    vector3( -657.77, -679.29, 31.48 ),   --10
    vector3( -718.58, -1119.97, 10.83 ),   --11
    vector3( 126.5, -126.31, 54.84 ),   --12
    vector3( -886.03, -1233.31, 5.66 ),   --13
    vector3( -752.18, -1325.17, 9.6 ),   --14
    vector3( -544.35, -1227.65, 18.46 ),   --15
    vector3( -319.9, -1389.73, 36.51 ),  --16
    vector3( -223.05, -1601.21, 34.89 ),  --17
    vector3( 1249.24, -350.4, 69.21 ),  --18
    }
},


---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA GALAXY
---------------------------------------------------------------------------------------------------------------------------------------
    ['Galaxy'] = { -- Nome da rota que vai aparecer no mapa
    ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
        ['nailon'] = math.random(3,4),
        ['placasdeaco'] = math.random(3,4),
        ['eletronicos'] = math.random(3,4),
        ['fibradearamida'] = math.random(3,4),
        ['alvejante'] = math.random(3,4),
        ['borrifador'] = math.random(3,4),
        ['tinta'] = math.random(3,4),
    },
    ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
        ["galaxy.permissao"] = vector3(348.84, 283.66, 91.2),
    },
    ['coords'] = { -- Coordenadas das rotas
    vector3( 896.19, -144.83, 76.79 ), --1
    vector3( 638.24, 1.76, 82.79 ), --2
    vector3( 286.99, 136.81, 104.3 ),  --3
    vector3( -133.42, 215.28, 98.33 ),  --4
    vector3( -166.75, 157.38, 77.66 ),   --5
    vector3( -333.17, 101.58, 71.22 ),   --6
    vector3( -448.54, -77.58, 41.29 ),   --7
    vector3( -1334.93, -338.2, 36.69 ),   --8
    vector3( -1285.5, -567.09, 31.72 ),   --9
    vector3( -657.77, -679.29, 31.48 ),   --10
    vector3( -718.58, -1119.97, 10.83 ),   --11
    vector3( 126.5, -126.31, 54.84 ),   --12
    vector3( -886.03, -1233.31, 5.66 ),   --13
    vector3( -752.18, -1325.17, 9.6 ),   --14
    vector3( -544.35, -1227.65, 18.46 ),   --15
    vector3( -319.9, -1389.73, 36.51 ),  --16
    vector3( -223.05, -1601.21, 34.89 ),  --17
    vector3( 1249.24, -350.4, 69.21 ),  --18
    }
},

---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA Cassino
---------------------------------------------------------------------------------------------------------------------------------------
    ['Cassino'] = { -- Nome da rota que vai aparecer no mapa
    ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
        ['nailon'] = math.random(3,4),
        ['placasdeaco'] = math.random(3,4),
        ['eletronicos'] = math.random(3,4),
        ['fibradearamida'] = math.random(3,4),
        ['alvejante'] = math.random(3,4),
        ['borrifador'] = math.random(3,4),
        ['tinta'] = math.random(3,4),
    },
    ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
        ["casino.permissao"] = vector3(973.59, 17.55, 71.84),
    },
    ['coords'] = { -- Coordenadas das rotas
    vector3( 896.19, -144.83, 76.79 ), --1
    vector3( 638.24, 1.76, 82.79 ), --2
    vector3( 286.99, 136.81, 104.3 ),  --3
    vector3( -133.42, 215.28, 98.33 ),  --4
    vector3( -166.75, 157.38, 77.66 ),   --5
    vector3( -333.17, 101.58, 71.22 ),   --6
    vector3( -448.54, -77.58, 41.29 ),   --7
    vector3( -1334.93, -338.2, 36.69 ),   --8
    vector3( -1285.5, -567.09, 31.72 ),   --9
    vector3( -657.77, -679.29, 31.48 ),   --10
    vector3( -718.58, -1119.97, 10.83 ),   --11
    vector3( 126.5, -126.31, 54.84 ),   --12
    vector3( -886.03, -1233.31, 5.66 ),   --13
    vector3( -752.18, -1325.17, 9.6 ),   --14
    vector3( -544.35, -1227.65, 18.46 ),   --15
    vector3( -319.9, -1389.73, 36.51 ),  --16
    vector3( -223.05, -1601.21, 34.89 ),  --17
    vector3( 1249.24, -350.4, 69.21 ),  --18
    }
},



---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA Napoles
---------------------------------------------------------------------------------------------------------------------------------------
    ['Napoles'] = { -- Nome da rota que vai aparecer no mapa
    ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
        ['placasdeaco'] = math.random(3,4),
        ['molas'] = math.random(3,4),
        ['furadeira'] = math.random(3,4),
        ['serra'] = math.random(3,4),
        ['caixa-vazia'] = math.random(3,4),
    },
    ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
        ["napoles.permissao"] = vector3(-345.6, -123.14, 39.01),
    },
    ['coords'] = { -- Coordenadas das rotas
    vector3( 896.19, -144.83, 76.79 ), --1
    vector3( 638.24, 1.76, 82.79 ), --2
    vector3( 286.99, 136.81, 104.3 ),  --3
    vector3( -133.42, 215.28, 98.33 ),  --4
    vector3( -166.75, 157.38, 77.66 ),   --5
    vector3( -333.17, 101.58, 71.22 ),   --6
    vector3( -448.54, -77.58, 41.29 ),   --7
    vector3( -1334.93, -338.2, 36.69 ),   --8
    vector3( -1285.5, -567.09, 31.72 ),   --9
    vector3( -657.77, -679.29, 31.48 ),   --10
    vector3( -718.58, -1119.97, 10.83 ),   --11
    vector3( 126.5, -126.31, 54.84 ),   --12
    vector3( -886.03, -1233.31, 5.66 ),   --13
    vector3( -752.18, -1325.17, 9.6 ),   --14
    vector3( -544.35, -1227.65, 18.46 ),   --15
    vector3( -319.9, -1389.73, 36.51 ),  --16
    vector3( -223.05, -1601.21, 34.89 ),  --17
    vector3( 1249.24, -350.4, 69.21 ),  --18
    }
},
---------------------------------------------------------------------------------------------------------------------------------------
-- ROTA ELITECAR
---------------------------------------------------------------------------------------------------------------------------------------
    ['Elitecar'] = { -- Nome da rota que vai aparecer no mapa
        ['items'] = { -- Lista de itens e quantidade que sera recebido por cada ponto
            ['placasdeaco'] = math.random(3,4),
            ['molas'] = math.random(3,4),
            ['furadeira'] = math.random(3,4),
            ['serra'] = math.random(3,4),
            ['caixa-vazia'] = math.random(3,4),
        },
        ['perm'] = { -- Lista de permissoes e coordenadas para iniciar a rota
            ["elitecar.permissao"] = vector3(1327.63, -681.38, 73.1),
        },
        ['coords'] = { -- Coordenadas das rotas
        vector3( 896.19, -144.83, 76.79 ), --1
        vector3( 638.24, 1.76, 82.79 ), --2
        vector3( 286.99, 136.81, 104.3 ),  --3
        vector3( -133.42, 215.28, 98.33 ),  --4
        vector3( -166.75, 157.38, 77.66 ),   --5
        vector3( -333.17, 101.58, 71.22 ),   --6
        vector3( -448.54, -77.58, 41.29 ),   --7
        vector3( -1334.93, -338.2, 36.69 ),   --8
        vector3( -1285.5, -567.09, 31.72 ),   --9
        vector3( -657.77, -679.29, 31.48 ),   --10
        vector3( -718.58, -1119.97, 10.83 ),   --11
        vector3( 126.5, -126.31, 54.84 ),   --12
        vector3( -886.03, -1233.31, 5.66 ),   --13
        vector3( -752.18, -1325.17, 9.6 ),   --14
        vector3( -544.35, -1227.65, 18.46 ),   --15
        vector3( -319.9, -1389.73, 36.51 ),  --16
        vector3( -223.05, -1601.21, 34.89 ),  --17
        vector3( 1249.24, -350.4, 69.21 ),  --18
        }
    },
}

return config