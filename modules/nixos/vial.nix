{ pkgs, ... }:

{
  # ... other configuration …

  services.udev.extraRules = # bash
    ''
      # Allow access to any Vial-enabled keyboard based on serial containing "vial:"
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';

  # Optionally, include Vial or VIA tools in your system environment
  environment.systemPackages = with pkgs;
    [
      vial
      # via
    ];
}

