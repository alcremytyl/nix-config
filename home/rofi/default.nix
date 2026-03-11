{...}: {
  programs.rofi = {
    enable = true;
    modes = [ "drun" ];
    # plugins = [ ];
    # theme = "material";
    theme = builtins.readFile "./config.rasi";
  };
}

/*
https://github.com/dctxmei/rofi-themes

applet
- time, hover 
- network


*/
