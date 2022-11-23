config = {}

config.payments = {
	{ ['permissao'] = "juiz.permissao", ['nome'] = "Juiz(a)", ['payment'] = 7000 },
	{ ['permissao'] = "procurador.permissao", ['nome'] = "Procurador(a)", ['payment'] = 4900 },
	{ ['permissao'] = "promotor.permissao", ['nome'] = "Promotor(a)", ['payment'] = 4900 },
	{ ['permissao'] = "defensor.permissao", ['nome'] = "Defensor(a) Público(a)", ['payment'] = 3430 },

	{ ['permissao'] = "comandopolicia.permissao", ['nome'] = "Comando", ['payment'] = 6000 },
	{ ['permissao'] = "policia.permissao", ['nome'] = "Policia", ['payment'] = 3000 },

	{ ['permissao'] = "diretor-geral.permissao", ['nome'] = "Diretor Geral", ['payment'] = 6000 },
	{ ['permissao'] = "diretor-auxiliar.permissao", ['nome'] = "Diretor Auxiliar", ['payment'] = 5500 },
	{ ['permissao'] = "medico-chefe.permissao", ['nome'] = "Médico Chefe", ['payment'] = 5000 },
	{ ['permissao'] = "medico-aulixiar.permissao", ['nome'] = "Médico Auxiliar", ['payment'] = 4500 },
	{ ['permissao'] = "medico-cirurgiao.permissao", ['nome'] = "Médico Cirurgião", ['payment'] = 4000 },
	{ ['permissao'] = "medico.permissao", ['nome'] = "Médico", ['payment'] = 3500 },
	{ ['permissao'] = "residente.permissao", ['nome'] = "Enfermeiro", ['payment'] = 3000 },
	{ ['permissao'] = "vipfac.permissao", ['nome'] = "Vip Facçao", ['payment'] = 5000 },
	{ ['permissao'] = "paramedico.permissao", ['nome'] = "Paramédico", ['payment'] = 2500 },
	{ ['permissao'] = "socorrista.permissao", ['nome'] = "Socorrista", ['payment'] = 2000 },
	{ ['permissao'] = "estagiario.permissao", ['nome'] = "Estágiario", ['payment'] = 900 },

	{ ['permissao'] = "mecanico.permissao", ['nome'] = "Mecânico(a)", ['payment'] = 3000 },
	{ ['permissao'] = "corretor.permissao", ['nome'] = "Corretor(a)", ['payment'] = 2000 },
	{ ['permissao'] = "uber.permissao", ['nome'] = "Uber", ['payment'] = 900 },

	{ ['permissao'] = "vipgreenvalley.permissao", ['nome'] = "VIP GreenValley", ['payment'] = 7000 },
	{ ['permissao'] = "vipdiamante.permissao", ['nome'] = "VIP Diamante", ['payment'] = 6000 },
	{ ['permissao'] = "vipplatina.permissao", ['nome'] = "VIP Platina", ['payment'] = 5000 },
	{ ['permissao'] = "vipouro.permissao", ['nome'] = "VIP Ouro", ['payment'] = 4000 },
	{ ['permissao'] = "vipprata.permissao", ['nome'] = "VIP Prata", ['payment'] = 3000 },
	{ ['permissao'] = "vipbronze.permissao", ['nome'] = "VIP Bronze", ['payment'] = 2000 },
	{ ['permissao'] = "vipgratis.permissao", ['nome'] = "VIP Gratis", ['payment'] = 1000 },
	{ ['permissao'] = "viptucano.permissao", ['nome'] = "VIP Tucano", ['payment'] = 1000 }
}

-- config.toggles = {
-- 	{ ['x'] = 441.29, ['y'] = -981.87, ['z'] = 30.69, ['perm1'] = "policia.permissao", ['perm2'] = "paisana-policia.permissao", ['blip'] = { name = "Policia", color = 51 } },
-- 	{ ['x'] = 463.31, ['y'] = -984.86, ['z'] = 30.72, ['perm1'] = "coronel.permissao", ['perm2'] = "paisana-coronel.permissao", ['blip'] = { name = "Coronel", color = 51 } },

-- 	{ ['x'] = 463.31, ['y'] = -984.86, ['z'] = 30.72, ['perm1'] = "core.permissao", ['perm2'] = "paisanacore.permissao", ['blip'] = { name = "Core", color = 51 } },
-- 	{ ['x'] = 463.31, ['y'] = -984.86, ['z'] = 30.72, ['perm1'] = "delegado.permissao", ['perm2'] = "paisanadelegado.permissao", ['blip'] = { name = "Delegado", color = 51 } },
-- 	{ ['x'] = 463.31, ['y'] = -984.86, ['z'] = 30.72, ['perm1'] = "agente.permissao", ['perm2'] = "paisanaagente.permissao", ['blip'] = { name = "Agente", color = 51 } },

-- 	{ ['x'] = -1820.53, ['y'] = -351.13, ['z'] = 49.47, ['perm1'] = "ems.permissao", ['perm2'] = "paisana-ems.permissao", ['blip'] = { name = "Hospital", color = 51 } },

-- 	{ ['x'] = 842.46, ['y'] = -950.83, ['z'] = 26.5, ['perm1'] = "bennys.permissao", ['perm2'] = "paisana-bennys.permissao", ['blip'] = { name = "Bennys", color = 51 } },
-- }



