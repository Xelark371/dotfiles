{ pkgs, ... }:
{
  security = {
    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (action.id == "org.freedesktop.policykit.exec" &&
              action.lookup("program") == "/run/current-system/sw/bin/gsr-kms-server" &&
              subject.user == "max") {
            return polkit.Result.YES;
          }
        });
      '';
    };
    rtkit.enable = true;
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
