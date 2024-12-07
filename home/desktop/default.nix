{ pkgs, ... }:
{
  home.packages = with pkgs; [
      hyprlock
      hypridle
      mako
      libnotify
    ];

  imports = [
    ./hyprland.nix
    ./mako.nix
    ./waybar.nix
    ./wofi.nix
  ];
}