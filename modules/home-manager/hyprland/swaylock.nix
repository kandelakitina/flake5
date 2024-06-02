{ config, pkgs, ... }:
let inherit (config.colorScheme) palette;
in {
  # home = { packages = with pkgs; [ swaylock ]; };

  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    # package = pkgs.swaylock;
    settings = {

      clock = true;
      datestr = "";
      screenshots = true;

      indicator = true;
      indicator-radius = 100;
      indicator-thickness = 7;

      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      effect-pixelate = 5;

      color = "1e1e2e";
      bs-hl-color = "f5e0dc";
      key-hl-color = "a6e3a1";
      caps-lock-bs-hl-color = "f5e0dc";
      caps-lock-key-hl-color = "a6e3a1";
      ring-color = "b4befe";
      ring-clear-color = "f5e0dc";
      ring-caps-lock-color = "fab387";
      ring-ver-color = "89b4fa";
      ring-wrong-color = "eba0ac";
      text-color = "cdd6f4";
      text-clear-color = "f5e0dc";
      text-caps-lock-color = "fab387";
      text-ver-color = "89b4fa";
      text-wrong-color = "eba0ac";
      layout-text-color = "cdd6f4";

      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-caps-lock-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      layout-bg-color = "00000000";
      layout-border-color = "00000000";
      line-color = "00000000";
      line-clear-color = "00000000";
      line-caps-lock-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      separator-color = "00000000";

      # effect-blur = "20x3";
      # fade-in = 0.1;

      # font = config.fontProfiles.regular.family;
      # font-size = 15;

      # line-uses-inside = true;
      # disable-caps-lock-text = true;
      # indicator-caps-lock = true;
      # indicator-radius = 40;
      # indicator-idle-visible = true;
      # indicator-y-position = 1000;

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
