import { atom, useRecoilValue, useSetRecoilState } from "recoil";

// TODO: Make an enum
export type ResolvablePermission =
  | "all_permissions"
  | "manage.admins"
  | "commands.resources"
  | "players.playermode"
  | "players.teleport"
  | "players.heal"
  | "players.trollmenu"
  | "players.ban"
  | "players.kick"
  | "players.message"
  | "players.warn"
  | "players.whitelist"
  | "console.view"
  | "console.write"
  | "control.server"
  | "server.cfg.editor"
  | "settings.view"
  | "settings.write"
  | "nineadmin.log.view"
  | "menu.vehicle"
  | "menu.clear_area"
  | "players.spectate"
  | "players.troll"
  | "players.freeze";

const permissionState = atom<ResolvablePermission[]>({
  key: "permissionsState",
  default: [],
});

export const usePermissionsValue = () => useRecoilValue(permissionState);

export const useSetPermissions = () => useSetRecoilState(permissionState);
