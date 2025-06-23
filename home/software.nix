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
    pcmanfm
    prismlauncher
    python3
    remmina
    spotify
    steam
    tor-browser
    ungit
    wl-clipboard
  ];
}
