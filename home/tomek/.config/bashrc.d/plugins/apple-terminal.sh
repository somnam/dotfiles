if [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
    export COLORTERM="${COLORTERM:=256}"
    [ "$LANG" = "C" ] || [ -z "$LANG" ] && export LANG=en_US.UTF-8
    [ "$LC_ALL" = "C" ] || [ -z "$LC_ALL" ] && export LC_ALL=en_US.UTF-8
fi
