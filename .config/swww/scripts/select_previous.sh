#!/bin/bash

if [ ! -v WALLPAPERS_DIRECTORY ]; then
    notify-send "Environment variable WALLPAPERS_DIRECTORY not set."
    exit 1
fi

wallpapers=("$WALLPAPERS_DIRECTORY"/*)
amountWallpapers=${#wallpapers[@]}

currentWallpaper=$(swww query);
currentWallpaper="${currentWallpaper##*/}"

for ((i = 0; i < amountWallpapers; i++)); do
  wallpaper=$(basename "${wallpapers[$i]}")
  if [ $wallpaper == $currentWallpaper ]; then
    if [ $i -eq 0 ]; then
      previousWallpaper=$(basename "${wallpapers[$amountWallpapers - 1]}")
    else
      previousWallpaper=$(basename "${wallpapers[$i - 1]}")
    fi
    break
  fi
done

swww img "$WALLPAPERS_DIRECTORY/$previousWallpaper"
#wal -n -i "$WALLPAPERS_DIRECTORY/$previousWallpaper"
notify-send "Background: $previousWallpaper"
