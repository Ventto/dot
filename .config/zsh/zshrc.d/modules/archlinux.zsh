# pkgbuild PKG: fetch and print the PKGBUILD for PKG via yay
function pkgbuild()
{
	_require yay || return 1
	if ! yay --noredownload --getpkgbuild "$1" >/dev/null 2>&1; then
		return 1
	fi
	local pth
	if [[ -n $XDG_CACHE_HOME ]]; then
		pth="$XDG_CACHE_HOME/yay/$1/PKGBUILD"
	else
		pth="$HOME/.cache/yay/$1/PKGBUILD"
	fi
	if [[ ! -f $pth ]]; then
		_err "$pth: PKGBUILD does not exist"
		return 1
	fi
	cat "$pth"
}

alias aur-clean='touch a.{gz,zip,xz}; rm -rf pkg/ src/ *.{gz,xz,zip}'
alias aur-create='git clone ssh://aur@aur.archlinux.org/' # usage: aur-create PKGNAME
alias aur-install='aurclean && makepkg -i -C -c --noarchive && rm *.tar.gz'
alias aur-show='git diff --cached'
alias aur-update='makepkg --printsrcinfo > .SRCINFO && git add PKGBUILD .SRCINFO'
# Useful for testing package installation
alias aur-master="[ -f PKGBUILD.master ] && mv PKGBUILD PKGBUILD.nat && mv PKGBUILD.master PKGBUILD"
alias aur-nat="[ -f PKGBUILD.nat ] && mv PKGBUILD PKGBUILD.master && mv PKGBUILD.nat PKGBUILD"
