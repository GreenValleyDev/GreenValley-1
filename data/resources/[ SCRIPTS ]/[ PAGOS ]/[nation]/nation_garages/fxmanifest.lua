shared_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'bodacious'
game 'gta5'

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"cfg/config.lua",
	"cfg/garagens.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"cfg/config.lua",
	"cfg/garagens.lua",
	"server.lua"
}

files {
	"nui/index.html",
	"nui/jquery.js",

	"nui/css.css",
	"nui/iciel-gotham-ultra.otf",
	"nui/images/*",
}                                                        