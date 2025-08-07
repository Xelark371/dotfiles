{
  services = {
    printing = {
      enable = true;
      browsing = true;
      defaultShared = true;
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  hardware.sane = {
    enable = true;
  };
}
