{...}: {
  flake.modules.homeManager.feature-neovim = {pkgs, ...}: let
    neovimConfig = pkgs.neovimUtils.makeNeovimConfig {
      extraLuaPackages = ps: [ps.jsregexp]; # <-- wires jsregexp into LUA_CPATH
    };

    neovim-custom = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (neovimConfig
      // {
        wrapRc = false;
      });
  in {
    home.packages = with pkgs; [
      neovim-custom
    ];
  };
}
