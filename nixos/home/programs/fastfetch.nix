{ config, pkgs, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        type = "builtin";
        source = "nixos";
        width = 20;
        height = 8;
        padding = {
          top = 1;
          left = 2;
          right = 0;
        };
      };
      display = {
        separator = " ";
        color = {
          keys = "magenta";
        };
      };
      modules = [
        {
          type = "custom";
          format = "";
        }
        {
          type = "custom";
          format = "";
        }
        {
          type = "custom";
          format = "";
        }
        {
          type = "custom";
          format = "";
        }
        {
          type = "title";
          format = " {#35} {#39}{user-name}";
        }
        {
          type = "custom";
          format = "{#30}──────────────";
        }
        {
          key = " {#31}󱄅 os  ";
          type = "os";
        }
        {
          key = " {#33} ker ";
          type = "kernel";
        }
        {
          key = " {#32}󱎫 up  ";
          type = "uptime";
        }
        {
          key = " {#36}󰏖 pkgs";
          type = "packages";
        }
        {
          key = " {#34} sh  ";
          type = "shell";
        }
        {
          key = " {#35}󱂬 wm  ";
          type = "wm";
        }
        {
          key = " {#31}󰋊 dsk ";
          type = "disk";
        }
        {
          key = " {#32} ram ";
          type = "memory";
        }

        {
          type = "custom";
          format = "";
        }
        {
          type = "colors";
          symbol = "block";
        }
      ];
    };
  };
}
