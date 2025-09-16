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
    lf
    home-manager
    ripgrep

    # dev
    docker
    devcontainer
    gcc
    gnumake

    # so professors don't get angry
    vscode
    mariadb
    harlequin # if not enjoyed use dbeaver-bin


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
