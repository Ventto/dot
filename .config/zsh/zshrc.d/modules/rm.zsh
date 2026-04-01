r()
{
	_require rip
	case "$PWD" in
		"/" | "/usr" | "/bin" | "/etc")
			echo "🚫 Dangerous location: $PWD"
			return 1
			;;
	esac

	rip "$@"
}
