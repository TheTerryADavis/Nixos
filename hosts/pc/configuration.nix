{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/default/default.nix
    ./../../modules/nixos/plasma.nix
    ./../../modules/nixos/steam.nix
    ./../../modules/nixos/ai.nix
  ];

  callum.autologin.enable = true;
  networking.hostName = "pc";
  home-manager.users."callum" = import ./home.nix;
}
