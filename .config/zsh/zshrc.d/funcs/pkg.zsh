if _require yay; then
	pkgbuild()
	{
		if ! yay --noredownload --getpkgbuild "$1" >/dev/null 2>&1; then
			return $?
		fi
		local pth
		if [[ -n $XDG_CACHE_HOME ]]; then
			pth="$XDG_CACHE_HOME/yay/$1/PKGBUILD"
		else
			pth="$HOME/.cache/yay/$1/PKGBUILD"
		fi
		if [[ ! -f $pth ]]; then
			_err "$pth: PKGBUILD does not exist"
			return $?
		fi
		cat "$pth"
	}
fi
