{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: let
    system = "x86_64-linux";
  in {
    nixosConfigurations.maxPC = nixpkgs.lib.nixosSystem {
      system = system;
      modules = [
        
        home-manager.nixosModules.home-manager

        ./nixos
        
        {
          home-manager = {
            backupFileExtension = "backup";

            useGlobalPkgs = true;
            useUserPackages = true;
            
            users.max = import ./home;
          };
        }
      ];
    };
  };
}