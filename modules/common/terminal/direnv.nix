{
    home-manager.users.${config.user}.programs.direnv = {
        enable = true;
        enableZshIntegration = true;
        nix-direnv.enable = true;
    };
    
}