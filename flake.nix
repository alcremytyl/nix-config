{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nvf, ... }:  let
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

        home-manager.nixosModules.home-manager
        {
          nixpkgs.config.allowUnfree = true;
          home-manager.backupFileExtension = "backup";
          home-manager.useUserPackages = true;
          home-manager.useGlobalPkgs = true;
          home-manager.users.mytyl = import ./home.nix { inherit pkgs; inherit nvf; };
        }
      ];
    };
  };
}
