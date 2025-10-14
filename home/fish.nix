#TODO: urgent, fisher for nix completions
{pkgs}: {
  enable = true;
  interactiveShellInit = ''
    set fish_greeting
    starship init fish | source
    nvf-print-config > ~/.config/nvim/init.lua

    # glaring security vuln we simply ignore
    eval (ssh-agent -c) > /dev/null
    grep -slR "PRIVATE" ~/.ssh/ | xargs ssh-add &> /dev/null
  '';
  functions = {
    fish_command_not_found = ''
      echo "fish: Unknown command: $argv[1]"
    '';
    nixos-refresh = ''
      sudo nixos-rebuild switch --flake /etc/nixos#mytyl $argv
    '';
  };
  plugins = [
    # NOTE: compiles but needs to be installed
    # {
    #   name = "grc";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "oh-my-fish";
    #     repo = "plugin-grc";
    #     rev = "61de7a8a0d7bda3234f8703d6e07c671992eb079";
    #     sha256 = "sha256-NQa12L0zlEz2EJjMDhWUhw5cz/zcFokjuCK5ZofTn+Q=";
    #   };
    # }
  ];
}
