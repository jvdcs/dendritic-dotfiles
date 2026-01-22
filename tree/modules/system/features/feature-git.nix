{
  flake.modules.nixos.feature-git = {
    programs.git = {
      enable = true;
      config.user = {
        email = "javedcorreossial@gmail.com";
        name = "jvdcs";
      };
    };
  };
}
