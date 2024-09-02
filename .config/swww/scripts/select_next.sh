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
    if [ $i -eq $(($amountWallpapers - 1)) ]; then
      nextWallpaper=$(basename "${wallpapers[0]}")
    else
      nextWallpaper=$(basename "${wallpapers[$i + 1]}")
    fi
    break
  fi
done

swww img "$WALLPAPERS_DIRECTORY/$nextWallpaper"
#wal -n -i "$WALLPAPERS_DIRECTORY/$nextWallpaper"
notify-send "Background: $nextWallpaper"
