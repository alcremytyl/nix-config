{ pkgs, ...}: {
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
}
