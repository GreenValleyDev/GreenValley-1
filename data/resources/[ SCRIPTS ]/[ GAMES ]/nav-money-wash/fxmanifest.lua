shared_script "@ThnAC/natives.lua"
---- Evolution Software Inc

fx_version 'bodacious'
game 'gta5'

ui_page 'nui/moneywash.html'

client_scripts {
	'@vrp/lib/utils.lua',
	'client/*.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'server/*.lua'
}

files {
  'nui/*',
  'nui/**/*'
}
              