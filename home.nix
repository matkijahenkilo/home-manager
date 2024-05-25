{ pkgs, ... }:

{
  home.stateVersion = "23.11"; # Please read the comment before changing.
  home.username = "marisa";
  home.homeDirectory = "/home/marisa";
  home.packages = [ ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {

    home-manager.enable = true;

    git = {
      enable = true;
      userName = "matkijahenkilo";
      userEmail = "matkija.henkilo@gmail.com";
      delta.enable = true;
      extraConfig = {
        delta.navigate = true;
        diff.algorithm = "histogram";
        init.defaultBranch = "master";
        merge.conflictStyle = "zdiff3";
        pull.rebase = true;
        rebase.autosquash = true;
        rerere.enabled = true;
        user.editor = "nvim";
      };
      ignores = [
        "*~"
        "*.swp"
        ".idea"
        ".vscode"
        ".direnv"
      ];
    };


    # kitty = { # requires nixGL
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

    fish = {
      enable = true;
      functions = {
        asd = {
          body = "yt-dlp -f mp4 $argv[1]";
          onEvent = "Ran yt-dlp";
        };
      };
    };

    fastfetch.enable = true;
  };
}
