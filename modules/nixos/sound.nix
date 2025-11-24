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

    wireplumber.enable = true;
    wireplumber.extraConfig = {
      "10-default-node" = {
        "policy.default" = {
          "default-audio-sink" =
            "alsa_output.pci-0000_03_00.1.hdmi-stereo-extra1";
        };
      };
    };

  };
  environment.systemPackages = with pkgs; [ pwvucontrol ];
}
