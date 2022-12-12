--Check Environment
if GetConvar('nineadminServerMode', 'false') ~= 'true' then
    return
end

RegisterNetEvent('nineadmin:menu:drunkEffectPlayer', function(id)
    local src = source
    local allow = PlayerHasTxPermission(src, 'players.troll')
    if allow then
        TriggerClientEvent('nineadmin:menu:drunkEffect', id)
    end
    TriggerEvent('txaLogger:menuEvent', src, 'drunkEffect', allow, id)
end)

RegisterNetEvent('nineadmin:menu:setOnFire', function(id)
    local src = source
    local allow = PlayerHasTxPermission(src, 'players.troll')
    if allow then
        TriggerClientEvent('nineadmin:menu:setOnFire', id)
    end
    TriggerEvent('txaLogger:menuEvent', src, 'setOnFire', allow, id)
end)

RegisterNetEvent('nineadmin:menu:wildAttack', function(id)
    local src = source
    local allow = PlayerHasTxPermission(src, 'players.troll')
    if allow then
        TriggerClientEvent('nineadmin:menu:wildAttack', id)
    end
    TriggerEvent('txaLogger:menuEvent', src, 'wildAttack', allow, id)
end)
