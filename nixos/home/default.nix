{
  config,
  pkgs,
  lib,
  ...
}:

let
  colors = import ./colors.nix;
in
{
  _module.args = { inherit colors; };

  imports = [
    ./programs/waybar.nix
    ./programs/kitty.nix
    ./programs/alacritty.nix
    ./programs/zellij.nix
    ./programs/nushell.nix
    ./packages.nix
    ./img.nix
    ./programs/helix.nix
    ./programs/fuzzel.nix
    ./programs/gowall.nix
    ./programs/git.nix
    ./programs/cava.nix
    ./programs/theme.nix
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
