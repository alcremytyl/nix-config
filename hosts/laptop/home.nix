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
  wayland.windowManager.hyprland.settings.monitor = [ # did not test
    { output = "eDP-1"; }
    { output = "HDMI-A-1"; mirror= "eDP-1"; }
  ];
}
