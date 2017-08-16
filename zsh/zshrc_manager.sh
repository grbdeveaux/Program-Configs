time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

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
#
