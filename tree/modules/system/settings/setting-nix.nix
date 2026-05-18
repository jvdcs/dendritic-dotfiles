{inputs, ...}: {
  flake.modules.nixos.setting-nix = {
    imports = [
      inputs.determinate.nixosModules.default
    ];

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnsupportedSystem = true;

    nix = {
      extraOptions = ''
        experimental-features = nix-command pipe-operators
        fallback = true
      '';
      settings = {
        max-jobs = 16;
        auto-optimise-store = true;
        substituters = [
          "https://nix-community.cachix.org"
          "https://vicinae.cachix.org"
          "https://cache.nixos.org"
          "https://cache.garnix.io"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        ];
        connect-timeout = 5;
        stalled-download-timeout = 5;
        http-connections = 128;
      };
    };
  };
}
