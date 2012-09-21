#!/bin/bash

OWD="$(pwd)"
PRG="$(basename "$0")"

# set up ~
function setup() {
    CWD="$(pwd -P)"

    for FILE in $(git ls-files -- '.*'); do
        rm -f "$HOME/$FILE"
        ln -s "$CWD/$FILE" "$HOME"
    done
}

# update repo
cd "$(dirname "$0")"
git pull || exit $?


if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setup
else
    read -p "This may overwrite existing files in your home directory. Are you sure? [y/N] " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup
    fi
fi

# post-setup
unset setup
[ -f "$HOME/.bash_profile" ] && source "$HOME/.bash_profile"
cd "$OWD"
