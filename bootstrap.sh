#!/bin/bash

OWD="$(pwd)"
PRG="$(basename "$0")"

# set up ~
function setup() {
    CWD="$(pwd -P)"

    for DIR in $(find "$CWD/files" -type d -mindepth 1 | sort); do
        mkdir -p "$HOME/.${DIR#$CWD/files/}"
    done

    for FILE in $(find "$CWD/files" -type f -mindepth 1); do
        TARGET="$HOME/.${FILE#$CWD/files/}"

        [ -e "$TARGET" -a ! -h "$TARGET" ] && mv "$TARGET" "$TARGET.bak"
        ln -nfs "$FILE" "$TARGET"
    done

    for DIR in $(find "$CWD/dirs" -type d -mindepth 1 -maxdepth 1); do
        TARGET="$HOME/.${DIR##*/}"

        [ -e "$TARGET" -a ! -h "$TARGET" ] && mv "$TARGET" "$TARGET.bak"
        ln -nfs "$DIR" "$TARGET"
    done
}

# update repo
cd "$(dirname "$0")"
git pull || exit $?
git submodule init || exit $?
git submodule update || exit $?


if [ "$1" == "--force" -o "$1" == "-f" ]; then
    setup
else
    read -p "This WILL overwrite existing files in your home directory. Are you sure? [y/N] " -n 1
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup
    fi
fi

# post-setup
unset setup
[ -f "$HOME/.bash_profile" ] && source "$HOME/.bash_profile"
cd "$OWD"
