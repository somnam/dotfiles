guess-colorfgbg ()
{
    if [ -z "$COLORFGBG" ]; then
        local prefix
        local bg
        stty -echo
        echo -ne '\x1b]11;?\x07'
        IFS=: read -t 0.1 -d $'\a' prefix bg
        if [[ ${bg:0:1} =~ [01234567] ]]; then
            export COLORFGBG='15;0'
        else
            export COLORFGBG='0;15'
        fi
        stty echo
    fi
}

guess-colorfgbg
