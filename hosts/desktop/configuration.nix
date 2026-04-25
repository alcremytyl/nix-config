{ config, pkgs, inputs, ... }@input: {
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    android-tools
    lm_sensors
    mgba
    r2modman
    wineWow64Packages.stable
    scrcpy # because waydroid sucks to set up
  ];


  programs.steam.enable = true;
}
