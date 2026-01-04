{
  config,
  pkgs,
  lib,
  colors,
  ...
}:

{
  programs.waybar = {
    enable = true;

    settings = lib.mkForce {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;

        margin-top = 10;
        margin-left = 10;
        margin-right = 10;
        spacing = 0;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "pulseaudio"
          "memory"
          "hyprland/language"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "{id}";
          on-click = "activate";
          all-outputs = true;
          persistent-workspaces = {
            "1" = [ ];
          };
        };

        "hyprland/language" = {
          format = "{}";
          format-en = "EN";
          format-ru = "RU";
          min-length = 3;
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 40;
          separate-outputs = true;
        };

        "clock" = {
          format = "{:%H:%M | %d.%m.%y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "memory" = {
          format = "RAM {used:0.1f}G";
          interval = 10;
        };

        "pulseaudio" = {
          format = "VOL {volume}%";
          format-muted = "MUTED";
          on-click = "pavucontrol";
        };

        "tray" = {
          icon-size = 15;
          spacing = 10;
        };
      };
    };

    style = lib.mkForce ''
      @define-color base      ${colors.palette.bg};
      @define-color text      ${colors.palette.fg};
      @define-color mauve     ${colors.palette.magenta};
      @define-color lavender  ${colors.palette.lavender};
      @define-color blue      ${colors.palette.blue};
      @define-color green     ${colors.palette.green};
      @define-color yellow    ${colors.palette.yellow};
      @define-color surface0  ${colors.palette.surface0};

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
        min-height: 0;
        font-weight: bold;
      }

      window#waybar {
        background-color: @base;
        border-radius: 8px;
        color: @text;
      }

      window#waybar > box {
        margin: 0;
      }

      #workspaces button {
        padding: 0 10px;
        color: @text;
        margin: 4px 2px;
        border-radius: 5px;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        color: @mauve;
        background: rgba(199, 146, 234, 0.15);
      }

      #workspaces button:hover {
        background: rgba(183, 189, 248, 0.1);
      }

      #clock, #memory, #pulseaudio, #language, #tray, #window {
        padding: 0 12px;
        margin: 0;
        border-radius: 0;
      }

      #window { 
        color: @lavender; 
      }

      #clock { 
        color: @mauve; 
      }

      #language { 
        color: @blue; 
      }

      #memory { 
        color: @green; 
      }

      #pulseaudio { 
        color: @yellow; 
      }

      #tray { 
        margin-right: 5px; 
      }
    '';
  };
}
