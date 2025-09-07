{
enable = true;
interactiveShellInit = ''
  set fish_greeting
  starship init fish | source

  # glaring security vuln we simply ignore
  eval (ssh-agent -c) > /dev/null
  grep -slR "PRIVATE" ~/.ssh/ | xargs ssh-add &> /dev/null
'';

functions = {
  fish_command_not_found = ''
    echo "fish: Unknown command: $argv[1]"
  '';
  nixos-refresh = ''
    sudo nixos-rebuild switch --flake /etc/nixos#mytyl
  '';
};
}
