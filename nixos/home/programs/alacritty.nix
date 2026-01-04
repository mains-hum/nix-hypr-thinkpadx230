{
  config,
  pkgs,
  colors,
  ...
}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetBrains Mono Nerd Font";
          style = "SemiBold";
        };
        bold = {
          family = "JetBrains Mono Nerd Font";
          style = "Bold";
        };
        size = 10.0;
      };

      terminal.shell = {
        program = "${pkgs.zellij}/bin/zellij";
        args = [
          "attach"
          "-c"
          "main"
          "options"
          "--default-shell"
          "${pkgs.nushell}/bin/nu"
        ];
      };

      window.opacity = 0.95;

      cursor = {
        style = {
          shape = "Block";
          blinking = "Always";
        };
      };

      # --- ЦВЕТА ИЗ ЕДИНОГО colors.nix ---
      colors = {
        primary = {
          background = colors.palette.bg;
          foreground = colors.palette.fg;
          dim_foreground = colors.palette.overlay0;
          bright_foreground = colors.palette.fg;
        };
        cursor = {
          text = colors.palette.bg;
          cursor = colors.palette.rosewater;
        };
        vi_mode_cursor = {
          text = colors.palette.bg;
          cursor = colors.palette.lavender;
        };
        selection = {
          text = colors.palette.bg;
          background = colors.palette.rosewater;
        };
        normal = {
          black = colors.palette.black;
          red = colors.palette.red;
          green = colors.palette.green;
          yellow = colors.palette.yellow;
          blue = colors.palette.blue;
          magenta = colors.palette.magenta;
          cyan = colors.palette.cyan;
          white = colors.palette.white;
        };
        bright = {
          black = colors.palette.bright_black;
          red = colors.palette.red;
          green = colors.palette.green;
          yellow = colors.palette.yellow;
          blue = colors.palette.blue;
          magenta = colors.palette.magenta;
          cyan = colors.palette.cyan;
          white = colors.palette.white;
        };
      };

      keyboard.bindings = [
        {
          key = "Plus";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
      ];
    };
  };
}
