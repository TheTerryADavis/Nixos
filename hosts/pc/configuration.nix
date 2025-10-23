{ ... }:

{
	imports = [
		./hardware-configuration.nix
		./../../modules/nixos/default.nix
    ./../../modules/nixos/plasma.nix
    ./../../modules/nixos/steam.nix
  ];

  nvf.colorscheme.nord.enable = true;
  callum.autologin.enable = true;

  networking.hostName = "pc";
  home-manager.users."callum" = import ./home.nix;
}
