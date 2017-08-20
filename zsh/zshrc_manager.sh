time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Source other zsh files
source ~/dotfiles/zsh/zshrc.sh
source ~/dotfiles/zsh/zshrc_alias.sh

# removed because it clashed with emacs
## Run tmux if exists
#if command -v tmux>/dev/null; then
#    [ -z $TMUX ] && exec tmux
#else
#    echo "tmux not installed. Run ./deploy to configure dependencies"
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
