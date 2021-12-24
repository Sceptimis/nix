{
  description = "Sceptimis's NixOS configurations.";

  inputs = {
    # Use Nix* package manager, and unstable nixpkgs.
    nix.url = "github:nixos/nix/latest-release";
    nixos.url = "github:nixos/nixpkgs/nixos-unstable";
    # Declaratively manage user homes. 
    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixos";
    };
  };

  outputs = { self, nix, nixos, hm, ... }: {
      nixosConfigurations = {
        # Main system
        koishi = nixos.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            hm.nixosModules.home-manager
            ./hosts/koishi.nix
            ./modules/koishi
            ./home/koishi
          ];
        };
      };
    };
}
