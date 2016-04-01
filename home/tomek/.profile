# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Clutter disable tearing.
export CLUTTER_PAINT=disable-clipped-redraws:disable-culling 
export CLUTTER_VBLANK=True

# Quiet AT warnings
export NO_AT_BRIDGE=1

# Colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Android
# export ANDROID_HOME=/home/tomek/.local/opt/android-sdk-linux
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Python
# export PYTHONPATH=$PYTHONPATH:/home/tomek/.local/lib/python2.7/site-packages
# export PYTHONSTARTUP=/home/tomek/.pystartup

# Nodejs
# export NODE_PATH=$NODE_PATH:$(npm root -g)
