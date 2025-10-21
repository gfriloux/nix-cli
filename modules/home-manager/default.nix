{
  home-manager,
  self
}: {
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (lib)
    mkDefault
    mkEnableOption
    ;

in
{
  imports = [
    ./atuin.nix
  ];

  options.nix-cli.hm = {
    enable = mkEnableOption "Enable nix-cli home-manager modules globally";
  };

  config = {
    nix-cli.hm.enable = mkDefault false;
    home.stateVersion = "25.05";

    # let home-manager control itself
    programs.home-manager.enable = true;
  };
}