config.attachs = {
	[GetHashKey("WEAPON_PISTOL_MK2")] = {
		flashlight = "COMPONENT_AT_PI_FLSH_02", --lanterna
		extended = "COMPONENT_PISTOL_MK2_CLIP_02", --alongador
		suppressor = "COMPONENT_AT_PI_SUPP_02", --silenciador
		mounted = "COMPONENT_AT_PI_RAIL" --mira
	},
	[GetHashKey("WEAPON_ASSAULT_RIFLE")] = {
		flashlight = "COMPONENT_AT_PI_FLSH_02", --lanterna
		extended = "COMPONENT_PISTOL_MK2_CLIP_02", --alongador
		suppressor = "COMPONENT_AT_PI_SUPP_02", --silenciador
		mounted = "COMPONENT_AT_PI_RAIL" --mira
	},
	[GetHashKey("WEAPON_PUMPSHOTGUN")] = {
		flashlight = "COMPONENT_AT_AR_FLSH", --lanterna
		extended = "COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER", --alongador
		suppressor = "COMPONENT_AT_SR_SUPP", --silenciador
		mounted = nil --mira
	}
}

config.Item  = "https://discord.com/api/webhooks/1036719134181965894/E0xlbj419u3qK39ukid34vzEEoKc929YuECsCe0nQ9U-Wd7v4SbeaUfsma8vzzhicyKx" -- Webhook: Log Item Gerado ADMIN.
config.Salarys = "https://discord.com/api/webhooks/1036719244160815134/DbpULXQZPqqJUu6dEnbrx0VNfHpQZAiAwgQZqr1YuelDSk6gjynSn_HBmyeEETTEQUxl" -- Webhook: Log Salario.
config.Dumb = "https://discord.com/api/webhooks/1036719401484963990/UfSRiFm188g6zkj6CBFK7JwaTcil2hJyeMkJ6NpjVXHBR6pG453LHE4Neoi8yfCRts5v" -- Webhook: Log Anti BUG Salario.
config.Toogle = "https://discord.com/api/webhooks/1036719523459506196/blbSzOjfaukBhOTlZhyX3ov3d9naQkDdfl6z8WA_O30TkO5IRnVjd_zYiDPWJ0CSrPGx" -- Webhook: Log Toogle.
config.recordPolice = 'https://discord.com/api/webhooks/1036719893522952272/sLXtWeDyR7jUlCKnLJZfmXVxdRFA0K9c-qZWf0jTR18pRS8WDI31els_TwUi1fpoqrTV' -- Webhook: Registro de ponto de saída da policia;
config.recordMedical = 'https://discord.com/api/webhooks/1036719893522952272/sLXtWeDyR7jUlCKnLJZfmXVxdRFA0K9c-qZWf0jTR18pRS8WDI31els_TwUi1fpoqrTV' -- Webhook: Registro de ponto de saída médico;
config.recordMechanic = 'https://discord.com/api/webhooks/1036720116299210752/5V_GgNFPjMXMSv_KuW81B1Q6nYXhFZSfc7TN0Y9iDMNRoscJzUScYU8t8Jwyb0UY_aMO' -- Webhook: Registro de ponto de saída de mecânicos;
config.webhookUnequip = 'https://discord.com/api/webhooks/1036719640409292962/E1Rs8FPU7-etlUsQsAFOND6CAqjCS13ObTNdVZMXO3NoxB47m-yiwotGE8OgYo_sthrG'
config.webhookKill = 'https://discordapp.com/api/webhooks/1036658809982165095/_4uf7SdtKfJnMvPOPgBXlJQ-odLfC0o4Db-LeBT2tba3cV6rBkC5PuKq4Kv7NHUTeGfX'
config.Malas = "https://discord.com/api/webhooks/1037171519383679136/oIOrNMq7FxAtfZdc_-yqaAHOluf6EISBKtfWLAAqgLICTJUXleaZLETNRWWBadSw8a1P" -- Webhook: Log Item Gerado ADMIN.

config.webhookIcon = 'https://cdn.discordapp.com/attachments/908814432019292260/908820312060215306/c9593eb5-f83e-47ef-a90d-e5d9c84694eb.png'
config.webhookBottomText = 'GREENVALLEY - '
config.webhookColor = 16431885