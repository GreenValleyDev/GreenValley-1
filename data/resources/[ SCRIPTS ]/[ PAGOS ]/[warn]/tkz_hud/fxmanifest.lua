shared_script "@ThnAC/natives.lua"
fx_version "bodacious"
game "gta5"

ui_page "ui/index.html"

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	"ui/assets/*",
    "ui/**/*",
	"ui/*"
}