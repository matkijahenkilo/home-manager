{ ... }:

{
  programs.git = {
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
}
