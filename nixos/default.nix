{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-index-database.nixosModules.nix-index

    ./bootloader.nix
    ./display-manager.nix
    ./graphical.nix
    ./hardware-configuration.nix
    ./services.nix
    ./users.nix
  ];

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
    home-manager
  ];

  programs = {
    nix-index-database.comma.enable = true;
  };

  system.stateVersion = "24.05";
}
