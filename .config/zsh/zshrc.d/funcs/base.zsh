# c [FILE...]: view FILE with syntax highlighting, or pick with fzf
function c()
{
	_require bat fzf || return 1
	if [ $# -gt 0 ]; then
		bat "$@"
	else
		bat "$(fzf)"
	fi
}

# e [FILE...]: open FILE(s) in nvim, or pick with fzf if no args
function e()
{
	_require nvim fzf || return 1
	local -r editor=(nvim -p)
	if [ "$#" -eq 0 ]; then
		${editor} $(fzf -m)
	else
		${editor} "$@"
	fi
}

# o [PATH]: open PATH with xdg-open, or current dir if no args
function o()
{
	_require xdg-open || return 1
	if [ $# -eq 0 ]; then
		run xdg-open .
	else
		run xdg-open "$@"
	fi
}

# r [FILE...]: safe rip wrapper, blocks deletions from dangerous locations
function r()
{
	_require rip || return 1
	case "$PWD" in
		"/" | "/usr" | "/bin" | "/etc")
			echo "🚫 Dangerous location: $PWD"
			return 1
			;;
	esac

	rip "$@"
}

# p NAME: show process info by name
function p()
{
	_require pgrep || return 1
	if [[ $# == 0 ]]; then
		return 1
	fi
	local readonly pid="$(pgrep -d, -x "$1")"
	if [[ -z $pid ]]; then
		return 1
	fi
	ps -fp "$pid"
}

# m [NAME]: show memory usage summary sorted by pss
function m()
{
	_require smem || return 1
	smem -M "$1" -s pss --total --abbreviate
}

# cdf [DIR]: cd into DIR, or pick a directory with fzf
function cdf()
{
	_require fd fzf || return 1
	if [ "$#" -eq 0 ]; then
		cd $(fd --type d | fzf)
	else
		cd "$@"
	fi
}

# mkd DIR: create directory and cd into it
function mkd()
{
	mkdir -p "$@"
	cd "$@" || exit
}

# tmpd [NAME]: create a temp dir and cd into it
function tmpd()
{
	_require mktemp || return 1
	local dir
	if [ $# -eq 0 ]; then
		dir=$(mktemp -d)
	else
		dir=$(mktemp -d -t "${1}.XXXXXXXXXX")
	fi
	cd "$dir" || exit
}

# run CMD [ARGS]: run CMD detached from terminal (nohup + disown)
function run()
{
	_require nohup || return 1
	nohup "$@" >/dev/null 2>&1 &
	disown
}

# targz DIR: create a .tar.gz archive of DIR using best available compressor
function targz()
{
	_require tar || return 1
	local readonly tmpFile="${1%/}.tar"
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${1}" || return 1

	size=$(
		stat -f"%z" "${tmpFile}" 2>/dev/null # OS X `stat`
		stat -c"%s" "${tmpFile}" 2>/dev/null # GNU `stat`
	)

	local cmd=""
	if ((size < 52428800)) && hash zopfli 2>/dev/null; then
		# the .tar file is smaller than 50 MB and Zopfli is available; use it
		cmd="zopfli"
	else
		if hash pigz 2>/dev/null; then
			cmd="pigz"
		else
			cmd="gzip"
		fi
	fi

	echo "Compressing .tar using \`${cmd}\`…"
	"${cmd}" -v "${tmpFile}" || return 1
	[ -f "${tmpFile}" ] && rm "${tmpFile}"
	echo "${tmpFile}.gz created successfully."
}

# fs [PATH...]: show size of files or total size of a directory
function fs()
{
	if du -b /dev/null >/dev/null 2>&1; then
		local readonly arg=-sbh
	else
		local readonly arg=-sh
	fi
	# shell_check disable=SC2199
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg -- .[^.]* *
	fi
}

# diff FILE1 FILE2: colored word-level diff via git
function diff()
{
	_require git || return 1
	git diff --no-index --color-words "$@"
}

# dataurl FILE: encode FILE as a base64 data URL
function dataurl()
{
	local mimeType
	mimeType=$(file -b --mime-type "$1")
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# shorten URL: create a short URL via is.gd (no tracking)
function shorten()
{
	_require curl || return 1
	if [ -z "${1}" ]; then
		echo "Usage: \`shorten url\`"
		return 1
	fi
	curl -s "https://is.gd/create.php?format=simple&logstats=0&url=${1}"
	echo
}

# weather [LOC]: print weather for LOC or current location
function weather()
{
	_require curl || return 1
	local loc
	loc="$(echo "$1" | tr ' ' '+')"
	curl -s "wttr.in/${loc}"
}

# server [PORT]: start HTTP server in current dir (default port: 8000)
server()
{
	_require python3 || return 1
	local readonly port="${1:-8000}"
	sleep 1 && open "http://localhost:${port}/" &
	python3 -m http.server "$port"
}

# bin2dec N: binary to decimal
function bin2dec()
{
	_require bc tr || return 1
	echo "ibase=2; ${1}" | bc
}

# dec2bin N: decimal to binary
function dec2bin()
{
	_require bc tr || return 1
	echo "obase=2; ${1}" | bc
}

# dec2hex N: decimal to hex
function dec2hex()
{
	_require bc tr || return 1
	echo "obase=16; ${1}" | bc
}

# hex2dec N: hex to decimal
function hex2dec()
{
	_require bc tr || return 1
	echo "ibase=16; $(echo "${1}" | tr '[a-z]' '[A-Z]')" | bc
}

# ixargs CMD: run CMD in a zsh interactive shell for each stdin line
function ixargs()
{
	_require xargs || return 1
	xargs -I{} zsh -ic "$@"
}

# until_ok TIMEOUT CMD: retry CMD every second until success or timeout
function until_ok()
{
	local timeout="$1"
	shift
	while ! eval "$@" && [[ $((timeout--)) > 0 ]]; do
		sleep 1
	done
}

# secret CMD: run CMD without saving it to history
function secret()
{
	history -d $((HISTCMD - 1))
	history -d $((HISTCMD - 3))
	history -d $((HISTCMD - 2))
	unset HISTFILE
	$@
}
