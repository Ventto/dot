function _log()
{
	local readonly msg="$1"

	printf "%s: %s\n" "${funcstack[3]}" "$msg"
}

function _err()
{
	_log "$@" >&2
}

# Checks the given command is an existing plain executable
function _require()
{
	local cmd

	for cmd in "$@"; do
		if ! hash "$cmd" >/dev/null 2>&1; then
			_err "'${cmd}' command not found"
			return 1
		fi
	done
}

function _systemd_active()
{
	ps --no-headers -o comm 1 | grep systemd >/dev/null 2>&1
}
