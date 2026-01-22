{
  flake.modules.nixos.setting-fonts = {pkgs, ...}: let
    monolisa = pkgs.stdenv.mkDerivation {
      name = "monolisa";
      version = "0.0.0";
      src = pkgs.fetchFromGitHub {
        owner = "JonyPlo";
        repo = "monolisa-font";
        rev = "44aaf6507692b567e870a6d65e65e66af5bab54d";
        hash = "sha256-WMSD+bZNbWjfe+I5MCvw/gClBG6XuO+tk+Ezb08cGTk=";
      };
      installPhase = ''
        mkdir -p $out/share/fonts/truetype/monolisa
        cp -r fonts/* $out/share/fonts/truetype/monolisa
      '';
    };
  in {
    fonts = {
      enableDefaultPackages = true;
      packages = with pkgs; [
        # serif
        texlivePackages.eczar
        cm_unicode
        # sans serif
        dm-sans
        # monospace
        monolisa
        julia-mono
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
      ];

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
        defaultFonts = {
          serif = ["Eczar"];
          sansSerif = ["DeepMind Sans Medium"];
          monospace = ["JetBrainsMono Nerd Font"];
          emoji = ["Noto Color Emoji"];
        };
      };
    };
  };
}
