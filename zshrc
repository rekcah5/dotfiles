source $HOME/antigen.zsh

if [[ -f /etc/commonprofile ]]; then
    source /etc/commonprofile
fi

export TERM="xterm-256color"
export EDITOR="vim"
export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"

# Load the oh-my-zsh's library
antigen use oh-my-zsh

antigen bundle git
# Syntax highlighting bundle.
antigen bundle zdharma/fast-syntax-highlighting
# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions
# Extra zsh completions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search 
antigen bundle zdharma/history-search-multi-word
antigen bundle joel-porquet/zsh-dircolors-solarized.git
antigen bundle autojump
antigen bundle safe-paste

# Load the theme
antigen theme nick 

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

# Dircolors
if [[ -f /usr/bin/dircolors && -f $HOME/.dir_colors ]]; then
    eval $(dircolors -b $HOME/.dir_colors)
fi
