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
      home-manager.users.root.home.stateVersion = stateVersion;

      # Pin a state version to prevent warnings
      home-manager.users.${config.user}.home = {
        stateVersion = stateVersion;
        packages = import ../../packages { inherit pkgs; };
        # programs = {
        #   # Let Home Manager install and manage itself.
        #   home-manager.enable = true;

        #   autojump = {
        #     enable = true;
        #     enableZshIntegration = true;
        #   };

        #   direnv = import ./direnv;

        #   fzf = {
        #     enable = true;
        #     enableZshIntegration = true;
        #   };

        #   git = import ./git;

        #   mcfly = {
        #     enable = true;
        #     fzf.enable = true;
        #   };

        #   oh-my-posh = {
        #     enable = true;
        #     useTheme = "1_shell";
        #   };

        #   vim.enable = true;

        #   vscode = import ./vscode { inherit pkgs; };
        #   zsh = import ./zsh { inherit pkgs; };
        # };
      };
    };
}