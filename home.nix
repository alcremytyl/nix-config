{ pkgs,  ... }@inputs:
let
  wallpaper = "/etc/nixos/assets/wallpaper.png";
in {
  home.username = "mytyl";
  home.homeDirectory = "/home/mytyl";
  home.stateVersion = "25.05"; # Please read the comment before changing.


  imports = [ inputs.nvf.homeManagerModules.default];

  wayland.windowManager.hyprland = import ./home/hyprland.nix;
  programs.fish = import ./home/fish.nix;
  programs.kitty = import ./home/kitty.nix;
  programs.nvf = import ./home/nvf/default.nix{inherit pkgs;};
  programs.waybar = import ./home/waybar/default.nix;


  programs.rofi = {
    enable = true;
    theme = "material";
  };


  # TODO: hyprpaper with rotating wallpapers
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ wallpaper ];
      wallpaper = [ "eDP-1,${wallpaper}" ];
    };
  };

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
    btop
    fzf
    highlight
    home-manager
    ripgrep
    starship
    unrar
    unzip
    yazi


    # dev
    devcontainer
    docker
    gcc
    gnumake
    python312

    # so professors don't get angry
    dbeaver-bin
    mariadb
    vscode


    # apps
    discord
    floorp


    # deps
    brightnessctl
    hyprshot
    hyprpaper
    playerctl
    wl-clipboard
  ];


  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
