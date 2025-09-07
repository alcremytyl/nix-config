{ pkgs,  ... }@inputs:

{
  home.username = "mytyl";
  home.homeDirectory = "/home/mytyl";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  wayland.windowManager.hyprland = import ./home/hyprland.nix;

  imports = [ inputs.nvf.homeManagerModules.default];
  programs.nvf = import ./home/nvf.nix;


  programs.rofi = {
    enable = true;
    theme = "material";
  };


  programs.fish = import ./home/fish.nix;

  programs.waybar = {
    enable = true;
    settings = [{
      modules-right = ["clock" "battery"]; 
    }];
  };

  programs.kitty = {
    enable = true;
    settings = {
      shell = "fish";
      font= "JetBrainsMono Nerd Font";
      background_blur = 1;
      background_opacity = 0.7;
      enable_audio_bell = false;
      font_size = 12.0;
      mouse_wait = 1.5;
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      titlebar_color = "background";

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
    starship
    btop
    fzf
    lf
    home-manager
    ripgrep
    gcc
    gnumake

    # dev
    docker
    devcontainer

    # apps
    floorp
    discord

    # deps
    wl-clipboard
    brightnessctl
    playerctl
    hyprshot


    # nvim 



    # pkgs.nerd-fonts.jetbrains-mono
  ];

  # fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mytyl/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
