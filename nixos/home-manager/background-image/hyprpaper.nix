{ pkgs, ... }:
{
  home-manager.users.max.services.hyprpaper = {
    package = pkgs.hyprpaper;
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        "${./image.jpeg}"
      ];

      wallpaper = [
        "eDP-1, ${./image.jpeg}"
      ];
    };
  };
}