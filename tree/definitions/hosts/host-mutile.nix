{
  library,
  modules,
  helpers,
  ...
}: {
  flake.modules = library.defineHostModule {
    name = "mutile";
    isoVersion = "25.05";
    imports = with modules.nixos; [
      device-ASUS_Zenbook_14_UX3405MA

      user-onon
      user-kino

      (helpers.symlink {
        from = "/etc/nixos/tree/definitions/users/onon/dotfiles";
        to = "/home/onon";
        user = "onon";
      })
      (helpers.symlink {
        from = "/etc/nixos/tree/definitions/users/kino/dotfiles";
        to = "/home/kino";
        user = "kino";
      })

      # misc-hibernateOnLidClose
      misc-generalServices
      misc-disableGreeter
      misc-portals

      setting-performanceTuning
      # setting-fryboVariables
      setting-timezoneLocale
      setting-documentation
      setting-bootLoader
      setting-security
      setting-console
      # setting-fonts
      setting-nix

      feature-geolocation
      feature-homeManager
      feature-networking
      feature-bluetooth
      # feature-printing
      feature-gaming
      feature-audio
      feature-git

      feature-syncthing
      # feature-crabHole
      # feature-docker
      feature-keyd

      # feature-noctalia

      # feature-niri
      feature-hyprland

      feature-stylix
      setting-stylix-fonts-sleek
      # setting-stylix-colors-trasmus

      # setting-stylix-fonts-pretty
      setting-stylix-colors-rosepine
      # setting-stylix-colors-ashen

      packageSet-systemMonitoring
      packageSet-systemInfo

      packageSet-shellEnhancements
      packageSet-networkUtils
      packageSet-processUtils
      packageSet-waylandUtils
      packageSet-fileUtils

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
      packageSet-nixTools
      packageSet-linters
      packageSet-guiApps
      packageSet-editors
      packageSet-audio
      packageSet-docs
      packageSet-libs
    ];
  };
}
