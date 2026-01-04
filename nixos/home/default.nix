{
  config,
  pkgs,
  lib,
  ...
}:

let
  # Импортируем нашу палитру
  colors = import ./colors.nix;
in
{
  # Пробрасываем переменную colors во все дочерние конфиги
  _module.args = { inherit colors; };

  imports = [
    ./programs/waybar.nix
    ./programs/rofi.nix
    ./programs/kitty.nix
    ./programs/alacritty.nix
    ./programs/zellij.nix
    ./programs/nushell.nix
    ./packages.nix
    ./img.nix
    ./programs/helix.nix
    ./programs/gowall.nix
    ./programs/git.nix
    ./programs/cava.nix
    ./programs/theme.nix
    ./programs/nvf.nix
    ./programs/fastfetch.nix
    ./programs/hyprland.nix
    ./programs/firefox.nix
  ];

  home.enableNixpkgsReleaseCheck = false;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "phinger-cursors-dark";
    };
  };

  home.stateVersion = "26.05";
}
