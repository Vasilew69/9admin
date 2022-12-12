# In-Game Menu

nineadmin v4.0.0 introduced an in-game menu equipped with common admin functionality, 
an online player browser, and a slightly trimmed down version of the web panel.

You can find a short preview video [here](https://www.youtube.com/watch?v=jWKg0VQK0sc)

## Accessing the Menu

You can access the menu in-game by using the command `/tx` or `/nineadmin`, alternatively
you can also use a keybind by going to `Game Settings > Key Bindings > FiveM` and 
setting the `(nineadmin) Menu: Open Main Page` option.

### Permissions
Anybody who you would like to give permissions to open the menu in-game, must have a nineadmin
account with either their Discord or Cfx.re identifiers tied to it.

***If you do not have any of these identifiers attached, you will not be able to access the menu***

You can further control the menu options accessible to admins by changing their permissions
in the admin manager as shown below.

![img](https://i.imgur.com/LP7Ij8M.png)

## Convars
The nineadmin menu has a variety of different convars that can alter the default behavior of the menu.  
Convars configured in the settings page should not be set manually.

**nineadmin-menuEnabled** (settings page only)
- Description: Whether the menu is enabled or not. Changing it requires server restart.
- Default: `true`

**nineadmin-menuAlignRight** (settings page only)
- Description: Whether to align the menu to the right of the screen instead of the left.
- Default: `false`

**nineadmin-menuPageKey** (settings page only)
- Description: Will change the key used for changing pages in the menu. This value must be the exact browser key code for your preferred key. You can use [this](https://keycode.info/) website and the `event.code` section to find it.
- Default: `Tab`

**nineadmin-menuDebug**
- Description: Will toggle debug printing on the server and client.
- Default: `false`
- Usage: `+setr nineadmin-menuDebug true`

**nineadmin-menuPlayerIdDistance**
- Description: The distance in which Player IDs become visible, if toggled on.
- Default: 150
- Usage: `+setr nineadmin-menuPlayerIdDistance 100`

**nineadmin-menuDrunkDuration**
- Description: How many seconds the drunk effect (troll action) should last.
- Default: 30
- Usage: `+setr nineadmin-menuDrunkDuration 120`

**nineadmin-menuPtfxDisable**
- Description: Determine whether to not play particles effects whenever an admin's player mode is changed.
- Default: `false`
- Usage: `+set nineadmin-menuPtfxDisable true`

**nineadmin-menuAnnounceNotiPos**
- Description: Determines the location of the nineadmin announcement notification. This **must** use one of the following valid 
positions, `top-center`, `top-left`, `top-right`, `bottom-center`, `bottom-left`, `bottom-right`.
- Default: `top-center`
- Usage: `+set nineadmin-menuAnnounceNotiPos top-right`

## Commands
**tx | nineadmin**
- Description: Will toggle the in-game menu. This command has an optional argument of a player id that will quickly open up the target player's info modal.
- Usage: `/tx (playerID)`, `/nineadmin (playerID)`
- Required Perm: `Must be an admin registered in the Admin Manager`

**nineadmin-debug**
- Description: Will toggle on debug mode without requiring a restart. (Can be used from console)
- Usage: `/nineadmin-debug [0 | 1]`
- Required Perm: `control.server`

**nineadmin-reauth**
- Description: Will retrigger the reauthentication process.
- Usage: `/nineadmin-reauth`
- Required Perm: `none`

## Troubleshooting menu access

- If you type `/tx` and nothing happens, your menu is probably disabled.  
- If you see a red message like [this](https://i.imgur.com/G83uTNC.png) and you are registered on nineadmin, you can type `/nineadmin-reauth` in the chat to retry the authentication.  
- If you can't authenticate and the reason id `Invalid Request: source`, this means the source IP of the HTTP request being made by fxserver to nineadmin is not a "localhost" one, which might occur if your host has multiple IPs. To disable this protection, edit your `config.json` file and add `webServer.disableNuiSourceCheck` with value `true` then restart nineadmin.

## Development
You can find development instructions regarding the menu [here.](https://github.com//blob/master/docs/development.md#menu-development)

## FAQ
- **Q**: Why don't the 'Heal' options revive a player when using ESX/QBCore/etc?
- **A**: Many frameworks independently handle a "dead" state for a player, meaning
  the menu is unable to reset this state in an resource agnostic form directly. To establish compatibility 
  with any framework, nineadmin will emit an [nineadmin:events:healedPlayer](https://github.com/vasilew69/9admin/blob/master/docs/events.md#nineadmineventshealedplayer-v48) 
  for developers to handle.
