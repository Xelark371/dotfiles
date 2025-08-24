.PHONY: news system home all

flake = "path:$(shell pwd)"

news:
	home-manager news --flake ${flake}

system:
	sudo nixos-rebuild switch --flake ${flake}

home:
	home-manager switch --flake ${flake}

all: system home
