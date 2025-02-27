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

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };

    gc = {
      automatic = true;
      dates = "monthly";
      options = "--delete-older-than 30d";
    };
  };

  environment.systemPackages = with pkgs; [
    hyprland
    pamixer
    brightnessctl
    xarchiver
    nodejs_22
    python3
    xdg-desktop-portal-hyprland
    polkit
    gcc
    jdk11
    gimp
    zlib
    devenv

    alacritty
    firefox
    neofetch
    vscode
    discord
    spotify
    htop
    brightnessctl
    networkmanagerapplet
    pcmanfm
    libreoffice
    prismlauncher
    steam
  ];

  system.stateVersion = "24.05";
}