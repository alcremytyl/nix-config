{pkgs}:{
  enable = true;
  settings = {
    hidden = true;
    icons = true;
    shell = "fish";
    # TODO:
  };
  # previewer.source = pkgs.writeShellScript "lf-pv.sh" ''
  #   #!/usr/bin/env bash
  #   case "$1" in
  #     *.tar*) tar tf "$1";;
  #     *.jpg|*.jpeg|*.png|*.gif|*.webp) 
  #       kitty +kitten icat --clear --transfer-mode=file --stdin no --place "${2}x${3}@${4}x${5}" $1;;
  #     *) highlight -O ansi $1 || cat "$1";;
  # '';
}
