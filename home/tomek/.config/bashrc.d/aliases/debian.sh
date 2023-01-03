apt-up ()
{
    sudo apt update && \
        sudo apt full-upgrade && \
        sudo apt autoremove --purge && \
        sudo apt autoclean
}

apt-clean ()
{
    sudo apt autoremove --purge && \
        sudo apt autoclean
}
