{ config, lib, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./disk.nix
    ./display-manager.nix
    ./graphical.nix
    ./nix.nix
    ./printers.nix
    ./services.nix
    ./users.nix
  ];

  zramSwap.enable = true;

  services.automatic-timezoned.enable = true;
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "fr";

  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
  };

  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    htop
    xarchiver
  ];

  security.pam.loginLimits = [
    {
      domain = "*";       # Pour tous les utilisateurs
      item = "nproc";     # Nombre de processus
      type = "soft";      # Limite douce (avertissement/dépassable temporairement)
      value = "10000";
    }
    {
      domain = "*";
      item = "nproc";
      type = "hard";      # Limite dure (blocage net)
      value = "10000";
    }
  ];

  systemd.slices."user.slice" = {
    sliceConfig = {
      TasksMax = 10000; # Limite le nombre de tâches (processus + threads)
    };
  };

  systemd.settings.Manager = {
    DefaultTasksMax = 10000;
  };

  system.stateVersion = "24.05";
}
