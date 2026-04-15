{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-move-transition
      obs-pipewire-audio-capture
      obs-shaderfilter
      obs-vaapi
      obs-vkcapture
      obs-websocket
    ];
  };
}
