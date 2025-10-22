{ lib, config, ... }:

let
  cfg = config.nix-cli.hm;
in
{
  options.nix-cli.hm.rbw = {
    enable = lib.mkEnableOption "Enable nix-cli home-manager modules globally";
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      { nix-cli.hm.rbw.enable = lib.mkDefault false; }

      (lib.mkIf config.nix-cli.hm.rbw.enable {
        programs.rbw.enable = true;
      })
    ]
  );
}
