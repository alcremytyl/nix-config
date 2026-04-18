{...}: {

  # TODO: add brightness
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./ellfouts.css;

    /** NOTE: do this in the hosts
      * _
      * settings = import ./bar-base.nix // { HOST-IMPLS... }
    **/ 
  };
}
