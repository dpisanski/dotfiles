#!/usr/bin/env bash

# source: https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh 

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

# Returns the name of the package manager present on this system.
get_package_manager() {
    if command -v apt-get >/dev/null 2>&1; then
        echo "apt-get"
    else
        echo "";
    fi
}

do_apt_get() {
    sudo apt-get update -y && sudo apt-get dist-upgrade -y \
        && sudo apt-get install -y build-essential
}

update_packages() {
    local -r package_manager=$(get_package_manager)

    if [ "$package_manager" == "apt-get" ]; then
        do_apt_get
    else
        echo "Couldn't find a package manger"
    fi

}

sync() {
    rsync --exclude-from 'rsync_exclude_list.txt' -avh --no-perms . ~;
    source ~/.bash_profile;
}

# $1: force flag
main() {
    if [ "$1" == "--force" -o "$1" == "-f" ]; then
        update_packages
        sync;
    else
        read -p "This may overwrite existing files in your home directory and update packages. Are you sure? (y/n) " -n 1;
        echo "";
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            update_packages
            sync;
        fi;
    fi;
}

main $1
