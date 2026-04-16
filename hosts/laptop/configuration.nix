{ config, pkgs, inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    tree
  ];
}
