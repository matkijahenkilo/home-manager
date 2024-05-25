{ pkgs, ... }:

{
  stylix = {
    autoEnable = true;
    targets.kde.enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/summercamp.yaml";
    image = ./../assets/bg;
    polarity = "dark";
    cursor = {
      package = pkgs.banana-cursor;
      name = "Banana";
    };
    fonts.sizes = {
      applications = 10;
      terminal = 11;
      desktop = 9;
      popups = 9;
    };
    opacity = {
      applications = 1.0;
      terminal = 0.85;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}
