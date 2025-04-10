{ pkgs, ... }:
{
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  services = {
    logind.powerKey = "ignore";

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        epson-escpr
      ];
      browsing = true;
      defaultShared = true;
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.epson-escpr ];
  };
}
