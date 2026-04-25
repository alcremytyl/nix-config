{ lib, ... }:
let 
  base = import ../../modules/waybar/bar-base.nix;
  overrides = {
    modules-center = ["hyprland/workspaces"];
    modules-right = ["group/expand" "network" "battery" "temperature" "pulseaudio"];
    modules-left = ["clock" "tray" "temperature#cpu" "temperature#igpu" "temperature#dgpu"];
  };
in {
  imports = [
    ../../home.nix
  ];

  programs.waybar.settings = [(base // overrides)];

  wayland.windowManager.hyprland.settings.monitor = lib.mkForce [
    "DP-2, 2560x1440@240, 0x0, 1"
    "HDMI-A-1, 1920x1080@60, 2560x0, 1.5"
  ];
}
