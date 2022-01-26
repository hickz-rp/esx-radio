fx_version 'cerulean'
game 'gta5'

shared_script '@es_extended/imports.lua'
shared_script 'config.lua'

client_scripts {
    'client.lua',
    'animation.lua'
}

server_script 'server.lua'

ui_page('html/ui.html')

files {
    'html/**/*'
}

lua54 'yes'