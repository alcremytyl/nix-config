{ config, pkgs, inputs, ... }: {
  imports = [
    ../../home.nix
    ./modules/obs-studio
  ];

  programs.waybar.settings = [{
    modules-left = ["clock" "tray" "temperature#cpu" "temperature#igpu" "temperature#dgpu"];
    "temperature#cpu" = {
      hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
      format = "CPU {temperatureC}°C";
    };

    "temperature#dgpu" = {
      hwmon-path = "/sys/class/hwmon/hwmon4/temp1_input";
      format = "GPU {temperatureC}°C";
    };

    "temperature#igpu" = {
      hwmon-path = "/sys/class/hwmon/hwmon5/temp1_input";
      format = "GPU {temperatureC}°C";
    };
  }];
}
