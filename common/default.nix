{ config, lib, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./disk.nix
    ./display-manager.nix
    ./graphical.nix
    ./network.nix
    ./nix.nix
    ./printers.nix
    ./services.nix
    ./users.nix
  ];

  zramSwap.enable = true;

  services.automatic-timezoned.enable = true;
  i18n.defaultLocale = "fr_FR.UTF-8";
  console.keyMap = "fr";

  virtualisation = {
    docker.enable = true;

    libvirtd = {
      enable = true;

      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };

  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
  ];

  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    config.programs.gpu-screen-recorder.package
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
