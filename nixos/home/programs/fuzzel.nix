{
  config,
  pkgs,
  colors,
  ...
}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=12";
        prompt = "❯   ";
        width = 30;
        horizontal-pad = 20;
        vertical-pad = 15;
        inner-pad = 10;
        line-height = 25;
        terminal = "alacritty";
        show-icons = "no";
        icons-enabled = "no";
      };

      colors = {
        background = "${builtins.substring 1 6 colors.palette.bg}f2";
        text = "${builtins.substring 1 6 colors.palette.fg}ff";
        match = "${builtins.substring 1 6 colors.palette.blue}ff";
        selection = "${builtins.substring 1 6 colors.palette.surface1}ff";
        selection-text = "${builtins.substring 1 6 colors.palette.fg}ff";
        selection-match = "${builtins.substring 1 6 colors.palette.yellow}ff";
        border = "00000000";
      };

      border = {
        width = 0;
        radius = 10;
      };
    };
  };
}
