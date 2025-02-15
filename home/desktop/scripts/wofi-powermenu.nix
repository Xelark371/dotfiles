{
  home.file.".local/bin/powermenu.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash

      entries="Shutdown\nSuspend\nReboot\nLogout"

      selected=$(echo -e "$entries" | wofi -d -k /dev/null -p "Power Menu")

      case $selected in
        "Shutdown")
          systemctl poweroff
          ;;
        "Reboot")
          systemctl reboot
          ;;
        "Suspend")
          systemctl suspend
          ;;
        "Logout")
          hyprctl dispatch exit
          ;;
      esac
    '';
  };
}