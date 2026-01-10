{
  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        # Pipewire Volume Control
        "float true, match:title ^(Pipewire Volume Control)$"
        "size 740 455, match:title ^(Pipewire Volume Control)$"
        "move 954 40, match:title ^(Pipewire Volume Control)$"

        # Blueman applet
        "float true, match:title ^(Bluetooth Devices)$"
        "size 531 383, match:title ^(Bluetooth Devices)$"
        "move 1025 41, match:title ^(Bluetooth Devices)$"

        # Goldendict
        "float true, match:class GoldenDict-ng"

        # Telegram
        "workspace 4, match:title Telegram*"

        # Whatsapp
        "workspace 4, match:title ^(WhatsApp for Linux)$"

        # Obsidian
        "workspace 3, match:class obsidian"

        # zk last scratchpad
        # "float true,move 50% 0,size 50% 100%, match:title zklast"
      ];
    };
  };
}
