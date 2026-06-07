{
  flake.modules.homeManager.setting-githubAuthentication = {
    services.ssh-agent.enable = true;

    programs.ssh = {
      enable = true;
      # tell SSH to automatically add unlocked key agent
      addKeysToAgent = "yes"; 
      
      matchBlocks."github.com" = {
        extraOptions = {
          StrictHostKeyChecking = "accept-new";
        };
      };
    };
  };
}
