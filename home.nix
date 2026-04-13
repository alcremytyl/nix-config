# TODO: 
# desktop/laptop profiles
# port new setup to laptop

{ config, pkgs, ... }:

{
  imports = [
    ./modules/dunst
    ./modules/fish
    ./modules/flatpak
    ./modules/hyprland
    ./modules/kitty
    ./modules/nvf
    ./modules/rofi
    ./modules/tmux
    ./modules/obs-studio
    ./modules/waybar
    ./modules/xdg
    ./modules/zoxide
  ];


  home = {
    homeDirectory = "/home/mytyl";
    stateVersion = "25.11"; 
    username = "mytyl";
    sessionPath = [
      "$HOME/.local/share/flatpak/exports/bin"
    ];
    sessionVariables = {
      EDITOR = "nvim";
      DEFAULT_BROWSER = "floorp";
    };
    packages = with pkgs; [
      libnotify

      # 
      btop
      fzf
      highlight
      hyprpaper
      playerctl
      ripgrep
      wl-clipboard
      yazi

      # discord in sys packages cuz idfk man
      betterdiscordctl

      pavucontrol
      floorp-bin
    ];
  };


  # services.arrpc.enable = true;
  programs.home-manager.enable = true;
  programs.vesktop.enable = true;
  # nixpkgs.config.allowUnfreePredicate = _: true;
}
