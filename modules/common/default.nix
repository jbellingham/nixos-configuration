{ config, lib, pkgs, ... }:
{
  imports = [
    ./terminal
  ];

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
      environment.systemPackages = with pkgs; [
        git
        vim
        curl
      ];

      nixpkgs.config.allowUnfree = true;
      home-manager.users.root.home.stateVersion = stateVersion;

      # Pin a state version to prevent warnings
      home-manager.users.${config.user} = {
        home = {
          packages = import ../../packages { inherit pkgs; };
          stateVersion = stateVersion;
        };
        
        programs = {
          # Let Home Manager install and manage itself.
          # home-manager.enable = true;

          autojump = {
            enable = true;
            enableZshIntegration = true;
          };

          fzf = {
            enable = true;
            enableZshIntegration = true;
          };

          git = import ./git;
        };
      };
    };
}