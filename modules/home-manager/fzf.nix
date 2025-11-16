{ lib, config, ... }:

let
  cfg = config.nix-cli.hm;
in
{
  config = lib.mkIf cfg.enable {
    programs.fzf = {
      enable = true;
    };
    home.packages = with pkgs; [
      fzf-make
    ];
  };
}
