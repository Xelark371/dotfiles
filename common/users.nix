{
  users.users = {
    max = {
      isNormalUser = true;
      extraGroups = [
        "input"
        "libvirtd"
        "networkmanager"
        "uinput"
        "wheel"
      ];
    };
  };

  nix.settings.trusted-users = [
    "max"
  ];
}
