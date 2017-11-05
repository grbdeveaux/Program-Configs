make_backup()
{
    NAME=$(basename $1)
    ORIGINAL=$1
    BACKUP=$1.old
    echo "\n$NAME"
    if [ -f $ORIGINAL.old ] || [ -d $ORIGINAL.old ]; then   # check if a backup already exists
        echo "$1 already has a backup. All existing backups should be handled before deploying.\n"
        exit 0
    elif [ -f $ORIGINAL ] || [ -d $ORIGINAL ]
    then
        mv $ORIGINAL $BACKUP
        echo "$ORIGINAL was backedup to $BACKUP"
    else
        echo "There is no $ORIGINAL to back up"
    fi
}

prompt_install() {
    echo -n "$1 is not installed. Would you like to install it? (y/n) " >&2
    old_stty_cfg=$(stty -g)
    stty raw -echo
    answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
    stty $old_stty_cfg && echo
    if echo "$answer" | grep -iq "^y" ;then
        # This could def use community support
        case "$(uname -s)" in
            Darwin)
                brew install $1
                ;;
            Linux)
                sudo apt install $1 -y
                ;;
            FreeBSD)
                sudo pkg install $1
                ;;
            *)
                echo "Operating system not recognized, please install $1 manually, then re-run this script."
                exit 1
                ;;
            esac
    fi
}

check_for_software() {
    echo "Checking to see if $1 is installed"
    if ! [ -x "$(command -v $1)" ]; then
        prompt_install $1
    else
        echo "$1 is installed."
    fi
}

check_default_shell() {
    if [ -z "${SHELL##*zsh*}" ] ;then
            echo "Default shell is zsh."
    else
        echo -n "Default shell is not zsh. Do you want to chsh -s \$(which zsh)? (y/n)"
        old_stty_cfg=$(stty -g)
        stty raw -echo
        answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
        stty $old_stty_cfg && echo
        if echo "$answer" | grep -iq "^y" ;then
            chsh -s $(which zsh)
        else
            echo "Warning: Your configuration won't work properly. If you exec zsh, it'll exec tmux which will exec your default shell which isn't zsh."
        fi
    fi
}

echo "We're going to do the following:"
echo "1. Check to make sure you have zsh, vim, and tmux installed"
echo "2. We'll help you install them if you don't"
echo "3. We're going to check to see if your default shell is zsh"
echo "4. We'll try to change it if it's not"

echo "Let's get started? (y/n)"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo
else
    echo "Quitting, nothing was changed."
    exit 0
fi

check_for_software zsh
echo
check_for_software vim
echo
check_for_software tmux
echo

check_default_shell

echo "Would you like to backup your current dotfiles? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo "\nBacking up old files."
    make_backup ~/.bashrc
    make_backup ~/.config/nvim
    make_backup ~/.oh-my-zsh
    make_backup ~/.tmux.conf
    make_backup ~/.vim
    make_backup ~/.vimrc
    make_backup ~/.zshrc
    make_backup ~/.tmux
    make_backup ~/.spacemacs
else
    echo "\nNot backing up old dotfiles."
fi

echo "\nWould you like to create symlinks to the new config files and directories? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
    echo "\nCreating symlinks to new configurations."
    ln -s ~/dotfiles/vim ~/.vim
    ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
    ln -s ~/dotfiles/nvim ~/.config/nvim
    ln -s ~/dotfiles/bash/bashrc.sh ~/.bashrc
    ln -s ~/dotfiles/zsh/zshrc_manager.sh ~/.zshrc
    ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/zsh/plugins/oh-my-zsh ~/.oh-my-zsh
    ln -s ~/dotfiles/tmux ~/.tmux
    ln -s ~/dotfiles/emacs/spacemacs ~/.spacemacs
else
    echo "\nNot creating symlinks."
fi

echo "\nPlease log out and log back in for default shell to be initialized."
exit 0
