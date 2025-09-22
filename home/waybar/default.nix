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
  }];

  style = builtins.readFile ./ellfouts.css;
}

