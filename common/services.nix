{ pkgs, ... }:
{
  security = {
    polkit.enable = true;
    rtkit.enable = true;
    wrappers.gsr-kms-server = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+ep";
      source = "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server";
    };
  };

  services = {
    xserver.videoDrivers = ["amdgpu"];
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

    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };

    logind.settings.Login.HandlePowerKey = "ignore";
  };
}
