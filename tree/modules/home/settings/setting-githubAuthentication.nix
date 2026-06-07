{
  flake.modules.homeManager.setting-githubAuthentication = {
    home.sessionVariables = {
      SSH_ASKPASS_REQUIRE = "never";
    };

    programs.ssh = {
      enable = true;
      matchBlocks."github.com" = {
        extraOptions = {
          StrictHostKeyChecking = "accept-new";
        };
      };
    };
  };
}
