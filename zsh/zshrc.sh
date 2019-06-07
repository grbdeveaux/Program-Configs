time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Source other zsh files
source ~/Documents/GitHub/Program-Configs/zsh/zshrc2.sh
source ~/Documents/GitHub/Program-Configs/zsh/zshrc_alias.sh
#source ~/Documents/GitHub/Program-Configs/zsh/prompt.sh
source ~/Documents/GitHub/Program-Configs/zsh/keybindings.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"