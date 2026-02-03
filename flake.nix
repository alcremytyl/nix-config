{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    nvf.url = "github:NotAShelf/nvf";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
  };

  outputs = { self, nixpkgs, home-manager, nvf, nix-flatpak, ... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      allowUnfree = true;
      config.useGlobalPkgs = true;
    };
  in
  {
    homeConfigurations."mytyl" = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs;
        modules = [
          # ./configuration.nix
          # ./hardware-configuration.nix

          nvf.homeManagerModules.default
          nix-flatpak.homeManagerModules.nix-flatpak

          ./home.nix
      ];
    };
  };
}
