#!/bin/zsh

alias reload=". $ZDOTDIR/.zshrc"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"

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

export XDG_CONFIG_HOME="${HOME}/.config"
export BROWSER="firefox --profile '${XDG_CONFIG_HOME}/firefox/default'"
export EDITOR="nvim"
export SUDO_EDITOR="rnano"
export VISUAL="$EDITOR"
export GIMP2_DIRECTORY=".config/gimp" # FIXME: sure about relative path ?
export LANG=en_US.UTF-8
export GOPATH="$HOME/.config/go"
export PATH="/usr/local/bin:${HOME}/.local/bin:${PATH}"
export PATH="/opt/xtools/arm-unknown-eabi/bin:${PATH}"
export PATH="$HOME/.cargo/bin:$PATH"
export ANDROID_HOME="/opt/android-sdk"
export LESSHISTFILE=/dev/null
export XDG_CURRENT_DESKTOP=Unity
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_FONT_DPI=96
export GTK2_RC_FILES="/usr/share/themes/Arc-Dark/gtk-2.0/gtkrc:${HOME}/.gtkrc-2.0"
export GTK_DATA_PREFIX=
export GTK_THEME=Arc-Dark
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

#==============================#
#           Prompt             #
#==============================#

default_prompt=true
# Shell is running in a pseudo terminal slave
if tty | grep -E '^/dev/pts/[0-9]+$' >/dev/null 2>&1; then
    if [ -f "${HOME}/.config/zsh/zshrc.d/prompts/stupid-zsh-prompt/prompt.zsh" ];
    then
        source "${HOME}/.config/zsh/zshrc.d/prompts/stupid-zsh-prompt/prompt.zsh"
        default_prompt=false
    fi
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
#          Functions           #
#==============================#
# Caution: Source functions first, aliases could require functions, but
# functions don't require alias.
#
. "${ZDOTDIR}/zshrc.d/function/common.zsh"

for file in {base,dev} ; do
    . "${ZDOTDIR}/zshrc.d/function/${file}.zsh"
done

#==============================#
#           Aliases            #
#==============================#

for file in {base,dev,firejail,mounts} ; do
    . "${ZDOTDIR}/zshrc.d/alias/${file}.sh"
done

#==============================#
#          Completion          #
#==============================#

. "${ZDOTDIR}/zshrc.d/completion/base.zsh"
#autoload -U +X bashcompinit && bashcompinit

#==============================#
#           Bindkeys           #
#==============================#

for file in {base,edit-command-line,fg-ctrlz} ; do
    . "${ZDOTDIR}/zshrc.d/bindkey/${file}.zsh"
done

#==============================#
#           Plugins            #
#==============================#
#
# Caution: Plugins are standalone files which do not depend from external
#          function, alias or anything else.

# Open a new terminal from current directory
if [ $TERM = "xterm-termite" ]; then
    . "${ZDOTDIR}/zshrc.d/plugins/vte-current-dir.zsh"
fi

# Helps setting the terminal title at runtime
. "${ZDOTDIR}/zshrc.d/plugins/mywin_title.zsh"

#==============================#
#      External Shell RC       #
#==============================#

. "${HOME}/workspace/crydio/config/bashrc"
#. "${HOME}/workspace/crydio/customers/scaleway/zsh/zshrc"
