
local ModSettings = {}
ModSettings.__index = ModSettings

function ModSettings.new(mod_name)
    local self = {}
    setmetatable(self, ModSettings)

    self.mod_name = mod_name
    --self.is_localized = true
    self:refresh()

    return self
end

function ModSettings:refresh()
    --self.is_localized = self:get_setting("UI_LOCALIZED")
end

function ModSettings:get_setting(setting_name)
    return ModSettingGet(self.mod_name .. "." .. setting_name)
end


return ModSettings