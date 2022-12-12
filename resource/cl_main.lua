-- =============================================
--  ServerCtx Synchronization
-- =============================================
ServerCtx = false

-- NOTE: for now the ServerCtx is only being set when the menu tries to load (enabled or not)
--- Will update ServerCtx based on GlobalState and will send it to NUI
function updateServerCtx()
    _ServerCtx = GlobalState.nineadminServerCtx
    if _ServerCtx == nil then
        print('^3ServerCtx fallback support activated.')
        TriggerServerEvent('nineadmin:events:getServerCtx')
    else
        ServerCtx = _ServerCtx
        print('^2ServerCtx updated from global state')
    end
end

RegisterNetEvent('nineadmin:events:setServerCtx', function(ctx)
    if type(ctx) ~= 'table' then return end
    ServerCtx = ctx
    print('^2ServerCtx updated from server event.')
    sendMenuMessage('setServerCtx', ServerCtx)
end)



-- =============================================
--  Announcement, DirectMessage and Warn handling
-- =============================================
-- Dispatch Announcements
RegisterNetEvent('nineadmin:receiveAnnounce', function(message, author)
    sendMenuMessage(
        'addAnnounceMessage',
        {
            message = message,
            author = author
        }
    )
end)
RegisterNetEvent('nineadmin:receiveDirectMessage', function(message, author)
    sendMenuMessage(
        'addDirectMessage',
        {
            message = message,
            author = author
        }
    )
end)

-- TODO: remove [SPACE] holding requirement?
local isRDR = not TerraingridActivate and true or false
local dismissKey = isRDR and 0xD9D0E1C0 or 22
local dismissKeyGroup = isRDR and 1 or 0
RegisterNetEvent('nineadminClient:warn', function(author, reason)
    toggleMenuVisibility(false)
    sendMenuMessage('setWarnOpen', {
        reason = reason,
        warnedBy = author
    })
    CreateThread(function()
        local countLimit = 100 --10 seconds
        local count = 0
        while true do
            Wait(100)
            if IsControlPressed(dismissKeyGroup, dismissKey) then
                count = count +1
                if count >= countLimit then
                    sendMenuMessage('closeWarning')
                    return
                elseif math.fmod(count, 10) == 0 then
                    sendMenuMessage('pulseWarning')
                end
            else
                count = 0
            end
        end
    end)
end)


-- =============================================
--  Other stuff
-- =============================================
-- Removing unwanted chat suggestions
-- We only want suggestion for: /tx, /nineadmin-debug, /nineadmin-reauth
-- The suggestion is added after 500ms, so we need to wait more
CreateThread(function()
    Wait(1000)
    --Commands
    TriggerEvent('chat:removeSuggestion', '/nineadmin') --too spammy
    TriggerEvent('chat:removeSuggestion', '/txaPing')
    TriggerEvent('chat:removeSuggestion', '/txaKickAll')
    TriggerEvent('chat:removeSuggestion', '/txaEvent')
    TriggerEvent('chat:removeSuggestion', '/txaReportResources')

    --Keybinds
    TriggerEvent('chat:removeSuggestion', '/nineadmin:menu:noClipToggle')
    TriggerEvent('chat:removeSuggestion', '/nineadmin:menu:endSpectate')
    TriggerEvent('chat:removeSuggestion', '/nineadmin:menu:openPlayersPage')
    TriggerEvent('chat:removeSuggestion', '/nineadmin:menu:togglePlayerIDs')

    --Convars
    TriggerEvent('chat:removeSuggestion', '/nineadmin-version')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-locale')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-localeFile')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-verbose')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-luaComHost')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-luaComToken')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-checkPlayerJoin')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-pipeToken')
    TriggerEvent('chat:removeSuggestion', '/nineadminServerMode')

    --Menu convars
    TriggerEvent('chat:removeSuggestion', '/nineadmin-menuEnabled')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-menuAlignRight')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-menuPageKey')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-menuDebug')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-playerIdDistance')
    TriggerEvent('chat:removeSuggestion', '/nineadmin-menuDrunkDuration')
end)

