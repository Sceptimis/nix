{ pkgs, lib, system, ... }: {
  imports = [
    ./desktop.nix
    ./user.nix
    ./vpn.nix
  ];

  system.stateVersion = "22.05";
  nix.autoOptimiseStore = true;
  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Australia/Perth";

  nix = {
    # Use flakes for **maximum hermeticism**.
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
      # Uses more disk space but speeds up nix-direnv.
      keep-derivations = true
      keep-outputs = true
    '';
  };

  # Allow proprietary packages.
  nixpkgs.config.allowUnfree = true;

  # System-wide packages.
  environment.systemPackages = with pkgs; [ ];

  # Let `home-manager` manage user-independent packages.
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  programs = {
    fish.enable = true;
    command-not-found.enable = false;
  };
}
