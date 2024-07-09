{ pkgs, config, ... }:
let
  lock =
    # "${pkgs.swaylock-effects}/bin/swaylock --daemonize --clock --indicator --grace 10";
    # "${pkgs.swaylock-effects}/bin/swaylock --daemonize --clock --indicator";
    "${pkgs.swaylock}/bin/swaylock --daemonize --clock --indicator";
  hyprlandPkg = config.wayland.windowManager.hyprland.package;
in {
  services.swayidle = {
    enable = true;
    events = [
      # executes command before systemd puts the computer to sleep.
      {
        event = "before-sleep";
        command = lock;
      }
      # executes command when logind signals that the session should be locked
      {
        event = "lock";
        command = lock;
      }
    ];
    timeouts = [
      {
        timeout = 5 * 60;
        command = lock;
      }
      {
        timeout = 15 * 60;
        command = "${pkgs.systemd}/bin/systemctl suspend";
        # command = "${hyprlandPkg}/bin/hyprctl dispatch dpms off";
        # resumeCommand = "${hyprlandPkg}/bin/hyprctl dispatch dpms on";
      }
    ];
  };
}
