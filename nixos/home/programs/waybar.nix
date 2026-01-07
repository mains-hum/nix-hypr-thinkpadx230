{
  config,
  pkgs,
  lib,
  colors,
  ...
}:

let
  waybar_cava_script = pkgs.writeShellScript "waybar-cava" ''
    export LANG=en_US.UTF-8
    ${pkgs.cava}/bin/cava -p $HOME/.config/cava/config_waybar | \
    sed -u 's/;//g;s/0/ /g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g'
  '';
in
{
  home.packages = [ pkgs.cava ];

  programs.waybar = {
    enable = true;

    settings = lib.mkForce {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        exclusive = true;

        margin-top = 10;
        margin-left = 15;
        margin-right = 15;

        modules-left = [
          "hyprland/workspaces"
          "custom/cava"
        ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "pulseaudio"
          "memory"
          "hyprland/language"
          "clock"
          "tray"
        ];

        "custom/cava" = {
          exec = "${waybar_cava_script}";
          format = "{}";
        };

        "hyprland/workspaces" = {
          format = "󰥱";
          on-click = "activate";
          all-outputs = true;
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
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
          format = "{:%H:%M:%S}";
          interval = 1;
        };

        "memory" = {
          format = "RAM {used:0.1f}G";
          interval = 10;
        };

        "pulseaudio" = {
          format = "{volume}%";
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

      * {
        border: none;
        border-radius: 0;
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 13px;
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

      #clock, #memory, #pulseaudio, #language, #tray, #window {
        padding: 0 12px;
      }

      #window { color: @lavender; }
      #clock { color: @mauve; }
      #language { color: @blue; }
      #memory { color: @green; }
      #pulseaudio { color: @yellow; }
      #tray { margin-right: 8px; }
    '';
  };

  xdg.configFile."cava/config_waybar".text = ''
    [general]
    bars = 10
    sleep_timer = 5
    framerate = 60

    [input]
    method = pulse
    source = auto

    [output]
    method = raw
    raw_target = /dev/stdout
    data_format = ascii
    ascii_max_range = 7
  '';
}
