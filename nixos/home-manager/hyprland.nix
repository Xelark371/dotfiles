{ pkgs, ... }:
{
  home-manager.users.max = {
    
    home.packages = with pkgs; [
      hyprlock
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      systemd.enable = true; # set to false for uwsm compatibility at the 24.11 version
      xwayland.enable = true;

      settings = {

        exec-once = [
          "waybar"
          "hyprpaper"
        ];

        general = {
          border_size = 0;
          no_border_on_floating = true;
          gaps_in = 1;
          gaps_out = 0;
          resize_on_border = true;
          extend_border_grab_area = 15; # used when resize_on_border is set to true (15 by default)
          hover_icon_on_border = true; # used when resize_on_border is set to true (true by default)
          allow_tearing = true;

        };

        decoration = {
          dim_inactive = true;
          dim_strength = 0.2;
          blur = {
            enabled = true;
            size = 4;
            passes = 4;
          };
        };

        input = {
          kb_layout = "fr";
          numlock_by_default = true;
          scroll_method = "2fg";

          touchpad = {
            disable_while_typing = true;
            natural_scroll = true;
          };

        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };
        
        "$mod" = "SUPER";
        "$terminal" = "alacritty";
        "$filemanager" = "pcmanfm";
        "$menu" = "wofi";

        bind =
        [
          "$mod, E, exec, $filemanager"
          "$mod, Q, exec, $terminal"
          "$mod, D, exec, $menu"
          "$mod, C, killactive,"
          "$mod, M, exit,"
          "$mod, V, togglefloating,"
          
          ", XF86AudioRaiseVolume, exec, pamixer -i 5"
          ", XF86AudioLowerVolume, exec, pamixer -d 5"
          ", XF86AudioMute, exec, pamixer -t"
          ", XF86AudioMicMute, exec, pamixer --default-source -t"

          ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
          ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ]
        ++ (
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          10)
        );

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        monitor = "eDP-1,1920x1080@60, 0x0, 1.25";
      };
    };
  };
}