{ lib, config, pkgs, ... }:

let
  cfg = config.nix-cli.hm;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      glow
    ];
  };
}
