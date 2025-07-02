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

          "privacy.resistFingerprinting" = false;

          "ui.key.menuAccessKeyFocuses" = false;

          "webgl.disabled" = false;
        };
      };
    };
  };
}
