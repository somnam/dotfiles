# Editor
export EDITOR='vim'

# Colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Android
# export ANDROID_HOME=/home/tomek/.local/opt/android-sdk-linux
# export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Python
export PYTHONPATH=$PYTHONPATH:/home/tomek/.local/lib/python2.7/site-packages
export PYTHONSTARTUP=/home/tomek/.pystartup

# Nodejs
export NODE_PATH=$NODE_PATH:$(npm root -g)

# Git
export GIT_PS1_SHOWDIRTYSTATE='y'
export GIT_PS1_SHOWSTASHSTATE='y'
export GIT_PS1_SHOWUNTRACKEDFILES='y'
export GIT_PS1_DESCRIBE_STYLE='contains'
export GIT_PS1_SHOWUPSTREAM='auto'

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=4
