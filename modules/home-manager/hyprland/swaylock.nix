{ config, pkgs, ... }:
let inherit (config.colorScheme) palette;
in {
  # home = { packages = with pkgs; [ swaylock ]; };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    # package = pkgs.swaylock;
    settings = {
      effect-blur = "20x3";
      fade-in = 0.1;

      font = config.fontProfiles.regular.family;
      font-size = 15;

      line-uses-inside = true;
      disable-caps-lock-text = true;
      indicator-caps-lock = true;
      indicator-radius = 40;
      indicator-idle-visible = true;
      indicator-y-position = 1000;

      # ring-color = "${palette.surface_bright}";
      # inside-wrong-color = "${palette.on_error}";
      # ring-wrong-color = "${palette.error}";
      # key-hl-color = "${palette.tertiary}";
      # bs-hl-color = "${palette.on_tertiary}";
      # ring-ver-color = "${palette.secondary}";
      # inside-ver-color = "${palette.on_secondary}";
      # inside-color = "${palette.surface}";
      # text-color = "${palette.on_surface}";
      # text-clear-color = "${palette.on_surface_variant}";
      # text-ver-color = "${palette.on_secondary}";
      # text-wrong-color = "${palette.on_surface_variant}";
      # text-caps-lock-color = "${palette.on_surface_variant}";
      # inside-clear-color = "${palette.surface}";
      # ring-clear-color = "${palette.primary}";
      # inside-caps-lock-color = "${palette.on_tertiary}";
      # ring-caps-lock-color = "${palette.surface}";
      # separator-color = "${palette.surface}";
    };
  };
}
