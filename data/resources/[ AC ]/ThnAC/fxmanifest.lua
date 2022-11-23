fx_version 'adamant'
game 'gta5'

author 'zNex#0001'
description 'www.thunderanticheat.com' 
version '3.0'

ui_page "admin_menu/index.html"

client_scripts {
    "src/client.lua"
}

server_scripts {
    "src/server.lua",
    "screenshot/index.js"
}

files {
    'loader.lua',
    'natives.lua',
    'native.lua',
    "admin_menu/**",
}

exports { 
    'receberDados',
    'getUsers',
    'getSourceId',
    'getUser',
    'setGroup'
}