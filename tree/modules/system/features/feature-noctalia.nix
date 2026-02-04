{inputs, ...}: {
  flake.modules.nixos.feature-noctalia = {system, ...}: {
    imports = [
      inputs.noctalia.nixosModules.default
    ];

    services.noctalia-shell.enable = true;

    environment.systemPackages = [
      inputs.noctalia.packages.${system}.default
    ];
  };
}
