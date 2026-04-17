{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.nix-cli.hm;
in {
  imports = with inputs; [
    gitflow-toolkit.homeModules.gitflow-toolkit
    catppuccin.homeModules.catppuccin
    television-ssh.homeModules.default
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
      fish = {
        enable = true;
        shellInit = ''
          oh-my-posh init fish --config ${config.xdg.configHome}/oh-my-posh/dracula.omp.json | source
        '';
        shellAliases = {
          cat = "bat";
          ping = "prettyping";
          cp = "xcp";
        };
      };
      delta = {
        enable = true;
        enableGitIntegration = true;
      };
      direnv = {
        enable = true;
        nix-direnv.enable = true;
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
      television-ssh.enable = true;
      zellij.enable = true;
    };
    home.packages = with pkgs; [
      alejandra
      croc
      dive
      doggo
      fastfetch
      fd
      fzf-make
      git-workspace
      glow
      gum
      just
      ncdu
      nix-output-monitor
      oh-my-posh
      p7zip
      prettyping
      pv
      pwgen
      rsync
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
