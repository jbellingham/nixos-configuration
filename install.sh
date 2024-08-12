#! /usr/bin/env bash
set -euxo pipefail

sudo ln -s ~/nixos-config/modules/nixos/configuration.nix /etc/nixos

chsh -s $(which zsh)
sudo nixos-rebuild switch --flake .#nixos --show-trace -L -v