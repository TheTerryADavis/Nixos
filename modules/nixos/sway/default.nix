{ pkgs, ... }:

{
  imports = [
    ./swaylock.nix
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.greetd}/bin/agreety --cmd sway";
  };
}
