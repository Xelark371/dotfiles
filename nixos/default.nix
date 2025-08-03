{ config, lib, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./display-manager.nix
    ./graphical.nix
    ./hardware-configuration.nix
    ./nix.nix
    ./services.nix
    ./users.nix
  ];

  zramSwap.enable = true;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";

  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      ovmf.enable = true;
      swtpm.enable = true;
    };
  };

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

  environment.systemPackages = with pkgs; [
    brightnessctl
    home-manager
    htop
    xarchiver
  ];

  system.stateVersion = "24.05";
}
