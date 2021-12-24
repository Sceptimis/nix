{ pkgs, lib, system, ... }: {  
  # Disable Pulseaudio, so that pipewire-pulse can be used instead.
  hardware.pulseaudio.enable = false;

  # For real-time processing in Pipewire.
  security.rtkit.enable = true;

  services = {
    xserver = {
      enable = true;
      displayManager = { # Enable GDM
        gdm.wayland = true;
        gdm.enable = true;
      };
      desktopManager.gnome.enable = true; # Enable GNOME
    };
    pipewire = { # Enable Pipewire, because Pulseaudio bad
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # Enable Xwayland
  programs.xwayland.enable = true;
  hardware.opengl.enable = true;

  # Enable Flatpak.
  # Mainly used for proprietary programs, 
  # but also for ease of use with OStree sandboxing via bubblewrap.
  services.flatpak.enable = true;
}
