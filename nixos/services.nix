{
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  services = {
    gvfs.enable = true;
    udisks2.enable = true;
    logind.powerKey = "ignore";

    printing = {
      enable = true;
      browsing = true;
      defaultShared = true;
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };

  hardware.sane = {
    enable = true;
  };
}
