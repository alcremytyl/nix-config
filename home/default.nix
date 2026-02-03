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
    ./home/dunst
    ./home/fish
    ./home/flatpak
    ./home/hyprland # and hyprpaper
    ./home/kitty
    ./home/rofi
    ./home/tmux
    ./home/waybar
    ./home/xdg
    ./home/zoxide
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
