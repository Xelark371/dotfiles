{
  imports = [
    ./scripts
    ./hyprland.nix
    ./mako.nix
    ./theme.nix
    ./waybar.nix
    ./wofi.nix
  ];

  services.hyprsunset.enable = true;
}
