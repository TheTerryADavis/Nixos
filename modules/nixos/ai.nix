{ inputs, pkgs, ... }:

{
  environment.systemPackages = with inputs.nix-ai-tools.packages.${pkgs.system}; [
    claude-code
    claude-desktop
    coderabbit-cli # IDK what this is but they sponsor fireship
    codex
    gemeni-cli
    groq-code-cli
    qwen-code
  ];
}
