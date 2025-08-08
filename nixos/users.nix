{
  users.users = {
    max = {
      isNormalUser = true;
      extraGroups = [
        "libvirtd"
        "networkmanager"
        "wheel"
      ];
    };
  };

  nix.settings.trusted-users = [
    "max"
  ];
}
