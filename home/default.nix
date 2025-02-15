{ config, pkgs, ...}:
{
	imports = [
		./apps
		./desktop
	];

	programs.bash = {
		enable = true;
	};

	home.shellAliases = {
		"nix-rebuild" = "sudo nixos-rebuild switch --flake path:/home/max/Dotfiles";
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
		platformTheme.name = "q5ct";
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

			(python3.withPackages (ps: with ps; [
				tkinter
			]))
		];

		sessionVariables = {
			XCURSOR_SIZE = "24";
			WLR_NO_HARDWARE_CURSORS = "1";
			MOZ_ENABLE_WAYLAND = "1";
			NIXOS_OZONE_WL = "1";
			APPIMAGE = "1";
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