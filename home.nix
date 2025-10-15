{ pkgs,  ... }@inputs:
let
  wallpaper = "/etc/nixos/assets/wallpaper.png";
in {
  home.username = "mytyl";
  home.homeDirectory = "/home/mytyl";
  home.stateVersion = "25.05"; # Please read the comment before changing.


  imports = [ inputs.nvf.homeManagerModules.default];

  wayland.windowManager.hyprland = import ./home/hyprland.nix;
  programs.fish = import ./home/fish.nix{inherit pkgs;};
  programs.kitty = import ./home/kitty.nix;
  programs.nvf = import ./home/nvf/default.nix{inherit pkgs; nvf = inputs.nvf;};
  programs.waybar = import ./home/waybar/default.nix;


  programs.rofi = {
    enable = true;
    theme = "material";
  };


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

  services.dunst = {
    enable = true;
    settings = let 
      # NOTE: opacity 40% = 0x66, 60% = 0x99
      fg = "#cdd6f4";
      bg = "#1e1e2e";
      frame = "#89b4fa";
      frame-critical = "#fab387";
    in {
      global = {
        frame_color = frame;
        separator_color= "#89b4fa";
        highlight = "#89b4fa";
      };

      urgency_low = {
        background = bg;
        foreground = fg;
      };

      urgency_normal = {
        background = bg;
        foreground = fg;
      };

      urgency_critical = {
        background = bg;
        foreground = fg;
        frame_color = frame-critical;
      };
    };
  };
 

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
