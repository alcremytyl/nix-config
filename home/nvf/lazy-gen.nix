{ pkgs }:

{ pname
, owner
, repo
, hash
, version ? "main"
, rev ? version
, setupModule ? null
, lazy ? null
}:

let
  package = pkgs.vimUtils.buildVimPlugin {
    inherit pname version;
    src = pkgs.fetchFromGitHub {
      inherit owner repo rev hash;
    };
  };
in
{
  inherit package;
} // (if setupModule != null then { inherit setupModule; } else {})
  // (if lazy != null then { inherit lazy; } else {})

