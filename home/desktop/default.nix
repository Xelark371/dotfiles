{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprlock
    hypridle
    mako
    libnotify
    waybar
    wofi
    grimblast
  ];

  imports = [
    ./scripts
    ./hyprland.nix
    ./mako.nix
    ./theme.nix
    ./waybar.nix
    ./wofi.nix
  ];
}