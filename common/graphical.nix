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

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    config = {
      common.default = [ "hyprland" ];
      hyprland.default = [ "hyprland" ];
    };
  };
}
