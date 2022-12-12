--Check Environment
if GetConvar('nineadminServerMode', 'false') ~= 'true' then
  return
end

local frozenPlayers = {}

local function isPlayerFrozen(targetId)
  return frozenPlayers[targetId] or false
end

local function setPlayerFrozenInMap(targetId, status)
  frozenPlayers[targetId] = status or nil
end

RegisterNetEvent("nineadmin:menu:freezePlayer", function(targetId)
  local src = source
  local allow = PlayerHasTxPermission(src, 'players.freeze')
  TriggerEvent("txaLogger:menuEvent", src, "freezePlayer", allow, targetId)
  if allow then
    local newFrozenStatus = not isPlayerFrozen(targetId)
    setPlayerFrozenInMap(targetId, newFrozenStatus)

    TriggerClientEvent("nineadmin:menu:freezeResp", src, newFrozenStatus)
    TriggerClientEvent("nineadmin:menu:freezePlayer", targetId, newFrozenStatus)
  end
end)
