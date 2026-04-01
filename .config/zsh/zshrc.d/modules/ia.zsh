function codex() {
    local system_prompt

    system_prompt="$(cat ~/.codex/system.md)"
    command codex "${system_prompt}"$'\n\n'"$*"
}
