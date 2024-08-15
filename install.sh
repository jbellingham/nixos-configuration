#! /usr/bin/env bash
set -euxo pipefail
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak
sudo ln -s ~/nixos-config/modules/nixos/configuration.nix /etc/nixos

sudo nixos-rebuild switch --flake .#nixos --show-trace -L -v
chsh -s $(which zsh)