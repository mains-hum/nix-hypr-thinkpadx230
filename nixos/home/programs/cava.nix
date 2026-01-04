{
  config,
  pkgs,
  colors,
  ...
}:

{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 60;
        autosens = 1;
        bars = 0;
        bar_width = 2;
        bar_spacing = 1;
      };

      smoothing = {
        integral = 77;
        monstercat = 1;
      };

      color = {
        gradient = 1;
        gradient_count = 6;

        gradient_color_1 = "'${colors.palette.blue}'";
        gradient_color_2 = "'${colors.palette.cyan}'";
        gradient_color_3 = "'${colors.palette.lavender}'";
        gradient_color_4 = "'${colors.palette.magenta}'";
        gradient_color_5 = "'${colors.palette.rosewater}'";
        gradient_color_6 = "'${colors.palette.red}'";
      };
    };
  };
}
