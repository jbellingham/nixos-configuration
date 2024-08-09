{ config, lib, pkgs, ... }:
{
  options = {
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };
    fullName = lib.mkOption {
      type = lib.types.str;
      description = "Human readable name of the user";
    };
  };
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