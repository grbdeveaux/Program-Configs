time_out () { perl -e 'alarm shift; exec @ARGV' "$@"; }
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

## Path to your oh-my-zsh installation.
export ZSH=/Users/grbdeveaux/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    archlinux
    colored-man-pages
    colorize
    dirhistory
    fzf
    )


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

# ALIASES
# Configs and tools
alias omzs="nvim ~/.oh-my-zsh"
alias szs="source ~/.zshrc"
alias uzs="source ~/.zshrc"
alias etm="nvim ~/.tmux.conf"
alias etml="nvim ~/.tmux.conf.local"
alias cdnv="cd ~/.config/nvim/"
alias ebrc="nvim ~/.bashrc"
alias updatebrc="source ~/.bashrc"

# Others
alias db="cd ~/Dropbox/"
alias da='date "+%Y-%m-%d %A %T %Z"' #Show the date

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias svi='sudo vi'
alias vis='nvim "+set si"'

# Change directory aliases
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Ah' # show hidden files
alias lf='ls -aFh' # file type extensions
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'


# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# git
function git_prepare() {
    if [ -n "$BUFFER" ];
    then
        BUFFER="git add -A; git commit -m \"$BUFFER\" && git push"
    fi

    if [ -z "$BUFFER" ];
    then
        BUFFER="git add -A; git commit -v && git push"
    fi

    zle accept-line
}
zle -N git_prepare
bindkey "gpp" git_prepare

# Edit and rerun
    function edit_and_run() {
        BUFFER="fc"
        zle accept-line
    }
    zle -N edit_and_run
    bindkey "^v" edit_and_run

# Enter
    function enter_line() {
        zle accept-line
    }
    zle -N enter_line
    bindkey "^o" enter_line

# Sudo
    function add_sudo() {
        BUFFER="sudo "$BUFFER
        zle end-of-line
    }
    zle -N add_sudo
    bindkey "^s" add_sudo

# Miscellaneous Disordered
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
PATH="/Users/grbdeveaux/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/grbdeveaux/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/grbdeveaux/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/grbdeveaux/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/grbdeveaux/perl5"; export PERL_MM_OPT;
export PATH="/usr/local/opt/texinfo/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/qt@5/bin:$PATH"
eval $(thefuck --alias)
alias gah='fuck'
alias plz='sudo'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# FZF 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
## CTRL-T - Paste the selected files and directories onto the command-line
## CTRL-R - Paste the selected command from history onto the command-line
## ALT-C - cd into the selected directory
