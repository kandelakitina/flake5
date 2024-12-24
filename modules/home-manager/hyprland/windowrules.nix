{
  wayland.windowManager.hyprland = {
    extraConfig = # hyprland
      ''
        # Pipewire Volume Control
        windowrulev2 = float, title:^(Pipewire Volume Control)$
        windowrulev2 = size 50% 20%, title:^(Pipewire Volume Control)$
        windowrulev2 = move 45% 10%, title:^(Pipewire Volume Control)$

        # Blueman applet
        windowrulev2 = float, title:^(Bluetooth Devices)$
        windowrulev2 = size 50% 20%, title:^(Bluetooth Devices)$
        windowrulev2 = move 45% 20%, title:^(Bluetooth Devices)$

        # zk last scratchpad
        # windowrulev2 = float, move 50% 0,resize set 50% 100%,title:zklast
      '';
  };
}
