{ pkgs, ... }:

{
  home-manager.users.max = {

    wayland.windowManager.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      systemd.enable = true;
      xwayland.enable = true;

      settings = {
        
        general = {
          border_size = 0;
          no_border_on_floating = true;
          gaps_in = 1;
          gaps_out = 0;
          resize_on_border = true;
          extend_border_grab_area = 15; #used when resize_on_border is set to true (15 by default)
          hover_icon_on_border = true; #used when resize_on_border is set to true (true by default)
          allow_tearing = true;

        };

        decoration = {
          dim_inactive = true;
          dim_strength = 0.15;
          blur = {
            enabled = true;
            size = 4;
            passes = 3;
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
        "$menu" = "wofi -S drun -I";
        bind =
        [
          "$mod, E, exec, $filemanager"
          "$mod, Q, exec, $terminal"
          "$mod, C, killactive,"
          "$mod, D, exec, $menu"
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

        monitor = ",1920x1080@60, 0x0, 1";

      };
    };
  };
}