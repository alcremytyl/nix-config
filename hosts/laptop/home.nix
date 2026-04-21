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
}
