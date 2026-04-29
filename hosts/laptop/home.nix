{ config, pkgs, inputs, ... }:
let 
  base = import ../../modules/waybar/bar-base.nix;
  overrides = {
    modules-center = ["hyprland/workspaces"];
    modules-right = ["group/expand" "network" "battery" "pulseaudio"];
    modules-left = ["clock" "tray" ];
  };
in {
  imports = [
    ../../home.nix
  ];

  programs.waybar.settings = [(base // overrides)];
  wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1,preferred,auto,auto" 
      "HDMI-A-1,preferred,auto,auto,mirror,eDP-1"
  ];
}
