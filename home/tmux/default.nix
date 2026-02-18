{ pkgs, ...}: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-256color";
    plugins = with pkgs.tmuxPlugins; [
      catppuccin
      tmux-which-key
    ];
      # set -g default-command fish
    extraConfigBeforePlugins = builtins.readFile ./theme.tmux;
    # 
    # set -g @plugin 'tmux-plugins/tmux-battery'
    # set -agF status-right "#{E:@catppuccin_status_battery}"
  };

  # for which-key
  # programs.dash.enable = true;
}

