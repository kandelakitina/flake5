{pkgs, ...}: {
  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.packages = with pkgs; [
    # gnome.dconf-editor
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-panel
    gnomeExtensions.space-bar
    # palenight-theme
  ];

  # home.sessionVariables.GTK_THEME = "palenight";

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "alacritty.desktop"
        "firefox.desktop"
        # "virt-manager.desktop"
        "org.gnome.Nautilus.desktop"
      ];

      # `gnome-extensions list` for a list
      enabled-extensions = [
        # "user-theme@gnome-shell-extensions.gcampax.github.com"
        "trayIconsReloaded@selfmade.pl"
        "Vitals@CoreCoding.com"
        "dash-to-panel@jderose9.github.com"
        "space-bar@luchrioh"
        # "window-list@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    # "org/gnome/shell/extensions/space-bar" = {
    # };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      workspace-names = ["Main"];
    };
    "org/gnome/shell/extensions/vitals" = {
      show-storage = false;
      show-voltage = true;
      show-memory = true;
      show-fan = true;
      show-temperature = true;
      show-processor = true;
      show-network = true;
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jpg";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.jpg";
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.jpg";
      primary-color = "#3465a4";
      secondary-color = "#000000";
    };
  };
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [
          ".config/dconf"
          ".config/gtk-3.0"
          ".config/gtk-4.0"
        ];
        files = [
        ];
      };
    };
  };
}
