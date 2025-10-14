#TODO: urgent, fisher for nix completions
# {pkgs}: {
{
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
  # plugins = [
  #   {
  #     name = "fisher";
  #     src = pkgs.fetchFromGithub {
  #       owner = "jorgebucaran";
  #       repo = "fisher";
  #       sha256 = "1awqwwzy0h3za7qs9pnc3hav40nbv45paxrvq7j6lk6cja8ah7yz";
  #     };
  #   }
  # ];
}
