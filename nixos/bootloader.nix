{ pkgs, config, ... }:
{
  environment.systemPackages = [ pkgs.catppuccin-grub ];

  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = null;

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        devices = [ "nodev" ];
        configurationLimit = 5;
      };
    };

    extraModprobeConfig = ''
      options ideapad_laptop no_bt_rfkill=1
    '';

    extraModulePackages = [
      config.boot.kernelPackages.v4l2loopback
    ];

    kernelModules = [
      "kvm-amd"
      "v4l2loopback"
    ];
  };
}
