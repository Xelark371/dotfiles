{ config, pkgs, ...}:
let
	home-manager = builtins.fetchTarball {
		url = "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
	};
in
{
	imports = [
		(import "${home-manager}/nixos")
		../apps/wofi.nix
		../apps/vscode.nix
		./background-image/hyprpaper.nix
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
				package = pkgs.vimix-gtk-themes;
				name = "vimix-dark-doder";
			};

			iconTheme = {
				package = pkgs.dracula-icon-theme;
				name = "Dracula";
			};
		};

		qt = {
      enable = true;
      platformTheme.name = "qtct";
      style = {
        name = "Vimix-Dark-Doder";
        package = pkgs.libsForQt5.qtstyleplugin-kvantum;
      };
    };

		home = {
			pointerCursor = {
				gtk.enable = true;
				package = pkgs.phinger-cursors;
				name = "phinger-cursors-dark";
				size = 24;
			};

			packages = with pkgs; [
				libsForQt5.qtstyleplugin-kvantum
				qt5.qtbase
				qt5ct
				vimix-gtk-themes
			];

			sessionVariables = {
				XCURSOR_SIZE = "24";
			};

			stateVersion = "24.05";
		};

		xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=Vimix-Dark-Doder
    '';

		xdg.configFile."qt5ct/qt5ct.conf".text = ''
      [Appearance]
      style=kvantum
    '';
	};
}