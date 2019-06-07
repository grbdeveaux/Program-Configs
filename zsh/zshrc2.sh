## Path to your oh-my-zsh installation.
export ZSH=/Users/grbdeveaux/.oh-my-zsh

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh

# Vars
    HISTFILE=~/.zsh_history
    SAVEHIST=100
    setopt inc_append_history # To save every command before it is executed
    setopt share_history # setopt inc_append_history

#So tmux supports powerline colors?
export TERM="xterm-256color"

#Functions

# Custom cd
function cd()
{
    builtin cd "$*" && ls -Gf
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# Set vim as default git editor
git config --global core.editor /usr/bin/vim

# For vim mappings:
stty -ixon

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi