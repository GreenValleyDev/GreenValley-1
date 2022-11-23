local config = {}

config.Token          = "7headt93ncL5YUqsQyUCmNa3GEwV0hf82MdhMZ4jYz2Ht4dd49rXHaBCDsm8"
config.LicenseKey     = "4N4N-73QV-V0AZ-NXAF"
config.currency       = "R$"
config.textwithdrawal = "Retirado por"
config.textdeposit    = "Depositado por"
config.texttake       = "Retirado por"
config.textstore      = "Colocado por"
config.IPImages       = "http://191.96.79.246/images/itens/"
config.command        = "painel"
config.keybind        = "F10"
config.webhooklink    = "seu link de webhook"
config.webhookimage   = "seu imagem de webhook"

config.blacklist = {
    command = "blacklist",
    permissions = {
        "manager.permissao"
    }
}

config.paineladm = {
    command = "paineladm",
    permissions = {
        "manager.permissao"
    }
}

config.reloadgroups = {
    command = "reloadgroups",
    permissions = {
        "manager.permissao"
    }
}

config.discord = {
    active   = false,
    guildid  = "",
    bottoken = ""
}

config.groups = {
    ["Hospital"] = { --organization name
        chest     = "Hospital", --chest name of logs
        bank      = false, --active bank (true|false)
        members   = 99, --maxmembers of organization
        blacklist = {
            active = true, --active blacklist (true|false)
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "diretor-geral", --group in service 
                offservice = "diretor-geral-folga", --group off service 
                withdraw   = true, --permission to withdraw (true|false)
                manager    = true --permission to manager members (true|false)
            },
            [2] = { 
                inservice  = "diretor-vice",
                offservice = "diretor-vice-folga",
                withdraw   = false,
                manager    = true
            },
            [3] = { 
                inservice  = "medico-chefe",
                offservice = "medico-chefe-folga",
                withdraw   = false,
                manager    = false
            },
            [4] = { 
                inservice  = "medico",
                offservice = "medico-folga",
                withdraw   = false,
                manager    = false
            },
            [5] = { 
                inservice  = "enfermeiro",
                offservice = "enfermeiro-folga",
                withdraw   = false,
                manager    = false
            },
            [6] = { 
                inservice  = "paramedico",
                offservice = "paramedico-folga",
                withdraw   = false,
                manager    = false
            },
            [7] = { 
                inservice  = "residente",
                offservice = "residente-folga",
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["policia"] = {
        chest     = "Policia",
        bank      = false,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "comandopolicia",
                offservice = "comandopolicia-paisana",
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "policia",
                offservice = "paisana-policia",
                withdraw   = true,
                manager    = false
            }
        }
    },
    
    ["Mecanicos"] = {
        chest     = "Mecanico",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-mecanico",
                offservice = "lider-mecanico-folga",
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "mecanico",
                offservice = "paisana-mecanico",
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Grecia"] = {
        chest     = "Grecia",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-grecia",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "grecia",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Complexo"] = {
        chest     = "Complexo",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-complexo",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "complexo",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Vilarica"] = {
        chest     = "Vilarica",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-rica",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "vilarica",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Beiramar"] = {
        chest     = "Beiramar",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-beiramar",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "beiramar",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    
    ["Holanda"] = {
        chest     = "Holanda",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-holanda",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "holanda",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Franca"] = {
        chest     = "Franca",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-franca",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "franca",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Egito"] = {
        chest     = "Egito",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-egito",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "egito",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Lakers"] = {
        chest     = "Lakers",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-lakers",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "lakers",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Napoles"] = {
        chest     = "Napoles",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-napoles",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "napoles",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
    
    ["Elitecar"] = {
        chest     = "Elitecar",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-elitecar",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "elitecar",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Galaxy"] = {
        chest     = "Galaxy",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-galaxy",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "galaxy",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },

    ["Galar"] = {
        chest     = "Galar",
        bank      = true,
        members   = 99,
        blacklist = {
            active = true,
            time   = 3,   --in days
        },
        permissions = {
            [1] = { 
                inservice  = "lider-galar",
                offservice = false,
                withdraw   = true,
                manager    = true
            },
            [2] = { 
                inservice  = "galar",
                offservice = false,
                withdraw   = false,
                manager    = false
            }
        }
    },
}

config.contractsamerole       = false
config.membersinorganizations = false

config.starttablet = function()
    vRP._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a","idle_b","prop_cs_tablet",49,60309)
end

config.stoptablet = function()
	vRP._DeletarObjeto()
	vRP._stopAnim(false)
end

return config