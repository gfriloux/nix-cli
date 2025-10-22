{ lib, config, ... }:

let
  cfg = config.nix-cli.hm;
in
{
  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;
      shellInit = ''
        oh-my-posh init fish --config ~/.config/oh-my-posh/dracula.omp.json | source
        atuin init fish | source
      '';
      shellAliases = {
        cat = "bat";
        ping = "prettyping";
        cp = "xcp";
      };
    };
  };
}
