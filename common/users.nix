{
  users.users = {
    max = {
      isNormalUser = true;
      extraGroups = [
        "docker"
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
