{pkgs, ...}: {
  home.packages = with pkgs; [
    goldendict-ng
    # libsForQt5.qt5ct
  ];

  # qt.platformTheme = "gnome";

  # home = {
  #   persistence = {
  #     "/persist/home/boticelli" = {
  #       directories = [
  #       ];
  #       files = [
  #       ];
  #     };
  #   };
  # };
}
