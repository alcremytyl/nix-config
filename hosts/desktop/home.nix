{ lib, pkgs, ... }:
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

  # my cursor so tiny
    # home.pointerCursor = {
    #   name = "Hyprland";
    #   package = pkgs.hyprcursor;
    #   size = 32;
    #   hyprcursor. enable = true;
    # };

  programs.waybar.settings = [(base // overrides)];

  wayland.windowManager.hyprland.settings = {
    monitor = lib.mkForce [
      "DP-2, 2560x1440@240, 0x0, 1"
      "HDMI-A-1, 1920x1080@60, 2560x0, 1"
    ];
    # drawing tablet as space 10
    workspace = [
      "1,monitor:DP-2"
      "2,monitor:DP-2"
      "3,monitor:DP-2"
      "4,monitor:DP-2"
      "5,monitor:DP-2"
      "6,monitor:DP-2"
      "7,monitor:DP-2"
      "8,monitor:DP-2"
      "9,monitor:DP-2"
      "10,monitor:HDMI-A-1"
    ];
  };
}
