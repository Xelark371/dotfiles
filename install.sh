# !/bin/bash

cp -r nixos /etc
sudo nixos-rebuild switch -y
