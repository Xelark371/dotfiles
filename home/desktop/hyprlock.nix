{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disbable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = false;
        grace = 0;
      };

      input-field = {
        hide_input = true;
        fade_on_empty = false;
        outer_color = "rgba(50, 50, 50, 1.0)";
        position = "0, -225";
        size = "500, 50";
      };

      background = {
        path = "${./image.jpeg}";
        color = "rgba(0, 0, 0, 1.0)";
        blur_passes = 3;
        blur_size = 6;
      };

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(255, 255, 255, 1.0)";
          font_size = 85;
          position = "0, 350";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = "$USER";
          color = "rgba(255, 255, 255, 1.0)";
          font_size = 25;
          position = "0, -140";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
