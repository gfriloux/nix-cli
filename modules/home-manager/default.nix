{
  home-manager,
  nixpkgs,
  self,
  name
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
    ./bat.nix
    ./broot.nix
    ./btop.nix
    ./delta.nix
    ./fzf.nix
    ./jq.nix
    ./lsd.nix
    ./micro.nix
    ./oh-my-posh.nix
    ./ripgrep.nix
    ./zellij.nix
  ];

  options.nix-cli.hm = {
    enable = mkEnableOption "Enable nix-cli home-manager modules globally";
  };

  config = {
    nix-cli.hm.enable = mkDefault false;
    # let home-manager control itself
    programs.home-manager.enable = true;
  };
}
