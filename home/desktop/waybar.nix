{ config, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      height = 24;
      margin = "4px 4px 0px 4px";
      layer = "bottom";
      position = "top";

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "network" "backlight" "wireplumber" "battery" ];
      spacing = 10;

      "hyprland/workspaces" = {
        format = "{}";
        on-click = "activate";
        persistent-workspaces = {
          "*" = 10;
        };
      };

      "clock" = {
        format = "{:%H:%M}";
        tooltip-format = "{:%d-%m-%Y}";
      };

      "backlight" = {
        format = "{percent}% {icon}";
        format-icons = ["󰛩" "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
        tooltip = false;
      };

      "wireplumber" = {
        format = "{volume}% {icon}";
        format-muted = "{volume}% ✖";
        format-icons = ["○" "◔" "◑" "◕" "●"];
        tooltip = false;
      };

      "battery" = {
        states = {
          good = 80;
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% {icon}";
        format-icons = {
          charging = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
        };
        interval = 5;
      };

      "network" = {
        format-wifi = "{essid} {icon}";
        format-ethernet = "{essid} 󰈀";
        format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        tooltip = false;
      };
    }];

    style = ''
      * {
        all: unset;
      }

      .module {
        background-color:rgb(45, 45, 45);
        border-radius: 10px;
        padding: 0 10px;
      }

      window.eDP-1 * {
        font-size: 14px;
      }

      #workspaces button {
        border-radius: 5px;
        padding: 0 5px;
      }

      #workspaces button:not(.empty) {
        color: white;
        background-color: black
      }

      #workspaces button.active {
        color: black;
        background-color: white
      }
    '';
  };
}
