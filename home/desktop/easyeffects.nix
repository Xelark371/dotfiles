{ ... }:

let
  mkBand = { frequency, gain, type, q ? 4.36, mute ? false }: {
    inherit frequency gain type mute;
    mode = "RLC (BT)";
    q = q;
    slope = "x1";
    solo = false;
    width = 4.0;
  };

  # Mic preset : gate → rnnoise → multiband compressor → EQ → limiter
  microPreset = {
    input = {
      blocklist = [];

      "gate#0" = {
        attack = 30.0;
        bypass = false;
        curve-threshold = -30.0;
        curve-zone = -6.0;
        dry = -80.01;
        hpf-frequency = 10.0;
        hpf-mode = "Off";
        hysteresis = false;
        hysteresis-threshold = -12.0;
        hysteresis-zone = -6.0;
        input-gain = 0.0;
        input-to-link = -80.01;
        input-to-sidechain = -80.01;
        link-to-input = -80.01;
        link-to-sidechain = -80.01;
        lpf-frequency = 20000.0;
        lpf-mode = "Off";
        makeup = 0.0;
        output-gain = 0.0;
        reduction = -24.0;
        release = 300.0;
        sidechain = {
          lookahead = 0.0;
          mode = "Peak";
          preamp = 0.0;
          reactivity = 10.0;
          source = "Middle";
          stereo-split-source = "Left/Right";
          type = "Internal";
        };
        sidechain-to-input = -80.01;
        sidechain-to-link = -80.01;
        stereo-split = false;
        wet = 0.0;
      };

      "rnnoise#0" = {
        bypass = false;
        enable-vad = false;
        input-gain = 0.0;
        model-name = "\"\"";
        output-gain = 0.0;
        release = 20.0;
        use-standard-model = true;
        vad-thres = 50.0;
        wet = 0.0;
      };

      "multiband_compressor#0" = {
        bypass = false;
        compressor-mode = "Modern";
        dry = -80.01;
        envelope-boost = "None";
        input-gain = 0.0;
        input-to-link = -80.01;
        input-to-sidechain = -80.01;
        link-to-input = -80.01;
        link-to-sidechain = -80.01;
        output-gain = 0.0;
        sidechain-to-input = -80.01;
        sidechain-to-link = -80.01;
        stereo-split = false;
        wet = 0.0;
        band0 = { attack-threshold = -12.0; attack-time = 20.0; boost-amount = 6.0; boost-threshold = -72.0; compression-mode = "Downward"; compressor-enable = true; enable-band = true;  knee = -6.0; makeup = 0.0; mute = false; ratio = 1.0; release-threshold = -80.01; release-time = 100.0; sidechain-custom-highcut-filter = false; sidechain-custom-lowcut-filter = false; sidechain-highcut-frequency = 500.0;   sidechain-lookahead = 0.0; sidechain-lowcut-frequency = 200.0;  sidechain-mode = "RMS"; sidechain-preamp = 0.0; sidechain-reactivity = 10.0; sidechain-source = "Middle"; sidechain-type = "Internal"; solo = false; split-frequency = 250.0;   stereo-split-source = "Left/Right"; };
        band1 = { attack-threshold = -12.0; attack-time = 20.0; boost-amount = 6.0; boost-threshold = -72.0; compression-mode = "Downward"; compressor-enable = true; enable-band = true;  knee = -6.0; makeup = 0.0; mute = false; ratio = 1.0; release-threshold = -80.01; release-time = 100.0; sidechain-custom-highcut-filter = false; sidechain-custom-lowcut-filter = false; sidechain-highcut-frequency = 1000.0;  sidechain-lookahead = 0.0; sidechain-lowcut-frequency = 500.0;  sidechain-mode = "RMS"; sidechain-preamp = 0.0; sidechain-reactivity = 10.0; sidechain-source = "Middle"; sidechain-type = "Internal"; solo = false; split-frequency = 500.0;   stereo-split-source = "Left/Right"; };
        band2 = { attack-threshold = -12.0; attack-time = 20.0; boost-amount = 6.0; boost-threshold = -72.0; compression-mode = "Downward"; compressor-enable = true; enable-band = true;  knee = -6.0; makeup = 0.0; mute = false; ratio = 1.0; release-threshold = -80.01; release-time = 100.0; sidechain-custom-highcut-filter = false; sidechain-custom-lowcut-filter = false; sidechain-highcut-frequency = 2000.0;  sidechain-lookahead = 0.0; sidechain-lowcut-frequency = 1000.0; sidechain-mode = "RMS"; sidechain-preamp = 0.0; sidechain-reactivity = 10.0; sidechain-source = "Middle"; sidechain-type = "Internal"; solo = false; split-frequency = 1000.0;  stereo-split-source = "Left/Right"; };
        band3 = { attack-threshold = -12.0; attack-time = 20.0; boost-amount = 6.0; boost-threshold = -72.0; compression-mode = "Downward"; compressor-enable = true; enable-band = true;  knee = -6.0; makeup = 0.0; mute = false; ratio = 1.0; release-threshold = -80.01; release-time = 100.0; sidechain-custom-highcut-filter = false; sidechain-custom-lowcut-filter = false; sidechain-highcut-frequency = 4000.0;  sidechain-lookahead = 0.0; sidechain-lowcut-frequency = 2000.0; sidechain-mode = "RMS"; sidechain-preamp = 0.0; sidechain-reactivity = 10.0; sidechain-source = "Middle"; sidechain-type = "Internal"; solo = false; split-frequency = 2000.0;  stereo-split-source = "Left/Right"; };
        band4 = { attack-threshold = -12.0; attack-time = 20.0; boost-amount = 6.0; boost-threshold = -72.0; compression-mode = "Downward"; compressor-enable = true; enable-band = false; knee = -6.0; makeup = 0.0; mute = false; ratio = 1.0; release-threshold = -80.01; release-time = 100.0; sidechain-custom-highcut-filter = false; sidechain-custom-lowcut-filter = false; sidechain-highcut-frequency = 8000.0;  sidechain-lookahead = 0.0; sidechain-lowcut-frequency = 4000.0; sidechain-mode = "RMS"; sidechain-preamp = 0.0; sidechain-reactivity = 10.0; sidechain-source = "Middle"; sidechain-type = "Internal"; solo = false; split-frequency = 4000.0;  stereo-split-source = "Left/Right"; };
        band5 = { attack-threshold = -12.0; attack-time = 20.0; boost-amount = 6.0; boost-threshold = -72.0; compression-mode = "Downward"; compressor-enable = true; enable-band = false; knee = -6.0; makeup = 0.0; mute = false; ratio = 1.0; release-threshold = -80.01; release-time = 100.0; sidechain-custom-highcut-filter = false; sidechain-custom-lowcut-filter = false; sidechain-highcut-frequency = 12000.0; sidechain-lookahead = 0.0; sidechain-lowcut-frequency = 8000.0;  sidechain-mode = "RMS"; sidechain-preamp = 0.0; sidechain-reactivity = 10.0; sidechain-source = "Middle"; sidechain-type = "Internal"; solo = false; split-frequency = 8000.0;  stereo-split-source = "Left/Right"; };
        band6 = { attack-threshold = -12.0; attack-time = 20.0; boost-amount = 6.0; boost-threshold = -72.0; compression-mode = "Downward"; compressor-enable = true; enable-band = false; knee = -6.0; makeup = 0.0; mute = false; ratio = 1.0; release-threshold = -80.01; release-time = 100.0; sidechain-custom-highcut-filter = false; sidechain-custom-lowcut-filter = false; sidechain-highcut-frequency = 16000.0; sidechain-lookahead = 0.0; sidechain-lowcut-frequency = 12000.0; sidechain-mode = "RMS"; sidechain-preamp = 0.0; sidechain-reactivity = 10.0; sidechain-source = "Middle"; sidechain-type = "Internal"; solo = false; split-frequency = 12000.0; stereo-split-source = "Left/Right"; };
        band7 = { attack-threshold = -12.0; attack-time = 20.0; boost-amount = 6.0; boost-threshold = -72.0; compression-mode = "Downward"; compressor-enable = true; enable-band = false; knee = -6.0; makeup = 0.0; mute = false; ratio = 1.0; release-threshold = -80.01; release-time = 100.0; sidechain-custom-highcut-filter = false; sidechain-custom-lowcut-filter = false; sidechain-highcut-frequency = 20000.0; sidechain-lookahead = 0.0; sidechain-lowcut-frequency = 16000.0; sidechain-mode = "RMS"; sidechain-preamp = 0.0; sidechain-reactivity = 10.0; sidechain-source = "Middle"; sidechain-type = "Internal"; solo = false; split-frequency = 16000.0; stereo-split-source = "Left/Right"; };
      };

      "equalizer#0" = {
        balance = 0.0;
        bypass = false;
        input-gain = 0.0;
        output-gain = 0.0;
        mode = "IIR";
        num-bands = 6;
        pitch-left = 0.0;
        pitch-right = 0.0;
        split-channels = false;
        left = {
          band0 = mkBand { frequency = 80.0;    gain = 0.0;  type = "Bell"; mute = true; };
          band1 = mkBand { frequency = 200.0;   gain = -2.0; type = "Bell"; };
          band2 = mkBand { frequency = 300.0;   gain = 1.0;  type = "Bell"; };
          band3 = mkBand { frequency = 2500.0;  gain = 2.0;  type = "Bell"; };
          band4 = mkBand { frequency = 5000.0;  gain = 1.0;  type = "Bell"; };
          band5 = mkBand { frequency = 10000.0; gain = -3.0; type = "Off";  };
        };
        right = {
          band0 = mkBand { frequency = 80.0;    gain = 0.0;  type = "Bell"; mute = true; };
          band1 = mkBand { frequency = 200.0;   gain = -2.0; type = "Bell"; };
          band2 = mkBand { frequency = 300.0;   gain = 1.0;  type = "Bell"; };
          band3 = mkBand { frequency = 2500.0;  gain = 2.0;  type = "Bell"; };
          band4 = mkBand { frequency = 5000.0;  gain = 1.0;  type = "Bell"; };
          band5 = mkBand { frequency = 10000.0; gain = -3.0; type = "Off";  };
        };
      };

      "limiter#0" = {
        alr = false;
        alr-attack = 5.0;
        alr-knee = 0.0;
        alr-knee-smooth = -5.0;
        alr-release = 50.0;
        attack = 5.0;
        bypass = false;
        dithering = "None";
        gain-boost = true;
        input-gain = 0.0;
        input-to-link = -80.01;
        input-to-sidechain = -80.01;
        link-to-input = -80.01;
        link-to-sidechain = -80.01;
        lookahead = 5.0;
        mode = "Herm Thin";
        output-gain = 0.0;
        oversampling = "None";
        release = 5.0;
        sidechain-preamp = 0.0;
        sidechain-to-input = -80.01;
        sidechain-to-link = -80.01;
        sidechain-type = "Internal";
        stereo-link = 100.0;
        threshold = -1.0;
      };

      plugins_order = [ "gate#0" "rnnoise#0" "multiband_compressor#0" "equalizer#0" "limiter#0" ];
    };
  };

  # DT770 Pro 80 Ohm Preset - oratory1990
  dt770Preset = {
    output = {
      blocklist = [];
      "equalizer#0" = {
        balance = 0.0;
        input-gain = -3.7;
        output-gain = 0.0;
        num-bands = 10;
        mode = "IIR";
        split-channels = false;
        band0 = { frequency = 65.0;    gain = -9.7; mode = "RLC (BT)"; mute = false; q = 0.35; slope = "x1"; solo = false; type = "Bell";       };
        band1 = { frequency = 105.0;   gain = 5.5;  mode = "RLC (BT)"; mute = false; q = 0.71; slope = "x1"; solo = false; type = "Low Shelf";  };
        band2 = { frequency = 210.0;   gain = 7.8;  mode = "RLC (BT)"; mute = false; q = 1.6;  slope = "x1"; solo = false; type = "Bell";       };
        band3 = { frequency = 950.0;   gain = -1.0; mode = "RLC (BT)"; mute = false; q = 3.0;  slope = "x1"; solo = false; type = "Bell";       };
        band4 = { frequency = 2600.0;  gain = -3.1; mode = "RLC (BT)"; mute = false; q = 2.0;  slope = "x1"; solo = false; type = "Bell";       };
        band5 = { frequency = 3000.0;  gain = 1.0;  mode = "RLC (BT)"; mute = false; q = 0.35; slope = "x1"; solo = false; type = "High Shelf"; };
        band6 = { frequency = 3700.0;  gain = 5.0;  mode = "RLC (BT)"; mute = false; q = 2.0;  slope = "x1"; solo = false; type = "Bell";       };
        band7 = { frequency = 4700.0;  gain = -3.0; mode = "RLC (BT)"; mute = false; q = 4.0;  slope = "x1"; solo = false; type = "Bell";       };
        band8 = { frequency = 7200.0;  gain = -6.5; mode = "RLC (BT)"; mute = false; q = 3.0;  slope = "x1"; solo = false; type = "Bell";       };
        band9 = { frequency = 10000.0; gain = -2.0; mode = "RLC (BT)"; mute = false; q = 0.71; slope = "x1"; solo = false; type = "High Shelf"; };
      };
      plugins_order = [ "equalizer#0" ];
    };
  };

in
{
  services.easyeffects = {
    enable = true;
    preset = "dt770pro_80ohms";
  };

  xdg.configFile."easyeffects/output/dt770pro_80ohms.json".text =
    builtins.toJSON dt770Preset;

  xdg.configFile."easyeffects/input/micro-parfait.json".text =
    builtins.toJSON microPreset;
}
