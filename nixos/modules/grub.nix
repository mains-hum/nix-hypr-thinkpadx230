{ pkgs, ... }:

{
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
    gfxmodeBios = "1366x768";
    splashImage = ./grub.png;
    extraConfig = ''
      insmod png
      insmod vbe
      insmod vga
      set menu_color_normal=light-cyan/black
      set menu_color_highlight=magenta/black
    '';
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v24n.psf.gz";
  };
  boot.loader.timeout = 3;
}
