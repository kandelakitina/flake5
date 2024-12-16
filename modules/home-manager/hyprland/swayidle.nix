{ pkgs, ... }:
# let
#   suspendScript = pkgs.writeShellScript "suspend-script" ''
#     ${pkgs.pipewire}/bin/pw-cli i all | ${pkgs.ripgrep}/bin/rg running
#     # only suspend if audio isn't running
#     if [ $? == 1 ]; then
#       ${pkgs.systemd}/bin/systemctl suspend
#     fi
#   '';
# in 
{
  # screen idle
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }

      {
        timeout = 600;
        # command = suspendScript.outPath;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
