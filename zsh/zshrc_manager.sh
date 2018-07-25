time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Source other zsh files
source ~/Documents/GitHub/dotfiles/zsh/zshrc.sh
source ~/Documents/GitHub/dotfiles/zsh/zshrc_alias.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# if [ -n "$INSIDE_EMACS" ]; then
#     export TERM=eterm-color
#     export PAGER=cat
# else
#     export TERM=xterm-256color
# fi
# stty -ixon -ixoff
