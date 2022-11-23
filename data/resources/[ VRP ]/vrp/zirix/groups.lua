groups = {}

groups.masterGroup = 'manager'

groups.list = {

	['manager'] = {
		_config = {
			title = 'Manager',
			gtype = 'staff'
		},
		
		"player.blips",
		"player.spec",
		"staff.permissao",
		"player.noclip",
		"player.secret",
		"player.wall",
		"player.teleport",
		"mqcu.permissao",
		"permissaocreator.permissao",
		'manager.permissao',
		"ticket.permissao",
		"car.permissao",
		"dv.permissao"
	},
	['off-manager'] = {
		_config = {
			title = 'Manager',
			gtype = 'staff'
		},
		
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall",
		"player.teleport",
		"mqcu.permissao",
		'off-manager.permissao'
	},


	['coordenador'] = {
		_config = {
			title = 'Coordenador',
			gtype = 'staff'
		},
		
		"player.blips",
		"player.spec",
		"player.noclip",
		"staff.permissao",
		"player.secret",
		"player.wall",
		"permissaocreator.permissao",
		"player.teleport",
		"mqcu.permissao",
		'coordenador.permissao',
		"ticket.permissao",
		"car.permissao",
		"dv.permissao"
	},
	['off-coordenador'] = {
		_config = {
			title = 'Coordenador',
			gtype = 'staff'
		},
		
		'off-coordenador.permissao'
	},

	['administrador'] = {
		_config = {
			title = 'Administrador(a)',
			gtype = 'staff'
		},
		
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall",
		"staff.permissao",
		"player.teleport",
		"permissaocreator.permissao",
		"mqcu.permissao",
		'administrador.permissao',
		"ticket.permissao",
		"car.permissao",
		"dv.permissao"
	},
	
	['off-administrador'] = {
		_config = {
			title = 'Administrador(a)',
			gtype = 'staff'
		},
		
		'off-administrador.permissao'
	},

	['moderador'] = {
		_config = {
			title = 'Moderador(a)',
			gtype = 'staff'
		},
		
		"player.blips",
		"player.spec",
		"player.noclip",
		"player.secret",
		"player.wall",
		"staff.permissao",
		"player.teleport",
		"permissaocreator.permissao",
		"mqcu.permissao",
		'moderador.permissao',
		"ticket.permissao",
		"dv.permissao"
	},
	['off-moderador'] = {
		_config = {
			title = 'Moderador(a)',
			gtype = 'staff'
		},

		'off-moderador.permissao'
	},

	['suporte'] = {
		_config = {
			title = 'Suporte',
			gtype = 'staff'
		},
		
		"player.blips",
		"player.noclip",
		"player.teleport",
		"player.secret",
		"staff.permissao",
		'suporte.permissao',
		"ticket.permissao",
		"dv.permissao"
	},
	['off-suporte'] = {
		_config = {
			title = 'Suporte',
			gtype = 'staff'
		},
		'off-suporte.permissao'
	},

	['auxiliar'] = {
		_config = {
			title = 'Auxiliar',
			gtype = 'staff'
		},
		'auxiliar.permissao',
		"ticket.permissao",
		"dv.permissao"
	},





	['prefeitura'] = {
		_config = {
			title = 'prefeitura',
			gtype = 'publico'
		},
		'prefeitura.permissao',
	},

	['prefeito'] = {
		_config = {
			title = 'Prefeito(a)',
			gtype = 'primario'
		},
		'prefeito.permissao',
	},
	['colaborador'] = {
		_config = {
			title = 'Colaborador(a)',
			gtype = 'primario'
		},
		'colaborador.permissao',
	},
	
	
	['justica'] = {
		_config = {
			title = 'justica',
			gtype = 'publico'
		},
		'justica.permissao',
	},
	
	['juiz'] = {
		_config = {
			title = 'Juiz(a)',
			gtype = 'primario'
		},
		'juiz.permissao',
	},
	['procurador'] = {
		_config = {
			title = 'Procurador(a)',
			gtype = 'primario'
		},
		'procurador.permissao',
	},
	['promotor'] = {
		_config = {
			title = 'Promotor(a)',
			gtype = 'primario'
		},
		'promotor.permissao',
	},
	['defensor'] = {
		_config = {
			title = 'Defensor(a) Público',
			gtype = 'primario'
		},
		'defensor.permissao',
	},
	['advogado'] = {
		_config = {
			title = 'Advogado(a)',
			gtype = 'adv'
		},
		'advogado.permissao'
	},
	['jornal'] = {
		_config = {
			title = 'Jornalista',
			gtype = 'secundario'
		},
		'jornal.permissao'
	},
	['lider-jornal'] = {
		_config = {
			title = 'Lider Jornalista',
			gtype = 'secundario'
		},
		'lider-jornal.permissao'
	},
	['paisana-jornal'] = {
		_config = {
			title = 'Jornalista Fora de Serviço',
			gtype = 'secundario'
		},
		'paisana-jornal.permissao'
	},
	['defensor-secundario'] = {
		_config = {
			title = 'Defensor(a) Público',
			gtype = 'secundario'
		},
		'defensor.permissao',
	},

------------------------------------------------------------------------------------------

	['comandopolicia'] = { -- toogle police
		_config = {
			title = 'COMANDO POLICIA',
			gtype = 'primario'
		},
		"player.blips",
		'comandopolicia.permissao',
		'policia.permissao',
	},
	['comandopaisana-policia'] = {
		_config = {
			title = 'PAISANA COMANDO POLICIA',
			gtype = 'primario'
		},
		"player.blips",
		'paisana-policia.permissao',
		'paisana-comandopolicia.permissao',
	},

	['policia'] = { -- toogle police
		_config = {
			title = 'POLICIA',
			gtype = 'primario'
		},
		"player.blips",
		'policia.permissao',
	},
	['paisana-policia'] = {
		_config = {
			title = 'A PAISANA POLICIA',
			gtype = 'primario'
		},
		"player.blips",
		'paisana-policia.permissao',
	},
	
	------------------------------------------------------------------------------------------
	['diretor'] = {
		_config = {
			title = 'Diretor',
			gtype = 'primario'
		},
		"player.blips",
		'radiohospital.permissao',
		'ems.permissao'
	}, 
	['paisana-diretor'] = {
		_config = {
			title = 'Paisana Diretor',
			gtype = 'primario'
		},
		"player.blips",
		'paisana-diretor.permissao'
	},
	['paisana-medico'] = {
		_config = {
			title = 'Paisana Medico',
			gtype = 'primario'
		},
		"player.blips",
		'paisana-medico.permissao'
	},
	['paisana-paramedico'] = {
		_config = {
			title = 'Paisana Paramedico',
			gtype = 'primario'
		},
		"player.blips",
		'paisana-paramedico.permissao'
	},

	------------------------------------------------------------------------------------------
	
	['ems'] = {
		_config = {
			title = 'EMS',
			gtype = 'primario'
		},
		"player.blips",
		'ems.permissao',
	}, 
	['paisana-ems'] = {
		_config = {
			title = 'EMS DE FOLGA',
			gtype = 'primario'
		},
		"player.blips",
		'paisana-ems.permissao'
	},

	
	['ems-secundario'] = {
		_config = {
			title = 'EMS',
			gtype = 'secundario'
		},
		"player.blips",
		'ems.permissao',
	}, 
	['paisana-ems-secundario'] = {
		_config = {
			title = 'EMS DE FOLGA',
			gtype = 'secundario'
		},
		'paisana-ems.permissao'
	},
	
	['diretor-geral'] = {
		_config = {
			title = 'Diretor Geral',
			gtype = 'hie'
		},
		'diretor-geral.permissao'
	},
	['diretor-auxiliar'] = {
		_config = {
			title = 'Diretor Auxiliar',
			gtype = 'hie'
		},
		'diretor-auxiliar.permissao'
	},
	['medico-chefe'] = {
		_config = {
			title = 'Médico Chefe',
			gtype = 'hie'
		},
		'medico-chefe.permissao'
	},
	['medico-cirurgiao'] = {
		_config = {
			title = 'Médico Cirurgião',
			gtype = 'hie'
		},
		'medico-cirurgiao.permissao'
	},
	['medico-aulixiar'] = {
		_config = {
			title = 'Médico Auxiliar',
			gtype = 'hie'
		},
		'medico-aulixiar.permissao'
	},
	['medico'] = {
		_config = {
			title = 'Médico',
			gtype = 'hie'
		},
		'medico.permissao'
	},
	['paramedico'] = {
		_config = {
			title = 'Paramédico',
			gtype = 'hie'
		},
		'paramedico.permissao'
	},
	['residente'] = {
		_config = {
			title = 'Residente',
			gtype = 'hie'
		},
		'residente.permissao'
	},
	['socorrista'] = {
		_config = {
			title = 'Socorrista',
			gtype = 'hie'
		},
		'socorrista.permissao'
	},
	['estagiario'] = {
		_config = {
			title = 'Estágiario',
			gtype = 'hie'
		},
		'estagiario.permissao'
	},

	
	['lider-corretor'] = {
		_config = {
			title = 'Corretor Chefe',
			gtype = 'hie'
		},
		'lider-corretor.permissao'
	},
	['corretor'] = {
		_config = {
			title = 'Corretor',
			gtype = 'primario'
		},
		'corretor.permissao'
	},
	['visitante'] = {
		_config = {
			title = 'Visitante',
			gtype = 'imobiliaria'
		},
		'visitante.permissao'
    },
    

	['lider-taxista'] = {
		_config = {
			title = 'Líder Taxista',
			gtype = 'hie'
		},
		'lider-taxista.permissao'
	},
	['taxista'] = {
		_config = {
			title = 'Taxista',
			gtype = 'primario'
		},
		'taxista.permissao'
	},
	['paisana-taxista'] = {
		_config = {
			title = 'Taxista de folga',
			gtype = 'primario'
		},
		'paisana-taxista.permissao'
	},
    

	['lider-uber'] = {
		_config = {
			title = 'Líder Uber',
			gtype = 'hie'
		},
		'lider-uber.permissao'
	},
	['uber'] = {
		_config = {
			title = 'Uber',
			gtype = 'primario'
		},
		'uber.permissao'
	},
	['paisana-uber'] = {
		_config = {
			title = 'Uber de folga',
			gtype = 'primario'
		},
		'paisana-uber.permissao'
	},
    

	['restaurante-uber'] = {
		_config = {
			title = 'Líder Restaurante',
			gtype = 'hie'
		},
		'lider-restaurante.permissao'
	},
	['restaurante'] = {
		_config = {
			title = 'Restaurante',
			gtype = 'primario'
		},
		'restaurante.permissao'
	},
	['paisana-restaurante'] = {
		_config = {
			title = 'Restaurante de folga',
			gtype = 'primario'
		},
		'paisana-restaurante.permissao'
	},
	
	
	['lider-mecanico'] = {
		_config = {
			title = 'Líder LS Customs',
			gtype = 'hie'
		},
		'lider-mecanico.permissao',
		'mecanico.permissao'
	},
	['mecanico'] = {
		_config = {
			title = 'LS Customs',
			gtype = 'primario'
		},
		'mecanico.permissao'
	},
	['paisana-mecanico'] = {
		_config = {
			title = 'Mecânico de folga',
			gtype = 'primario'
		},
		'paisana-mecanico.permissao'
    },
    
	
	['hotel'] = {
		_config = {
			title = 'Hotel',
			gtype = 'primario'
		},
		'hotel.permissao'
	},

	['lider-bennys'] = {
		_config = {
			title = 'Líder da Bennys',
			gtype = 'hie'
		},
		'lider-bennys.permissao',
		'bennys.permissao'
    },
	['paisana-lider-bennys'] = {
		_config = {
			title = 'Líder da Bennys',
			gtype = 'hie'
		},
		'paisana-lider-bennys.permissao'
    },
	

	['bennys'] = {
		_config = {
			title = 'Membro da Bennys',
			gtype = 'primario'
		},
		'bennys.permissao'
	},
	['paisana-bennys'] = {
		_config = {
			title = 'Paisana da Bennys',
			gtype = 'primario'
		},
		'paisana-bennys.permissao'
	},
    

	['napoles'] = {
		_config = {
			title = 'Membro Napoles',
			gtype = 'primario'
		},
		'napoles.permissao',
		'desmanche.permissao'
	},
	['lider-napoles'] = {
		_config = {
			title = 'Líder Napoles',
			gtype = 'hie'
		},
		'lider-napoles.permissao',
		'desmanche.permissao',
		'napoles.permissao'
	},
    

	['atlantic'] = {
		_config = {
			title = 'Membro Atlantic',
			gtype = 'primario'
		},
		'chamadosmec.permissao',
		'atlantic.permissao'
	},
	['lider-atlantic'] = {
		_config = {
			title = 'Líder Atlantic',
			gtype = 'hie'
		},
		'chamadosmec.permissao',
		'lider-atlantic.permissao',
		'atlantic.permissao'
	},
	
	
	['elitecar'] = {
		_config = {
			title = 'Membro Elitecar',
			gtype = 'primario'
		},
		'chamadosmec.permissao',
		'desmanche.permissao',
		'elitecar.permissao'
	},
	['lider-elitecar'] = {
		_config = {
			title = 'Líder Elitecar',
			gtype = 'hie'
		},
		'chamadosmec.permissao',
		'desmanche.permissao',
		'lider-elitecar.permissao',
		'elitecar.permissao'
    },
    
	
	['galar'] = {
		_config = {
			title = 'Membro Galar',
			gtype = 'primario'
		},
		'portag.permissao',
		'casino.permissao'
	},
	['lider-galar'] = {
		_config = {
			title = 'Líder Galar',
			gtype = 'hie'
		},
		'portag.permissao',
		'lider-casino.permissao',
		'casino.permissao'
	},


	['mojito'] = {
		_config = {
			title = 'Membro Mojito',
			gtype = 'primario'
		},
		'mojito.permissao'
	},
	['lider-mojito'] = {
		_config = {
			title = 'Líder Mojito',
			gtype = 'hie'
		},
		'lider-mojito.permissao',
		'mojito.permissao'
	},


	['egito'] = {
		_config = {
			title = 'Membro Do Egito',
			gtype = 'primario'
		},
		'egito.permissao'
	},
	['lider-egito'] = {
		_config = {
			title = 'Líder Do Egito',
			gtype = 'hie'
		},
		'lider-egito.permissao',
		'egito.permissao'
	},


	['lakers'] = {
		_config = {
			title = 'Membro Lakers',
			gtype = 'primario'
		},
		'lakers2.permissao',
		'lakers.permissao'
	},
	['lider-lakers'] = {
		_config = {
			title = 'Líder Lakers',
			gtype = 'hie'
		},
		'lakers2.permissao',
		'lider-lakers.permissao',
		'lakers.permissao'
	},


	['holanda'] = {
		_config = {
			title = 'Membro Holanda',
			gtype = 'primario'
		},
		'holanda.permissao'
	},
	['lider-holanda'] = {
		_config = {
			title = 'Líder Da Holanda',
			gtype = 'hie'
		},
		'lider-holanda.permissao',
		'holanda.permissao'
	},

	
	['bratva'] = {
		_config = {
			title = 'Membro Bratva',
			gtype = 'primario'
		},
		'bratva.permissao'
	},
	['lider-bratva'] = {
		_config = {
			title = 'Líder Bratva',
			gtype = 'hie'
		},
		'lider-bratva.permissao',
		'bratva.permissao'
	},

	
	['cartel'] = {
		_config = {
			title = 'Membro Cartel',
			gtype = 'primario'
		},
		'cartel.permissao'
	},
	['lider-cartel'] = {
		_config = {
			title = 'Líder Cartel',
			gtype = 'hie'
		},
		'lider-cartel.permissao',
		'cartel.permissao'
	},

	
	['aguiasdonorte'] = {
		_config = {
			title = 'Membro Aguias do Norte', -- Galaxy
			gtype = 'primario'
		},
		'aguiasdonorte.permissao'
	},
	['lider-aguiasdonorte'] = {
		_config = {
			title = 'Líder Aguias do Norte',
			gtype = 'hie'
		},
		'lider-aguiasdonorte.permissao',
		'aguiasdonorte.permissao'
	},

	
	['anjosdoasfalto'] = {
		_config = {
			title = 'Membro Anjos do Asfalto', -- Tequi-La-La
			gtype = 'primario'
		},
		'anjosdoasfalto.permissao'
	},
	['lider-anjosdoasfalto'] = {
		_config = {
			title = 'Líder Anjos do Asfalto',
			gtype = 'hie'
		},
		'lider-anjosdoasfalto.permissao',
		'anjosdoasfalto.permissao'
	},


	['vanilla'] = {
		_config = {
			title = 'Membro Vanilla', -- vanilla
			gtype = 'primario'
		},
		'vanilla.permissao'
	},
	['lider-vanilla'] = {
		_config = {
			title = 'Líder Vanilla',
			gtype = 'hie'
		},
		'lider-vanilla.permissao',
		'vanilla.permissao'
	},


	['galaxy'] = {
		_config = {
			title = 'Membro Galaxy',
			gtype = 'primario'
		},
		'galaxy.permissao'
	},
	['lidergalaxy'] = {
		_config = {
			title = 'Lider Galaxy',
			gtype = 'hie'
		},
		'lider-galaxy.permissao',
		'galaxy.permissao'
	},


	['turquia'] = {
		_config = {
			title = 'Membro Turquia', -- vanilla
			gtype = 'primario'
		},
		'turquia.permissao'
	},
	['lider-turquia'] = {
		_config = {
			title = 'Líder Turquia',
			gtype = 'hie'
		},
		'lider-turquia.permissao',
		'turquia.permissao'
	},

	
	['vilarica'] = {
		_config = {
			title = 'Membro Vilarica', -- vilarica
			gtype = 'primario'
		},
		'vilarica.permissao'
	},
	['lider-vilarica'] = {
		_config = {
			title = 'Líder Vilarica',
			gtype = 'hie'
		},
		'lider-vilarica.permissao',
		'vilarica.permissao'
	},


	['complexo'] = {
		_config = {
			title = 'Membro Complexo',
			gtype = 'primario'
		},
		'complexo.permissao'
	},
	['lider-complexo'] = {
		_config = {
			title = 'Líder Complexo',
			gtype = 'hie'
		},
		'lider-complexo.permissao',
		'complexo.permissao'
	},


	['beiramar'] = {
		_config = {
			title = 'Membro Beiramar',
			gtype = 'primario'
		},
		'beiramar.permissao'
	},
	['lider-beiramar'] = {
		_config = {
			title = 'Líder Beiramar',
			gtype = 'hie'
		},
		'lider-beiramar.permissao',
		'beiramar.permissao'
	},


	['grecia'] = {
		_config = {
			title = 'Membro Da Grecia',
			gtype = 'primario'
		},
		'grecia.permissao'
	},
	['lider-grecia'] = {
		_config = {
			title = 'Líder Da Grecia',
			gtype = 'hie'
		},
		'lider-grecia.permissao',
		'grecia.permissao'
	},
	
	['roxos'] = {
		_config = {
			title = 'Membro Roxos',
			gtype = 'primario'
		},
		'roxos.permissao'
	},
	['lider-roxos'] = {
		_config = {
			title = 'Líder Roxos',
			gtype = 'hie'
		},
		'lider-roxos.permissao',
		'roxos.permissao'
	},

	['faccao'] = {
		_config = {
			title = 'VIP Facçao',
			gtype = 'pass'
		},
		'vipfac.permissao',
		'mochila.permissao',
		'roupas.permissao'
	},
	['vipgreenvalley'] = {
		_config = {
			title = 'VIP GreenValley',
			gtype = 'pass'
		},
		'vipgreenvalley.permissao',
		'mochila.permissao'
	},
	['vipdiamante'] = {
		_config = {
			title = 'VIP Diamante',
			gtype = 'pass'
		},
		'vipdiamante.permissao',
		'mochila.permissao'
	},
	['vipplatina'] = {
		_config = {
			title = 'VIP Platina',
			gtype = 'pass'
		},
		'vipplatina.permissao',
		'mochila.permissao'
	},
	['vipouro'] = {
		_config = {
			title = 'VIP Ouro',
			gtype = 'pass'
		},
		'vipouro.permissao'
	},
	['vipprata'] = {
		_config = {
			title = 'VIP Prata',
			gtype = 'pass'
		},
		'vipprata.permissao'
	},
	['vipbronze'] = {
		_config = {
			title = 'VIP Bronze',
			gtype = 'pass'
		},
		'vipbronze.permissao'
	},
	['vipgratis'] = {
		_config = {
			title = 'VIP Gratis',
			gtype = 'pass'
		},
		'vipgratis.permissao',
		'mochila.permissao'
	},
	['viptucano'] = {
		_config = {
			title = 'Vip Tucano',
			gtype = 'pass'
		},
		'viptucano.permissao'
	},
	['booster'] = {
		_config = {
			title = 'Booster Pass',
			gtype = 'booster'
		},
		'booster.permissao'
	},
	['cofre1'] = {
		_config = {
			title = 'cofre1',
			gtype = 'secundario'
		},
		'cofre1.permissao',
	},
	['cofre2'] = {
		_config = {
			title = 'cofre2',
			gtype = 'secundario'
		},
		'cofre2.permissao',
	},
	['cofre3'] = {
		_config = {
			title = 'cofre3',
			gtype = 'secundario'
		},
		'cofre3.permissao',
	},
	['cofre4'] = {
		_config = {
			title = 'cofre4',
			gtype = 'secundario'
		},
		'cofre4.permissao',
	},
	['cofre5'] = {
		_config = {
			title = 'cofre5',
			gtype = 'secundario'
		},
		'cofre5.permissao',
	},
	['cofre6'] = {
		_config = {
			title = 'cofre6',
			gtype = 'secundario'
		},
		'cofre6.permissao',
	},
	['cofre7'] = {
		_config = {
			title = 'cofre7',
			gtype = 'secundario'
		},
		'cofre7.permissao',
	},
	['cofre8'] = {
		_config = {
			title = 'cofre8',
			gtype = 'secundario'
		},
		'cofre8.permissao',
	},
	['cofre9'] = {
		_config = {
			title = 'cofre9',
			gtype = 'secundario'
		},
		'cofre9.permissao',
	},
	['cofre10'] = {
		_config = {
			title = 'cofre10',
			gtype = 'secundario'
		},
		'cofre10.permissao',
	},
	['cofre11'] = {
		_config = {
			title = 'cofre11',
			gtype = 'secundario'
		},
		'cofre11.permissao',
	},
	['cofre12'] = {
		_config = {
			title = 'cofre12',
			gtype = 'secundario'
		},
		'cofre12.permissao',
	},
	['somautomotivo'] = {
		_config = {
			title = 'Som Automotivo',
			gtype = 'secundario'
		},
		'somautomotivo.permissao',
	},
	['marinho'] = {
		_config = {
			title = 'Marinho',
			gtype = 'secundario'
		},
		'marinho.permissao',
	},
	['lexy'] = {
		_config = {
			title = 'Lexy',
			gtype = 'secundario'
		},
		'lexy.permissao',
	},
	['godmode'] = {
		_config = {
			title = 'GodMode',
			gtype = 'secundario'
		},
		"godmode.permissao"
	},
	['truck'] = {
		_config = {
			title = 'Truck',
			gtype = 'secundario'
		},
		"truck.permissao"
	},
	['casamarcao'] = {
		_config = {
			title = 'Casa Marcao',
			gtype = 'secundario'
		},
		'casamarcao.permissao',
	},
	['norinha'] = {
		_config = {
			title = 'Norinha',
			gtype = 'secundario'
		},
		'norinha.permissao'
	},
	['verificado'] = {
		_config = {
			title = 'Verificado',
			gtype = 'secundario'
		},
		'verificado.permissao'
	},
	['civil'] = {
		'elevador.permissao'
	},
}

return groups