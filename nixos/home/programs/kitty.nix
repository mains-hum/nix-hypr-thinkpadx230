{
  config,
  pkgs,
  colors,
  ...
}:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };

    settings = {
      shell = "fish";
      window_padding_width = 0;
      background_opacity = "0.95";
      background_blur = 1;
      enable_audio_bell = false;

      foreground = "${colors.palette.fg}";
      background = "${colors.palette.bg}";
      selection_foreground = "${colors.palette.fg}";
      selection_background = "${colors.palette.surface2}";
      url_color = "${colors.palette.cyan}";
      cursor = "${colors.palette.rosewater}";
      cursor_text_color = "${colors.palette.bg}";

      color0 = "${colors.palette.black}";
      color8 = "${colors.palette.bright_black}";

      color1 = "${colors.palette.red}";
      color9 = "${colors.palette.red}";

      color2 = "${colors.palette.green}";
      color10 = "${colors.palette.green}";

      color3 = "${colors.palette.yellow}";
      color11 = "${colors.palette.yellow}";

      color4 = "${colors.palette.blue}";
      color12 = "${colors.palette.blue}";

      color5 = "${colors.palette.magenta}";
      color13 = "${colors.palette.magenta}";

      color6 = "${colors.palette.cyan}";
      color14 = "${colors.palette.cyan}";

      color7 = "${colors.palette.fg}";
      color15 = "${colors.palette.white}";
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+equal" = "change_font_size all +1";
      "ctrl+kp_add" = "change_font_size all +1";
      "ctrl+minus" = "change_font_size all -1";
      "ctrl+underscore" = "change_font_size all -1";
      "ctrl+kp_subtract" = "change_font_size all -1";
      "ctrl+0" = "change_font_size all 0";
      "ctrl+kp_0" = "change_font_size all 0";
    };
  };
}
