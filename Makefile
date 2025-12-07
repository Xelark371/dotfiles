.PHONY: desktop laptop home

flake = "path:$(shell pwd)"

desktop:
	sudo nixos-rebuild switch --flake ${flake}#desktop

laptop:
	sudo nixos-rebuild switch --flake ${flake}#laptop

home:
	home-manager switch --flake ${flake}
