function run_with_firejail() {
    local exe

    for exe in "$@"; do
        if hash "$exe" 2>/dev/null; then
            if [[ -f /etc/firejail/${exe}.profile ]]; then
                eval "alias ${exe}='firejail ${exe}'"
            fi
        fi
    done
}
