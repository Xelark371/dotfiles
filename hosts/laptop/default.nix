{
  imports = [
    ./hardware-configuration.nix
    ./vpn.nix
  ];

  networking.hostName = "laptop";
}
