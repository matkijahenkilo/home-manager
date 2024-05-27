{ inputs, ... }:

{
  home = {
    stateVersion = "23.11"; # Please read the comment before changing.
    username = "marisa";
    homeDirectory = "/home/marisa";
    packages = [ ];
  };

  programs.home-manager = {
    enable = true;
  };

  imports = [
    ./modules
  ];
}
