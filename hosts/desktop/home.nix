{ lib, pkgs, ... }:
let 
  base = import ../../modules/waybar/bar-base.nix;
  overrides = {
    modules-center = ["hyprland/workspaces"];
    modules-right = ["group/expand" "network" "battery" "temperature" "pulseaudio"];
    modules-left = ["clock" "tray" "temperature#cpu" "temperature#igpu" "temperature#dgpu"];
  };
  inherit (lib.generators) mkLuaInline;

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
      { scale = 1; output = "HDMI-A-1"; mode = "1920x1080@74.97"; position = "0x0"; }
      { scale = 1; output = "HDMI-A-2"; mode = "1920x1080@60";    position = "1920x1440"; }
      { scale = 1; output = "DP-1";     mode = "2560x1440@300";   position = "1920x0"; }
    ];

    workspace_rule = [
      { workspace = 1; monitor = "DP-1"; default = true; }
      { workspace = 2; monitor = "DP-1"; }
      { workspace = 3; monitor = "DP-1"; }
      { workspace = 4; monitor = "DP-1"; }
      { workspace = 5; monitor = "DP-1"; }

      { workspace = 6; monitor = "HDMI-A-1"; default = true; }
      { workspace = 7; monitor = "HDMI-A-1"; }
      { workspace = 8; monitor = "HDMI-A-1"; }
      { workspace = 9; monitor = "HDMI-A-1"; }

      { workspace = 10; monitor = "HDMI-A-2"; default = true;} # drawing tablet
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
