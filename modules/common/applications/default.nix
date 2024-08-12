{ config, ... }:
{
  imports = [
    ./vscode
  ];

  # Install firefox.
  home-manager.users.${config.user}.programs.firefox.enable = true;
}