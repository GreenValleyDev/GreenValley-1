shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'adamant'
game 'gta5'

ui_page 'nui/darkside.html'

client_scripts {
	'@vrp/lib/utils.lua',
	'config/config.lua',
	'hansolo/*.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'config/config.lua',
	'skywalker.lua'
}

files {
	'nui/*.html',
	'nui/*.css',
	'nui/*.js'
}              