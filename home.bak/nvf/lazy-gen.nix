{ pkgs }:

plugins: builtins.listToAttrs (
  builtins.map (plugin:
    let
      name = plugin.name;
      pname = plugin.pname or name;
      repo = plugin.repo or name;
      branch = plugin.branch or "main";
      hash = plugin.hash or "";
      lazy_val = if builtins.hasAttr "lazy" plugin then plugin.lazy else true;
      cmd = if builtins.hasAttr "cmd" plugin then plugin.cmd else "";
    in {
      name = name;
      value = {
        package = pkgs.vimUtils.buildVimPlugin {
          pname = pname;
          version = branch;
          src = pkgs.fetchFromGitHub {
            owner = plugin.owner;
            repo = repo;
            rev = branch;
            hash = hash;
          };
        };
        setupModule = plugin.setupModule or pname;
        lazy = lazy_val;
        cmd = [cmd];
      };
    }
  ) plugins
)
