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
    gcc
    gimp
    libreoffice
    neofetch
    networkmanagerapplet
    pcmanfm
    prismlauncher
    python3
    steam

    libsForQt5.qtstyleplugin-kvantum
    qt5.qtbase
    libsForQt5.qt5ct
    vimix-gtk-themes
  ];
}