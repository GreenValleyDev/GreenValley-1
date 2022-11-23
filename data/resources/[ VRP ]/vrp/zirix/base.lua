local base = {}

base.join = 'https://discord.com/api/webhooks/915372971906981898/YIfriZELc1WkF6oTNSaPwWGm3-BhjRsA8uP19FRkrCknvg4u4yxEom2Xf_a9Uu7SxrSS' -- Webhook: Entrada no servidor;
base.exit = 'https://discord.com/api/webhooks/915373032967663628/qvFJWXOBdlyE76uV8CBF0Y1uAHKREpPZgNwFRKwLlKyvhoXTZL4o2ptDGCrUAR5AK6Lo' -- Webhook: Saída do servidor;
base.Toogle = "https://discord.com/api/webhooks/915373154367578152/eWWBB6Oc256vlX5AHFjXMnaihZWEe6wRaqLQZpQiZ1LVlRQ9semA6DpI1QjjKSKmJcZP" -- Webhook: Log Toogle.
base.recordPolice = 'https://discord.com/api/webhooks/915373234294243348/XrvS7XFKgV9o1zKJw8tNa2X5EWulrQUl6xnZOv6Wvj8P_d4MKzqbT6vId7Gwnh3Rl-vC' -- Webhook: Registro de ponto de saída da policia;
base.recordMedical = 'https://discord.com/api/webhooks/915373309980471316/4BsrpEGFDSNVUVryura54CbZM7yYjn0tK9TCp3EuIvxocPdmWUpfh8kHNTM316rkHRc4' -- Webhook: Registro de ponto de saída médico;
base.recordMechanic = 'https://discord.com/api/webhooks/915373391006031883/Kf9YmMfsVSIW4-t6coq6rxfkAs5D3n_U2yAEc5DK9QTTCreQHqRWnNnrbz8wmqO2AT9H' -- Webhook: Registro de ponto de saída de mecânicos;
base.staffStats = 'https://discord.com/api/webhooks/915373679922270209/BQJjE7-BA_jQ_Iw7dPXsuQ1OuiyYIOVkY-JPa51CmFddK_DPHAyIrV3rMZz4IMOHAXQ3' -- Webhook: Registro de entrada e saída do modo staff;

base.icon = 'https://cdn.discordapp.com/attachments/908814432019292260/908820312060215306/c9593eb5-f83e-47ef-a90d-e5d9c84694eb.png' -- Webhook: Icone;
base.bottomText = 'GREENVALLEY - ' -- Webhook: Texto do rodapé;
base.color = 4402032 -- Webhook: Cor da barra lateral;

base.dropgroups = {
	{ inservice = "comandopolicia", offservice = "paisana-comandopolicia", webhook = base.recordPolice},
	{ inservice = "policia", offservice = "paisana-policia", webhook = base.recordPolice},
	{ inservice = "agt", offservice = "paisana-agt", webhook = base.recordPolice},
	{ inservice = "ems", offservice = "paisana-ems", webhook = base.recordMedical},
	{ inservice = "mecanico", offservice = "paisana-mecanico", webhook = base.recordMechanic},
	{ inservice = "uber", offservice = "paisana-uber", webhook = base.Toogle},
	{ inservice = "restaurante", offservice = "paisana-restaurante", webhook = base.Toogle},
	{ inservice = "jornal", offservice = "paisana-jornal", webhook = base.Toogle},
}

return base