{ pkgs,  ... }@inputs:
{
  home.username = "mytyl";
  home.homeDirectory = "/home/mytyl";
  home.stateVersion = "25.05"; # Please read the comment before changing.


  imports = [ 
    inputs.nvf.homeManagerModules.default
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];


  wayland.windowManager.hyprland = import ./home/hyprland.nix;
  programs.fish = import ./home/fish.nix{inherit pkgs;};
  programs.kitty = import ./home/kitty.nix;
  programs.nvf = import ./home/nvf/default.nix{inherit pkgs; nvf = inputs.nvf;};
  programs.waybar = import ./home/waybar/default.nix;

  services.flatpak = {
    enable = true;
    packages = [
      "org.vinegarhq.Sober"
      "com.parsecgaming.parsec"
    ];
  };

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "xterm-256color";
    extraConfig = ''
      set -g default-command fish
    '';
    plugins = with pkgs.tmuxPlugins; [
      tmux-fzf
      catppuccin
      tmux-which-key
      tmux-powerline
    ];
  };

  programs.rofi = {
    enable = true;
    theme = "material";
  };

  services.hyprpaper = 
  let
    wp = "/home/mytyl/.config/hypr/wallpaper.png";
  in 
  {
    enable = true;
    settings = {
      wallpaper = [ {monitor="eDP-1"; path=wp; } ];
      # preload = [ wallpaper ];
      # wallpaper = [ "eDP-1,${wallpaper}" ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  services.dunst = import ./home/dunst.nix;
 

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # ui
    # waybar
    rofi
    # dunst
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
    nodePackages.npm

    # so professors don't get angry
    dbeaver-bin
    mariadb
    vscode


    # apps
    discord
    floorp-bin


    # deps
    brightnessctl
    hyprshot
    hyprpaper
    playerctl
    wl-clipboard
  ];


  home.sessionVariables = {
    EDITOR = "nvim";
    DEFAULT_BROWSER = "floorp";
  };

  programs.home-manager.enable = true;
}
