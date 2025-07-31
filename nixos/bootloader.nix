{ pkgs, config, ... }:
{
  environment.systemPackages = [ pkgs.catppuccin-grub ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = null;

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        devices = [ "nodev" ];
        configurationLimit = 10;
      };
    };

    extraModulePackages = [
      config.boot.kernelPackages.v4l2loopback
    ];

    kernelModules = [
      "v4l2loopback"
    ];
  };
}
