{ config, pkgs, ... }:

{
  home.username = "mytyl";
  home.homeDirectory = "/home/mytyl";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # ref: https://github.com/hyprwm/Hyprland/blob/38d77338d6bf08dca1df98e3cc12daa72c5673eb/example/hyprland-hm.nix
  wayland.windowManager.hyprland = import ./home/hyprland.nix;


  programs.rofi = {
    enable = true;
    theme = "material";

    # plugins = with pkgs; [
    #   rofi-calc
    # ];
  };


  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
    '';
    functions.fish_command_not_found = ''
      echo "fish: Unknown command: $argv[1]"
    '';
  };

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

    # dev
    docker

    # apps
    floorp
    discord

    # deps
    wl-clipboard
    brightnessctl
    playerctl

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # TODO: impl
  # fonts.packages = with pkgs; [ 
  #   nerd-fonts.jetbrains-mono
  # ];

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
