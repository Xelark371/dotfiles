{ pkgs, ... }:

let
  wallpaper = ../../assets/wallpapers/image.png;
in
{
  services.swww.enable = true;

  systemd.user.services.swww.Service.ExecStartPost = "${pkgs.swww}/bin/swww img ${wallpaper} --resize crop --filter Lanczos3";
}
