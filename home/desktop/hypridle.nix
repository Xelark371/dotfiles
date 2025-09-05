{ pkgs, ... }:
let
  status = command : ''
    ${pkgs.playerctl}/bin/playerctl -a status | grep -q "Playing" || ${command}
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
          timeout = 600;
          on-timeout = status "brightnessctl -s set 0%";
          on-resume = "brightnessctl -r";
        }

        {
          timeout = 900;
          on-timeout = status "pidof hyprlock || hyprlock";
        }

        {
          timeout = 1200;
          on-timeout = status "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on; sunsetr -r";
        }

        {
          timeout = 1230;
          on-timeout = status "systemctl suspend";
        }
      ];
    };
  };
}
