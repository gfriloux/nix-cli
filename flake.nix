{
  description = "Adeptus Mechanicus gfriloux CLI env";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.home-manager = {
    url = "github:nix-community/home-manager/master";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }@ inputs: {
    homeModules = {
      default = import ./modules/home-manager {
        inherit self nixpkgs home-manager;
        name = "default";
      };
    };
  };
}
