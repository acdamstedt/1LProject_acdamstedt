#!/bin/sh
echo -ne '\033c\033]0;Mathemagicians\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Mathemagicians_Linux.x86_64" "$@"
