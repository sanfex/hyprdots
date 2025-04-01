#!/bin/bash

configs=(
    "alacritty"
    "fastfetch"
    "fish"
    "hypr"
    "kitty"
    "mako"
    "nvim"
    "rofi"
    "swaylock"
    "swww"
    "waybar"
    "waypaper"
)

cp "$HOME/.bashrc" "./"
echo "Copied $HOME/.bashrc"

cp "$HOME/.zshrc" "./"
echo "Copied $HOME/.zshrc"

cp -r "$HOME/wallpapers" "./"
echo "Copied $HOME/wallpapers"

for config in "${configs[@]}"; do
    configRoute="$HOME/.config/$config"
    if [ -d "$configRoute" ]; then
        cp -r "$configRoute" "./.config/"
        echo "Copied $configRoute"
    else
        echo "$configRoute doesn't exists"
    fi
done

echo "Finished copying configs"
