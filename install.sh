#! /usr/bin/env nix-shell
#! nix-shell -i bash
#! nix-shell -p git

git clone https://github.com/jbellingham/whatever ./nixos-config # todo... repo
sudo ln -s ~/nixos-config/configuration.nix /etc/nixos