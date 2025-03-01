{ pkgs, lib, ... }: {
  # Sound options
  security.rtkit.enable = true;
  # hardware.pulseaudio.enable = lib.mkForce false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  environment.systemPackages = with pkgs; [ pwvucontrol ];
}
