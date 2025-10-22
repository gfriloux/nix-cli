{ lib, config, pkgs, ... }:

let
  cfg = config.nix-cli.hm;
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      oh-my-posh
    ];

    home.file.".config/oh-my-posh/dracula.omp.json".source = oh-my-posh/dracula.omp.json;
  };
}
