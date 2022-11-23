shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'adamant'
game 'gta5'

author 'FELIPEEX-NETWORKING'
contact 'Script for tablet police'
version '1.0.1'

ui_page "nui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server.lua"
}

files {
	"nui/images/*.jpg",
	"nui/images/*.png",
	"nui/images/*.svg",
	"nui/images/*.gif",
	"nui/index.html",
	"nui/jquery.js",
	"nui/css.css"
}              