{ pkgs, lib, config, ... }: {
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;
    events = [
      {
        event = "before-sleep";
        command = "swaylock";
      }
      {
        event = "lock";
        command = "swaylock";
      }
    ];
    timeouts = [{
      timeout = 60;
      command = "swaylock -fF";
    }];
  };
}
