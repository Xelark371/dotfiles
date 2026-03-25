{
  networking = {
    networkmanager = {
      enable = true;
      wifi = {
        backend = "iwd";
        powersave = true;
      };
    };
    wireless.iwd.enable = true;
  };
}
