{ pkgs, config, ... }:
{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      efi.canTouchEfiVariables = true;
      timeout = 10;

      limine = {
        enable = true;
        maxGenerations = 5;
        secureBoot = {
          enable = true;
          autoGenerateKeys = true;
          autoEnrollKeys.enable = true;
        };

        extraEntries = ''
          /Windows
          protocol: efi
          path: uuid(d20469c6-8bc1-449c-861d-65e0fe0948ba):/EFI/Microsoft/Boot/bootmgfw.efi
        '';
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
