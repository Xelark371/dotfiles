.PHONY: system home all

flake = "path:$(shell pwd)"

system:
	sudo nixos-rebuild switch --flake ${flake}

home:
	home-manager switch -b backup --flake ${flake}

all: system home
