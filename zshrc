source <(antibody init)

export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
autoload -Uz compinit
compinit -i
antibody bundle < ~/.zsh_plugins

export TERM="xterm-256color"
export EDITOR="vim"

if command -v tmux>/dev/null; then
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

zle -N zle-line-init
zle -N zle-keymap-select
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Dircolors
if [[ -f /usr/bin/dircolors && -f $HOME/.dir_colors ]]; then
    eval $(dircolors -b $HOME/.dir_colors)
fi

alias dms='docker-machine.exe start default'

export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_CERT_PATH=~/.docker/machine/machines/default
export DOCKER_MACHINE_NAME=default
export COMPOSE_CONVERT_WINDOWS_PATHS=true
