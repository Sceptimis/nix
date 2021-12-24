{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Kernel Settings
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # LUKS
  boot.initrd.luks.devices."nixos".device = "/dev/disk/by-label/nixos";

  # Filesystems
  fileSystems = {
    "/" =
      {
        device = "/dev/mapper/nixos";
        fsType = "btrfs";
        options = [ "subvol=root" ];
      };
    "/boot" =
      {
        device = "/dev/disk/by-label/boot";
        fsType = "vfat";
      };
    "/home" =
      {
        device = "/dev/mapper/nixos";
        fsType = "btrfs";
        options = [ "subvol=home" ];
      };
    "/nix" =
      {
        device = "/dev/mapper/nixos";
        fsType = "btrfs";
        options = [ "subvol=nix" ];
      };
    "/snapshots" =
      {
        device = "/dev/mapper/nixos";
        fsType = "btrfs";
        options = [ "subvol=snapshots" ];
      };
  };

  swapDevices = [ ];

  networking.hostName = "koishi";

  # Nvidia driver w/ drm modeset for Wayland support.
  hardware.nvidia.modesetting.enable = true;
  services.xserver = {
    videoDrivers = [ "nvidia" ];
    displayManager.gdm.nvidiaWayland = true;
  };
}
