{
  library,
  modules,
  helpers,
  inputs,
  ...
}: {
  flake.modules = library.defineHostModule {
    name = "frybo";
    isoVersion = "25.05";
    imports = with modules.nixos; [
      device-ASUS_Zenbook_14_UX3405MA

      user-alice

      misc-hibernateOnLidClose
      misc-generalServices
      misc-disableGreeter
      misc-portals

      (helpers.symlink {
        from = "/etc/nixos/tree/definitions/users/alice/dotfiles";
        to = "/home/alice";
        user = "alice";
      })

      setting-performanceTuning
      setting-fryboVariables
      setting-timezoneLocale
      setting-documentation
      setting-bootLoader
      setting-security
      setting-console
      setting-fonts
      setting-nix

      # setting-cafeInternetFix

      feature-geolocation
      feature-homeManager
      feature-networking
      feature-printing
      feature-gaming
      feature-audio
      feature-git

      feature-syncthing
      feature-crabHole
      feature-keyd

      feature-podman
      feature-docker

      feature-claudeCode
      feature-noctalia
      feature-bluetooth

      feature-niri
      feature-hyprland
      feature-cosmicDe

      # === STYLIX ===
      feature-stylix

      setting-stylix-fonts-sleek
      # setting-stylix-fonts-pretty

      # setting-stylix-colors-rosepine
      setting-stylix-colors-trasmus
      # setting-stylix-colors-ashen
      # ===

      packageSet-systemInfo
      packageSet-systemMonitoring

      packageSet-fileUtils
      packageSet-shellEnhancements
      packageSet-networkUtils
      packageSet-processUtils
      packageSet-waylandUtils

      packageSet-guiApps
      packageSet-editors
      packageSet-audio

      packageSet-hardwareControl
      packageSet-languageServers
      packageSet-hardwareInfo
      packageSet-formatters
      packageSet-mediaTools
      packageSet-containers
      packageSet-clipboard
      packageSet-fromFlake
      packageSet-compilers
      packageSet-databases
      packageSet-security
      packageSet-linters
      packageSet-nixTools
      packageSet-docs
      packageSet-libs
    ];
  };
}
