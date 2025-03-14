{
  users.users = {
    max = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };

  nix.settings.trusted-users = [
    "max"
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "max";
      };
    };
  };
}