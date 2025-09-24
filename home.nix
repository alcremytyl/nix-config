{ pkgs,  ... }@inputs:

{
  home.username = "mytyl";
  home.homeDirectory = "/home/mytyl";
  home.stateVersion = "25.05"; # Please read the comment before changing.


  imports = [ inputs.nvf.homeManagerModules.default];

  wayland.windowManager.hyprland = import ./home/hyprland.nix;
  programs.fish = import ./home/fish.nix;
  programs.kitty = import ./home/kitty.nix;
  programs.nvf = import ./home/nvf.nix;


  programs.rofi = {
    enable = true;
    theme = "material";
  };



  programs.waybar = import ./home/waybar/default.nix;
  programs.lf.enable = true;# = import ./home/lf.nix{inherit pkgs;}; 
  # TODO: MAKE THAT HOE BE TREATED AS A RAW STRING
  programs.lf.previewer.source = pkgs.writeShellScript "lf-pv.sh" ''
    #!/usr/bin/env bash
    case "$1" in
      *.tar*) tar tf "$1";;
      *.jpg|*.jpeg|*.png|*.gif|*.webp) 
        kitty +kitten icat --clear --transfer-mode=file --stdin no --place "''${2}x''${3}@''${4}x''${5}" "$1";;
      *) highlight -O ansi $1 || cat "$1";;
    esac
  '';

  # programs.waybar = {
  #   enable = true;
  #   settings = [{
  #     modules-right = ["clock" "battery"]; 
  #   }];
  # };


  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
 

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # ui
    # waybar
    rofi
    rofi-calc # TODO: implement
    dunst
    libnotify

    # cli
    starship
    btop
    fzf
    home-manager
    ripgrep

    highlight
    unzip
    unrar


    # dev
    docker
    devcontainer
    gcc
    gnumake

    # so professors don't get angry
    vscode
    mariadb
    dbeaver-bin
    # harlequin # if not enjoyed use dbeaver-bin
    python312


    # apps
    floorp
    discord

    # deps
    wl-clipboard
    brightnessctl
    playerctl
    hyprshot
  ];


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
