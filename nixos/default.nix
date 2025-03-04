{ config, lib, pkgs, ... }:
{
  imports = [
      ./graphical.nix
      ./hardware-configuration.nix
      ./services.nix
      ./users.nix
    ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };
  };

  zramSwap.enable = true;

  hardware.cpu.amd.updateMicrocode = true;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";

  networking = {
    hostName = "maxPC";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  console.keyMap = "fr";

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
    xarchiver
    htop
  ];

  system.stateVersion = "24.05";
}