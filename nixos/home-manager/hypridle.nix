{ pkgs, ... }:
{
  home-manager.users.max = {

    home.packages = with pkgs; [
      playerctl
    ];

    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on | brightnessctl -r";
        };

        listener = [
          {
            timeout = 300;
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
          }

          {
            timeout = 600;
            on-timeout = "loginctl lock-session";
          }

          {
            timeout = 750;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }

          {
            timeout = 780;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}