{ config, lib, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./disk.nix
    ./display-manager.nix
    ./graphical.nix
    ./hardware-configuration.nix
    ./nix.nix
    ./printers.nix
    ./services.nix
    ./users.nix
    ./vpn.nix
  ];

  zramSwap.enable = true;

  services.automatic-timezoned.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "fr";

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

  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    htop
    xarchiver
  ];

  system.stateVersion = "24.05";
}
