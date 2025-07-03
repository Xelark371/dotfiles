{ config, ... }:
{
  programs.waybar = {
    enable = true;
    settings = [{
      height = 30;
      layer = "top";
      position = "top";

      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "network" "backlight" "wireplumber" "battery" ];
      spacing = 15;

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
        on-click = "${config.home.homeDirectory}/.local/bin/network-menu.sh";
        tooltip = false;
      };
    }];

    style = ''
      * {
        all: unset;
      }

      #waybar {
        background-color:rgb(45, 45, 45);
      }

      window.eDP-1 * {
        font-size: 14px;
      }

      .modules-right {
        margin-right: 10px;
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
