{
  config,
  pkgs,
  lib,
  colors,
  ...
}:

let
  cleanHex = c: lib.removePrefix "#" c;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$bg" = "rgb(${cleanHex colors.palette.bg})";
      "$fg" = "rgb(${cleanHex colors.palette.fg})";
      "$red" = "rgb(${cleanHex colors.palette.red})";
      "$green" = "rgb(${cleanHex colors.palette.green})";
      "$yellow" = "rgb(${cleanHex colors.palette.yellow})";
      "$blue" = "rgb(${cleanHex colors.palette.blue})";
      "$magenta" = "rgb(${cleanHex colors.palette.magenta})";
      "$cyan" = "rgb(${cleanHex colors.palette.cyan})";
      "$lavender" = "rgb(${cleanHex colors.palette.lavender})";

      "$mainMod" = "MOD3";
      "$screenshot" = "grim -g \"$(slurp)\" ~/Pictures/screenshot.png";
      "$browser" = "firefox";
      "$launcher" = "fuzzel";
      "$swww" = "swww-daemon";
      "$autoswww" = "swww img ~/Wallpaper/1.* --transition-type none";
      "$volum" = "wpctl set-volume @DEFAULT_AUDIO_SINK@";
      "$mute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      monitor = [
        "DP-2, 1920x1080@60, -1920x540, 1"
        "HDMI-A-1, 1920x1080@99, -1920x-540, 1"
        "DP-1, 1920x1080@165, 0x0, 1"
      ];

      workspace = [
        "1, monitor:DP-2, default:true"
        "2, monitor:HDMI-A-1, default:true"
        "3, monitor:DP-1, default:true"
      ];

      env = [
        "XCURSOR_THEME, phinger-cursors-dark"
        "XCURSOR_SIZE, 24"
      ];

      cursor = {
        inactive_timeout = 2;
      };

      "exec-once" = [
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "$swww & $autoswww & waybar"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 0;
        "col.active_border" =
          "rgba(${cleanHex colors.palette.magenta}ee) rgba(${cleanHex colors.palette.cyan}ee) 45deg";
        "col.inactive_border" = "rgba(${cleanHex colors.palette.surface0}aa)";
      };

      decoration = {
        rounding = 5;
        active_opacity = 0.95;
        inactive_opacity = 0.90;
        fullscreen_opacity = 1.0;

        shadow = {
          enabled = false;
          range = 15;
          render_power = 2;
          color = "rgba(00000088)";
          offset = "8 8";
        };

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.02;
        };
      };

      animations = {
        enabled = false;
        bezier = [
          "superfast, 0.05, 0.8, 0.2, 1.05"
          "quick, 0.25, 0.1, 0.25, 1.0"
        ];
        animation = [
          "windowsIn, 1, 3, superfast, popin"
          "windowsOut, 1, 3, quick, slide"
          "windowsMove, 1, 3, quick, slide"
          "workspaces, 1, 3.5, quick, slide"
          "border, 1, 1, quick"
          "fade, 1, 2.5, quick"
        ];
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "caps:hyper";
        follow_mouse = 1;
      };

      bind = [
        "$mainMod, SPACE, exec, hyprctl switchxkblayout all next"
        "$mainMod, E, exec, alacritty"
        "$mainMod, RETURN, exec, alacritty"
        "$mainMod, Q, killactive"
        "$mainMod, F, fullscreen"
        "$mainMod, R, exec, $launcher"
        "$mainMod, W, exec, $browser"
        "$mainMod, D, exec, Telegram"
        "ALT SHIFT, S, exec, $screenshot"
        "$mainMod, A, exec, steam"
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "SUPER ALT SHIFT, S, exec, systemctl suspend"
        "SUPER ALT SHIFT, Q, exec, poweroff"
        "SUPER ALT SHIFT, R, exec, reboot"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod CTRL, Q, exit"
        "$mainMod CTRL, R, exec, hyprctl reload"
        "$mainMod, G, togglefloating"
        ", XF86AudioRaiseVolume, exec, $volum 5%+"
        ", XF86AudioLowerVolume, exec, $volum 5%-"
        ", XF86AudioMute, exec, $mute"
        "CTRL SHIFT, 0, exec, pkill mpvpaper; swww img ~/Wallpaper/0.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 9, exec, pkill mpvpaper; swww img ~/Wallpaper/9.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 8, exec, pkill mpvpaper; swww img ~/Wallpaper/8.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 7, exec, pkill mpvpaper; swww img ~/Wallpaper/7.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 6, exec, pkill mpvpaper; swww img ~/Wallpaper/6.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 5, exec, pkill mpvpaper; swww img ~/Wallpaper/5.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 4, exec, pkill mpvpaper; swww img ~/Wallpaper/4.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 3, exec, pkill mpvpaper; swww img ~/Wallpaper/3.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 2, exec, pkill mpvpaper; swww img ~/Wallpaper/2.* --transition-type fade --transition-fps 165"
        "CTRL SHIFT, 1, exec, pkill mpvpaper; swww img ~/Wallpaper/1.* --transition-type fade --transition-fps 165"
      ];

      binde = [
        "$mainMod CTRL, h, resizeactive, -50 0"
        "$mainMod CTRL, l, resizeactive, 50 0"
        "$mainMod CTRL, k, resizeactive, 0 -50"
        "$mainMod CTRL, j, resizeactive, 0 50"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindr = [
        "$mainMod, $mainMod, exec, wtype -k Escape"
      ];
    };
  };
}
