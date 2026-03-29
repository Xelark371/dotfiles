{ config, pkgs, ... }:

{
  systemd.user.services.gpu-replay = {
    Unit = {
      Description = "GPU Screen Recorder Replay Buffer";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = ''
        /run/current-system/sw/bin/gpu-screen-recorder \
          -w screen \
          -f 30 \
          -a 'rnnoise_source|default_output' \
          -r 70 \
          -c mp4 \
          -k av1 \
          -bm cbr \
          -q 1000 \
          -o ${config.xdg.userDirs.extraConfig.CLIPS}
      '';
      Restart = "on-failure";
      RestartSec = "3s";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
