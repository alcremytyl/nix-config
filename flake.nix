{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:  let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations."mytyl" = nixpkgs.lib.nixosSystem {
        inherit system;

	modules = [
          ./configuration.nix
          ./hardware-configuration.nix

          # Home Manager as a NixOS module
          home-manager.nixosModules.home-manager
          {
	    nixpkgs.config.allowUnfree = true;
	    home-manager.backupFileExtension = "backup";
	    home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.mytyl = import ./home.nix;
          }
	];


      # homeConfigurations."mytyl" = home-manager.lib.homeManagerConfiguration {
      #   pkgs = import nixpkgs {
      #     inherit system;
      #     config.allowUnfree = true;
      #   };

      #   # Specify your home configuration modules here, for example,
      #   # the path to your home.nix.
      #   modules = [ 
      #     ./home.nix 
      #     home-manager.nixosModules.home-manager

      #   ];

      #   # Optionally use extraSpecialArgs
      #   # to pass through arguments to home.nix
      # };
    };
  };
}
