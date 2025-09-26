.PHONY: system home all

flake = "path:$(shell pwd)"

all: system home

system:
	sudo nixos-rebuild switch --flake ${flake}

home:
	home-manager switch --flake ${flake}
