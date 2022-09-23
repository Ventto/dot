alias aur-clean='touch a.{gz,zip,xz}; rm -rf pkg/ src/ *.{gz,xz,zip}'
# Usage: aur-create PKGNAME
alias aur-create='git clone ssh://aur@aur.archlinux.org/'
alias aur-install='aurclean && makepkg -i -C -c --noarchive && rm *.tar.gz'
alias aur-show='git diff --cached'
alias aur-update='makepkg --printsrcinfo > .SRCINFO && git add PKGBUILD .SRCINFO'
# Useful for testing package installation
alias aur-master="[ -f PKGBUILD.master ] && mv PKGBUILD PKGBUILD.nat
                                         && mv PKGBUILD.master PKGBUILD"
alias aur-nat="[ -f PKGBUILD.nat ] && mv PKGBUILD PKGBUILD.master
                                   && mv PKGBUILD.nat PKGBUILD"
