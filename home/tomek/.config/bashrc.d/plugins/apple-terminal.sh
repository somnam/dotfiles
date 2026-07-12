if [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
    export COLORTERM="${COLORTERM:=256}"
    if [[ "$LANG" == "C" || -z "$LANG" ]]; then
        export LANG="en_US.UTF-8"
    fi
    if [[ "$LC_ALL" == "C" || -z "$LC_ALL" ]]; then
        export LC_ALL="en_US.UTF-8"
    fi
fi
