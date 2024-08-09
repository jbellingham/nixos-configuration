{ config, lib, pkgs, ... }:
{
  config =
    let
      stateVersion = "24.05";
    in
    {
      environment.systemPackages = with pkgs;[
        git
        vim
        curl
      ];

      nixpkgs.config.allowUnfree = true;

      # Pin a state version to prevent warnings
      home-manager.users.${config.user}.home.stateVersion = stateVersion;
      home-manager.users.root.home.stateVersion = stateVersion;
    };
}