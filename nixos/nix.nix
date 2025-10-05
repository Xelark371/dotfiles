{ inputs, ... }:
{
  imports = [
    inputs.nix-index-database.nixosModules.nix-index
  ];

  nix = {
    optimise.automatic = true;

    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      download-buffer-size = 104857600;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2w";
    };
  };

  programs = {
    nix-index-database.comma.enable = true;
  };
}
