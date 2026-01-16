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

          "extensions.autoDisableScopes" = 0;

          "media.eme.enabled" = true;

          "privacy.resistFingerprinting" = false;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;

          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "ui.key.menuAccessKeyFocuses" = false;

          "webgl.disabled" = false;
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
