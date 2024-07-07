{ pkgs, ... }: {
  services.swayidle = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    events = [{
      event = "before-sleep";
      command = "swaylock -f -c 000000";
    }];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
        resumeCommand = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
      }
      {
        timeout = 320;
        command = "swaylock -f -c 000000";
      }
    ];
  };
}
