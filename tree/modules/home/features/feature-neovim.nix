{...}: {
  flake.modules.homeManager.feature-neovim = {pkgs, ...}: let
    typstar = pkgs.vimUtils.buildVimPlugin {
      name = "typstar";
      src = pkgs.fetchFromGitHub {
        owner = "arne314";
        repo = "typstar";
        rev = "main";
        sha256 = "sha256-T/rRIt0Mr2bgSkiUUaDHcAQkgtue9ChlvHzx4OH0RVg=";
      };
      dependencies = [pkgs.vimPlugins.luasnip];
      doCheck = false;
    };

    neovimConfig = pkgs.neovimUtils.makeNeovimConfig {
      viAlias = true;
      vimAlias = true;
      extraLuaPackages = ps: [ps.jsregexp]; # <-- wires jsregexp into LUA_CPATH
      plugins = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        luasnip
        typst-preview-nvim
        typstar
        blink-cmp
        mini-nvim
        vim-visual-multi
        nvim-surround
        harpoon2
        snacks-nvim
        nvim-autopairs

        promise-async
        nvim-ufo
      ];
    };

    neovim-custom = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped (neovimConfig
      // {
        wrapRc = false;
      });
  in {
    home.packages = with pkgs; [
      neovim-custom
      tinymist
      typst
      # luajitPackages.jsregexp  <-- removed, handled by extraLuaPackages above
    ];
  };
}
