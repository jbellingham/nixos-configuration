{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # Used for MacOS system config
    darwin = {
      url = "github:/lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     # Used for user packages and dotfiles
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows =
        "nixpkgs"; # Use system packages list where available
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let
      # Global configuration for my systems
      globals =
        rec {
            user = "jesse";
            fullName = fullName;        
            # gitName = fullName;
            # gitEmail = "5078290+jbellingham@users.noreply.github.com";
          };

      # System types to support.
      supportedSystems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    in rec {
    nixosConfigurations = {
      nixos = import ./hosts/nixos { inherit inputs globals; };
      darwin = import ./hosts/darwin { inherit inputs globals; };
    };
  };
}
