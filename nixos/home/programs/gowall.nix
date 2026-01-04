{ pkgs, colors, ... }:

{
  home.packages = [ pkgs.gowall ];
  home.file.".config/gowall/config.yml".text = ''
    themes:
      - name: "custom-ocean"
        colors:
          - "${colors.palette.bg}"
          - "${colors.palette.surface0}"
          - "${colors.palette.surface1}"
          - "${colors.palette.surface2}"
          - "${colors.palette.fg}"
          - "${colors.palette.white}"
          - "${colors.palette.cyan}"
          - "${colors.palette.blue}"
          - "${colors.palette.red}"
          - "${colors.palette.orange}"
          - "${colors.palette.yellow}"
          - "${colors.palette.green}"
          - "${colors.palette.magenta}"
          - "${colors.palette.overlay1}"
          - "${colors.palette.overlay0}"
          - "${colors.palette.bg_dark}"
  '';
}
