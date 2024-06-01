{
  description = "My personal NixOS and dotfiles configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = inputs@{ ... }:
  let
    libs = import ./libs/default.nix { inherit inputs; };
  in with libs; {
    nixosConfigurations = {
      tau = mkHost ./hosts/tau/configuration.nix;
    };
    homeConfigurations = {
      "marisa@tau" = mkHome "x86_64-linux" "marisa";
    };
  };
}
