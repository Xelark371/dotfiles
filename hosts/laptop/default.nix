{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./vpn.nix
  ];

  networking.hostName = "laptop";

  environment.systemPackages = with pkgs; [
    wakeonlan
  ];
}
