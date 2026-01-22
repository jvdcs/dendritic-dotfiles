{
  flake.modules.homeManager.feature-stylixDefaults = {pkgs, ...}: {
    stylix = {
      targets = {
        yazi.enable = false;
        vscode.enable = false;
        zen-browser.enable = false;
      };
      cursor = {
        name = "GoogleDot-Black";
        package = pkgs.google-cursor;
        size = 6;
      };
      icons = {
        enable = true;
        package = pkgs.papirus-nord;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
      };
    };
  };
}
