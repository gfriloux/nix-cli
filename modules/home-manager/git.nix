{ lib, config, ... }:

let
  cfg = config.nix-cli.hm;
in
{
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
    };
  };
}
