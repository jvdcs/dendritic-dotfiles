{
  flake.modules.homeManager = {
    packageSet-viewers = {pkgs, ...}: {
      home.packages = with pkgs; [
        sioyek # keyboard-driven PDF viewer
        qimgv # lightweight image viewer
        swayimg # Wayland native image viewer
      ];
    };

    packageSet-latex = {pkgs, ...}: {
      home.packages = with pkgs; [
        texliveFull # complete LaTeX distribution
        ghostscript # PostScript/PDF interpreter
      ];
    };

    packageSet-typst = {pkgs, ...}: {
      home.packages = with pkgs; [
        tree-sitter-grammars.tree-sitter-typst # typst syntax tree parser
        tree-sitter # parser generator tool
        typst-live # live preview for typst
        typst # modern typesetting system
      ];
    };

    packageSet-lsps = {pkgs, ...}: {
      home.packages = with pkgs; [
        tinymist # typst language server
        marksman # markdown lsp
        markdown-oxide
      ];
    };

    packageSet-mediaTools = {pkgs, ...}: {
      home.packages = with pkgs; [
        ffmpeg # audio/video converter swiss army knife
        spotdl # download Spotify tracks
        yt-dlp # download YouTube videos
      ];
    };

    packageSet-audioVisualizers = {pkgs, ...}: {
      home.packages = with pkgs; [
        iniparser # INI file parser (cava dep)
        fftw # fast fourier transform library
        cava # console audio visualizer
      ];
    };

    packageSet-shell = {pkgs, ...}: {
      home.packages = with pkgs; [
        starship # cross-shell prompt
        nushell # structured data shell
        fish # shell for nushell completions
      ];
    };

    packageSet-terminalTools = {pkgs, ...}: {
      home.packages = with pkgs; [
        asciiquarium-transparent # aquarium in terminal
        unoconv # document format converter
        lynx # text-based web browser
      ];
    };

    packageSet-creative = {pkgs, ...}: {
      home.packages = with pkgs; [
        kdePackages.kdenlive # video editor
        obs-studio # streaming/recording
        # easyeffects # PipeWire audio effects
        pinta # simple image editor
        aseprite # pixel editor
        # ardour # digital audio workstation
        # aseprite # pixel art editor
      ];
    };

    packageSet-productivity = {pkgs, ...}: {
      home.packages = with pkgs; [
        syncthing # file synchronization
        # qutebrowser # lightweight python-QT browser
        slack # discord but for the employed
        obsidian # markdown knowledge base
        # gocryptfs # encrypted filesystem
        newsflash # rss reader
      ];
    };
  };
}
