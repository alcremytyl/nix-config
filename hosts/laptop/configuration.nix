{ config, pkgs, inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    tree
  ];

  hardware.tuxedo-drivers.enable = true;
  hardware.tuxedo-rs = {
    enable = true;
    tailor-gui.enable = true;
  };
}
