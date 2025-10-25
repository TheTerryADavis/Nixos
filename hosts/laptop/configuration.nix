{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/default/default.nix
    ./../../modules/nixos/sway/default.nix
    ./../../modules/nixos/ai.nix
  ];

  networking.hostName = "laptop";
  home-manager.users."callum" = import ./home.nix;
}
