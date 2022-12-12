--Check Environment
if GetConvar('nineadminServerMode', 'false') ~= 'true' then
  return
end

local IS_PTFX_DISABLED = (GetConvar('nineadmin-menuPtfxDisable', 'false') == 'true')

RegisterNetEvent('nineadmin:menu:playerModeChanged', function(mode, nearbyPlayers)
  local src = source
  if mode ~= 'godmode' and mode ~= 'noclip' and mode ~= 'none' then
    debugPrint("Invalid player mode requested by " .. GetPlayerName(src) .. " (mode: " .. (mode or 'nil'))
    return
  end

  local allow = PlayerHasTxPermission(src, 'players.playermode')
  TriggerEvent("txaLogger:menuEvent", src, "playerModeChanged", allow, mode)
  if allow then
    TriggerClientEvent('nineadmin:menu:playerModeChanged', src, mode, not IS_PTFX_DISABLED)

    if not IS_PTFX_DISABLED then
      for _, v in ipairs(nearbyPlayers) do
        TriggerClientEvent('txcl:syncPtfxEffect', v, src)
      end
    end
  end
end)
