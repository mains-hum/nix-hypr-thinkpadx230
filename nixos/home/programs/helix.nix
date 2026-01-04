{ pkgs, colors, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "custom_ocean_transparent";
      editor = {
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        true-color = true;
        lsp.display-messages = true;
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
          normal = "block";
        };
        indent-guides = {
          render = true;
          character = "▏";
        };
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
          ];
          center = [ "diagnostics" ];
          right = [
            "position"
            "file-encoding"
            "file-type"
          ];
          separator = "│";
        };
      };
      keys.normal = {
        "esc" = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        "L" = "goto_next_buffer";
        "H" = "goto_previous_buffer";
        "space" = {
          "w" = ":w";
          "q" = ":q";
        };
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
          };
        }
        {
          name = "rust";
          auto-format = true;
        }
        {
          name = "python";
          auto-format = true;
        }
      ];
    };
  };

  xdg.configFile."helix/themes/custom_ocean_transparent.toml".text = ''
    inherits = "catppuccin_macchiato"
    "ui.background" = { }
    "ui.statusline" = { fg = "${colors.palette.fg}", bg = "${colors.palette.surface0}" }
    "ui.virtual.indent-guide" = { fg = "${colors.palette.surface1}" }
    "ui.cursor.match" = { fg = "${colors.palette.yellow}", modifiers = ["bold"] }
    "ui.bufferline.active" = { fg = "${colors.palette.bg}", bg = "${colors.palette.lavender}", modifiers = ["bold"] }
    "ui.statusline.inactive" = { fg = "${colors.palette.overlay0}", bg = "${colors.palette.bg}" }
    "ui.help" = { bg = "${colors.palette.surface0}", fg = "${colors.palette.fg}" }
    "ui.menu" = { bg = "${colors.palette.surface0}", fg = "${colors.palette.fg}" }
    "ui.menu.selected" = { bg = "${colors.palette.surface1}", fg = "${colors.palette.magenta}" }
  '';
}
