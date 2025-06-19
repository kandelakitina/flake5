{
  home.sessionVariables = { GTK_THEME = "Adwaita-dark"; };

  xdg.configFile."gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Adwaita-dark
    gtk-icon-theme-name = Adwaita
  '';

  # For GTK 4 apps (like latest Nautilus), also add:
  xdg.configFile."gtk-4.0/settings.ini".text = ''
    [Settings]
    gtk-theme-name = Adwaita-dark
    gtk-icon-theme-name = Adwaita
  '';
}
