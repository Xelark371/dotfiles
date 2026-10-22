{ config, lib, pkgs, ... }:
{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./disk.nix
    ./display-manager.nix
    ./graphical.nix
    ./hermes-agent.nix
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
      domain = "*";
      item = "nproc";
      type = "soft";
      value = "10000";
    }
    {
      domain = "*";
      item = "nproc";
      type = "hard";
      value = "10000";
    }
  ];

  systemd.slices."user.slice" = {
    sliceConfig = {
      TasksMax = 10000;
    };
  };

  systemd.settings.Manager = {
    DefaultTasksMax = 10000;
  };

  system.stateVersion = "24.05";
}
