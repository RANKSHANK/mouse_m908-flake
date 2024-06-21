{
  description = "mouse_m908 Nix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    eachSys = nixpkgs.lib.genAttrs  [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
        "i686-darwin"
        "i686-linux"
    ];
  in {
    packages = eachSys (sys: rec {
        mouse_m908 = nixpkgs.legacyPackages.${sys}.callPackage ./package.nix {};
        default = mouse_m908;
       }
    );


  };
}
