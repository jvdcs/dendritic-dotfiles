{inputs, ...}: {
  flake.modules.nixos.feature-niri = {system, ...}: {
    environment.systemPackages = with inputs.niri-flake.packages.${system}; [
      xwayland-satellite-unstable
    ];

    programs.niri = {
      enable = true;
      package = inputs.niri-flake.packages.${system}.niri-unstable;
    };
  };
}
