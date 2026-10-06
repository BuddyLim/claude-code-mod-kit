#!/bin/sh
# Copies the kit into each mod's hooks/kit folder. A mod cannot import a file
# outside its own folder, so each carries a copy and stays usable when cloned
# alone. Run after editing anything under kit/:
#
#   ./sync.sh                 the mods under ~/.claude/skills that have a hooks/kit
#   ./sync.sh <mod folder>…   these mods (a first sync creates hooks/kit)

set -eu

here=$(cd "$(dirname "$0")" && pwd)

if [ "$#" -eq 0 ]; then
  set --
  for mod in "$HOME"/.claude/skills/*/; do
    [ -d "${mod}hooks/kit" ] && set -- "$@" "${mod%/}"
  done
fi

for mod in "$@"; do
  if [ ! -d "$mod/hooks" ]; then
    echo "skipped $mod: no hooks folder" >&2
    continue
  fi

  mkdir -p "$mod/hooks/kit"
  cp "$here"/kit/*.ts "$mod/hooks/kit/"
  echo "synced $mod"
done
