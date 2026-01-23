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

      feature-geolocation
      feature-homeManager
      feature-networking
      feature-bluetooth
      feature-printing
      feature-gaming
      feature-audio
      feature-git

      feature-syncthing
      feature-crabHole
      feature-docker
      feature-keyd

      # feature-noctalia

      feature-niri
      feature-hyprland

      feature-stylix
      setting-stylix-fonts-sleek
      setting-stylix-colors-trasmus

      # setting-stylix-fonts-pretty
      # setting-stylix-colors-rosepine
      # setting-stylix-colors-ashen

      (helpers.from inputs.nixpkgs-25_11 [
        packageSet-systemInfo
        packageSet-systemMonitoring
      ])

      packageSet-fileUtils
      packageSet-shellEnhancements
      packageSet-networkUtils
      packageSet-processUtils
      packageSet-waylandUtils

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
