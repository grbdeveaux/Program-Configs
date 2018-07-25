time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Source other zsh files
source ~/Documents/GitHub/dotfiles/zsh/zshrc.sh
source ~/Documents/GitHub/dotfiles/zsh/zshrc_alias.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"