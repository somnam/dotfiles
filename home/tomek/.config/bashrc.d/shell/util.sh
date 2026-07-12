remove_path() {
    local dir="${1%/}"
    PATH=":${PATH}:"
    PATH="${PATH//:${dir}:/:}"
    PATH="${PATH#:}"
    PATH="${PATH%:}"
}

prepend_path() {
    local dir="${1%/}"
    remove_path "$dir"
    export PATH="${dir}${PATH:+:$PATH}"
}
