shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'cerulean'
game 'gta5'
author 'Jaime Filho <https://github.com/jaimeadf>'
description "A resource for FiveM that captures the screen of a player and uploads it to a discord webhook."
version '1.3.6'
url 'https://github.com/jaimeadf/discord-screenshot'
server_script 'dist/server.js'
server_only 'yes'
dependency 'screenshot-basic'              