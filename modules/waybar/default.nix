{...}: {

  # TODO: add brightness
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./ellfouts.css;

    /** NOTE: 
      * settings are done in ./bar-base.nix and modules're set up per-host
    **/ 
  };
}
