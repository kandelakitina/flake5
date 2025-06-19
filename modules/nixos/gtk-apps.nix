{ config, pkgs, ... }:

{
  # Enable D-Bus for GNOME apps to function
  services.dbus.enable = true;

  # Required for GNOME apps to save their settings
  programs.dconf.enable = true;

  # Enable xserver (you’re on Wayland, but some GTK stuff still expects this)
  services.xserver.enable = true;

  # Install core apps and their backend systems
  environment.systemPackages = with pkgs; [
    nautilus
    evince
    gvfs # Mounting, trash, etc.
    adwaita-icon-theme
    gnome-themes-extra
  ];

  # Enable xdg-desktop-portal and GTK backend for Wayland
  xdg.portal = {
    enable = true;
    wlr.enable = true; # Hyprland is wlroots-based
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
