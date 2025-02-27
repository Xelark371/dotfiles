{
  users.users.max = {
    isNormalUser = true;
    home = "/home/max";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "max";
      };
    };
  };

  programs.hyprland.enable = true;
}