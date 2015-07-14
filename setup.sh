#!/usr/bin/env bash

do_apt_get() {
	sudo apt-get update -y && sudo apt-get dist-upgrade -y \
		&& sudo apt-get install -y build-essential
}

# Returns the name of the package manager present on this system.
get_package_manager() {
	if command -v apt-get >/dev/null 2>&1; then
		echo "apt-get"
	else
		echo "";
	fi
}

# $1 The name of the local distribution 
main() {
	local -r package_manager=$(get_package_manager)

	if [ "$package_manager" == "apt-get" ]; then
		do_apt_get
	else
		echo "Couldn't find a package manger"
	fi

}

main "$@"
