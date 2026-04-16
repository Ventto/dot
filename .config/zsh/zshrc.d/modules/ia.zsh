function cx() {
    local codex_config_root selected current_config
    local -a configs

    codex_config_root="${XDG_CONFIG_HOME:-$HOME/.config}/codex/configs"

    if [[ ! -d "${codex_config_root}" ]]; then
        echo "No Codex configs found in ${codex_config_root}" >&2
        return 1
    fi

    configs=("${codex_config_root}"/*(/N:t))

    if (( ${#configs[@]} == 0 )); then
        echo "No Codex configs found in ${codex_config_root}" >&2
        return 1
    fi

    if [[ -n "${CODEX_HOME}" && "${CODEX_HOME}" == "${codex_config_root}/"* && -d "${CODEX_HOME}" ]]; then
        current_config="${CODEX_HOME:t}"
    fi

    if command -v fzf >/dev/null 2>&1; then
        selected="$(
            printf '%s\n' "${configs[@]}" | fzf \
                --prompt='Codex config> ' \
                --height=10 \
                --reverse \
                ${current_config:+--header="Current: ${current_config}"}
        )"
    else
        select selected in "${configs[@]}"; do
            [[ -n "${selected}" ]] && break
        done
    fi

    if [[ -z "${selected}" ]]; then
        return 1
    fi

    CODEX_HOME="${codex_config_root}/${selected}" command codex "$@"
}
