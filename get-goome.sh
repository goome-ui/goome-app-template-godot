#!/bin/sh
set -e
cd "$(dirname "$0")"
v="${1:-${GOOME_VERSION:-0.5.0}}"
curl -fsSL -o goome-addon.zip "https://github.com/goome-ui/godot-goome/releases/download/v$v/godot-goome-$v.zip"
rm -rf addons/goome
unzip -q -o goome-addon.zip
rm goome-addon.zip
echo "got goome $v into addons/goome"
