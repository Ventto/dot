#!/bin/zsh

alias reload=". $ZDOTDIR/.zshrc"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dot/ --work-tree=$HOME"

#==============================#
#           Patches            #
#==============================#

# Fix slow git autocompletion in huge repositories
__git_files () {
    _wanted files expl 'local files' _files
}

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

export BROWSER="firefox --profile '${HOME}/.config/firefox/default'"
export EDITOR="nvim"
export SUDO_EDITOR="rnano"
export TERMINAL="termite"
#export USE_EDITOR="$EDITOR -p"
export VISUAL="$EDITOR"
export GIMP2_DIRECTORY=".config/gimp"
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

#==============================#
#           Prompt             #
#==============================#

# Shell is running in a pseudo terminal slave
if tty | grep -E '^/dev/pts/[0-9]+$' >/dev/null 2>&1; then
    if [ -f "${HOME}/.config/zsh/zshrc.d/prompts/stupid-zsh-prompt/prompt.zsh" ];
    then
        source "${HOME}/.config/zsh/zshrc.d/prompts/stupid-zsh-prompt/prompt.zsh"
    fi
else
    setopt prompt_subst

    # Enable colors in prompt
    autoload -U colors && colors

    PROMPT=$'%{$bg[${prompt_bg_color}]%}%{$fg[black]%}[%D{%M:%S}]${cpwd}${icon} # %{$reset_color%} '
    function precmd {
        [ "$?" -eq 0 ] && prompt_bg_color="green" || prompt_bg_color="red"
        [ -z "${vcs_info_msg_0_}" ] && cpwd=$' %~ ' || cpwd=$''
    }
fi

#==============================#
#          Functions           #
#==============================#

##
# The helper script provides "add_*" functions for adding Shell's resources
# such as functions, aliases and more in an elegant way.
# For more details, see the sources. The resources are stored in the "zshrc.d"
# directory.
source "${ZDOTDIR}/zshrc.d/helper.zsh"

##
# Caution: Source functions first, aliases could require functions, but
#          functions don't require alias.
#
add_functions 'file-utils'
add_functions 'maths'
add_functions 'systemd'
add_functions 'dev'

#==============================#
#           Aliases            #
#==============================#

add_aliases 'apps'
add_aliases 'base'
add_aliases 'systemd'
add_aliases 'dev'
add_aliases 'firejail'
add_aliases 'network'
add_aliases 'overrided-cmds'

#==============================#
#          Completion          #
#==============================#

add_comp 'base'

autoload -U +X bashcompinit && bashcompinit
add_bash_comp 'ct-ng'

#==============================#
#           Bindkeys           #
#==============================#

add_bindkeys 'base'
add_bindkeys 'edit-command-line'
add_bindkeys 'fg-ctrlz'

#==============================#
#           Plugins            #
#==============================#
#
# Caution: Plugins are standalone files which do not depend from external
#          function, alias or anything else.

# Open a new terminal from current directory
[ $TERM = "xterm-termite" ] && add_plugin 'vte-current-dir'

# Helps setting the terminal title at runtime
add_plugin 'mywin_title'
