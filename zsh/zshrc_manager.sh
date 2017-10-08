time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Source other zsh files
source ~/dotfiles/zsh/zshrc.sh
source ~/dotfiles/zsh/zshrc_alias.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
