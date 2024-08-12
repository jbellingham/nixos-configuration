{ ... }:
{
  imports = [
    ./direnv.nix
    ./zsh.nix
  ];

home-manager.users.${config.user} = {
    programs.mcfly = {
      enable = true;
      fzf.enable = true;
    };

    programs.oh-my-posh = {
      enable = true;
      useTheme = "1_shell";
    };

    programs.vim.enable = true;
  }
}