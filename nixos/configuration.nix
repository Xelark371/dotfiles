{ config, lib, pkgs, ... }:
{
  imports = [
      ./hardware-configuration.nix
      ./home-manager/home.nix
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

  networking = {
    hostName = "maxPC";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
  };

  time.timeZone = "Europe/Paris";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://cache-etu.univ-artois.fr:3128";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n.defaultLocale = "fr_FR.UTF-8";

  console.keyMap = "fr";

  #services.displayManager = {
  #  sddm.enable = true;
  #  sddm.wayland.enable = true;
  #  defaultSession = "hyprland";
  #};

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "max";
      };
    };
  };

  programs.hyprland.enable = true;

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    font-awesome
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
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    hyprland
    pamixer
    brightnessctl
    xarchiver
    nodejs_22
    python3
    xdg-desktop-portal-hyprland
    wl-clipboard
    wofi
    waybar
    polkit
    dunst
    gcc

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
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";

  };

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

