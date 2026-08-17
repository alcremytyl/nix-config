{ config, pkgs, inputs, ... }@input: {
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    android-tools
    lm_sensors

    easyeffects
    deepfilternet

    proton-vpn

    r2modman
    wineWow64Packages.stable

    azahar
    mgba

    scrcpy # because waydroid sucks to set up

    prismlauncher
    temurin-bin-21 # java 21
  ];


  hardware.xpadneo.enable = true;
  programs.steam.enable = true;

  programs.dconf.enable = true;   # for EasyEffects

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;
      "default.clock.quantum" = 512;
      "default.clock.min-quantum" = 512;
      "default.clock.max-quantum" = 512;
    };
  };
}
