{
  flake.modules.nixos = {
    setting-stylix-fonts-sleek = {pkgs, ...}: {
      stylix.fonts = {
        serif = {
          package = pkgs.texlivePackages.eczar;
          name = "Eczar";
        };

        sansSerif = {
          package = pkgs.dm-sans;
          name = "DeepMind Sans Medium";
        };

        monospace = {
          package = pkgs.ioskeley-mono.normal-NF;
          name = "IoskeleyMono Nerd Font Medium";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };
}
