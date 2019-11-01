# Path to your oh-my-zsh installation.
#export ZSH=/home/versloot/.oh-my-zsh

source $HOME/dotfiles/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle vi-mode
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle Tarrasch/zsh-autoenv
antigen bundle Tarrasch/zsh-bd
antigen bundle hcgraf/zsh-sudo
antigen bundle web-search
#antigen bundle HerringtonDarkholme/auto-fu
antigen bundle oz/safe-paste
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle colored-man-pages

# For SSH, starting ssh-agent is annoying

# Node Plugins
antigen bundle coffee
antigen bundle node
antigen bundle npm

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

#
# # Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
  #
antigen bundle zsh-users/zsh-completions src
#
# Load the theme.
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train

antigen bundle djui/alias-tips

# Tell antigen that you're done.
antigen apply

alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias fi="find . -iname "
alias reloadsettings="source ~/.zshrc"
alias chrome="sensible-browser"

setopt SHARE_HISTORY

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export VIMRC=~/.vimrc
export TERM=xterm-256color
export KEYTIMEOUT=1
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
