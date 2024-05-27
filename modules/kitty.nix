{ lib, ... }: {
  # programs.kitty = { # requires nixGL
  #   enable = true;
  #   font = {
  #     package = pkgs.nerdfonts;
  #     name = "Fira Code nerd Font Mono";
  #     size = 11;
  #   };
  #   settings = {
  #     background_opacity = "0.85";
  #     background_blur = "3";
  #   };
  # };

  home.sessionVariables = {
    TERMINAL = lib.mkDefault "kitty";
  };
}
