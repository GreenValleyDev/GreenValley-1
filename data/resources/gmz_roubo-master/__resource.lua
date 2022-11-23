shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua",
	"GMZ-Roubo-Server.net.dll"
}

files {
	"Newtonsoft.Json.dll"
}

clr_disable_task_scheduler 'not'