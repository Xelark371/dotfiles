{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    phinger-cursors
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.ubuntu
  ];

  programs.hyprland.enable = true;
}
