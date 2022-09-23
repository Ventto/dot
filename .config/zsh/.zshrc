#!/bin/zsh

alias reload=". $ZDOTDIR/.zshrc"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"

# Fix slow git autocompletion
# FIXME: Did it work ?
fpath=("${ZDOTDIR}/zshrc.d/completions" $fpath)

#==============================#
#           Options            #
#==============================#

# History

HISTFILE=~/.cache/zsh_hist
HISTSIZE=1000000
SAVEHIST=1000000
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Directory

DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
setopt RM_STAR_WAIT
setopt NOGLOBDOTS
setopt AUTO_CD
REPORTTIME=5

#==============================#
#    Environment Variables     #
#==============================#
#
export XDG_CONFIG_HOME="${HOME}/.config"
# Basic internals
export BROWSER="env MOZ_ENABLE_WAYLAND=1 firefox --profile ${XDG_CONFIG_HOME}/firefox"
export EDITOR="nvim"
export LANG=en_US.UTF-8
export LESSHISTFILE=/dev/null
export PATH="/usr/local/bin:${HOME}/.local/bin:${PATH}"
export SUDO_EDITOR="rnano"
export VISUAL="$EDITOR"
# Dev
export ANDROID_HOME="/opt/android-sdk"
export GOPATH="$HOME/.config/go"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/xtools/arm-unknown-eabi/bin:${PATH}"
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export XDG_CURRENT_DESKTOP=Unity
# Themes, cursors and icons
## GTK2
### Force the theme and settings of few applications still in GTK2 (ex: gimp)
export GTK2_RC_FILES="/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc:${HOME}/.gtkrc-2.0"
export GIMP2_DIRECTORY=".config/gimp"
## GTK3
## Force the theme of few applications such as gnome ones
export GTK_THEME=Arc-Dark
export GTK_DATA_PREFIX=
## QT5
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_FONT_DPI=96

#==============================#
#          Prompts             #
#==============================#

# Shell is running in a pseudo terminal slave
if tty | grep -E '^/dev/pts/[0-9]+$' >/dev/null 2>&1; then
    custom_prompt="${ZDOTDIR}/.p10k.zsh"
    if [ -f $custom_prompt ];
    then
        source "${HOME}/.local/share/powerlevel10k/powerlevel10k.zsh-theme"
        source "$custom_prompt"
        default_prompt=false
    fi
    unset custom_prompt
else
    default_prompt=true
fi
if $default_prompt; then
    setopt prompt_subst
    # Enable colors in prompt
    autoload -U colors && colors

    PROMPT=$'%{$bg[${prompt_bg_color}]%}%{$fg[black]%}[%D{%H:%M}]${cpwd}${icon}  %{$reset_color%} '
    function precmd {
        [ "$?" -eq 0 ] && prompt_bg_color="green" || prompt_bg_color="red"
        [ -z "${vcs_info_msg_0_}" ] && cpwd=$' %~ ' || cpwd=$''
    }
fi

#==============================#
#           Sources            #
#==============================#
# Caution: Source functions first, aliases could require functions, but
# functions don't require alias.
# Before sourcing
source "${ZDOTDIR}/zshrc.d/funcs/internals.zsh"

typeset -a _bindkeys _funcs _aliases _completions

_bindkeys=( base edit-command-line fg-ctrlz )
_funcs=( base pkg security )
_aliases=( base dev pkg mounts )
_completions=( base )

for dir in _bindkeys _funcs _aliases _completions; do
    for file in ${(P)dir}; do
        source "${ZDOTDIR}/zshrc.d/${dir:1}/${file}.zsh"
    done
    eval "unset ${dir}"
done

# After sourcing
run_with_firejail okular eom riot-desktop
