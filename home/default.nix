{ config, pkgs, ...}:
{
	imports = [
		./desktop
		./programs
		./software.nix
	];

	home = {
		username = "max";
		homeDirectory = "/home/max";

		sessionVariables = {
			XCURSOR_SIZE = "24";
			WLR_NO_HARDWARE_CURSORS = "1";
			MOZ_ENABLE_WAYLAND = "1";
			NIXOS_OZONE_WL = "1";
		};

		stateVersion = "24.05";
	};

	xdg = {
    mimeApps = {
      enable = true;

      defaultApplications = {
        "application/pdf" = [ "librewolf.desktop" ];
        "application/zip" = [ "xarchiver.desktop" ];
        "image/jpeg" = [ "viewnior.desktop" ];
        "image/png" = [ "viewnior.desktop" ];
        "text/plain" = [ "libreoffice.desktop" ];
      };
    };
	};
}
