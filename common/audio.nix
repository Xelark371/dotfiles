{ ... }:

{
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;

    extraConfig.pipewire."10-clock-settings" = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.quantum" = 128;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 2048;
        "default.clock.allowed-rates" = [ 44100 48000 88200 96000 ];
      };
    };

    extraConfig.pipewire."99-input-masking" = {
      "context.modules" = [
        {
          name = "libpipewire-module-loopback";
          args = {
            "node.description" = "Audio-Global";
            "capture.props" = {
              "node.name" = "audio_global_sink";
              "media.class" = "Audio/Sink";
              "audio.position" = [ "FL" "FR" ];
            };
            "playback.props" = {
              "node.name" = "playback.audio_global_sink";
              "node.passive" = true;
            };
          };
        }
      ];
    };

  };
}
