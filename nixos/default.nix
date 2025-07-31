{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    inputs.nix-index-database.nixosModules.nix-index

    ./audio.nix
    ./bootloader.nix
    ./display-manager.nix
    ./graphical.nix
    ./hardware-configuration.nix
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

  nix = {
    optimise.automatic = true;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2w";
    };
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    home-manager
    htop
    xarchiver
  ];

  programs = {
    nix-index-database.comma.enable = true;
  };

  system.stateVersion = "24.05";
}
