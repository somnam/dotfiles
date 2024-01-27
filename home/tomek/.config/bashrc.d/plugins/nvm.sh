if [ -d ${HOME}/.nvm ]; then
    export NVM_DIR=${HOME}/.nvm
    [[ -r $NVM_DIR/bash_completion ]] && source $NVM_DIR/bash_completion
fi
