shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'cerulean'
games { 'gta5' }

client_scripts {
    '@vrp/lib/utils.lua',
	'config.lua',
    'client/*.lua',
}

server_scripts {
    '@vrp/lib/utils.lua',
    'config.lua',
    'server/*.lua',
}

ui_page {
    'html/index.html',
}

files {
    'html/index.html',
    'html/css/*.css',
    'html/js/*.js',
    'html/font/*.svg',
    'html/font/*.ttf',
    'html/font/*.eot',
    'html/font/*.woff',
    'html/font/*.woff2',
    'html/images/**/*.svg'
}              