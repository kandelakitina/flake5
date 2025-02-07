{ pkgs, ... }: {
  home.packages = with pkgs; [ goldendict-ng ];

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
