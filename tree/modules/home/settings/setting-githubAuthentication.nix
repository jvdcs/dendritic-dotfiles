{
  flake.modules.homeManager.setting-githubAuthentication = {
    services.ssh-agent.enable = true;

    programs.ssh = {
      enable = true;
      settings."*".AddKeysToAgent = "yes"; # tell SSH to automatically add unlocked key agent
      matchBlocks."github.com" = {
        extraOptions = {
          StrictHostKeyChecking = "accept-new";
        };
      };
    };
  };
}
