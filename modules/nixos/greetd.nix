{ config, ... }: {
  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "Hyprland &> /dev/null";
        user = "boticelli";
      };
      initial_session = default_session;
    };
  };
}
