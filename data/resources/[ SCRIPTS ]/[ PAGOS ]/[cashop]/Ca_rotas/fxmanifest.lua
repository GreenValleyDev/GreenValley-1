shared_script "@ThnAC/natives.lua"
fx_version 'adamant'
game 'gta5'

client_scripts {
	"@vrp/lib/utils.lua",
	"client/client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server/server.lua"
}

file "cfg/config.lua"
