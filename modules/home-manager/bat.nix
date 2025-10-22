{ lib, config, ... }:

let
  cfg = config.nix-cli.hm;
in
{
  config = lib.mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        italic-text = "always";
      };
    };
  };
}
