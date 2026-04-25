{ ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
      # nvf-print-config > ~/.config/nvim/init.lua

      # glaring security vuln we simply ignore
      # eval (ssh-agent -c) > /dev/null
      # grep -slR "PRIVATE" ~/.ssh/ | xargs ssh-add &> /dev/null
    '';
    functions = {
      fish_command_not_found = ''
        echo "fish: Unknown command: $argv[1]"
      '';
      nix-next = ''
        sudo nixos-rebuild $argv[1] --flake $HOME/.config/home-manager#$argv[2]
      '';
    };
  };

  programs.starship.enable = true;
}
