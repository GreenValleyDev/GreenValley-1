config = {}

config.medicpermission = "ems.permissao" --Permissão dos Medicos

config.revive = "reanimar" --Comando para o Paramedico reanimar o cidadão

config.diagnosticPlayer = "diagnostico" --Comando para o Paramedico fazer o diagnostico no cidadão

config.treatment = "tratamento" --Comando para o Paramedico fazer o tratamento no cidadão
config.treatment2 = "tratamento2" --Comando para o Paramedico fazer o tratamento no cidadão

config.reviveillegal = "reanimarilegal" --Comando para o Paramedico reanimar o cidadão

config.treatmentillegal = "tratamentoilegal" --Comando para o Paramedico fazer o tratamento no cidadão

config.illegalpermissions = {
	"manager.permissao",
	"anjosdoasfalto.permissao",
	"aguiasdonorte.permissao"
}

config.illegalpositions = {
	{ ['x'] = -471.64, ['y'] = 6287.36, ['z'] = 14.63 },
	{ ['x'] = 1213.32, ['y'] = -494.24, ['z'] = 67.17 }
}

config.stretchers = { --Macas do Hospital
	{ ['x'] = -1877.74, ['y'] = -322.73, ['z'] = 49.44, ['x2'] = -1878.55, ['y2'] = -322.03, ['z2'] = 49.19, ['h'] = 142.26 },
	{ ['x'] = -1874.33, ['y'] = -325.18, ['z'] = 49.44, ['x2'] = -1874.99, ['y2'] = -324.52, ['z2'] = 49.19, ['h'] = 139.55 },
	{ ['x'] = -1871.25, ['y'] = -327.45, ['z'] = 49.44, ['x2'] = -1871.83, ['y2'] = -326.63, ['z2'] = 49.19, ['h'] = 138.45 },
	{ ['x'] = -1867.79, ['y'] = -330.6, ['z'] = 49.44, ['x2'] = -1868.44, ['y2'] = -329.7, ['z2'] = 49.19, ['h'] = 135.71 }, 
	{ ['x'] = -1864.85, ['y'] = -332.66, ['z'] = 49.44, ['x2'] = -1865.56, ['y2'] = -331.79, ['z2'] = 49.2, ['h'] = 139.81 },
	{ ['x'] = -1863.3, ['y'] = -333.54, ['z'] = 49.44, ['x2'] = -1862.6, ['y2'] = -334.24, ['z2'] = 49.19, ['h'] = 141.82 },
	{ ['x'] = -1876.19, ['y'] = -317.5, ['z'] = 49.45, ['x2'] = -1875.42, ['y2'] = -318.21, ['z2'] = 49.19, ['h'] = 321.72 },
	{ ['x'] = -1871.09, ['y'] = -321.36, ['z'] = 49.45, ['x2'] = -1872.24, ['y2'] = -320.9, ['z2'] = 49.19, ['h'] = 315.18 },
	{ ['x'] = -1869.71, ['y'] = -322.63, ['z'] = 49.45, ['x2'] = -1869.05, ['y2'] = -323.46, ['z2'] = 49.19, ['h'] = 316.82 },

	--Paleto
	{ ['x'] = -246.12, ['y'] = 6316.68, ['z'] = 32.43, ['x2'] = -245.26, ['y2'] = 6316.23, ['z2'] = 32.35, ['h'] = 315.0 },
	{ ['x'] = -247.69, ['y'] = 6318.58, ['z'] = 32.43, ['x2'] = -246.98, ['y2'] = 6317.95, ['z2'] = 32.35, ['h'] = 315.0 },
	{ ['x'] = -251.47, ['y'] = 6322.53, ['z'] = 32.43, ['x2'] = -252.14, ['y2'] = 6323.12, ['z2'] = 32.35, ['h'] = 315.0 },
	{ ['x'] = -256.73, ['y'] = 6316.24, ['z'] = 32.43, ['x2'] = -256.08, ['y2'] = 6315.58, ['z2'] = 32.35, ['h'] = 135.0 },
	{ ['x'] = -253.19, ['y'] = 6312.80, ['z'] = 32.43, ['x2'] = -252.63, ['y2'] = 6312.13, ['z2'] = 32.34, ['h'] = 135.0 },
	{ ['x'] = -251.63, ['y'] = 6311.09, ['z'] = 32.43, ['x2'] = -251.02, ['y2'] = 6310.52, ['z2'] = 32.35, ['h'] = 135.0 },
}