{ pkgs, lib, inputs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "discord-unwrapped"
    "libsciter"
    "spotify"
    "steam"
    "steam-unwrapped"
    "vscode"
  ];

  home.packages = with pkgs; [
    blueman
    brave
    celluloid
    dbeaver-bin
    dconf
    devenv
    discord
    droidcam
    fastfetch
    firefox
    gcc
    gimp
    gnumake
    godot
    kdePackages.kdenlive
    losslesscut-bin
    libreoffice
    mindustry
    moonlight-qt
    networkmanagerapplet
    pcmanfm
    prismlauncher
    protonup-rs
    python3
    remmina
    ryubing
    simple-scan
    spotify
    tor-browser
    ungit
    viewnior
    virt-manager
    wl-clipboard
  ];
}
