{ pkgs, lib, inputs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "libsciter"
    "spotify"
    "vscode"
  ];

  home.packages = with pkgs; [
    blueman
    dconf
    devenv
    discord
    droidcam
    gcc
    gimp
    gnumake
    godot
    libreoffice
    mindustry
    moonlight-qt
    neofetch
    networkmanagerapplet
    obs-studio
    pcmanfm
    prismlauncher
    protonup-rs
    python3
    remmina
    simple-scan
    spotify
    tor-browser
    ungit
    viewnior
    virt-manager
    wl-clipboard

    inputs.hytale.packages.${pkgs.system}.hytale-launcher
  ];
}
