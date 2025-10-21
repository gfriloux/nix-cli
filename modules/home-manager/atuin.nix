{ lib, config, ... }:

let
  cfg = config.nix-cli.hm.git;
in
{
  options.nix-cli.hm.git = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.nix-cli.hm.enable;
      description = "Enable ATUIN module";
    };
  };

  config = lib.mkIf cfg.enable {

    programs.atuin = {
      enable = true;
      #enableFishIntegration = true;
    };
  };
}
