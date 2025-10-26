{
  pkgs,
  ...
}:

{
  config = {
    environment = {
      sessionVariables = {
        NH_FLAKE = "/home/callum/config";
      };

      systemPackages = with pkgs; [
        nh
        nix-output-monitor
        nvd
      ];
    };
  };
}
