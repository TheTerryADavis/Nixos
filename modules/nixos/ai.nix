{ inputs, pkgs, ... }:

{
  environment.systemPackages = with inputs.nix-ai-tools.packages.${pkgs.system}; [
    codex
  ];
}
