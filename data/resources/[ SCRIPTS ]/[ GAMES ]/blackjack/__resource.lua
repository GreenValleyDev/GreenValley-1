shared_script "@ThnAC/natives.lua"
---- Evolution Software Inc

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency "vrp"

client_scripts {
	'shared.js',
	'client/blackjack.js',
	'client/client.js',
	'client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
    'server.lua'
}

ui_page('client/html/index.html')

files({
    'client/html/index.html',
    'client/html/script.js',
    'client/html/style.css'
})

--[[server_scripts {
	'shared.js',
	'server/server.js'
}]]--              