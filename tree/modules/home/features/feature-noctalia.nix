{inputs, ...}: {
  flake.modules.homeManager.feature-noctalia = {...}: {
    imports = [
      inputs.noctalia.homeModules.default
    ];

    programs.noctalia-shell = {
      enable = true;
    };
  };
}
