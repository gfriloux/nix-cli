{ lib, ... }:

{
  imports = [
    ./atuin.nix
  ];

  options.nix-cli.hm = {
    enable = lib.mkEnableOption "Enable nix-cli home-manager modules globally";
  };

  config = {
    nix-cli.hm.enable = lib.mkDefault false;
    home.stateVersion = "25.05";

    # let home-manager control itself
    programs.home-manager.enable = true;
  };
}
