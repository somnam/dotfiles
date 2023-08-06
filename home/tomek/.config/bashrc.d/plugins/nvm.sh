if [ -d ${HOME}/.nvm ]; then
    export NVM_DIR=${HOME}/.nvm
    [[ -s "$NVM_DIR/nvm.sh" ]] && source $NVM_DIR/nvm.sh
    [[ -r $NVM_DIR/bash_completion ]] && source $NVM_DIR/bash_completion
fi
