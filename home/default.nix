{ pkgs, ...}@inputs:
{
  home = {
    username = "mytyl";
    homeDirectory = "/home/mytyl";
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "nvim";
      DEFAULT_BROWSER = "floorp";
    };
  };

  imports = [
    ./dunst
    ./fish
    ./flatpak
    ./hyprland # and hyprpaper
    ./kitty
    ./rofi
    ./tmux
    ./waybar
    ./xdg
    ./zoxide
  ];

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
    # home-manager
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



  # home.
  programs.home-manager.enable = true;
}
