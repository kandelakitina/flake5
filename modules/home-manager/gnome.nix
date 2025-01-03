{ lib, pkgs, ... }: {

  # qt = {
  #   enable = true;
  #   platformTheme = "gnome";
  #   style = "adwaita-dark";
  # };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    # iconTheme = {
    #   name = "Colloid-dark";
    #   package = pkgs.colloid-icon-theme;
    # };

    # theme = {
    #   name = "Adementary-dark";
    #   package = pkgs.adementary-theme;
    # };

    # cursorTheme = {
    # name = "Bibata-Cursor";
    # package = pkgs.bibata-cursors;
    # name = "Numix-Cursor";
    # package = pkgs.numix-cursor-theme;
    # };

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

  # home.sessionVariables = {
  #   GTK_THEME = "Colloid-Dark";
  #   WINIT_UNIX_BACKEND = "x11";
  # };

  home.packages = with pkgs; [
    # gnome.dconf-editor
    # gnomeExtensions.user-themes
    # gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.vitals
    gnomeExtensions.dash-to-panel
    gnomeExtensions.space-bar
    # palenight-theme
    # adementary-theme
    gnomeExtensions.hibernate-status-button
    gnomeExtensions.forge
    gnomeExtensions.pano
    gnomeExtensions.search-light
    gnomeExtensions.caffeine
    gnomeExtensions.appindicator
    gnomeExtensions.paperwm
    gnomeExtensions.switcher
    gnomeExtensions.no-overview
    gnomeExtensions.random-wallpaper
    gnomeExtensions.color-picker
    gnomeExtensions.bluetooth-battery
    gnomeExtensions.status-area-horizontal-spacing
    gnomeExtensions.vertical-workspaces
    gnomeExtensions.top-bar-organizer
    wmctrl # needed for app scripts
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "apps-menu@gnome-shell-extensions.gcampax.github.com"
        "caffeine@patapon.info"
        "dash-to-panel@jderose9.github.com"
        "drive-menu@gnome-shell-extensions.gcampax.github.com"
        "hibernate-status@dromi"
        "pano@elhan.io"
        "paperwm@paperwm.github.com"
        "places-menu@gnome-shell-extensions.gcampax.github.com"
        "search-light@icedman.github.com"
        "Vitals@CoreCoding.com"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "switcher@landau.fi"
        "no-overview@fthx"
        "randomwallpaper@iflow.space"
        "color-picker@tuberry"
        "bluetooth-battery@michalw.github.com"
        "status-area-horizontal-spacing@mathematical.coffee.gmail.com"
        "vertical-workspaces@G-dH.github.com"
        "top-bar-organizer@julian.gse.jsts.xyz"
      ];

      disabled-extensions = [
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "forge@jmmaranan.com"
        "light-style@gnome-shell-extensions.gcampax.github.com"
        "native-window-placement@gnome-shell-extensions.gcampax.github.com"
        "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"
        "space-bar@luchrioh"
        "trayIconsReloaded@selfmade.pl"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "window-list@gnome-shell-extensions.gcampax.github.com"
        "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
      ];
      disable-user-extensions = false;

      favorite-apps = [
        "Alacritty.desktop"
        "firefox.desktop"
        "org.telegram.desktop.desktop"
        # "virt-manager.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };

    "org/gnome/shell/extensions/space-iflow-randomwallpaper" = {
      auto-fetch = true;
      hours = 1;
      change-type = 3;
      fetch-on-startup = true;
      sources = [ "1714852810324" ];
    };

    "org/gnome/shell/extensions/space-iflow-randomwallpaper/sources/unsplash/1714852810324" =
      {
        keyword = "mountains";
      };

    "org/gnome/shell/extensions/pano" = {
      send-notification-on-copy = false;
      play-audio-on-copy = false;
      session-only-mode = true;
    };

    "org/gnome/shell/extensions/forge" = {
      move-pointer-focus-enabled = false;
    };

    "org/gnome/desktop/applications/terminal" = {
      exec = "${pkgs.alacritty}/bin/foot";
    };

    # Bindings
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" =
      {
        binding = "<Super>b";
        command = "run-firefox";
        name = "Firefox";
      };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" =
      {
        binding = "<Super>Return";
        command = "run-alacritty";
        name = "Alacritty";
      };

    "org/gnome/shell/keybindings/toggle-application-view" = { "@as" = [ ]; };

    # "org/gnome/shell/extensions/space-bar" = {
    # };
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
    "org/gnome/gnome/mutter" = { edge-tiling = true; };

    "org/gnome/desktop/wm/preferences" = {
      workspace-names = [ "1" "2" "3" "4" ];
      button-layout = "appmenu:minimize,maximize,close";
    };

    "org/gnome/desktop/wm/keybindings" = { close = [ "<Super>q" ]; };

    "com/github/stunkymonkey/nautilus-open-any-terminal" = {
      terminal = "alacritty";
    };

    "org/gnome/shell/extensions/appindicator" = {
      legacy-tray-enabled = false;
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      panel-element-positions = ''
        {"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"activitiesButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":false,"position":"centerMonitor"},{"element":"dateMenu","visible":true,"position":"centered"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}
      '';
      panel-sizes = ''{"0":32}'';
      panel-positions = ''{"0":"TOP"}'';
      trans-use-custom-opacity = true;
      # trans-panel-opacity = 0.2;
      multi-monitors = false;
    };

    "org/gnome/shell/extensions/vitals" = {
      show-storage = false;
      show-voltage = true;
      show-memory = true;
      show-fan = true;
      show-temperature = true;
      show-processor = true;
      show-network = true;
      icon-style = 1;
    };
    "org/gnome/desktop/background" = {
      picture-uri =
        "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-l.jpg";
      picture-uri-dark =
        "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.jpg";
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri =
        "file:///run/current-system/sw/share/backgrounds/gnome/adwaita-d.jpg";
      primary-color = "#3465a4";
      secondary-color = "#000000";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.6;
    };
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 0.0;
      night-light-schedule-to = 0.0;
      night-light-temperature = 2700;
    };
    "org/gnome/desktop/notifications/application/org-telegram-desktop" = {
      enable = false;
    };
  };
  home = {
    persistence = {
      "/persist/home/boticelli" = {
        directories = [
          ".config/dconf"
          ".config/gtk-3.0"
          ".config/gtk-4.0"
          ".local/share/gnome-shell"
          ".local/share/icons"
          ".local/.icons"
        ];
        files = [ ];
      };
    };
  };
}
