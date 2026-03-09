{ pkgs, config, ... }:
{
  environment.systemPackages = [ pkgs.catppuccin-grub ];

  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 10;

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
      config.boot.kernelPackages.hid-tmff2
      config.boot.kernelPackages.v4l2loopback
    ];

    kernelModules = [
      "hid-tmff2"
      "kvm-amd"
      "uinput"
      "v4l2loopback"
    ];

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
