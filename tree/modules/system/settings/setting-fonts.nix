{
  flake.modules.nixos.setting-fonts = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.freetype
      pkgs.freetype.dev
    ];

    fonts = {
      enableDefaultPackages = true;
      packages =
        with pkgs; [
          # serif
          texlivePackages.eczar
          cm_unicode
          ibm-plex
          # sans serif
          dm-sans
          # monospace
          julia-mono
          ioskeley-mono.normal-NF
          nerd-fonts.space-mono
          nerd-fonts.jetbrains-mono
          nerd-fonts.symbols-only
          nerd-fonts.geist-mono
          iosevka-comfy.comfy
          # foreign script fallback
          noto-fonts-cjk-sans
          noto-fonts-color-emoji
          # newadd
          times-newer-roman
        ]
        # ++ builtins.attrValues pkgs.ioskeley-mono
        ;

      fontconfig = {
        enable = true;
        antialias = true;
        cache32Bit = true;
        subpixel = {
          rgba = "rgb";
          lcdfilter = "light";
        };
        hinting = {
          enable = true;
          autohint = true;
          style = "medium";
        };
        # Controlled by setting-stylix-fonts-sleek.nix
        # defaultFonts = {
        #   serif = ["Eczar"];
        #   sansSerif = ["DeepMind Sans Medium"];
        #   monospace = ["IoskeleyMono Nerd Font"];
        #   emoji = ["Noto Color Emoji"];
        # };
      };
    };
  };
}
