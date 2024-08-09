# System config for NixOS

{ inputs, globals, ... }:
with inputs;

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    globals
    inputs.home-manager.nixosModules.home-manager
    ../../modules/common
    ../../modules/nixos
    {}
  ];
}