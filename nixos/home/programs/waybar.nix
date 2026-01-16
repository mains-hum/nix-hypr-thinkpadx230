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
        height = 24;
        exclusive = true;

        margin-top = 10;
        margin-left = 10;
        margin-right = 10;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
          "custom/cava"
        ];
        modules-center = [ ];
        modules-right = [
          "network"
          "pulseaudio"
          "memory"
          "battery"
          "hyprland/language"
          "clock"
          "tray"
        ];

        "hyprland/workspaces" = {
          format = "󰥱";
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
        };

        "clock" = {
          format = "{:%H:%M:%S | %d.%m.%y | %A}";
          interval = 1;
        };

        "memory" = {
          format = "  {used:0.1f}G";
          interval = 10;
        };

        "network" = {
          format-wifi = "  {bandwidthDownBits}";
          format-ethernet = "󰈀  {bandwidthDownBits}";
          format-disconnected = "󰖪  OFF";
          interval = 1;
          tooltip-format = "{ifname} via {gwaddr}\n⬆ {bandwidthUpBits} ⬇ {bandwidthDownBits}";
          on-click = "nm-connection-editor";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󱐋 {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };

        "pulseaudio" = {
          format = "{icon}  {volume}%";
          format-muted = "MUTED";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            default = [
              ""
              ""
              ""
            ];
          };
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
      @define-color orange    #fab387;

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 12px;
        font-weight: bold;
      }

      window#waybar {
        background-color: @base;
        opacity: 0.95; 
        border-radius: 5px;
        color: @text;
      }

      #custom-cava {
        color: @mauve;
        font-size: 16px;
        padding-left: 10px;
        font-family: "JetBrainsMono Nerd Font"; 
      }

      #workspaces button {
        padding: 0 6px;
        color: @text;
        opacity: 0.4;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        color: @mauve;
        opacity: 1.0;
        font-size: 14px;
      }

      #workspaces button:hover {
        color: @lavender;
        background: transparent;
      }

      #clock, #memory, #pulseaudio, #language, #tray, #window, #network, #battery {
        padding: 0 12px;
      }

      #window { color: @lavender; }
      #clock { color: @mauve; }
      #language { color: @blue; }
      #memory { color: @green; }
      #pulseaudio { color: @yellow; }
      #network { color: @lavender; }
      #battery { color: @orange; }
      #tray { margin-right: 8px; }
    '';
  };
}
