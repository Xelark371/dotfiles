{ pkgs, ... }:
let
  status = command : ''
    [ $(${pkgs.playerctl}/bin/playerctl status 2>/dev/null) = "Playing" ] && : || ${command}
  '';
in
{
  home.packages = with pkgs; [
    playerctl
  ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "pidof hyprlock || hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on | brightnessctl -r";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = status "brightnessctl -s set 10"; 
          on-resume = "brightnessctl -r";
        }

        {
          timeout = 600;
          on-timeout = status "pidof hyprlock || hyprlock";
        }

        {
          timeout = 750;
          on-timeout = status "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }

        {
          timeout = 780;
          on-timeout = status "systemctl suspend";
        }
      ];
    };
  };
}