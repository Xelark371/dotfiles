{ pkgs, config, ... }:
{
  imports = [
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
  ];

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {

      exec-once = [
        "hyprpaper"
        "hypridle"
        "waybar"
      ];

      general = {
        border_size = 0;
        no_border_on_floating = true;
        gaps_in = 0;
        gaps_out = 0;
        resize_on_border = true;
        extend_border_grab_area = 15; # used when resize_on_border is set to true (15 by default)
        hover_icon_on_border = true; # used when resize_on_border is set to true (true by default)
        allow_tearing = true;
      };

      decoration = {
        rounding = 0;
        dim_inactive = true;
        dim_strength = 0.2;
        blur = {
          enabled = false;
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

      xwayland.force_zero_scaling = true;

      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$filemanager" = "pcmanfm";
      "$musicplayer" = "spotify";
      "$menu" = "pidof wofi || wofi";

      bind = [
        "$mod, E, exec, $filemanager"
        "$mod, Q, exec, $terminal"
        "$mod, D, exec, $menu"
        "$mod, C, killactive,"
        "$mod, L, exec, hyprlock"
        "$mod, V, togglefloating,"

        "$mod, Print, exec, grimblast copy output"
        "SHIFT, Print, exec, grimblast copy area"

        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"

        ", XF86AudioStop, exec, playerctl -p $musicplayer stop"
        ", XF86AudioPrev, exec, playerctl -p $musicplayer previous"
        ", XF86AudioPlay, exec, playerctl -p $musicplayer play-pause"
        ", XF86AudioNext, exec, playerctl -p $musicplayer next"

        ", XF86PowerOff, exec, pidof wofi || ${config.home.homeDirectory}/.local/bin/powermenu.sh"
      ]
      ++ (
        builtins.concatLists (builtins.genList (i:
          let ws = i + 1;
          in [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
            "$mod CTRL, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        )
        10)
      );

      binde = [
        ", XF86AudioRaiseVolume, exec, pamixer -i 1"
        ", XF86AudioLowerVolume, exec, pamixer -d 1"
      ];

      bindel = [
        ", XF86MonBrightnessUp, exec, brightnessctl set +1%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 1%-"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      monitor = [
        "eDP-1, highres, auto, 1.25"
        ", highrr, auto, auto"
      ];

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };
    };
  };
}
