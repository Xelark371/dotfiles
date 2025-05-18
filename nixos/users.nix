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
}
