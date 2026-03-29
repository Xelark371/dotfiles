{ pkgs, lib, inputs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "libsciter"
    "spotify"
    "steam"
    "steam-unwrapped"
    "vscode"
  ];

  home.packages = with pkgs; [
    blueman
    celluloid
    dconf
    devenv
    discord
    droidcam
    fastfetch
    gcc
    gimp
    gnumake
    godot
    kdePackages.kdenlive
    losslesscut-bin
    libreoffice
    lutris
    mindustry
    moonlight-qt
    networkmanagerapplet
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
