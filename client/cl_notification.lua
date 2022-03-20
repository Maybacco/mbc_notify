-- EXMAPLE USAGE:
--
-- TriggerEvent('mbc_notify:NotifyLeft', "first text", "second text", "generic_textures", "tick", 4000)
-- TriggerEvent('mbc_notify:Tip', "your text", 4000)
-- TriggerEvent('mbc_notify:NotifyTop', "your text", "TOWN_ARMADILLO", 4000)
-- TriggerEvent('mbc_notify:ShowSimpleRightText', "your text",  4000)
-- TriggerEvent('mbc_notify:ShowObjective', "your text", 4000)
-- TriggerEvent('mbc_notify:ShowTopNotification', "your text", "your text", 4000)
-- TriggerEvent('mbc_notify:ShowAdvancedRightNotification', "your text", "generic_textures" , "tick" , "COLOR_PURE_WHITE", 4000)
-- TriggerEvent('mbc_notify:ShowBasicTopNotification', "your text", 4000)
-- TriggerEvent('mbc_notify:ShowSimpleCenterText', "your text", 4000)

RegisterNetEvent('mbc_notify:NotifyLeft')
AddEventHandler('mbc_notify:NotifyLeft', function(firsttext, secondtext, dict, icon, duration)
    local _dict = dict
    local _icon = icon
    if not LoadTexture(_dict) then
        _dict = "generic_textures"
        LoadTexture(_dict)
        _icon = "tick"
    end
    exports.mbc_notify:ShowAdvancedNotification(tostring(firsttext), tostring(secondtext), tostring(_dict), tostring(_icon), tonumber(duration))
end)

RegisterNetEvent('mbc_notify:Tip')
AddEventHandler('mbc_notify:Tip', function(text, duration)
    exports.mbc_notify:ShowTooltip(tostring(text), tonumber(duration))
end)

RegisterNetEvent('mbc_notify:NotifyTop')
AddEventHandler('mbc_notify:NotifyTop', function(text, location, duration)
    exports.mbc_notify:ShowLocationNotification(tostring(text), tostring(location), tonumber(duration))
end)

RegisterNetEvent('mbc_notify:ShowSimpleRightText')
AddEventHandler('mbc_notify:ShowSimpleRightText', function(text, duration)
    exports.mbc_notify:ShowSimpleRightText(tostring(text), tonumber(duration))
end)

RegisterNetEvent('mbc_notify:ShowObjective')
AddEventHandler('mbc_notify:ShowObjective', function(text, duration)
    exports.mbc_notify:ShowObjective(tostring(text), tonumber(duration))
end)

RegisterNetEvent('mbc_notify:ShowTopNotification')
AddEventHandler('mbc_notify:ShowTopNotification', function(tittle, subtitle, duration)
    exports.mbc_notify:ShowTopNotification(tostring(tittle), tostring(subtitle), tonumber(duration))
end)

RegisterNetEvent('mbc_notify:ShowAdvancedRightNotification')
AddEventHandler('mbc_notify:ShowAdvancedRightNotification', function(text, dict, icon, text_color, duration)
    local _dict = dict
    local _icon = icon
    if not LoadTexture(_dict) then
        _dict = "generic_textures"
        LoadTexture(_dict)
        _icon = "tick"
    end
    exports.mbc_notify:ShowAdvancedRightNotification(tostring(text), tostring(_dict), tostring(_icon), tostring(text_color), tonumber(duration))
end)

RegisterNetEvent('mbc_notify:ShowBasicTopNotification')
AddEventHandler('mbc_notify:ShowBasicTopNotification', function(text, duration)
    exports.mbc_notify:ShowBasicTopNotification(tostring(text), tonumber(duration))
end)

RegisterNetEvent('mbc_notify:ShowSimpleCenterText')
AddEventHandler('mbc_notify:ShowSimpleCenterText', function(text, duration)
    exports.mbc_notify:ShowSimpleCenterText(tostring(text), tonumber(duration))
end)

function LoadTexture(dict)
    if Citizen.InvokeNative(0x7332461FC59EB7EC, dict) then
        RequestStreamedTextureDict(dict, true)
        while not HasStreamedTextureDictLoaded(dict) do
            Wait(1)
        end
        return true
    else
        return false
    end
end
