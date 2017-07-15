#!/bin/sh

# SSH
alias sak='ssh-add ~/.ssh/id_rsa'

# Package
alias aurclean="touch a.gz b.zip c.xz ; rm -rf pkg src *.gz *.xz *.zip"
alias aurinstall="aurclean && makepkg -i -C -c --noarchive && rm *.tar.gz"
alias aurcreate="git clone ssh://aur@aur.archlinux.org/"
alias aurshow="git diff --cached"
alias aurupdate="makepkg --printsrcinfo > .SRCINFO && git add PKGBUILD .SRCINFO"
alias aurmaster="[ -f PKGBUILD.master ] && mv PKGBUILD PKGBUILD.nat &&
mv PKGBUILD.master PKGBUILD; cd ../../; git a; bb; mv ../../master.tar.gz ."
alias aurnat="[ -f PKGBUILD.nat ] && mv PKGBUILD PKGBUILD.master &&
mv PKGBUILD.nat PKGBUILD"
