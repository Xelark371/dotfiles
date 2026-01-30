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
    dconf
    devenv
    discord
    droidcam
    gcc
    gimp
    gnumake
    godot
    libreoffice
    lutris
    mindustry
    moonlight-qt
    neofetch
    networkmanagerapplet
    obs-studio
    pcmanfm
    prismlauncher
    python3
    remmina
    rustdesk
    simple-scan
    spotify
    steam
    tor-browser
    ungit
    viewnior
    virt-manager
    wl-clipboard

    inputs.hytale.packages.${pkgs.system}.hytale-launcher
  ];
}
