{ config, lib, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./disk.nix
    ./display-manager.nix
    ./graphical.nix
    ./nix.nix
    ./printers.nix
    ./services.nix
    ./users.nix
  ];

  zramSwap = {
    enable = true;
  };

  services.automatic-timezoned.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "fr";

  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  networking = {
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
