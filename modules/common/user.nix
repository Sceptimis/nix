{ pkgs, lib, ... }: {
  users.users.sceptimis = {
    shell = pkgs.fish;
    home = "/home/sceptimis";
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
