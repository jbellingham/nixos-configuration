{ pkgs, ... }: with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # nixgl.auto.nixGLDefault
    
    glibc
    # adwaita-icon-theme
    # gnome-tweaks
    toybox # just for pgrep
    wine
    winetricks
    fuse
    pulseaudio
    
    # cli tools
    bat
    btop
    caffeine-ng
    fzf
    neofetch
    p7zip
    tldr
    jq

    # dev-related
    distrobox
    docker-compose
    lazydocker
    git-extras
    inxi
    nixd
    
    # disk usage analyzer flatpak
    # gnome-extensions
    # gnomeExtensions.vitals
    # gnomeExtensions.user-themes
    gnomeExtensions.dash-to-panel

    # apps
    discord
    # dwarf-fortress-packages.dwarf-fortress-full
    firefox
    meld
    obsidian
    protonmail-desktop
    slack

    dracula-theme

    # nixgl.nixGLIntel
    # (nixGLWrap _1password-gui)
    # (nixGLWrap lutris)
    # (nixGLWrap spotify)
    # (nixGLWrap wezterm)

    # System backups
    # https://github.com/linuxmint/timeshift
    timeshift

    # fonts
    fira-code
    hack-font
    meslo-lgs-nf
    monaspace
]