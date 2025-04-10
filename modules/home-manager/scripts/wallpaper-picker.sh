#!/usr/bin/env bash

wallpaper_path=$HOME/Pictures/wallpapers
wallpapers_folder=$HOME/Pictures/wallpapers/wallpapers
wallpaper_name="$(ls $wallpapers_folder | wofi --dmenu --prompt 'Select Wallpaper')"
if [[ -f $wallpapers_folder/$wallpaper_name ]]; then
    find ~/Pictures/wallpapers -maxdepth 1 -type f -delete
    cp $wallpapers_folder/$wallpaper_name $wallpaper_path/wallpaper
    wall-change $wallpaper_path/wallpaper
else
    exit 1
fi
