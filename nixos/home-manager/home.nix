{ config, pkgs, ...}:
let
	home-manager = builtins.fetchTarball {
		url = "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
	};
in
{
	imports = [
		(import "${home-manager}/nixos")
		./hyprland.nix
	];

	home-manager.backupFileExtension = "backup";
	home-manager.users.max = {

		programs.git = {
			enable = true;
			userName = "Xelark371";
			userEmail = "maxencebressel.371@gmail.com";
		};

		gtk = {
			enable = true;

			theme = {
				package = pkgs.flat-remix-gtk;
				name = "Flat-Remix-GTK-Grey-Darkest";
			};

			iconTheme = {
				package = pkgs.gnome.adwaita-icon-theme;
				name = "Adwaita";
			};

			font = {
				name = "Sans";
				size = 11;
			};
		};

		home = {
			pointerCursor = {
				package = pkgs.bibata-cursors;
				name = "Bibata-Modern-Classic";
				size = 12;
				gtk.enable = true;
			};

			sessionVariables = {
				WLR_NO_HARDWARE_CURSORS = "1";
  			NIXOS_OZONE_WL = "1";
			};

			stateVersion = "24.05";
		};

	};
}