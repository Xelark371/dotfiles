{ pkgs, ... }:

{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof swaylock || swaylock";
        before_sleep_cmd = "pidof swaylock || swaylock";
        after_sleep_cmd = "hyprctl dispatch dpms on | brightnessctl -r";
      };

      listener = [
        {
          timeout = 600;
          on-timeout = "${pkgs.brightnessctl}/bin/brightnessctl -s set 0%";
          on-resume = "${pkgs.brightnessctl}/bin/brightnessctl -r";
        }

        {
          timeout = 900;
          on-timeout = "pidof swaylock || swaylock";
        }

        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on; sunsetr -r";
        }

        {
          timeout = 1230;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
