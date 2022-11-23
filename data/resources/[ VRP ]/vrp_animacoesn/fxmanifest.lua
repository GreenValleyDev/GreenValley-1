shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'bodacious'
game 'gta5'

description 'Animations for Cool For The Summer Collection @ AjnaMods'
author 'Ana Clara Rodrigues'

client_scripts {
	'config.lua',
	'client/*.lua'
}

server_scripts {
	'server/*.lua'
}