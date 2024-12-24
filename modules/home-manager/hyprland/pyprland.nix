{
  wayland.windowManager.hyprland.settings.bind =
    [ "SUPER,n,exec,pypr toggle zklast && hyprctl dispatch bringactivetotop" ];
  home.file.".config/hypr/pyprland.toml".text = # toml
    ''
      [pyprland]
      plugins = ["scratchpads"]

      [scratchpads.zklast]
      command = "alacritty --title zklast -e zk edit --limit 1 --sort modified-"
      class = "scratchpad"
    '';
}
