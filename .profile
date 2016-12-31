# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# ~/.profile has the stuff NOT specifically related to bash, such as environment variables (PATH and friends)

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# add pip local bin to path
if [[ -d "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -a "/usr/local/bin/aws_completer" ] ; then
    complete -C '/usr/local/bin/aws_completer' aws
fi

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    :
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # colored terminal in OSX
    export CLICOLOR=1
fi

if [[ -x "/usr/libexec/java_home" ]]; then
    export JAVA_HOME="$(/usr/libexec/java_home)"
fi
