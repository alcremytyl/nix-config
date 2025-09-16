{
  enable = true;
  settings = [
    {
      modules-left = ["hyprland/workspaces"];
      modules-center = ["wayland/window"];
      modules-right = ["clock" "battery"]; 

      position = "top";

    }
  ];

  style = builtins.readFile ./river_style.css;
}

