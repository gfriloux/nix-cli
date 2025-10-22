{ lib, config, ... }:

let
  cfg = config.nix-cli.hm;
in
{
  config = lib.mkIf cfg.enable {
    programs.delta = {
      enable = true;
      #enableGitIntegration = true;
    };
  };
}
