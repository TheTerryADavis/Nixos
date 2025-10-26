{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

{
  options.defaultPkgs = {
    enable = lib.mkEnableOption "enables defaultPkgs" // {
      default = true;
    };
  };

  imports = [
    ../browsers.nix
  ];

  config = lib.mkIf config.defaultPkgs.enable {
    environment.systemPackages = [
      inputs.nvf.packages.${pkgs.system}.default
      pkgs.tree 
      pkgs.neofetch
      pkgs.git
      pkgs.feh
    ];
  };
}
