{
  enable = true;
  settings = [{
    reload_on_style_change = true;
    position = "top";

    modules-left = ["clock" "tray"];
    modules-center = ["hyprland/workspaces"];
    modules-right = ["group/expand" "network" "battery"]; 

    "hyprland/workspaces" = {
      format ="{icon}";
      format-icons = {
        active = "";
        default = "";
        empty = "";
      };
      persistent-workspaces = {
        "*" = [1 2 3 4 5];
      };
    };

    clock = {
      tooltip-format = "<tt>{calendar}</tt>";
      calendar.format.today = "<span color='#FAFBFC'<b>{}</b></span>";
      actions = {
        on-click-right = "shift_down";
        on-click = "shift_up";
      };
    };

    network = {
      format-wifi = " ";
      format-ethernet = "󰈀 ";
      format-disconnected =  " ";
      tooltip-format-disconnected = "Disconnected";
      tooltip-format-wifi = "{essid} ({signalStrength}%)";
      tooltip-format-ethernet =  "{ifname} 󰈀 ";
      on-click =  "kitty nmtui";
    };

    # currently disabled
    bluetooth = {
      format-on = "󰂯 ";
      format-off = "󰂲 ";
      format-disabled = "󰂲 ";
      format-connected-battery = "󰥈 {device_battery_percentage}%";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
    };

    battery = {
      format = "{icon} {capacity}%";
      format-charging = "󰂄 {capacity}%";
      format-plugged = "󰂄 {capacity}%";
      format-icons = [ "󰁻" "󰁼" "󰁾" "󰂀" "󰂂" "󰁹" ];

      states = {
        good = 95;
        warning = 50;
        critical = 30;
      };
    };

  }];

  style = builtins.readFile ./ellfouts.css;
}

