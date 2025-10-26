{ lib, config, ... }:

{
  options = {
    alacritty.colorscheme.nord.enable =
      lib.mkEnableOption "Changes from gruvbox to nord(gruvbox is the default)"
      // {
        default = false;
      };
  };

  config = lib.mkIf config.defaultPkgs.enable {
    # Declared in defaultPkgs.nix
    fonts.fontconfig.enable = true;
    programs.alacritty = {
      enable = true;
      theme = if config.alacritty.colorscheme.nord.enable then "nord" else "gruvbox_material";
      settings = {
        window.opacity = 0.9;
        font.normal = {
          family = "Jetbrains Mono Nerd Font";
          style = "Regular";
        };
      };
    };
  };
}
