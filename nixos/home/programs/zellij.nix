{ pkgs, colors, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "${pkgs.nushell}/bin/nu";
      theme = "ocean";
      show_startup_tips = false;
      default_layout = "compact";
      pane_frames = false;
      mouse_mode = true;

      session_serialization = true;
      serialize_pane_viewport = true;
      scrollback_lines_to_serialize = 10000;

      plugins = {
        resurrect = { location = "zellij:zellij-resurrect"; };
      };

      load_plugins = {
        resurrect = {
          on_startup = true;
          interval = 30;
        };
      };

      keybinds = {
        "shared_except \"locked\"" = {
          "bind \"Ctrl a\"" = { NewPane = "Down"; };
          "bind \"Ctrl s\"" = { NewPane = "Right"; };
          "bind \"Ctrl h\"" = { MoveFocus = "Left"; };
          "bind \"Ctrl l\"" = { MoveFocus = "Right"; };
          "bind \"Ctrl j\"" = { MoveFocus = "Down"; };
          "bind \"Ctrl k\"" = { MoveFocus = "Up"; };
          "bind \"Alt h\"" = { Resize = "Increase Left"; };
          "bind \"Alt l\"" = { Resize = "Increase Right"; };
          "bind \"Alt j\"" = { Resize = "Increase Down"; };
          "bind \"Alt k\"" = { Resize = "Increase Up"; };
          "bind \"Ctrl t\"" = { NewTab = [ ]; };
          "bind \"Alt w\"" = { CloseTab = [ ]; };
          "bind \"Alt n\"" = { GoToNextTab = [ ]; };
          "bind \"Alt p\"" = { GoToPreviousTab = [ ]; };
        };
      };

      themes = {
        ocean = {
          fg = "${colors.palette.fg}";
          bg = "${colors.palette.bg}";
          black = "${colors.palette.black}";
          red = "${colors.palette.red}";
          green = "${colors.palette.green}";
          yellow = "${colors.palette.yellow}";
          blue = "${colors.palette.blue}";
          magenta = "${colors.palette.magenta}";
          cyan = "${colors.palette.cyan}";
          white = "${colors.palette.white}";
          orange = "${colors.palette.orange}";
        };
      };
    };
  };
}
