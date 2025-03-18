{ pkgs, ... }:
{
  programs.librewolf = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        search = {
          default = "Google";
        };

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          darkreader
          ublock-origin
        ];

        settings = {
          "extensions.autoDisableScopes" = 0;

          "browser.translations.automaticallyPopup" = false;

          "ui.key.menuAccessKeyFocuses" = false;
        };
      };
    };
  };
}