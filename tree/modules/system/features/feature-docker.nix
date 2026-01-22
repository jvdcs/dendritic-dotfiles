{
  flake.modules.nixos.feature-docker = {pkgs, ...}: {
    environment.systemPackages = [pkgs.docker-language-server];
    virtualisation.docker.enable = true;
  };
}
