{ pkgs, ... }:

let
  wallpaper = ../../assets/wallpapers/image.png;
in
{
  services.swww.enable = true;

  systemd.user.services.swww-setup = {
    Unit = {
      Description = "Apply wallpaper";
      Requires = [ "swww.service" ];
      After = [ "swww.service" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.swww}/bin/swww img ${wallpaper} --resize crop --filter Lanczos3";
      Restart = "on-failure";
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };
}
