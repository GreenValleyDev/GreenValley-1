shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
fx_version 'adamant'
game 'gta5'

ui_page "index.html"

files {"index.html"}

client_scripts {"unique.lua"}

server_scripts {"@vrp/lib/utils.lua", "unique.lua", "server.js"}
