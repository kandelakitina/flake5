{ pkgs, lib, config, ... }: {
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock --daemonize";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock --daemonize --grace 0";
      }
      {
        event = "unlock";
        command = "pkill -SIGUSR1 swaylock";
      }
      {
        event = "after-resume";
        command = ''swaymsg "output * dpms on"'';
      }
    ];
    timeouts = [
      {
        timeout = 1800;
        command = "${pkgs.swaylock-effects}/bin/swaylock --daemonize";
      }
      {
        timeout = 2000;
        command = ''swaymsg "output * dpms off"'';
        resumeCommand = ''swaymsg "output * dpms on"'';
      }
    ];
  };
  # services.swayidle = {
  #   enable = true;
  #   package = pkgs.swayidle;
  #   events = [
  #     {
  #       event = "before-sleep";
  #       command = "swaylock";
  #     }
  #     {
  #       event = "lock";
  #       command = "swaylock";
  #     }
  #   ];
  #   timeouts = [{
  #     timeout = 60;
  #     command = "swaylock -fF";
  #   }];
  # };
}
