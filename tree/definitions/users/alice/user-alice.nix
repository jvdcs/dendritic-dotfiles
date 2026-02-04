{
  library,
  modules,
  ...
}: {
  flake.modules = library.defineUserModule {
    name = "alice";
    homeManagerVersion = "25.05";
    shell = pkgs: pkgs.bash;
    groups = [
      "users"
      "networkmanager"
      "docker"
      "wheel"
      "video"
      "keyd"
      "mpd"
    ];
    imports = with modules.homeManager; [
      setting-disableDefaultHomeFolders

      misc-generalServices

      feature-stylixDefaults
      feature-mprisProxy
      feature-zenBrowser
      feature-spicetify
      feature-cliphist
      feature-vscode
      feature-direnv
      feature-emacs
      feature-yazi
      feature-mpd

      feature-halloy

      feature-noctalia
      feature-vicinae
      feature-zathura
      feature-kitty
      feature-btop

      packageSet-audioVisualizers
      packageSet-terminalTools
      packageSet-productivity
      packageSet-mediaTools
      packageSet-creative
      packageSet-viewers
      packageSet-shell
      packageSet-latex
      packageSet-typst
      packageSet-lsps
    ];
  };
}
