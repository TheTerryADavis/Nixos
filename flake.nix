{
	description = "Nixos config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
    nvf = {
			url = "github:NotAShelf/nvf";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	  plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    nix-ai-tools.url = "github:numtide/nix-ai-tools";
  };

	outputs = { self, nixpkgs, ... }@inputs: 
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop/configuration.nix
          inputs.nvf.nixosModules.default
          inputs.home-manager.nixosModules.default
          inputs.nix-ai-tools.nixosModules.default
        ];
      };

      pc = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/pc/configuration.nix
          inputs.nvf.nixosModules.default
          inputs.home-manager.nixosModules.default
          inputs.nix-ai-tools.nixosModules.default
        ];
      };
    };
  };
}
