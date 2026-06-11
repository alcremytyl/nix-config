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

  programs.waybar.settings = [(base // overrides)];

  services.easyeffects = {
    enable = true;
    preset = "noise-cancellation";
  };

  systemd.user.services.easyeffects = {
    Unit = {
      After = [ "pipewire.service" ];
      Requires = [ "pipewire.service" ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    # NOTE: 
    # HDMI-A-3 is the top one
    # DP-1 rightmost
    # DP-2 middle-right
    monitor = lib.mkForce [
      "HDMI-A-1, 1920x1080@74.97, 0x0, 1"
      "DP-1, 2560x1440@300, 1920x0, 1"
    ];
    workspace = [
      "1,monitor:DP-1,default:true"
      "2,monitor:DP-1"
      "3,monitor:DP-1"
      "4,monitor:DP-1"
      "5,monitor:DP-1"

      "6, monitor:HDMI-A-1,default:true"
      "7, monitor:HDMI-A-1"
      "8, monitor:HDMI-A-1"
      "9, monitor:HDMI-A-1"
      "10,monitor:HDMI-A-1"
    ];
  };

  xdg.configFile."easyeffects/input/noise-cancellation.json".text = builtins.toJSON {
      "input" = {
        "blocklist" = [ ];
        "plugins_order" = [
          "deep_filter"
          "gate"
        ];
        "deep_filter" = {
          "bypass" = false;
          "attenuation-limit" = 100.0; # Maximum suppression
        };

        "gate" = {
          "bypass" = false;
          "threshold" = -35.0; # Adjust this: anything below this dB is muted
          "ratio" = 4.0;
          "attack" = 5.0;
          "release" = 100.0;
          "makeup" = 0.0;
        };
      };
    };
}
