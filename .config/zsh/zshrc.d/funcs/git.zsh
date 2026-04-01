function git-profile()
{
	case $1 in
		ventto)
			_show git config --local user.name "Thomas Venriès"
			_show git config --local user.email "thomas.venries@gmail.com"
			;;
		*)
			_err "${1}: unkown profile"
			;;
	esac
}
