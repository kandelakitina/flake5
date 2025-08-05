{
  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "hx.desktop";
      "text/markdown" = "hx.desktop";
      "text/plain" = "hx.desktop";
      "application/x-ruby" = "hx.desktop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
      # "image/png" = "pqiv.desktop";
      # "image/jpeg" = "pqiv.desktop";
      # "image/gif" = "pqiv.desktop";
      # "image/webp" = "pqiv.desktop";
      # "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
      # "application/x-wine-extension-osz" = "osu-stable.desktop";
      # "x-scheme-handler/http" = "librewolf.desktop";
      # "x-scheme-handler/https" = "librewolf.desktop";
    };
  };
}
