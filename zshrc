source $HOME/antigen.zsh
source /etc/commonprofile   
#source ~/.bin/tmuxinator.zsh
export TERM="xterm-256color"
export EDITOR="vim"
export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundle git
antigen bundle <<EOBUNDLES
    # Bundles from the default repo (robbyrussell's oh-my-zsh)
    git

    # Syntax highlighting bundle.
    #zsh-users/zsh-syntax-highlighting
    zdharma/fast-syntax-highlighting

    # Fish-like auto suggestions
    zsh-users/zsh-autosuggestions

    # Extra zsh completions
    zsh-users/zsh-completions

    zsh-users/zsh-history-substring-search 

    zdharma/history-search-multi-word

    autojump
    safe-paste
EOBUNDLES

# Load the theme
antigen theme mh




# Tell antigen that you're done
antigen apply

if command -v tmux>/dev/null; then
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

#Fix nice WSL errors
unsetopt BG_NICE

# Zsh VIM
bindkey -v
export KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
