# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

# TODO: move allat home manager stuff to ~/.config/home

{ config, pkgs, ... }@inputs:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = "nix-command flakes";

  xdg.mime = {
    enable = true;
    defaultApplications = {
      "text/html" = "floorp.desktop";
      "x-scheme-handler/http" = "floorp.desktop";
      "x-scheme-handler/https" = "floorp.desktop";
    };
  };

  # for flatpak
  xdg.portal = {
    enable = true;
    config.common.default = [ "gtk" ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      #      xdg-desktop-portal-kde
      #      xdg-desktop-portal-gtk
    ];
  };
  services.flatpak.enable = true;

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "start-hyprland";
        # command = "Hyprland";
        user = "mytyl";
      };
      default_session = initial_session;
    };
  };
  services.openssh.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  networking.firewall.allowedTCPPorts = [ 10350 3306 ];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  virtualisation.docker.enable = true;

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    dataDir = "/var/lib/mariadb/data";
    settings.mysqld = {
      bind-address = "0.0.0.0";
      port = 3306;
      skip-networking = false;

    };
  };


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mytyl = {
    isNormalUser = true;
    description = "Mytyl Kamizono";
    extraGroups = [ "networkmanager" "wheel" "docker" "mysql" ];
    packages = with pkgs; [];
  };

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];


  environment.pathsToLink = [ "/share/fish" ];
  environment.systemPackages = with pkgs; [
    vim 
    # neovim
    git
    wget
    kitty
  ];


  system.stateVersion = "25.05"; 

}
