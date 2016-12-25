#!/usr/bin/env bash

# source: https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh 

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

sync() {
    rsync --exclude-from 'rsync_exclude_list.txt' -avh --no-perms . ~;
    source ~/.bash_profile;
}

# $1: force flag
main() {
    if [ "$1" == "--force" -o "$1" == "-f" ]; then
        sync;
    else
        read -p "This may overwrite existing files in your home directory and update packages. Are you sure? (y/n) " -n 1;
        echo "";
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sync;
        fi;
    fi;
}

main $1
