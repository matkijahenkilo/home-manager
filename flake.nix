{
  description = "Home Manager configuration of marisa";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ inputs.nixgl.overlay ];
      };
    in {
      homeConfigurations = {
        marisa = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            ./home.nix
          ];
        };
      };
    };
}
