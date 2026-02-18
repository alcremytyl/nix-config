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
    # extraConfig = builtins.readFile ./theme.tmux;
    extraConfig = ''
      set -g @catppuccin_flavor 'machiatto'
      set -g @catppuccin_date_time "%Y-%m-%d | %H:%M"
    '';
    # 
    # set -g @plugin 'tmux-plugins/tmux-battery'
    # set -agF status-right "#{E:@catppuccin_status_battery}"
  };

  # for which-key
  # programs.dash.enable = true;
}

