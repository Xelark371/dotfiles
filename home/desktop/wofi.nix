{
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 600;
      height = 400;
      always_parse_args = true;
      allow_images = true;
      show_all = false;
      print_command = true;
      insensitive = true;
      prompt = "Applications";
    };
  };
}