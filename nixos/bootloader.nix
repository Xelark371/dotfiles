{ pkgs, config, ... }:
{
  environment.systemPackages = [ pkgs.catppuccin-grub ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        devices = [ "nodev" ];
        configurationLimit = 10;

        theme = "${pkgs.catppuccin-grub}/grub/themes/catppuccin-mocha-grub-theme";
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
