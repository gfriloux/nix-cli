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
    ./croc.nix
    ./delta.nix
    ./dive.nix
    ./dogdns.nix
    ./fish.nix
    ./fzf.nix
    ./glow.nix
    ./gum.nix
    ./jq.nix
    ./just.nix
    ./lsd.nix
    ./micro.nix
    ./ncdu.nix
    ./oh-my-posh.nix
    ./prettyping.nix
    ./pv.nix
    ./pwgen.nix
    ./ripgrep.nix
    ./rsync.nix
    ./viu.nix
    ./xcp.nix
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
