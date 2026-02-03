{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
  };

  outputs = { self, nixpkgs, home-manager, nvf, nix-flatpak, ... }:  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { 
      inherit system; 
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations."mytyl" = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix
        ./hardware-configuration.nix

	      nvf.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak

        home-manager.nixosModules.home-manager
        {
          nixpkgs.config.allowUnfree = true;
          home-manager = { 
            backupFileExtension = "backup";
            useUserPackages = true;
            useGlobalPkgs = true;
            users.mytyl = import ./home.nix { inherit pkgs; inherit nvf; inherit nix-flatpak; };
          };
        }
      ];
    };
  };
}
