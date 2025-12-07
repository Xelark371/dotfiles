{
  imports = [
    ./hardware-configuration.nix
  ];

  networking = {
    hostName = "desktop";
    interfaces.enp6s0.wakeOnLan.enable = true;
    firewall.allowedUDPPorts = [ 9 ];
  };

  services = {
    sunshine = {
      enable = true;
      capSysAdmin = true;
      openFirewall = true;

      applications.apps = [
        {
          name = "Steam BP";
          cmd = "steam steam://open/bigpicture";
          image-path = "steam.png";
        }
      ];
    };

    udev.extraRules = ''
      KERNEL=="uinput", SUBSYSTEM=="misc", TAG+="uaccess", OPTIONS+="static_node=uinput", GROUP="input", MODE="0660"
    '';
  };
}
