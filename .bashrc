# ~/.bashrc: executed by bash(-1) for non-login shells.

# SOURCE ALIASES
source ~/.bashrc_aliases


#######################################################
# SOURCED ALIAS'S AND SCRIPTS
#######################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
fi

#######################################################
# EXPORTS
#######################################################

# Disable the bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest > 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=vim
export VISUAL=gvim

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Alias's to change the directory
alias web='cd /var/www/html'


#######################################################
# SPECIAL FUNCTIONS
#######################################################

# Use the best version of pico installed
edit ()
{
        if [ "$(type -t jpico)" = "file" ]; then
                # Use JOE text editor http://joe-editor.sourceforge.net/
                jpico -nonotice -linums -nobackups "$@"
        elif [ "$(type -t nano)" = "file" ]; then
                nano -c "$@"
        elif [ "$(type -t pico)" = "file" ]; then
                pico "$@"
        else
                vim "$@"
        fi
}
sedit ()
{
        if [ "$(type -t jpico)" = "file" ]; then
                # Use JOE text editor http://joe-editor.sourceforge.net/
                sudo jpico -nonotice -linums -nobackups "$@"
        elif [ "$(type -t nano)" = "file" ]; then
                sudo nano -c "$@"
        elif [ "$(type -t pico)" = "file" ]; then
                sudo pico "$@"
        else
                sudo vim "$@"
        fi
}

# Extracts any archive(s) (if unp isn't installed)
extract () {
        for archive in $*; do
                if [ -f $archive ] ; then
                        case $archive in
                                *.tar.bz2)  tar xvjf $archive    ;;
                                *.tar.gz)    tar xvzf $archive    ;;
                                *.bz2)      bunzip2 $archive    ;;
                                *.rar)      rar x $archive      ;;
                                *.gz)        gunzip $archive      ;;
                                *.tar)      tar xvf $archive    ;;
                                *.tbz2)      tar xvjf $archive    ;;
                                *.tgz)      tar xvzf $archive    ;;
                                *.zip)      unzip $archive      ;;
                                *.Z)        uncompress $archive  ;;
                                *.7z)        7z x $archive        ;;
                                *)          echo "don't know how to extract '$archive'..." ;;
                        esac
                else
                        echo "'$archive' is not a valid file!"
                fi
        done
}

# Copy file with a progress bar
cpp()
{
        set -e
        strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
        | awk '{
        count += $NF
        if (count % 10 == 0) {
                percent = count / total_size * 100
                printf "%3d%% [", percent
                for (i=0;i<=percent;i++)
                        printf "="
                        printf ">"
                        for (i=percent;i<100;i++)
                                printf " "
                                printf "]\r"
                        }
                }
        END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}

# Copy and go to the directory
cpg ()
{
        if [ -d "$2" ];then
                cp $1 $2 && cd $2
        else
                cp $1 $2
        fi
}

# Move and go to the directory
mvg ()
{
        if [ -d "$2" ];then
                mv $1 $2 && cd $2
        else
                mv $1 $2
        fi
}

# Create and go to the directory
mkdirg ()
{
        mkdir -p $1
        cd $1
}

# Goes up a specified number of directories  (i.e. up 4)
up ()
{
        local d=""
        limit=$1
        for ((i=1 ; i <= limit ; i++))
                do
                        d=$d/..
                done
        d=$(echo $d | sed 's/^\///')
        if [ -z "$d" ]; then
                d=..
        fi
        cd $d
}

#Automatically do an ls after each cd
# cd ()
# {
#        if [ -n "$1" ]; then
#                builtin cd "$@" && ls
#        else
#                builtin cd ~ && ls
#        fi
# }

