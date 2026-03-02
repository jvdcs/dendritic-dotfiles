{inputs, ...}: {
  flake.modules.homeManager.feature-zenBrowser = {
    pkgs,
    system,
    ...
  }: {
    imports = [
      inputs.zen-browser-flake.homeModules.default
    ];

    home.packages = let
      zenPkg = inputs.zen-browser-flake.packages.${system}.default;
    in [
      (pkgs.runCommand "zen-compat" {} ''
        mkdir -p $out/bin
        ln -s ${zenPkg}/bin/zen-beta $out/bin/zen
      '')
    ];

    programs.zen-browser = {
      enable = true;
      profiles.alice = {};
      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };
  };
}
