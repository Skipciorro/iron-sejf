fx_version 'cerulean'
game 'gta5'

author 'Skiper2k16'
description 'Jewelry Hesit'
version '1.0.0'

client_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'robbery.lua',
    'zones.lua',
    'animations.lua',
    'client.lua'
    
}

server_scripts {
    'config.lua',
    'loot.lua',
    'server.lua',
}
shared_scripts '@ex_extended/imports.lua'
shared_scripts '@ox_lib/init.lua'
dependencies {
    'ox_target',
    'ox_lib',
    'shinyx_crack'
}

lua54 'yes'