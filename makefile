.PHONY: system home

flake = "path:$(shell pwd)"

system:
	sudo nixos-rebuild switch --flake ${flake}

home:
	home-manager switch --flake ${flake}