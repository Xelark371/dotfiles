{ config, ... }:
{
  home.file.".local/bin/network-menu.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      show_networks() {
        nmcli -f SSID,SECURITY dev wifi | tail -n +2 | wofi -d -p "Select Network"
      }

      connect_network() {
        network="$1"
        password=$(echo "" | wofi -d -p "Password for $network" -P)
        nmcli dev wifi connect "$network" password "$password"
      }

      main_menu() {
        choice=$(echo -e "Available Networks\nConnect to Network" | wofi -d -p "Network Options")
        
        case "$choice" in
          "Available Networks")
            selected_network=$(show_networks)
            ;;
          "Connect to Network")
            selected_network=$(show_networks)
            if [ -n "$selected_network" ]; then
              connect_network "$selected_network"
            fi
            ;;
        esac
      }

      main_menu
    '';
  };
}