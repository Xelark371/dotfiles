{
  home-manager.users.max.services.hyprpaper = {
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