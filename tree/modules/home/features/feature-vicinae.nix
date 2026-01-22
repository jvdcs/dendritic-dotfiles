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
            border_width = 2;
          };
          size = {
            width = 900;
            height = 600;
          };
          dim_around = true;
          blur.enabled = false;
          compact_mode.enabled = false;
          layer_shell = {
            layer = "top";
            enabled = true;
          };
        };
        keybinds = {
          "action.copy" = "control+shift+C";
          "action.copy-name" = "control+shift+.";
          "action.copy-path" = "control+shift+,";
          "action.dangerous-remove" = "control+shift+X";
          "action.duplicate" = "control+D";
          "action.edit" = "control+E";
          "action.edit-secondary" = "control+shift+E";
          "action.move-down" = "control+shift+ARROWDOWN";
          "action.move-up" = "control+shift+ARROWUP";
          "action.new" = "control+N";
          "action.open" = "control+O";
          "action.pin" = "control+shift+P";
          "action.refresh" = "control+R";
          "action.remove" = "control+X";
          "action.save" = "control+S";
          "open-search-filter" = "control+P";
          "open-settings" = "control+,";
          "toggle-action-panel" = "control+B";
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
