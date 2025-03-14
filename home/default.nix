{ config, pkgs, ...}:
{
	imports = [
		./desktop
		./programs
		./software.nix
	];

	home = {
		shellAliases = {
			"nix-rebuild" = "sudo nixos-rebuild switch --flake path:/home/max/Dotfiles";
			"home-rebuild" = "sudo home-manager switch --flake path:/home/max/Dotfiles";
		};

		sessionVariables = {
			XCURSOR_SIZE = "24";
			WLR_NO_HARDWARE_CURSORS = "1";
			MOZ_ENABLE_WAYLAND = "1";
			NIXOS_OZONE_WL = "1";
			APPIMAGE = "1";
		};

		stateVersion = "24.05";
	};
}