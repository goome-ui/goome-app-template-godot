#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."

source_repo=goome-ui/godot-goome

latest=$(gh api "repos/$source_repo/releases/latest" -q .tag_name)
latest=${latest#v}
current=$(sed -n 's#.*GOOME_VERSION:-\([0-9.]*\)}.*#\1#p' get-goome.sh | head -n1)
echo "latest $latest, pinned $current"

if ! [[ $latest =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || [ -z "$current" ]; then
  echo "cannot read a clean version, nothing to do"
  exit 0
fi
highest=$(printf '%s\n%s\n' "$latest" "$current" | sort -V | tail -n1)
if [ "$latest" = "$current" ] || [ "$highest" != "$latest" ]; then
  echo "up to date"
  exit 0
fi

if ! gh release view "v$latest" -R "$source_repo" --json assets -q '.assets[].name' | grep -qx "godot-goome-$latest.zip"; then
  echo "release v$latest has no addon zip yet, nothing to do"
  exit 0
fi

pin_version() {
  sed -i "s/GOOME_VERSION:-[0-9][0-9.]*}/GOOME_VERSION:-$latest}/" get-goome.sh
  sed -i "s/else { \"[0-9][0-9.]*\" }/else { \"$latest\" }/" get-goome.ps1
}

smoke_test() {
  ./get-goome.sh
  test -f addons/goome/goome.gdextension
  test -f addons/goome/plugin.cfg
  test -s addons/goome/bin/libgoome.linux.x86_64.so
  rm -rf addons/goome
}

pin_version
git diff --stat

if [ -z "${GOOME_NOSMOKE:-}" ]; then
  smoke_test
fi

if [ -n "${GOOME_DRY:-}" ]; then
  echo "dry run, not committing"
  exit 0
fi

git config user.name "$(git log -1 --format=%an)"
git config user.email "$(git log -1 --format=%ae)"

git add get-goome.sh get-goome.ps1
git commit -q -m "Bump goome to $latest"
git push -q origin HEAD:dev

git checkout -q -B main origin/main
pin_version
if git diff --quiet; then
  echo "main already pinned to $latest"
  exit 0
fi
git add get-goome.sh get-goome.ps1
git commit -q -m "Update to goome $latest"
git push -q origin main
