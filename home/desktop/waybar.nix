{ config, ... }:
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "network" "backlight" "wireplumber" "battery" ];
      spacing = 15;

      "hyprland/workspaces" = {
        format = "{}";
        on-click = "activate";
        sort-by-number = true;
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
        on-click = "${config.home.homeDirectory}/.local/bin/network-menu.sh";
        tooltip = false;
      };
    }];

    style = ''
      .modules-right {
        margin-right: 10px;
      }

      #workspace button {
        border-radius: 50px;
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
