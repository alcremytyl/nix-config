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
    scrcpy # because waydroid (google auth) is being annoying
  ];

  programs.steam.enable = true;
}
