# nix-cli

Il s'agit d'un `nix module` pour `home-manager` qui installe les
outils `cli` que j'ai globalement besoin sur toutes les machines
que j'utilise.

Ça me permet de simplifier l'écriture de mes flakes, rajoutant
juste ce dépôt dans les inputs pour être peinard.

# Utilisation

## Ajout du input

```nix
gitflow-toolkit = {
  url = "github:gfriloux/gitflow-toolkit-flake";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

## On charge le module home-manager

```nix
modules = [
  ...
  nix-cli.homeModules.default
];
```

## On active le module

```nix
nix-cli.hm.enable = true;
```
