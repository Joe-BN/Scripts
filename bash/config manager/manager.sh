#!/usr/bin/env bash

guide="$1"

if [[ -z "$guide" ]]; then
  echo "Usage: $0 <name>"
  echo "   -> the short form of the path you want to track"
  exit 1
fi

push_dir="/home/$USER/Github"

if [[ "$guide" == "conf" ]]; then
  path="/etc/nixos/"
  destination="$push_dir/NixOS-configuration/"  

elif [[ "$guide" == "dot" ]]; then
  path="/home/$USER/.config/"
  destination="$push_dir/Dotfiles/"

else
  echo "Error !!!"
  echo "UNKNOWN input"
  exit 1
fi


sudo rsync -av --delete --exclude='.git/' "$path" "$destination"
cd "$destination"
git add .
git commit -m "Update $(date)"
git push