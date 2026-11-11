{
  description = "fenix stable";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, fenix }: 
    flake-utils.lib.eachDefaultSystem (system:
    let 
      pkgs = import nixpkgs{inherit system;};
      toolchain = fenix.packages.${system}.complete.toolchain;
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ toolchain ];
        buildInputs = [];
        nativeBuildInputs = [];
      };
  });
}

