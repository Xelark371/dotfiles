{
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  services = {
    sunshine.enable = true;

    earlyoom.enable = true;
    fwupd.enable = true;

    gvfs.enable = true;
    udisks2.enable = true;

    tlp = {
      enable = true;

      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      };
    };

    logind.settings.Login.HandlePowerKey = "ignore";
  };
}
