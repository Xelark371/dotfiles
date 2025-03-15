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
    easyeffects
    gcc
    gimp
    gnumake
    libreoffice
    lutris
    neofetch
    networkmanagerapplet
    pcmanfm
    prismlauncher
    python3
    spotify
    steam
    ungit
  ];
}