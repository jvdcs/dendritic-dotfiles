{inputs, ...}: {
  flake.modules.homeManager.feature-vicinae = {
    system,
    pkgs,
    lib,
    ...
  }: let
    opensslInject = pkgs.writeText "inject-openssl.cmake" ''
      find_package(OpenSSL REQUIRED)
    '';

    vicinaePatched = inputs.vicinae.packages.${system}.default.overrideAttrs (old: {
      buildInputs = (old.buildInputs or []) ++ [pkgs.openssl];

      cmakeFlags =
        (old.cmakeFlags or [])
        ++ [
          "-DCMAKE_PROJECT_INCLUDE_BEFORE=${opensslInject}"
        ];
    });
  in {
    imports = [
      inputs.vicinae.homeManagerModules.default
    ];

    services.vicinae = {
      enable = true;
      package = vicinaePatched;
      systemd = {
        enable = true;
        autoStart = true;
        environment = {
          USE_LAYER_SHELL = 1;
        };
      };
      settings = {
        imports = [];
        close_on_focus_loss = true;
        consider_preedit = false;
        pop_to_root_on_close = false;
        escape_key_behavior = "navigate_back";
        favicon_service = "twenty";
        keybinding = "default";
        search_files_in_root = false;
        font = {
          normal = {
            family = "auto";
            size = 14;
          };
        };
        theme = {
          light = {
            name = lib.mkForce "stylix";
            icon_theme = "auto";
          };
          dark = {
            name = lib.mkForce "stylix";
            icon_theme = "auto";
          };
        };
        launcher_window = {
          opacity = lib.mkForce 1;
          client_side_decorations = {
            enabled = true;
            rounding = 10;
            border_width = 1;
          };
          size = {
            width = 800;
            height = 500;
          };
          dim_around = true;
          blur.enabled = false;
          compact_mode.enabled = false;
          layer_shell = {
            layer = "top";
            enabled = true;
          };
        };
        favorites = ["clipboard:history"];
        fallbacks = ["files:search"];
      };
      extensions = with inputs.vicinae-extensions.packages.${system}; [
        process-manager
        niri
        nix
      ];
    };
  };
}
