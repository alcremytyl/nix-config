{...}: {
  programs.rofi = {
    enable = true;
    settings.modes = [ "drun" ];
    # plugins = [ ];
    # TODO: figure out how to copy paste rasi into here or just nix it 
    theme = "material";
  };
}

/*
https://github.com/dctxmei/rofi-themes

applet
- time, hover 
- network


*/
