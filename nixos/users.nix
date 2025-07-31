{
  users.users = {
    max = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "libvirtd"
      ];
    };
  };

  nix.settings.trusted-users = [
    "max"
  ];
}
