time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }

# Run tmux if exists
if command -v tmux>/dev/null; then
	[ -z $TMUX ] && exec tmux
else
	echo "tmux not installed. Run ./deploy to configure dependencies"
fi

# Source other zsh files
source ~/dotfiles/zsh/zshrc.sh
source ~/dotfiles/zsh/zshrc_alias.sh
