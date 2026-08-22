{...}: {
  flake.modules.homeManager.feature-ghostty = {...}: {
    programs.ghostty = {
      enable = true;
      settings = {
        confirm-close-surface = false; # kitty: confirm_os_window_close = 0
        link-previews = true; # kitty: show_hyperlink_targets = "yes"
        adjust-cell-height = 3; # kitty: modify_font = "cell_height +3px"
        font-size = 1;
        cursor-style-blink = false; # kitty: cursor_blink_interval = 0
        window-padding-x = 6; # kitty: window_padding_width = 6
        window-padding-y = 6;
        palette-generate = false;
        term = "xterm-256color";
        env = "COLORTERM=truecolor";
        # background-opacity = lib.mkForce 0.8;
        # background-blur-radius = lib.mkForce 20;

        keybind = [
          "ctrl+u=unbind"
          "ctrl+d=unbind"
          "ctrl+shift+r=unbind"
          "ctrl+shift+d=unbind"
          "ctrl+shift+w=unbind" # real Ghostty default (close_surface) — this one matters
          "ctrl+shift+u=unbind"
          "ctrl+shift+n=unbind" # real Ghostty default (new_window) — this one matters
          "ctrl+shift+h=unbind"
          "ctrl+shift+l=unbind"
          "ctrl+shift+k=scroll_page_lines:-1" # kitty: scroll_line_up
          "ctrl+shift+j=scroll_page_lines:1" # kitty: scroll_line_down
          "all:ctrl+equal=increase_font_size:1" # kitty: change_font_size all +1.0
          "all:ctrl+minus=decrease_font_size:1" # kitty: change_font_size all -1.0
        ];
      };
    };
  };
}
