{ config, pkgs, ...}:
# let
# 	home-manager = builtins.fetchTarball {
# 		url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
# 		sha256 = "05zi0zbn5spnw8fdw0cf0mak9rwwzx24856ysjyrbgpc8pdv55lb";
# 	};
# in
{
	imports = [
		./apps
		./desktop
	];

	home.shellAliases = {
    "nix-rebuild" = "sudo nixos-rebuild switch --flake path:$HOME/Dotfiles";
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
			libsForQt5.qt5ct
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
}