{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    # ./modules/disk.nix
    ./hardware-configuration.nix
    ./modules/intel.nix
    ./modules/hyprland.nix
    ./modules/grub.nix
    ./modules/audio.nix
    ./modules/fonts.nix
    ./modules/zapret.nix
  ];

  system.stateVersion = "26.05";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  zramSwap.enable = true;
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = false;
  services.udisks2.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 1d";
    };
  };

  time.timeZone = "Asia/Yekaterinburg";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ALL = "en_US.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  users.users.nixos = {
    isNormalUser = true;
    description = "nixos";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "storage"
    ];
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "nixos";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  security.sudo.extraRules = [
    {
      users = [ "nixos" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/bash /home/nixos/zapret-discord-youtube-linux/main_script.sh";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  services.flatpak.enable = true;
  services.gvfs.enable = true;

  environment.variables = {
    XCURSOR_THEME = "phinger-cursors-dark";
    XCURSOR_SIZE = "24";
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    curl
    unzip
    zip
    phinger-cursors
  ];

  security.sudo.enable = true;
}
