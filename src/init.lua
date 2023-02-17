
local mod_name = "polymorph-settings"

GLOBAL = {
    mod_name = mod_name,
    files_path = "mods/" .. mod_name .. "/files",
}

function OnWorldPostUpdate() 
    --if _main then _main() end
end

function OnPlayerSpawned( player_entity )
    --dofile_once(GLOBAL.files_path .. "/main.lua")
end

function OnPausedChanged(is_paused, is_inventory_pause)
    GLOBAL.mod_settings:refresh()
end