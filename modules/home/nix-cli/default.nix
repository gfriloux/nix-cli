{ config, lib, pkgs, inputs, ... }:
let
  cfg = config.nix-cli.hm;
in
{
  imports = with inputs; [
    gitflow-toolkit.homeModules.gitflow-toolkit
    catppuccin.homeModules.catppuccin
  ];

  options.nix-cli.hm = {
    enable = lib.mkEnableOption "Enable nix-cli home-manager modules globally";
  };

  config = lib.mkIf cfg.enable {
    programs.home-manager.enable = true;
    programs = {
      atuin.enable = true;
      bat.enable = true;
      btop.enable = true;
      delta.enable = true;
      fish = {
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
      fzf.enable = true;
      git.enable = true;
      gitflow-toolkit.enable = true;
      helix.enable = true;
      jq.enable = true;
      lsd.enable = true;
      micro.enable = true;
      rbw.enable = true;
      television.enable = true;
      zellij.enable = true;
    };
    home.packages = with pkgs; [
      croc
      dive
      dogdns
      glow
      gum
      fastfetch
      fzf-make
      git-workspace
      just
      ncdu
      oh-my-posh
      prettyping
      pv
      pwgen
      rsync
      fd
      viu
      xcp
    ];
    xdg.configFile."oh-my-posh/dracula.omp.json".source = oh-my-posh/dracula.omp.json;

    catppuccin = {
      flavor = "frappe";
      enable = true;
    };
  };
}
