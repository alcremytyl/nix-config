{ pkgs }:

let
  buildPlugin = {
    name,
    pname ? name,
    version ? "main",
    owner,
    repo ? pname,
    rev ? version,
    hash ? "",
    setupModule ? null,
    lazy ? null,
  }: {
    package = pkgs.vimUtils.buildVimPlugin {
      inherit pname version;
      src = pkgs.fetchFromGitHub {
        inherit owner repo rev hash;
      };
    };
  # TODO: check if this is even needed
  } // (if setupModule != null then { inherit setupModule; } else {})
    // (if lazy != null then { inherit lazy; } else {});
in

{
  buildPlugins = (plugins:
    builtins.listToAttrs (map (plugin: {
      name = plugin.name;
      value = buildPlugin plugin;
    }) plugins));
}

