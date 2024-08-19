{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [ yubikey-personalization ];

  services = {
    pcscd.enable = true;
    udev.packages = with pkgs; [ yubikey-personalization ];
    dbus.packages = [ pkgs.gcr ];
  };

  security.pam.u2f = {
    enable = true;
    cue = true;
  };

  security.pam.services = {
    swaylock.u2fAuth = true;
    login.u2fAuth = true;
    sudo.u2fAuth = true;
    # sddm.u2fAuth = true;
  };

  # security.pam.yubico = {
  #   enable = true;
  #   debug = true;
  #   mode = "challenge-response";
  #   id = [ "25940960" ];
  # };

  services.udev.extraRules = ''
    ACTION=="remove",\
     ENV{ID_BUS}=="usb",\
     ENV{ID_MODEL_ID}=="0407",\
     ENV{ID_VENDOR_ID}=="1050",\
     ENV{ID_VENDOR}=="Yubico",\
     RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';
}
