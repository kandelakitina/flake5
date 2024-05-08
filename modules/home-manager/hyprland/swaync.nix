{
  xdg.configFile."swaync/config.json".text = builtins.toJSON {
    positionX = "center";
    positionY = "top";
    control-center-margin-top = 10;
    control-center-margin-bottom = 10;
    control-center-margin-right = 10;
    control-center-margin-left = 10;
    widgets = [ "inhibitors" "title" "dnd" "notifications" ];
  };
}
