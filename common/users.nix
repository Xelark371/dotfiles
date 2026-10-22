{ pkgs, ... }:

{
  users.users = {
    max = {
      password = "issouissou";
      isNormalUser = true;
      extraGroups = [
        "docker"
        "input"
        "libvirtd"
        "networkmanager"
        "uinput"
        "kvm"
        "wheel"
      ];
    };
  };

  nix.settings.trusted-users = [
    "max"
  ];
}
