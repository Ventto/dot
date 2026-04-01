zj()
{
	local root session layout fallback_layout

	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		root="$(git rev-parse --show-toplevel)"
		session="$(basename "$root")"
		layout="$root/.zellij/layout.kdl"
		fallback_layout="dev"
	else
		root="$PWD"
		session="shell_$(basename "$PWD")"
		layout=""
		fallback_layout="dev"
	fi

	cd "$root" || return 1

	if [[ -n "$ZELLIJ" ]]; then
		echo "Already inside Zellij"
		return 0
	fi

	if [[ $# -gt 0 ]]; then
		zellij "$@"
		return $?
	fi

	if zellij list-sessions --no-formatting 2>/dev/null | grep -Eq "^${session} "; then
		zellij attach "$session"
		return $?
	fi

	if [[ -f "$layout" ]]; then
		zellij attach --create-background "$session" options --default-layout "$layout" &&
			zellij attach "$session"
	else
		zellij attach --create-background "$session" options --default-layout "$fallback_layout" &&
			zellij attach "$session"
	fi
}
