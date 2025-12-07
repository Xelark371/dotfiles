{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";

  services.sunshine = {
    enable = true;
    capSysAdmin = true;
    openFirewall = true;
  };
}
