{ config, pkgs, ... }:

{
  fileSystems."/data/sdcard" = {
    device = "/dev/disk/by-uuid/36D6-BBAC";
    fsType = "auto";
    options = [
      "nofail"
      "user"
      "umask=000"
    ];
  };
}
