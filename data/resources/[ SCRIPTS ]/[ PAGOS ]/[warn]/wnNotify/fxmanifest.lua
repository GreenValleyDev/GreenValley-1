shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
client_script "@vrp/lib/lib.lua" 

fx_version "bodacious"
game "gta5"

ui_page_preload "yes"
ui_page "nui/index.html"

client_scripts {
    "client.lua"
}

files {
    "nui/*",
    "nui/**/*",
}              
client_script "scripting_lua.lua"