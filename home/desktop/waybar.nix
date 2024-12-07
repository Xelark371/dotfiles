{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "custom/spotify" "clock" ];
      modules-right = [ "backlight" "wireplumber" "battery" "network" ];

      "hyprland/workspaces" = {
        format = "{name}";
        on-click = "activate";
      };

      "clock" = {
        format = "{:%H:%M}";
        tooltip-format = "{:%Y-%m-%d}";
      };

      "custom/spotify" = {
        format = "{icon} {}";
        format-icons = {
          "Playing" = "▶️";
          "Paused" = "⏸️";
        };
        max-length = 40;
        exec = "playerctl -p spotify metadata --format '{{status}} {{artist}} - {{title}}' -F";
        on-click = "playerctl -p spotify play-pause";
      };

      "backlight" = {
        format = "{percent}% {icon}";
        format-icons = ["○" "◐" "●"];
      };

      "wireplumber" = {
        format = "{volume}% {icon}";
        format-muted = "{volume} ✖";
        format-icons = ["○" "◔" "◑" "◕" "●"];
        on-click = "pavucontrol";
      };

      "battery" = {
        states = {
          good = 80;
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% ⚡";
        format-icons = ["▯" "▰" "▱"];
      };

      "network" = {
        format-wifi = "{essid} ◎";
        format-ethernet = "◉";
        format-disconnected = "◌";
      };
    }];

    style = ''
      * {
        font-size: 12px;
        background-color: black;
        color: white;
      }
    '';
  };
}