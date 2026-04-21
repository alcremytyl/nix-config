{ config, pkgs, inputs, ... }:
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
}
