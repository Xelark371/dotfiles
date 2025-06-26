{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "pixel_sakura";
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;

    package = pkgs.kdePackages.sddm;

    extraPackages = [
      pkgs.sddm-astronaut
    ];

    theme = "sddm-astronaut-theme";

    settings = {
      Theme = {
        CursorTheme = "phinger-cursors-dark";
        CursorSize = 24;
      };
    };
  };
}
