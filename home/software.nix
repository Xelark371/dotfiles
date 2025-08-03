{ pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "discord"
    "spotify"
    "steam"
    "steam-unwrapped"
    "vscode"
  ];

  home.packages = with pkgs; [
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
    neofetch
    networkmanagerapplet
    obs-studio
    pcmanfm
    prismlauncher
    python3
    remmina
    simple-scan
    spotify
    steam
    tor-browser
    ungit
    viewnior
    virt-manager
    wl-clipboard
  ];
}
