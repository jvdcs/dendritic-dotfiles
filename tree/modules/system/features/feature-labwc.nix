{inputs, ...}: {
  flake.modules.nixos.feature-labwc = {system, ...}: {
    programs.labwc.enable = true;
  };
}
