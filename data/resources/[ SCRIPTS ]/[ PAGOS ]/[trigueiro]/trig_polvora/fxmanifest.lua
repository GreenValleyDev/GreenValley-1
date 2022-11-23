shared_script "@ThnAC/natives.lua"
fx_version 'bodacious'
games { 'gta5' }


client_script {
    "@vrp/lib/utils.lua",
    'client.lua'
}

server_script {
    "@vrp/lib/utils.lua",
    'server.lua'
}