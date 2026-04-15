{ pkgs, ... }:

let
  wallpaper = ../../assets/wallpapers/image.png;
in
{
  services.awww.enable = true;

  systemd.user.services.awww.Service.ExecStartPost = "${pkgs.awww}/bin/awww img ${wallpaper} --resize crop --filter Lanczos3";
}
