{ pkgs, ... }: {

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    font = {
      name = "Ubuntu Nerd Font";
      size = 13;
    };

  };
  home.pointerCursor = {
    gtk.enable = true;
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    # size = 32;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      # gtk-theme = "Adementary-dark";
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
      clock-show-weekday = true;
      show-battery-percentage = true;
      # document-font-name = "UbuntuMono Nerd Font Propo 12";
      # font-name = "UbuntuMono Nerd Font Propo 12";
      # monospace-name = "UbuntuMono Nerd Font Mono 12";
    };
  };

}
