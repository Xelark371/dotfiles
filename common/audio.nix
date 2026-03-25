{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ rnnoise-plugin ];

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
    jack.enable = true;

    extraConfig.pipewire."99-input-denoising" = {
      "context.modules" = [
        {
          name = "libpipewire-module-filter-chain";
          args = {
            "node.description" = "Noise cancelling";
            "media.name" = "Noise cancelling";
            "filter.graph" = {
              nodes = [
                {
                  type = "ladspa";
                  name = "rnnoise";
                  plugin = "${pkgs.rnnoise-plugin}/lib/ladspa/librnnoise_ladspa.so";
                  label = "noise_suppressor_mono";
                  control = {
                    "VAD Threshold (%)" = 90.0;
                    "VAD Grace Period (ms)" = 200.0;
                    "Retroactive VAD Grace (ms)" = 100.0;
                    "Wet Signal Level (dB)" = 0.0;
                  };
                }
              ];
            };
            "capture.props" = {
              "node.name" = "effect_input.rnnoise";
              "node.passive" = true;
              "audio.rate" = 48000;
              "audio.channels" = 1;
              "audio.position" = [ "MONO" ];
            };
            "playback.props" = {
              "node.name" = "rnnoise_source";
              "node.description" = "Noise cancelling";
              "media.class" = "Audio/Source";
              "audio.rate" = 48000;
              "audio.channels" = 1;
              "audio.position" = [ "MONO" ];
            };
          };
        }
      ];
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
