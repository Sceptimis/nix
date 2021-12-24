{ pkgs, ... }: {
  # Programs installed will use nixpkgs-unstable.
  home-manager.users.sceptimis = { pkgs, ... }: {
    # Packages that have additional configuration.
    imports = [
      ./git.nix
      ./gnome.nix
      ./gnupg.nix
    ];

    # Other packages that have no additional configuration.
    home.packages = with pkgs; [
      alacritty
      firefox
      htop
      keepassxc
      mullvad-vpn
      cinnamon.nemo
      neovim
      pavucontrol
      python3
      srm
      tmux
      tutanota-desktop
    ];
  };
}
