{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          bitwarden
          darkreader
          istilldontcareaboutcookies
          ublock-origin
        ];

        settings = {
          "browser.translations.automaticallyPopup" = false;
          "browser.tabs.unloadOnLowMemory" = true;

          "dom.ipc.processCount" = 4;
          "dom.webgpu.enabled" = true;

          "extensions.autoDisableScopes" = 0;
          "media.eme.enabled" = true;
          "network.cookie.lifetimePolicy" = 0;

          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.history" = false;
          "privacy.resistFingerprinting" = false;

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "ui.key.menuAccessKeyFocuses" = false;
          "webgl.disabled" = false;

          "ui.systemUsesDarkTheme" = 1;
          "layout.css.prefers-color-scheme.content-override" = 0;
        };

        userChrome = ''
          .titlebar-buttonbox-container, .titlebar-spacer[type="post-tabs"] {
            display: none;
          }
        '';
      };
    };
  };
}
