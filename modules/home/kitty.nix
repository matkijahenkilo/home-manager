{ lib, ... }: {
  programs.kitty = { # requires nixGL which I'm too dumb to make it work
    enable = false;
  };

  home.sessionVariables = {
    TERMINAL = lib.mkDefault "kitty";
  };
}
