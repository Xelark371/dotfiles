{
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  services = {
    earlyoom.enable = true;
    fwupd.enable = true;

    gvfs.enable = true;
    udisks2.enable = true;

    logind.powerKey = "ignore";

    tlp = {
      enable = true;

      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      };
    };

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
