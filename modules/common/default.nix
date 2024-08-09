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
      environment.systemPackages = with pkgs; [
        git
        vim
        curl
      ];

      nixpkgs.config.allowUnfree = true;

      # Pin a state version to prevent warnings
      home-manager.users.${config.user}.home.stateVersion = stateVersion;
      home-manager.users.root.home.stateVersion = stateVersion;

      packages = import ../packages { inherit pkgs; };
      programs = {
        # Let Home Manager install and manage itself.
        home-manager.enable = true;

        autojump = {
          enable = true;
          enableZshIntegration = true;
        };

        direnv = import ./modules/direnv;

        fzf = {
          enable = true;
          enableZshIntegration = true;
        };

        git = import ./modules/git;

        mcfly = {
          enable = true;
          fzf.enable = true;
        };

        oh-my-posh = {
          enable = true;
          useTheme = "1_shell";
        };

        vim.enable = true;

        vscode = import ./modules/vscode { inherit pkgs; };
        zsh = import ./modules/zsh { inherit pkgs; };
      };
    };
}