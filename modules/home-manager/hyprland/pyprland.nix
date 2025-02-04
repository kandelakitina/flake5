{
  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, n, exec, pypr toggle zklast && hyprctl dispatch bringactivetotop"
    "SUPER, z, exec, pypr toggle zkopen && hyprctl dispatch bringactivetotop"
  ];

  home.file.".config/hypr/pyprland.toml".text = # toml
    ''
      [pyprland]
      plugins = ["scratchpads"]

      [scratchpads.zk]
      lazy = true
      # excludes = "*"
      # restore_excluded = true

      [scratchpads.zklast]
      command = "alacritty --title zklast -e zk last"
      use = "zk"
      # class = "zklast"

      [scratchpads.zkopen]
      command = "alacritty --title zkopen -e zk open"
      use = "zk"

      # [scratchpads.alacritty]
      # command = "alacritty"
      # class = "scratchpad"
    '';
}