# Returns the last 2 fields of the working directory
pwdtail ()
{
        pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Show the current distribution
distribution ()
{
        local dtype
        # Assume unknown
        dtype="unknown"

        # First test against Fedora / RHEL / CentOS / generic Redhat derivative
        if [ -r /etc/rc.d/init.d/functions ]; then
                source /etc/rc.d/init.d/functions
                [ zz`type -t passed 2>/dev/null` == "zzfunction" ] && dtype="redhat"

        # Then test against SUSE (must be after Redhat,
        # I've seen rc.status on Ubuntu I think? TODO: Recheck that)
        elif [ -r /etc/rc.status ]; then
                source /etc/rc.status
                [ zz`type -t rc_reset 2>/dev/null` == "zzfunction" ] && dtype="suse"

        # Then test against Debian, Ubuntu and friends
        elif [ -r /lib/lsb/init-functions ]; then
                source /lib/lsb/init-functions
                [ zz`type -t log_begin_msg 2>/dev/null` == "zzfunction" ] && dtype="debian"

        # Then test against Gentoo
        elif [ -r /etc/init.d/functions.sh ]; then
                source /etc/init.d/functions.sh
                [ zz`type -t ebegin 2>/dev/null` == "zzfunction" ] && dtype="gentoo"

        # For Mandriva we currently just test if /etc/mandriva-release exists
        # and isn't empty (TODO: Find a better way :)
        elif [ -s /etc/mandriva-release ]; then
                dtype="mandriva"

        # For Slackware we currently just test if /etc/slackware-version exists
        elif [ -s /etc/slackware-version ]; then
                dtype="slackware"

        fi
        echo $dtype
}

# Show the current version of the operating system
ver ()
{
        local dtype
        dtype=$(distribution)

        if [ $dtype == "redhat" ]; then
                if [ -s /etc/redhat-release ]; then
                        cat /etc/redhat-release && uname -a
                else
                        cat /etc/issue && uname -a
                fi
        elif [ $dtype == "suse" ]; then
                cat /etc/SuSE-release
        elif [ $dtype == "debian" ]; then
                lsb_release -a
                # sudo cat /etc/issue && sudo cat /etc/issue.net && sudo cat /etc/lsb_release && sudo cat /etc/os-release # Linux Mint option 2
        elif [ $dtype == "gentoo" ]; then
                cat /etc/gentoo-release
        elif [ $dtype == "mandriva" ]; then
                cat /etc/mandriva-release
        elif [ $dtype == "slackware" ]; then
                cat /etc/slackware-version
        else
                if [ -s /etc/issue ]; then
                        cat /etc/issue
                else
                        echo "Error: Unknown distribution"
                        exit 1
                fi
        fi
}

# Automatically install the needed support files for this .bashrc file
install_bashrc_support ()
{
        local dtype
        dtype=$(distribution)

        if [ $dtype == "redhat" ]; then
                sudo yum install multitail tree joe
        elif [ $dtype == "suse" ]; then
                sudo zypper install multitail
                sudo zypper install tree
                sudo zypper install joe
        elif [ $dtype == "debian" ]; then
                sudo apt-get install multitail tree joe
        elif [ $dtype == "gentoo" ]; then
                sudo emerge multitail
                sudo emerge tree
                sudo emerge joe
        elif [ $dtype == "mandriva" ]; then
                sudo urpmi multitail
                sudo urpmi tree
                sudo urpmi joe
        elif [ $dtype == "slackware" ]; then
                echo "No install support for Slackware"
        else
                echo "Unknown distribution"
        fi
}

# Show current network information
netinfo ()
{
        echo "--------------- Network Information ---------------"
        /sbin/ifconfig | awk /'inet addr/ {print $2}'
        echo ""
        /sbin/ifconfig | awk /'Bcast/ {print $3}'
        echo ""
        /sbin/ifconfig | awk /'inet addr/ {print $4}'

        /sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
        echo "---------------------------------------------------"
}


# View Apache logs
apachelog ()
{
        if [ -f /etc/httpd/conf/httpd.conf ]; then
                cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
        else
                cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
        fi
}

# Edit the Apache configuration
apacheconfig ()
{
        if [ -f /etc/httpd/conf/httpd.conf ]; then
                sedit /etc/httpd/conf/httpd.conf
        elif [ -f /etc/apache2/apache2.conf ]; then
                sedit /etc/apache2/apache2.conf
        else
                echo "Error: Apache config file could not be found."
                echo "Searching for possible locations:"
                sudo updatedb && locate httpd.conf && locate apache2.conf
        fi
}

# Edit the PHP configuration file
phpconfig ()
{
        if [ -f /etc/php.ini ]; then
                sedit /etc/php.ini
        elif [ -f /etc/php/php.ini ]; then
                sedit /etc/php/php.ini
        elif [ -f /etc/php5/php.ini ]; then
                sedit /etc/php5/php.ini
        elif [ -f /usr/bin/php5/bin/php.ini ]; then
                sedit /usr/bin/php5/bin/php.ini
        elif [ -f /etc/php5/apache2/php.ini ]; then
                sedit /etc/php5/apache2/php.ini
        else
                echo "Error: php.ini file could not be found."
                echo "Searching for possible locations:"
                sudo updatedb && locate php.ini
        fi
}

# Edit the MySQL configuration file
mysqlconfig ()
{
        if [ -f /etc/my.cnf ]; then
                sedit /etc/my.cnf
        elif [ -f /etc/mysql/my.cnf ]; then
                sedit /etc/mysql/my.cnf
        elif [ -f /usr/local/etc/my.cnf ]; then
                sedit /usr/local/etc/my.cnf
        elif [ -f /usr/bin/mysql/my.cnf ]; then
                sedit /usr/bin/mysql/my.cnf
        elif [ -f ~/my.cnf ]; then
                sedit ~/my.cnf
        elif [ -f ~/.my.cnf ]; then
                sedit ~/.my.cnf
        else
                echo "Error: my.cnf file could not be found."
                echo "Searching for possible locations:"
                sudo updatedb && locate my.cnf
        fi
}

# For some reason, rot13 pops up everywhere
rot13 () {
        if [ $# -eq 0 ]; then
                tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
        else
                echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
        fi
}

# Trim leading and trailing spaces (for scripts)
trim()
{
        local var=$@
        var="${var#"${var%%[![:space:]]*}"}"  # remove leading whitespace characters
        var="${var%"${var##*[![:space:]]}"}"  # remove trailing whitespace characters
        echo -n "$var"
}

#######################################################
# Set the ultimate amazing command prompt
#######################################################

function __setprompt
{
        local LAST_COMMAND=$? # Must come first!

        # Define colors
        local LIGHTGRAY="\033[0;37m"
        local WHITE="\033[1;37m"
        local BLACK="\033[0;30m"
        local DARKGRAY="\033[1;30m"
        local RED="\033[0;31m"
        local LIGHTRED="\033[1;31m"
        local GREEN="\033[0;32m"
        local LIGHTGREEN="\033[1;32m"
        local BROWN="\033[0;33m"
        local YELLOW="\033[1;33m"
        local BLUE="\033[0;34m"
        local LIGHTBLUE="\033[1;34m"
        local MAGENTA="\033[0;35m"
        local LIGHTMAGENTA="\033[1;35m"
        local CYAN="\033[0;36m"
        local LIGHTCYAN="\033[1;36m"
        local NOCOLOR="\033[0m"

        # Clear Prompt
        PS1=""

        # Newline
        PS1+="\n"

        # Date
        PS1+="\[${DARKGRAY}\](\[${CYAN}\]\$(date +%a) $(date +%b-'%-m')" # Date
        PS1+="${BLUE} $(date +'%-I':%M:%S%P)\[${DARKGRAY}\])-" # Time

        # Jobs
        PS1+="\[${DARKGRAY}\]:\[${MAGENTA}\]\j"

        PS1+="\[${DARKGRAY}\])-"

        # User and server
        local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
        local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
        if [ $SSH2_IP ] || [ $SSH_IP ] ; then
                PS1+="(\[${RED}\]\u@\h"
        else
                PS1+="(\[${RED}\]\u"
        fi

        # Current directory
        PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\])-"

        # Number of files
        PS1+="\[${GREEN}\]\$(/bin/ls -A -1 | /usr/bin/wc -l)\[${DARKGRAY}\])"

        # Skip to the next line
        PS1+="\n"

        if [[ $EUID -ne 0 ]]; then
                PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
        else
                PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
        fi

        # PS2 is used to continue a command using the \ character
        PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

        # PS3 is used to enter a number choice in a script
        PS3='Please enter a number from above list: '

        # PS4 is used for tracing a script in debug mode
        PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'

# Enable 256 Colors
export TERM="xterm-256color"

# Enable 256 colors in tmux
[[ $TERM == "screen" ]] && export -p TERM="screen-256color"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"         # This loads RVM into a shell session.
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion # This sets RVM shell completion

