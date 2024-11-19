{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./home-manager/home-manager.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "max-nix";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://cache-etu.univ-artois.fr:3128";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "fr_FR.UTF-8";

  console.keyMap = "fr";

  services.displayManager = {
    sddm.enable = true;
    sddm.wayland.enable = true;
    defaultSession = "hyprland";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
  #  (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  users.extraUsers.max = {
      isNormalUser = true;
      home = "/home/max";
      extraGroups = [ "wheel" "networkmanager" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    hyprland
    xdg-desktop-portal-hyprland
    wl-clipboard
    wofi
    waybar
    polkit
    swww
    dunst
    libnotify
    gcc

    alacritty
    firefox
    spotify
    vscode
    neofetch
    htop
    brightnessctl
    networkmanagerapplet
    pcmanfm
    libreoffice
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix).
  system.copySystemConfiguration = true;
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

